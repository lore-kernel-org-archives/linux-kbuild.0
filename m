Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912DAC433EF
	for <linux-kbuild@archiver.kernel.org>; Fri,  3 Sep 2021 15:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6961E610C8
	for <linux-kbuild@archiver.kernel.org>; Fri,  3 Sep 2021 15:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349664AbhICPxD (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 3 Sep 2021 11:53:03 -0400
Received: from mail-oo1-f53.google.com ([209.85.161.53]:46990 "EHLO
        mail-oo1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235632AbhICPxD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Sep 2021 11:53:03 -0400
Received: by mail-oo1-f53.google.com with SMTP id z1-20020a4a2241000000b0028e8dfb83b4so1630275ooe.13;
        Fri, 03 Sep 2021 08:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVNFfi09M86JT10bziJ/Y2VXfaqfqBBOkyrez5O9qP0=;
        b=UQjzBDOxQzB8cHcdtIDH7m/zjyCfeiJ8fkBV/yWRyNizq3sH0eOyHwPo7rwii5q67S
         8PvhAC7gvwk2p8c22O02DHCwgsfdrRnC/xG07m/ILnXOw34OgfnRVLny5hySJCx8BG13
         thw4tcyIKlTHYjpLtHpROjTLp15igbkhBvP8OK292JRlJWlNPWFWRu/Mr4wkYyIRpP+S
         DuOgkIl1EmC8WJRw/Ak4Oo7axNXpXIoNod21t9FMcQTvlmgNrwi99j8ExUx1UXdi6CNF
         zUL/2CRWqr+9i/7Es+FkP8GqEDHz0t3psuIy76s+DWXKa6zO7FNatyg1JqhA/6pkac+I
         TEDQ==
X-Gm-Message-State: AOAM532seHlaSxzOS6ghaeQOVDgiivMR6S4+dKwJB72sDZyBIG0OR+Yl
        M9ejmCVmu/yzHJEW5uOtF6hB7ClnVg==
X-Google-Smtp-Source: ABdhPJxcvlH+serFrOMN+1im9jrwrFaOlEPVYa9rWqoDua+9mdAm1Le4cY9xy6dYpTU8oTbI2QEzBA==
X-Received: by 2002:a4a:1506:: with SMTP id 6mr3518815oon.93.1630684322565;
        Fri, 03 Sep 2021 08:52:02 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id b25sm1078381ooq.6.2021.09.03.08.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 08:52:01 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tom Rini <trini@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: Enable DT schema checks for %.dtb targets
Date:   Fri,  3 Sep 2021 10:52:01 -0500
Message-Id: <20210903155201.3004567-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It is possible to build a single dtb, but not with DT schema validation
enabled. Enable the schema validation to run for %.dtb targets. Anyone
building a dtb for a specific platform *should* pay attention to schema
warnings.

This could be supported with a separate %.dt.yaml target instead.
However, the .dt.yaml format is considered an intermediate format and
could possibly go away at some point if schema checking is integrated
into dtc. Also, the plan is to enable the schema checks by default once
platforms are free of warnings, and this is a move in that direction.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index ec9e8a0fe298..01b888cfe1dc 100644
--- a/Makefile
+++ b/Makefile
@@ -1399,8 +1399,8 @@ endif
 
 ifneq ($(dtstree),)
 
-%.dtb: include/config/kernel.release scripts_dtc
-	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
+%.dtb: dt_binding_check include/config/kernel.release scripts_dtc
+	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ $(dtstree)/$*.dt.yaml
 
 %.dtbo: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
@@ -1409,7 +1409,7 @@ PHONY += dtbs dtbs_install dtbs_check
 dtbs: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
-ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
+ifneq ($(filter dtbs_check %.dtb, $(MAKECMDGOALS)),)
 export CHECK_DTBS=y
 dtbs: dt_binding_check
 endif
-- 
2.30.2

