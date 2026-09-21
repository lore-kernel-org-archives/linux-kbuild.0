Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382D5208D6;
	Mon, 21 Sep 2026 22:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029901; cv=none; b=Q2rYH8RYlB1mrXJUl7JFDmbhsjJpitW0iM4Y9ZobNDLBymKtIdQPRWxA+kxKjTokyy3qtGVY9QCz3xr+cYgOPeR3ECuR/SCTDhNgeCjjWcj/D/6cNFg9N462NhIbzVN27LLtaVc1ls3RCFSupGrMswNHDzU/NJxZ5uAKUbOZxQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029901; c=relaxed/simple;
	bh=zQdpkRB1raAu9El8Gr7JSqs4nWRjQtN49/wJdCaCzHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZ7MOTZz01WpcXjIXTdiG/lbj5HBTw07S1riBqN/5NnEdYiqB2wN7TwnrwQbR31nVslnSNAp6o9AO9dTB+yFO5iJReU2KjIXunBDGAtx+47laHPXSD8jQDUaurOK5pds/dvMsEyf8AwAFleh/rxxtTSuleK1bNiQFQfAWoH+vzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATN/W+B0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATN/W+B0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5951F000FF;
	Mon, 21 Sep 2026 22:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029899;
	bh=NJgNfalgH9SR174GVDquiTtpvJhDQQUnFJHEnW+s0ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ATN/W+B0hnnslgfh8kDm21HTQAzkbmppGldmNUN3PhH2hpormE2Pmrn7Hj3kZ/Vru
	 ryo2yG9iiXBzm1I1a7YVYSoYuPN1TUvblur9s8g/Ksll8BI0IqzI+Gw+uBOzwJy9YP
	 KnMQ70w+9qREMimi3f39Sr501sX3Easor3gvQdIsNCag0ltBpkDfEMFI2ce4yJqGM7
	 1Orhhe+Bfu59zuVjwQALYMLUu4rvT0/X3igeXZkWPHvT6LY+g/rA5tW5zXM0+gHPNf
	 gl9InxzU3IxMoLwCoHDurucepRUL262hHs63RXDlMe2QMHXPMkWIEFTtBCnhdAAXcx
	 lW8GyGV7orrXA==
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
Subject: [PATCH v3 06/28] objtool: Ignore traps after noreturn calls in STT_CODE
Date: Mon, 21 Sep 2026 15:31:07 -0700
Message-ID: <ca409e47fdb00307578abccb77a841b421592273.1790028654.git.jpoimboe@kernel.org>
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
index 83b4e748d33ba..f65b1b01b4fe9 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4271,12 +4271,6 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
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
@@ -4292,6 +4286,12 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
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

