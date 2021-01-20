Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D26C433E0
	for <linux-kbuild@archiver.kernel.org>; Wed, 20 Jan 2021 04:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D474C23121
	for <linux-kbuild@archiver.kernel.org>; Wed, 20 Jan 2021 04:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731575AbhATEF4 (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 19 Jan 2021 23:05:56 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:55317 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729221AbhATEF2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 23:05:28 -0500
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 10K446Aa007457;
        Wed, 20 Jan 2021 13:04:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 10K446Aa007457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611115446;
        bh=BRgrkKTsVG1UZgRw/qwmxVo1U8KoOfHkPwz2tqhTwc8=;
        h=From:To:Cc:Subject:Date:From;
        b=Ji+9Fc88MZBtcCgjAPB9rGZJxbxrgJDyi8T9GJo4S1sBSlTQshonUv7Q2PV/gVeWf
         srh23/QT0ZJF0ddzm+Z4CrkdHPlwHAciVRsPniT58diZ4Ca+khZELjbEjBl3gYLsyb
         3d1wxL+UnVjDQyIqUxg5Oo8+HH+tCfO0B801iW7cUtGLbrZblKxzZ+8jUGYVLNMhCO
         As4mt9lwC+tVi6INGhJaxS7DtZb90x/dshhLgfRosn+tc1eMdAXessUroFAPhwJwz7
         VjeTs62WQFE7zIoxrE3pbQsDRkOm5RBBJDRlfaAadP6DnmJgfBxhaOt6WK+7d4WETB
         MrgsG1c02T0eA==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: stop removing stale <linux/version.h> file
Date:   Wed, 20 Jan 2021 13:04:03 +0900
Message-Id: <20210120040403.2897639-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Revert commit 223c24a7dba9 ("kbuild: Automatically remove stale
<linux/version.h> file").

It was more than 6 years ago. I do not expect anybody to start
git-bisect for such a big window.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Makefile b/Makefile
index 23d0494e48bc..ebbf7158dfa0 100644
--- a/Makefile
+++ b/Makefile
@@ -257,7 +257,6 @@ export building_out_of_srctree srctree objtree VPATH
 # of make so .config is not included in this case either (for *config).
 
 version_h := include/generated/uapi/linux/version.h
-old_version_h := include/linux/version.h
 
 clean-targets := %clean mrproper cleandocs
 no-dot-config-targets := $(clean-targets) \
@@ -1261,7 +1260,6 @@ endef
 
 $(version_h): FORCE
 	$(call filechk,version.h)
-	$(Q)rm -f $(old_version_h)
 
 include/generated/utsrelease.h: include/config/kernel.release FORCE
 	$(call filechk,utsrelease.h)
-- 
2.27.0

