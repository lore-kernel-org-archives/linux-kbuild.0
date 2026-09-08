Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82CD5A986A;
	Tue,  8 Sep 2026 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899681; cv=none; b=t0fbuO3u709t/knBaJL4MairYlQVy7m1LTSn2PgMgkIH98B3kpTJA5X+UwmPzdO9tN+XUOQvvmrUZvZmmshWyCvaPXFALQiccfNKpSzrtAcLkDwCN6PLjYZKkmaJhpfKxVRptBJAo9GdLukXSpAfsR1GGZ+rQ1HSTHBuePyr5u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899681; c=relaxed/simple;
	bh=VFz8lBru3Qms0pxRnA63kuF2S4xr2Wi8VDOhngblftM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWQCT2ARJv8JK2vlhZdsescmjV1Y34IsJlTw82WUEXNCwTrBa+DBgytOLNpwRSe9/jKZYsiywS507JBYzDc9u8m+ZT+mGLcp14XksU3n+c6d7gNGBsIJ/kSzlNrbwa20mQobwZG6bWvQm/xcyrICq6yXqFg6ePt0z+mnbWParB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfdEB1Li; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfdEB1Li"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA341F00A3A;
	Tue,  8 Sep 2026 20:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899679;
	bh=SasHm0H1uD9YNErhrHb6nEh7430J9yuNnou+/rYTmZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dfdEB1LiHZq3kvB4p5BIb9bbkQjUdVJ/15D7GdlhvRDcsiBvaTpiC2hjNf6d4LR3A
	 kjdAufuMJLwWByQTW8g7+9Ap3p/ei5vfRK9gZopGwW0Rk1DOZVGuxv880ptjC+fc7z
	 0wvzsDrpms/H4R1mDrwGghppzziEi/qwB8XycArWt4ZZY1CHygxwOYFhwcMubfIPak
	 fd8+c61spup+2O9g2vqBpvIhjP2ugMRLU4gQcUCSVyJuvjk/O2wyn0RjQhFPzzSQyp
	 LnT8zLRkSMGxiCdtxGjOMPlM9RJLBoR0C3sW8QpReja98mnzpPJyVBX7msCFfFpn3Y
	 U9MyCKNtYDtmg==
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
Subject: [PATCH v2 21/27] objtool: Fix noreturn detection for non-sibling jumps to SYM_CODE
Date: Tue,  8 Sep 2026 13:33:33 -0700
Message-ID: <8a2e4b91bc77da223068b1da6366360c3973aed5.1788899473.git.jpoimboe@kernel.org>
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

Objtool doesn't consider a jump to be a sibling call if the destination
isn't a function, so srso_alias_untrain_ret()'s jump to
srso_alias_return_thunk() is ignored by objtool and the former is
falsely classified as noreturn.

Change the noreturn detection to consider such cases as effectively
sibling calls, except for one known exception: jumping to .altinstr_aux.

Currently the misclassification is harmless: dead ends aren't marked
when calling a noreturn from an alternative replacement
(CALL_UNTRAIN_RET), they're ignored by rethunk validation, and ORC
generation relies on unwind hints in the SRSO code regardless.

Fix it in the name of robustness and in preparation for a subsequent
patch which generates a list of exported noreturns.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 35e24151f5785..41df5f608535f 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -266,8 +266,22 @@ static bool might_return(struct objtool_file *file, struct symbol *func)
 		if (insn->type == INSN_RETURN)
 			return true;
 
-		if (!is_sibling_call(insn))
+		if (!is_sibling_call(insn)) {
+			/*
+			 * Assume a jump into a non-function eventually returns
+			 * to the original caller one way or another, e.g., the
+			 * jump in srso_alias_untrain_ret().
+			 *
+			 * .altinstr_aux is an exception, cpu_feature_enabled()
+			 * jumps there and then right back.
+			 */
+			if (is_static_jump(insn) && insn->jump_dest &&
+			    !insn_func(insn->jump_dest) &&
+			    strcmp(insn->jump_dest->sec->name, ".altinstr_aux"))
+				return true;
+
 			continue;
+		}
 
 		dest = insn_call_dest(insn);
 		if (!dest || !is_noreturn(dest))
-- 
2.55.0

