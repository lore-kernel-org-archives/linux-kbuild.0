Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B711AF0BB
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Jul 2026 19:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784662236; cv=none; b=apGu3iYHtGxTBamTD7qtTEyPeivPYg13zccBz1PWc38OTbXTqgOSefmioCd34XLH2+gh/VcIXfG6WULhTgOeKhO/KGna7UrnZNFHCqODMELvSdtqh+eGxwEkUT5++WOBOhSYDL5Kq+eQ9iIMyPP5AiiqvcKUv097WZXBiN9ZMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784662236; c=relaxed/simple;
	bh=/4ykxTnVW6KNXSdeCHEyJQFbqKYCjEuXbs9jf6IxfA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=APxd11T5K7aER97psbmvPlpy+f6HdGpv7HOiY4b2LWusCxA4u9frLzR3rvB3mgBJUKTOmxdwTVCF8FIGlWZY9ZjYIET7fjB9ZMYjfbCPuV9Na6yoFcxs4Wkf+EXBUrvpP8gjKoD10yJ9iipzJ2frFzFHzMf5YpP2l72stXG0NbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KK03iiKl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KK03iiKl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49558ce01afso24848425e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jul 2026 12:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784662233; x=1785267033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m9AKq8jynDHRD5GVA4V3Nt+Cij+XKuND1K/KFrp4pQ=;
        b=KK03iiKlEA+YGIgSAuCFdsD1w0oBy/S2faQa3vtuqINtIX5F/7TMfb+3mJbniWfbyX
         yUImqwK3G0K8OmhvbHXT98GE+sgYFZp5gP3lFkmTA1hwAJWbhADd0Vk5KGiSl+de+dkZ
         HtbPk/8x/X+Gwk/zcua/+fyV36cqEvctMCtnFc3HJ8/GgiuhQpXClprpPoCUGtCDQOkI
         FPHJ9Wjzdx74bvPppY/jxPsy5OchktLu9J1gY9yh32TK2YJ7yHi/MRBrIrspCmlyjvIt
         M4QPSBza7Gqo2EmXfuhKUFKtWyTGq5UmlIWyBwrejZAd8xjTVaXpJvQ30GJsCCxZG96X
         CmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784662233; x=1785267033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9m9AKq8jynDHRD5GVA4V3Nt+Cij+XKuND1K/KFrp4pQ=;
        b=ZSiuqNaJX3jhR4Ag0tkHxQtPCQ25N+L/ZUYCQIop7NjmFubRZ/bWSD1Au/+JZCWkd9
         4Jd6Y8uSkMJHNGxYWbaOP5MDm4WSuNdlQ1/VtMn9GpW9AXOuf9xsTrS50KknX4q8GHpS
         Pfnx0QYvG4ZK32RXpJJf9FrT6iqFOfrsOkzzDkvlI4u/oSLaSWqfVWwvfbC4tk3QssV1
         LcidJg3v5IUW9JWilPspUmx4gcbSPwP6tuWT4s/EsOCw9uGrqfm0ld206AFZxn3LFbIC
         nyTO6KxHiOAzprEht31VnKv4uk6cSWLVjhhMirI6tEpewvliwMm5xJAbT8s9exkD5hiy
         ihTQ==
X-Forwarded-Encrypted: i=1; AHgh+RosAUblgVWH6vdUawg6S55CNcg5l50yPPwlRV1iCliimfaf9KWaEJSoUwFFZk/xb1QIcvb6rL9f2m8v2ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPMSWkZjMcmQljCbbMqk1lDFCfFUjdg8TM1Kk6+/ngnBy9ra/
	SvbTRnP6fv6vV3xdf7koAzKpbfAPQs02ScwcHuNlzgikVEcuYYmCWqXt
X-Gm-Gg: AfdE7ck75WdjuTMSjNVavDiRaLQ0KP9L3Red30RKHDB2LggPffxXDUNN6N26shIs757
	u7Lgt0wP6rnksEzv2xKPQr4pRXOkkN8HyVPUUR7TBD7t5laBqWB2uhfW4RPFWcFUsfysFSnLrHD
	UxOiV1Psc1k2UYrHyuk82M3G1kK7v/VbUd0dYSil2MUUbvuNO08qclkd9iYHiUdpf8mUblTrs0Z
	XfHMAwK2LON5D43em+czFzsvyMpJrDsjK1awk+4Ab5UTGSx053xUFU13QzQeSIpucqDCzELziKR
	rfmAco8gDXz6+kNrRo8TEl51jbbFsq6VV4wgm0kVl1ONXe1YNsq4NIgcb9VePv8eERksT0IFuxl
	uXmywLuTHMghuVQiRIXUOXE2aGKW5aKxrVL8lpfmChid91GMR9/i2R5CpDWPKhVux36Wba9dwkN
	twneg04gkFT4Cf4xrPC54D7M1herF50ppm+X4NmRPN
X-Received: by 2002:a05:600c:1509:b0:495:3f5e:e7a with SMTP id 5b1f17b1804b1-4954a51dee6mr160279525e9.34.1784662233223;
        Tue, 21 Jul 2026 12:30:33 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:3552:6c88:7143:3dc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a509901sm25547815e9.8.2026.07.21.12.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 12:30:32 -0700 (PDT)
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
Subject: [PATCH] kconfig: fix submenu rendering of negative dependencies
Date: Tue, 21 Jul 2026 20:30:28 +0100
Message-ID: <20260721193028.313342-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes the "ironic visualization" issue reported here:
https://lore.kernel.org/linux-kbuild/cbe95c15d2760f6fce8eaf207c969ce8fd3703aa.camel@xry111.site/

where a config option FOO is nested in the submenu of the previous option
BAR, despite FOO actually depending on !BAR.

I've only tested locally on x86, but as far as I can tell, this only
changes how 2 options are rendered in the menu:
1. NTFS3_FS, no longer in the NTFS_FS submenu, and
2. MTD_BLOCK_RO, no longer in the MTD_BLOCK submenu.

Assisted-by: Claude:claude-4.8-opus
Signed-off-by: Julian Braha <julianbraha@gmail.com>
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
2.54.0

