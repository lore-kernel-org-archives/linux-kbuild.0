Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21233C2782;
	Fri, 28 Aug 2026 04:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892724; cv=none; b=I4EswDviOy046nnzDIEn5tcs7e/TW7Lz0ErhcSyuQbEUhki2a2cReGz9Dc1YRpi9QSzLB1PYzM54ZRxbWJtcN8lXjDG9dfbeHsCfB6SMK1NHqmoXkOBvYj3UO1AlZyKB90VNnnkNhesJL5hnxhAJeH0/ZPhTvwrFqmVRFj4BZBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892724; c=relaxed/simple;
	bh=XG8cF63XQa8Xc1aYG1ZtRZX7xY6+LPMKaT6xREKqCh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxMtnnpJhFo2xfjEa05LuE7tG7mAYumUpT2+aAQivJaV7j3VQRccYl2MBdRu7EZy/kTxhNnUDrloSwUTVCUizYjDZtpmhTM0vHzGRcqHh0vHNINL/GUtiTYjx1SphdJuKeZuYYof/MT9XfxqTxxht9hz196huCMRABuD1hIs9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MC5UxQvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MC5UxQvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF561F00A3A;
	Fri, 28 Aug 2026 04:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892722;
	bh=oL0/32zIjEk68kWbn5G+FVF7tD9ZwNBrosw3NxneCPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MC5UxQvLUg5803mFZzeEugqrloYBoLSLOeEp+WDphqkSOWLAGXEGE6bJvRBokRd/N
	 7osqy6qSysnScmt5K45G56JeFYW2Rq5BxROY1LH3UtMA3q4LwXL/fosWD25zJAJ2u1
	 FYw2o7ObDyjPt2Ogi++DqyA8OjlOexeS6OhhGml2Arz6fHHtSC9yMHIJb4HJj7nCEh
	 czKZWf6DJBLZou4N/j0w25VzS+vV1k4nUmDU1A/xJLMYw0tOz8IzL6Xs7Rsgh93ILV
	 BU6B/PcDmZ+S989QfvCN2s86to8MtzpmGsdcRVUt5sK/q26uEyyen0WmusdnUm503X
	 bdSavd2rrwBbQ==
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
Subject: [PATCH 06/27] objtool: Ignore traps after noreturn calls in STT_CODE
Date: Thu, 27 Aug 2026 21:51:35 -0700
Message-ID: <44e198b8eb0f377b5e2c61cf6bb753d735201bd7.1787890035.git.jpoimboe@kernel.org>
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

Objtool doesn't do unreachable warnings for traps after noreturn calls,
but only in functions.  Loongarch assembly STT_CODE can have the same
pattern:

  bl	start_kernel
  	ASM_BUG()

Ignore those as well.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 4528f017277d2..7333b0ed86818 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4269,12 +4269,6 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
 	    !strcmp(insn->sec->name, ".altinstr_aux"))
 		return true;
 
-	if (!func)
-		return false;
-
-	if (func->static_call_tramp)
-		return true;
-
 	/*
 	 * CONFIG_UBSAN_TRAP inserts a UD2 when it sees
 	 * __builtin_unreachable().  The BUG() macro has an unreachable() after
@@ -4290,6 +4284,12 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
 	      insn->jump_dest && insn->jump_dest->type == INSN_BUG)))
 		return true;
 
+	if (!func)
+		return false;
+
+	if (func->static_call_tramp)
+		return true;
+
 	/*
 	 * Check if this (or a subsequent) instruction is related to
 	 * CONFIG_UBSAN or CONFIG_KASAN.
-- 
2.55.0

