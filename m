Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5C6C433EF
	for <linux-kbuild@archiver.kernel.org>; Tue,  5 Apr 2022 14:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245161AbiDEOME (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 5 Apr 2022 10:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384127AbiDEM1M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Apr 2022 08:27:12 -0400
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3161574BF;
        Tue,  5 Apr 2022 04:35:18 -0700 (PDT)
Received: from grover.. (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 235BYCGn000464;
        Tue, 5 Apr 2022 20:34:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 235BYCGn000464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1649158453;
        bh=3DqNNvADXzvHcLCX0JSWQu0LGeQKS0pcjU6by571POs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IMM4BxXHf9E3neDAF1TWt3R+5eYjP6f7RQRZUvTHBnrIAQT4Pz/Q5AIfVvofrn4J4
         7RoXYWZ8ok44JqyjEhkn9QipP1dxZoWTkOeerMrUH4Q59PunvHTHp323M4A+jQ3RTJ
         T/extvRF5kV6xsvgaJuf2VjE4pDbPIf08E+3Hyo1Y7nz0OOvEbgyyfjqX5/1e9+oYn
         gmiEx3+cCur7VXwUVAOmm0aaMuEMp5Gyrkw6DehiFLPZ0JbRwaN4RxyZFzieEQWlZG
         4BqsexGyno2F1xP5ZzXbeZvfNaldzuMr6gY+u6rhOG7EMHmw2LqRT5Hs4qxz7IRtDc
         7aFfq7GP3W8DA==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2 01/10] kbuild: factor out genksyms command from cmd_gensymtypes_{c,S}
Date:   Tue,  5 Apr 2022 20:33:49 +0900
Message-Id: <20220405113359.2880241-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220405113359.2880241-1-masahiroy@kernel.org>
References: <20220405113359.2880241-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The genksyms command part in cmd_gensymtypes_{c,S} is duplicated.
Factor it out into the 'genksyms' macro.

For the readability, I slightly refactor the arguments to genksyms.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Fix the location of the closing parenthesis

 scripts/Makefile.build | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9717e6f6fb31..31e0e33dfe5d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -125,13 +125,14 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 $(obj)/%.i: $(src)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
+genksyms = scripts/genksyms/genksyms		\
+	$(if $(1), -T $(2))			\
+	$(if $(CONFIG_MODULE_REL_CRCS), -R)	\
+	$(if $(KBUILD_PRESERVE), -p)		\
+	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
+
 # These mirror gensymtypes_S and co below, keep them in synch.
-cmd_gensymtypes_c =                                                         \
-    $(CPP) -D__GENKSYMS__ $(c_flags) $< |                                   \
-    scripts/genksyms/genksyms $(if $(1), -T $(2))                           \
-     $(patsubst y,-R,$(CONFIG_MODULE_REL_CRCS))                             \
-     $(if $(KBUILD_PRESERVE),-p)                                            \
-     -r $(firstword $(wildcard $(2:.symtypes=.symref) /dev/null))
+cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
 
 quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
 cmd_cc_symtypes_c =                                                         \
@@ -344,11 +345,7 @@ cmd_gensymtypes_S =                                                         \
     $(CPP) $(a_flags) $< |                                                  \
      grep "\<___EXPORT_SYMBOL\>" |                                          \
      sed 's/.*___EXPORT_SYMBOL[[:space:]]*\([a-zA-Z0-9_]*\)[[:space:]]*,.*/EXPORT_SYMBOL(\1);/' ; } | \
-    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - |                                \
-    scripts/genksyms/genksyms $(if $(1), -T $(2))                           \
-     $(patsubst y,-R,$(CONFIG_MODULE_REL_CRCS))                             \
-     $(if $(KBUILD_PRESERVE),-p)                                            \
-     -r $(firstword $(wildcard $(2:.symtypes=.symref) /dev/null))
+    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
 
 quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
 cmd_cc_symtypes_S =                                                         \
-- 
2.32.0

