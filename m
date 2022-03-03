Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A081CC433F5
	for <linux-kbuild@archiver.kernel.org>; Thu,  3 Mar 2022 17:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbiCCR2U (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 3 Mar 2022 12:28:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235346AbiCCR2U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Mar 2022 12:28:20 -0500
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2541DBA;
        Thu,  3 Mar 2022 09:27:31 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,151,1643670000"; 
   d="scan'208";a="7549937"
Received: from randriaga.irisa.fr (HELO randriaga) ([131.254.10.20])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 18:27:28 +0100
User-agent: mu4e 1.6.10; emacs 27.2
From:   Randrianaina Georges Aaron <georges-aaron.randrianaina@irisa.fr>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Acher <mathieu.acher@irisa.fr>
Subject: [PATCH] kconfig: add KCONFIG_ALLCONFIG support for tinyconfig
Date:   Thu, 03 Mar 2022 17:51:02 +0100
Message-ID: <87k0dbosis.fsf@irisa.fr>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since f8f0d06438e5, tinyconfig overrides KCONFIG_ALLCONFIG to
include kernel/configs/tiny-base.config. However, this ignores
user's preset if defined.

This modification checks if the user has set KCONFIG_ALLCONFIG
and if so, concatenates it with kernel/configs/tiny-base.config
to be used as preset config symbols.

Signed-off-by: Randrianaina Georges Aaron <georges-aaron.randrianaina@irisa.fr>
---
 scripts/kconfig/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index b8ef0fb4bbef..337693fb4762 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -102,7 +102,13 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 
 PHONY += tinyconfig
 tinyconfig:
+ifeq ($(KCONFIG_ALLCONFIG),)
 	$(Q)KCONFIG_ALLCONFIG=kernel/configs/tiny-base.config $(MAKE) -f $(srctree)/Makefile allnoconfig
+else
+	$(Q)cat $(KCONFIG_ALLCONFIG) <(echo) kernel/configs/tiny-base.config > .tmp.config
+	$(Q)KCONFIG_ALLCONFIG=.tmp.config $(MAKE) -f $(srctree)/Makefile allnoconfig
+	$(Q)rm -f .tmp.config
+endif
 	$(Q)$(MAKE) -f $(srctree)/Makefile tiny.config
 
 # CHECK: -o cache_dir=<path> working?
-- 
2.34.1
