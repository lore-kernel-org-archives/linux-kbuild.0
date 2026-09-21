Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C603152E071;
	Mon, 21 Sep 2026 22:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029910; cv=none; b=mbKfVSqeeUyuh+11gCSYVEpy930eEw4JAF1L/Rd3dTIeW8vlFdNcOIDHZaUNa21yQkP0NbkcaZ13l+srXzUKt9Oz7SZ/S/7y1LPeLmaTNIeUG1UNaGw2C3zotpzdPvaeK4xye+lQNkO7+xRbc+ShL0d1bJxugAIZ++IXFkttYIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029910; c=relaxed/simple;
	bh=VFz8lBru3Qms0pxRnA63kuF2S4xr2Wi8VDOhngblftM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBG1f3NFWrG3WuR2E//uqXF0imCxv3V7Wu8ButusDTj06tNXmBm4ZdAc9zPlEdr1qqsOcvtJoNtyV3vyRqhZanXXKFqAe3/a+M7rec+wuFeLsO7P0IWwABhaKFjjGNCASPXSXwy2iqiRjyvonDIGARCVdA9yfusJrS0D0KfhNFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhMx2+KQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhMx2+KQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368DB1F00893;
	Mon, 21 Sep 2026 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029908;
	bh=SasHm0H1uD9YNErhrHb6nEh7430J9yuNnou+/rYTmZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GhMx2+KQ72d4shruzS6Vz7JWiE87ZLtUQg9PnY1KOqxBvI62NYWFh5HxV5YvzGkf4
	 ANeI/lMC+WyeLKqoXNrT8sqT756jB0UWaL6HaiCjwYk8Sgg6BCOXmqDgHic8x+K+bV
	 awggttp1e3IMdIV6gbQQslBqVfFpe8uH+PIAdWgL5OUPyuDHQy+zJoLyk4jqXWLVu1
	 YOsvVyfN6awX6v6/L1T2GQUssFVPGpWsblOUZSNX6ti7JOX1aNlx9m53z9HXR683DY
	 uiMB8jlOYS5Y3CRzsxZo5LYILIuiglFl9o+0g1c4pM2sNGxbESSyfeDeDwfcO8xy82
	 gQQClDxPTQYYw==
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
Subject: [PATCH v3 21/28] objtool: Fix noreturn detection for non-sibling jumps to SYM_CODE
Date: Mon, 21 Sep 2026 15:31:22 -0700
Message-ID: <43ad45ea8097343900cec43cd796c65e091db776.1790028654.git.jpoimboe@kernel.org>
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

