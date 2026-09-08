Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0A63B4EBD;
	Tue,  8 Sep 2026 20:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899672; cv=none; b=ZjB2+dqeLDvXwkQEUJ5ym74DhE3kAcxafpHyX/RtkG9HPy4LxGIqwGpGdr0FbpxoXd6bd2L+yPv3Z0pupCQi1fcnxCrK+DorPc0+1DWIGo1BTzK/uERbEiyFo3KXHCLvq/rvZojqOGWyndx2m1ERMyx00ougKKnDFCtpQTyB3qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899672; c=relaxed/simple;
	bh=zQdpkRB1raAu9El8Gr7JSqs4nWRjQtN49/wJdCaCzHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=safFAiSYVtjjzsDLvdcY3ly+Vrcw71tdwxgbErss2SJRa4VcYzUHnOx/997jsgU0+Nk95NRo94i5G9Ut5iVG5lmliZBV0lnJI4xAlE8ksjzlQP98XOPbqs9gEQgbH6ccBK2LeYL652Q/oogEELU7h2PKRonRe1StF7umpi/abOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ9sJkH3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ9sJkH3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CBA1F00AC4;
	Tue,  8 Sep 2026 20:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899671;
	bh=NJgNfalgH9SR174GVDquiTtpvJhDQQUnFJHEnW+s0ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MQ9sJkH3jxlTtsswDqPlK0MqIAjp+RBaBamjkv1ggdJTxAndmvkrpKkPmfalklnjK
	 nsrX6b4Ev/ftrPG/7G+USpLRlS7FAQ/O/0NhulajTqgdBQ9xciwFxZ5HjjLctDK8Q2
	 xOUVAH6nlivj2OgLg0LoBbSz6Lx0o4fKhfZ/4OW3X3WMKYhy60OcidLbz3LJUnZ50u
	 hRZRJMI3VtBVKGTGtXLiaOhfr4K9/DGDh6rmtcjHNv0S9XNGTdAnK41zHiYppho8DZ
	 yzyESe+SHJC/l8wKxMNt94U2gRm+DCSYWyt8J/dsbOjXDDpWmkjhX6I7e86MJxjgeY
	 gfHVFbzW/SUUw==
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
Subject: [PATCH v2 06/27] objtool: Ignore traps after noreturn calls in STT_CODE
Date: Tue,  8 Sep 2026 13:33:18 -0700
Message-ID: <f33299a54f3f06242cc9dfbaef776366468880c4.1788899473.git.jpoimboe@kernel.org>
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

