Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748B392C56
	for <linux-kbuild@vger.kernel.org>; Sat,  1 Aug 2026 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595976; cv=none; b=Hu5jAKf5O6d7iL4d9lGN1aXvB0ixc/v+ou+vX7IvTlscxZldUyn1KZrt3lcFwfGcCirG3H6bWyLNXX8Vwhg5A6W+tdGAoqCs+OZseXBz9v6JpHA2McOLdVhhFQFWjP5GU3UpGw8WCoH8UKI3bmVMt7b7xlcQuPBxH/4KP9Mn3Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595976; c=relaxed/simple;
	bh=Vttuw5du2HyON+new+LEsXAblA6lU3qKSJM0dWQzcok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gU72rv7BFPXBJalPLDOXkhU+p19gMEWo7Np193UM3aCEGKLH3+yID13MxAgRwinVEZuA2oLnSu7b0cSIOR1CgnA7PVsyt785Q0DZMl9d5Pj+opyywMTY6IETReNhWO6zPSx6tgqE7FubYMkPSSvvbOeCoQIdln19SDoGQ12wHqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJe02nxj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJe02nxj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954df200ddso4621935e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Aug 2026 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785595969; x=1786200769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uL7BQNezkocW6jWA2Bv2TxHluVpydRqBfpvgiVgWdA=;
        b=IJe02nxjVeuq7r2jqNbET0jDbmwzWMqXRuLec9McVsvS4JiKP+wARBN6bWrSRoG9iy
         v5UO9JwoMvofcV6JifXG+Aiy82dYXVUxZoooIydCuXPnf2mAKsmC1lpBVgFHDYl9ertK
         T4Rwlj6mY2S7eZ8u2dB/CXrAhIYO5heDEc+ncMM4qgmBGFVKAgrqzppx7MjnMEHzlp5R
         xeUWG55EzovI/xp+zO2N5ymddg4JLZC19mtCuEBvKXjyxsxI+zQLfEGjQy2ZpfieHzE5
         XkNMDOlIaSf82JF5TI5RRB+NaIIHMnIpAKnSp3R0b+TdauDgWKDWrV81+2+u7rzLtPxj
         e6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595969; x=1786200769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uL7BQNezkocW6jWA2Bv2TxHluVpydRqBfpvgiVgWdA=;
        b=djms9g8xxqx/IOAYxb78/HeXic9GpBWCra7drh6f7iaL7JSAamGRz8RZ2FFC+px8ff
         zu70zzIQsov/sKkwskTVgCRnok0ly8/bZAHGhEDp7hXl0ef3xtxedtfL5nK1VdmGRult
         X3uMR+wn5UzP+WWBAkLO5POl1kyzD4ndfzSp7eFGE6t0Fu5i6+3CiKliO3mMbXVti0lX
         TOrBFuS6YyFXAFiD5VnwMy5AqYpHC8qB2Vvx/4pnS3Anl9rtWmiEPEY3rgX5cfnLVtZw
         NSDshfhjeZv4bM7xeCzjZClbom4uq4A6bomHD03/zjDJzSMrj5VJr4YBHCq0KBav/w0S
         oFWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBwMcufWnuxTwNzJCta0q+Pkpk47egu2KcSFIXqi6am2NdX36R0BB2R5Z8rbZ5SBoldlK6ZG05/v51GQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDydxkwJKyQQUlxXc6IZEwx1pDWU/29FXtIFqw0ivnNRH4P93
	zcaHeLKaxoL9a9aEPAcygRI39eQekTpR4trUJ9atk1Op7M4KJPhktgg/
X-Gm-Gg: AR+sD1228tn6ITNMDRdm/18q1x3rbY5BOu/Xotd29e++5FeWlkjSYRe6fTZRbKzQJo7
	Xw3sAdqJATRI7VpVQzjKFAIRZGZ6FGj0Kl4HWmYxch7GKNHWyouRz3G4HF6+U7xTxiiTrf7Ns//
	MttnhYZpJJLtrUZDFXKiOoM3xGu2M1mltGLqDj2lR/JJcHVsq/RZhtR2QAysO5bIoE7vBNwVgdx
	G8Lyudl8roGf1FC/+xHcizxFxtuyR5ZXVpC3dEf92FVOKhqWSgmDxEK1QVPTtzZXO2PaF7Sbn17
	S9urbNt4A2ttmcv4dLiS0pM9vsrwt4GfF9YIjevvyOWcS2c9E+3tXO4Ue8EABljKqLedZ+k73sC
	GYuYkIRCAoxVlrwdXB4g3qccKRRSgRAJ1DX06y/UlkKKYVcEXeuZi9so42NGgIJm37oYWeC4Wju
	XpqSEGkICrrmQlpR4N2zPpeNxY0I7pLsv0MB6GDUhvLuZr/boIc6b2UrhApeolT1iUwRkuhxE5s
	gb2Q7t58HvyM51wZ3xoWhFPv2ESLbyP689JixmzVXFcbFo9mZFV
