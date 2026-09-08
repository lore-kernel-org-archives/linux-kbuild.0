Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFB43B71C7;
	Tue,  8 Sep 2026 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899672; cv=none; b=RHy+LSlWuZHtA2FTdjyi8+kDVar46HpXVGWJddpc2/pjlAwJCtmNjmJMMhpdrsgX9YHbpounYXT6g2hEkYFMm52tCxpmyWx4TJ6Zzpky84KLCA2aMJL5QAcB1b+iSDiua0OMEHO9zpxAHWFpDhHXnuAPgcrngRbfQ/0m8JMkKxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899672; c=relaxed/simple;
	bh=RqP/t3s2/zIrSrTTD49ejM+aVVU3EBIBfm/FS0sYOgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tjof9sBen+qzIBsstTXWq6HZGjdYfqTbdRSaszb6+6rZUusuA4wlz1CXh75OSeecYnzsNZPPFx+wOiLPAk/TGyQWW8tFRgt5rsNYCc3M5ZwM5+sGJoOksIz9iquhHLRecKppNEOoWI1bp8Wwe+syP0ODj4abMgYEtyLbOd0Xmxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBv7cX8a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBv7cX8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820101F00A3F;
	Tue,  8 Sep 2026 20:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899669;
	bh=uQigbxSbB36jbuuLbsBr4mlC7PBHgUWmA8HWqG/3ibE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PBv7cX8aGCDLF5Td2EqD/a8KCVXO34qXK5lIqeXL82LUAn3LarNnA3Zjq+Or/LbX9
	 pRPcXi5my6VFQeK1bNsB39/jWyw3bq1Oa0C1b5uyZE8tibZieRQp2+h9xa/FKA6Mr1
	 whfOLv5xQ1/ljqFUZxHGfWJmZ5ZtH3T1THRnTN8zkiR91pzSEvVGHCKQrWnBFc4zYT
	 2e1C5bVWV23oBFKxH4f8HW41CwlTvVp+OnTI1cJqjps6PRLOXPRHKnbEvcW8k3BhaW
	 TRwnkCOX0j7s+qI2gtisPMIlHkRX0c8g1IhHg2UIX2eX1ktWMPlZK+S3tPg61iBELj
	 a2C+kKh36fLyQ==
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
Subject: [PATCH v2 04/27] objtool: Fix dead end detection for sibling calls
Date: Tue,  8 Sep 2026 13:33:16 -0700
Message-ID: <1aa3b99e1a7066490ba1767bbb2fd777788de8a5.1788899473.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788899473.git.jpoimboe@kernel.org>
References: <cover.1788899473.git.jpoimboe@kernel.org>
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
index 464f6c9d9ff0b..1fe7efa934ebf 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -274,30 +274,31 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
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

