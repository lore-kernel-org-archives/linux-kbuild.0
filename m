Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846A3C433E6
	for <linux-kbuild@archiver.kernel.org>; Mon, 25 Jan 2021 11:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42E36229C4
	for <linux-kbuild@archiver.kernel.org>; Mon, 25 Jan 2021 11:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbhAYLcl (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 25 Jan 2021 06:32:41 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:55014 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbhAYLJA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 06:09:00 -0500
X-Greylist: delayed 577 seconds by postgrey-1.27 at vger.kernel.org; Mon, 25 Jan 2021 06:09:00 EST
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id C857AADD4CA; Mon, 25 Jan 2021 11:58:05 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, cyril@debamax.com,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] cmd_dtc: Enable generation of device tree symbols
Date:   Mon, 25 Jan 2021 11:57:57 +0100
Message-Id: <20210125105757.661240-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Adding the -@ switch to dtc results in the binary devicetrees containing
a list of symbolic references and their paths. This is necessary to
apply device tree overlays e.g. on Raspberry Pi as described on
https://www.raspberrypi.org/documentation/configuration/device-tree.md.

Obviously the downside of this change is an increas of the size of the
generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):

	$ du -s arch/arm/boot/dts*
	101380	arch/arm/boot/dts-pre
	114308	arch/arm/boot/dts-post

so this is in average an increase of 12.8% in size.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 213677a5ed33..0683a5808f7f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -319,7 +319,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
+	$(DTC) -@ -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
-- 
2.29.2