X-Received: by 2002:a05:600c:4f84:b0:496:bbcb:b0bb with SMTP id 5b1f17b1804b1-4980c674e31mr58378605e9.18.1785595969102;
        Sat, 01 Aug 2026 07:52:49 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808199a68sm42880765e9.4.2026.08.01.07.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:52:48 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	kees@kernel.org
Cc: xry111@xry111.site,
	hyc.lee@gmail.com,
	jeffbai@aosc.io,
	vegard.nossum@oracle.com,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	nico@fluxnic.net,
	masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] kconfig: fix submenu rendering of negative dependencies
Date: Sat,  1 Aug 2026 15:52:38 +0100
Message-ID: <20260801145238.2140291-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig frontend should render options that depend on a
previous option in the submenu of that previous option. But
currently, this breaks for negative dependencies. For example,
option FOO may be rendered in the submenu of option BAR, despite
FOO actually depending on !BAR.

Let's fix this ironic rendering by modifying Kconfig to explicitly
check negative dependencies.

I've only tested locally on x86, but as far as I can tell, this only
changes how 2 options are rendered in the menu:
1. NTFS3_FS, no longer in the NTFS_FS submenu, and
2. MTD_BLOCK_RO, no longer in the MTD_BLOCK submenu.

Tested-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Xi Ruoyao <xry111@xry111.site>
Closes: https://lore.kernel.org/all/cbe95c15d2760f6fce8eaf207c969ce8fd3703aa.camel@xry111.site/
Assisted-by: Claude:claude-4.8-opus
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- made commit message self-contained
- moved the issue link to the trailers
- add Nathan's tested-by and Xi's reported-by tags 
Link to v1:
https://lore.kernel.org/all/20260721193028.313342-1-julianbraha@gmail.com/
---
 scripts/kconfig/expr.c | 33 +++++++++++++++++++++++++++++++++
 scripts/kconfig/expr.h |  1 +
 scripts/kconfig/menu.c | 10 ++++++++++
 3 files changed, 44 insertions(+)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 16f92c4a775a..2b91d16bf14f 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -738,6 +738,39 @@ bool expr_contains_symbol(struct expr *dep, struct symbol *sym)
 	return false;
 }
 
+/*
+ * Check if the expression references 'sym' in a way that is satisfiable
+ * with 'sym' disabled, e.g.'sym!=y'.
+ *
+ * Expects that expr_transform() was already called on 'expr'.
+ */
+bool expr_contains_symbol_negated(struct expr *dep, struct symbol *sym)
+{
+	if (!dep)
+		return false;
+
+	switch (dep->type) {
+	case E_AND:
+	case E_OR:
+		return expr_contains_symbol_negated(dep->left.expr, sym) ||
+		       expr_contains_symbol_negated(dep->right.expr, sym);
+	case E_NOT:
+		return dep->left.expr->type == E_SYMBOL &&
+		       dep->left.expr->left.sym == sym;
+	case E_EQUAL:
+		/* sym=n */
+		return dep->left.sym == sym && dep->right.sym == &symbol_no;
+	case E_UNEQUAL:
+		/* sym!=y, sym!=m */
+		return dep->left.sym == sym &&
+		       (dep->right.sym == &symbol_yes ||
+			dep->right.sym == &symbol_mod);
+	default:
+		break;
+	}
+	return false;
+}
+
 bool expr_depends_symbol(struct expr *dep, struct symbol *sym)
 {
 	if (!dep)
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index fa3823a97d72..b580f9fa0f29 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -307,6 +307,7 @@ tristate expr_calc_value(struct expr *e);
 struct expr *expr_eliminate_dups(struct expr *e);
 struct expr *expr_transform(struct expr *e);
 bool expr_contains_symbol(struct expr *dep, struct symbol *sym);
+bool expr_contains_symbol_negated(struct expr *dep, struct symbol *sym);
 bool expr_depends_symbol(struct expr *dep, struct symbol *sym);
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym);
 
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b2d8d4e11e07..9c079e92a9ed 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -428,9 +428,19 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 			if (!expr_contains_symbol(dep, sym))
 				/* No dependency, quit */
 				break;
+			/*
+			 * Note that it's actually possible to depend on both
+			 * 'SYM!=y' and 'SYM=y', so we need to first check if
+			 * it's a positive dependency before checking if it's
+			 * a negative dependency. See example:
+			 * 'SFC && MTD && !(SFC=y && MTD=m)'
+			 */
 			if (expr_depends_symbol(dep, sym))
 				/* Absolute dependency, put in submenu */
 				goto next;
+			if (expr_contains_symbol_negated(dep, sym))
+				/* Negative dependency, quit */
+				break;
 
 			/*
 			 * Also consider it a dependency on sym if our
-- 
2.55.0

