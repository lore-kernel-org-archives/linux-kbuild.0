Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FB151FCA1;
	Mon, 21 Sep 2026 22:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029900; cv=none; b=eo2rE/0itLBhyobBuZzqygYv+Cdhb8LD8VdR/3/GiisLUg3YFUVfQX/6qHs9CuRHQd1kVB3TxJhQrZIB3rYnMcUc+GzYHgCrazq5xzxR+5+hRenb8yPJR3npkII61G5ebExLgLedfCzQ8e28S9sD5S3IClqEJHW763qDURG7wwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029900; c=relaxed/simple;
	bh=RqP/t3s2/zIrSrTTD49ejM+aVVU3EBIBfm/FS0sYOgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZoeZAOQ6ojEyZCIy2LK49FX2b4E3gLsK08zBFeJtBcZH+G8EHQf2Ed5xsuAzjd24kzuJh5Dalt19Sn259g4nhr0aMLtXWSO7JuKLpXG4Hin0cTZ5dwBYR/rf2nwiLS6wMewmxsOKNRJt0V2y79Ywl8kW6j+hPGMFudQ6Lc0CLUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQHxutsR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQHxutsR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CE81F0089B;
	Mon, 21 Sep 2026 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029898;
	bh=uQigbxSbB36jbuuLbsBr4mlC7PBHgUWmA8HWqG/3ibE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fQHxutsRcCush+U9pyYPWIJt3lDwX2jM0NEY5urFaNzZd7O9sdDdT53G0qNtpiaty
	 wDL2qTp1VNCvWm75VClsHfIit7+a484iDturh+J5OJuqXu79z9JxkiFhh/DGEYIvAD
	 8daHQ+hkg3LqRDpcryWT3kXY2XGCKlCL4QaSNnlLnDds23JmcZlIXnvRqbDDr4Oqlj
	 YWrOhrRkx7KwnmjgjwsLUcvnlTzn9hGOPV5xR2tSJLGLseekzhMkjV1iCDhKwNhFO1
	 CO2yI/fukzfDLgRhT2yHrow/Ag/6F/9ACsQ93gyA1qwL4MD6CJtfMH68ykswKCZnKn
	 axgxrLKiqkkaQ==
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
Subject: [PATCH v3 04/28] objtool: Fix dead end detection for sibling calls
Date: Mon, 21 Sep 2026 15:31:05 -0700
Message-ID: <e48a2a11efa839d4460e5678254ce89b04931a2b.1790028654.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790028654.git.jpoimboe@kernel.org>
References: <cover.1790028654.git.jpoimboe@kernel.org>
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

