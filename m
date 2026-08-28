Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DEF3C10BD;
	Fri, 28 Aug 2026 04:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892723; cv=none; b=rpFCsDcXbH3lHbcbK7nm6ayZ9vhntVwleyPDmnEgVZRoaMcZF1a8uNbpND+jntCBp7sc9K1QcL8L/kM1LeFz14t2Qtyr/UIpw0ZW7YFTAtmsAxm3okqIaAPOyJ07WZmHn+IVhCx4J3JD3t9f28emCOyyxfN66wd6GIuKsHMmG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892723; c=relaxed/simple;
	bh=Hb0BZMB8mtLFbivp9I1uUtXixTBgS2gRoT00j1tUVh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5SU9Hz2mOv8RoEx918eusvMpOO6+1uLO+PDeHJu1ubUbQOlEl4ts5sLWUXCdFVpRUU0BCjWIaWsiHPkL9dh06wobj3WwtqXHIU3bRlng/ok0wk0bOi+KVvl4y9XobSB6Xgxyty3YY3Em0mIniAQESCjaYGd0L7ZD+pn38CQvxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXzwa+ma; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXzwa+ma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31E61F000E9;
	Fri, 28 Aug 2026 04:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892721;
	bh=p4f8E/RMYR3yUrIve9wZDIuFSVWmc2kSXdiGNK4DR98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gXzwa+maNCyOufEaIDKWTH+TBbheIFZqCfrjy5cs1B90PMRqB2cfGjeYl+mPyV2wg
	 IYOoar5sBen04Z7xbLLLZbcWf6weFozq+kLNOKYak//DlGW+VGUALUKJoHvqFDzBQ5
	 KKi/uESBw4Adg17pBquC40Jvqbx0N7cFaYirDdRfdzgQDKW8zGV/S/xIWDbTAIAzlV
	 Ew6LI5ROc4Sc2IeVMeuzvrEzdQF7zz4Y+XRP+DmKmi91qxIOoeHw1BHHiIMh5CeuPs
	 zkyuzT5EvwoujhDlw1xW4pZqo2rrfITeg6VbWth/njcps0DdvmF6hLLtHbcZvoUcAm
	 Pp05rhKLVC6LQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH 04/27] objtool: Fix dead end detection for sibling calls
Date: Thu, 27 Aug 2026 21:51:33 -0700
Message-ID: <82b063dbeff61b78a4c42643ce5d4ebf8936c291.1787890035.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787890035.git.jpoimboe@kernel.org>
References: <cover.1787890035.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dead end detection for sibling calls has apparently always been
broken.  There are two issues: it checks jump_dest instead of call_dest,
and it only checks the first sibling call instead of all of them.  Fix
both issues.

No warnings were seen, this was only found by code inspection.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index a98d7589d8a48..01c50aa00b6dc 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -272,30 +272,31 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 		return false;
 
 	/*
-	 * A function can have a sibling call instead of a return.  In that
-	 * case, the function's dead-end status depends on whether the target
-	 * of the sibling call returns.
+	 * A function can have sibling calls instead of a return.  It's only a
+	 * dead end if *all* the sibling call targets are dead ends.
 	 */
 	func_for_each_insn(file, func, insn) {
-		if (is_sibling_call(insn)) {
-			struct instruction *dest = insn->jump_dest;
+		struct symbol *dest;
 
-			if (!dest)
-				/* sibling call to another file */
-				return false;
+		if (!is_sibling_call(insn))
+			continue;
 
-			/* local sibling call */
-			if (recursion == 5) {
-				/*
-				 * Infinite recursion: two functions have
-				 * sibling calls to each other.  This is a very
-				 * rare case.  It means they aren't dead ends.
-				 */
-				return false;
-			}
+		dest = insn_call_dest(insn);
+		if (!dest)
+			/* call to another file */
+			return false;
 
-			return __dead_end_function(file, insn_func(dest), recursion+1);
+		if (recursion == 5) {
+			/*
+			 * Infinite recursion: two functions have sibling
+			 * calls to each other.  This is a very rare case.
+			 * It means they aren't dead ends.
+			 */
+			return false;
 		}
+
+		if (!__dead_end_function(file, dest, recursion+1))
+			return false;
 	}
 
 	return true;
-- 
2.55.0

