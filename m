Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1ECC433F5
	for <linux-kbuild@archiver.kernel.org>; Tue, 29 Mar 2022 02:16:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiC2CR7 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 28 Mar 2022 22:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiC2CRx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Mar 2022 22:17:53 -0400
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9A663B1;
        Mon, 28 Mar 2022 19:16:10 -0700 (PDT)
Received: from grover.. (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 22T2FUb1001635;
        Tue, 29 Mar 2022 11:15:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 22T2FUb1001635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1648520131;
        bh=IGjG7HZTYaNUSK92f2Wk37VM01/dRdTOa/MwlyRMzuA=;
        h=From:To:Cc:Subject:Date:From;
        b=CK5A6Z8l9TIdOTlyalfmupcm97RSZxmWQEQe1ijh8aYFSryWIvY9FPhCopnCz3yEV
         TmRJDW3y/5UtCNWM6jcvbHSuY/x1t0VT9zPSlQGuYHXfxwp126QWMxFW3bWbizy664
         ii4Y2K6f0+lq4XwxFvXbFjhaitR1ew0xAJecRHNAvC1zmwkRoGXyD9kO2H4VDvyrdx
         pfLS2wi0lCBYVY9k39c0J0AfkWY6amG0yEHBVOrs9H1BVI9dAhLtJwBTxQzq2hhScQ
         OIIkUHHgpMbI2S1PGiWgM5PVFTjuPCtqDRaJN1o62ByIdpwXOos+JHEn/3mGu3P3Wk
         vu6BVPgv7YdrQ==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 1/2] kbuild: factor out genksyms command from cmd_gensymtypes_{c,S}
Date:   Tue, 29 Mar 2022 11:15:19 +0900
Message-Id: <20220329021520.308997-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
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

 scripts/Makefile.build | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9717e6f6fb31..3f2985df4d60 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -125,13 +125,14 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 $(obj)/%.i: $(src)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
+genksyms = scripts/genksyms/genksyms		\
+	$(if $(1), -T $(2))			\
+	$(if $(CONFIG_MODULE_REL_CRCS), -R)	\
+	$(if $(KBUILD_PRESERVE), -p)		\
+	-r $(or $(wildcard $(2:.symtypes=.symref), /dev/null))
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

