Return-Path: <SRS0=IFx9=D7=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884A5C55178
	for <linux-kbuild@archiver.kernel.org>; Sat, 24 Oct 2020 12:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D10422257
	for <linux-kbuild@archiver.kernel.org>; Sat, 24 Oct 2020 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603543209;
	bh=1LsZLS6OViW8gYSobpM1E5wVZVG6gAIV782zBtNBvJ0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=ttbmA3oBpx3dQixPL0mJ9yUXxWBpY9vb9OL76lZdXQkYbW86ve7fR2LV3CAtp73e3
	 /35pTVUXEdZ24SBRbcNRdDWZSKtFXfysiHkL20RbXdh0QKWQno+bmLBMEL6B2xLPeq
	 pOxVJgbXInWTdT4ORjA3+/4lxM9OI1SkB/v46gZc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761418AbgJXMkI (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 24 Oct 2020 08:40:08 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:60870 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761413AbgJXMkI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Oct 2020 08:40:08 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 09OCdV89029147;
        Sat, 24 Oct 2020 21:39:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 09OCdV89029147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603543173;
        bh=81zyaYaVR1S6fInGALmKGZwy2+4D+jIaUDdhWxoELSc=;
        h=From:To:Cc:Subject:Date:From;
        b=1fPtJVNgKR2Ygu1jSUFbZGiZVHI8sNWnruf+BP68TbqndfBMTzqwB6TxAtiVAH9/E
         O/atUFJ08z6lozUQy0V+ZWsNTk8/SIUUk99FJ3fb1Eyiv9IHetkt2dKVQVR3f9RmFa
         SK0hRQNumCo8BzUUMu78WI8FvH6VIxTSzhnClhZwvcllAzBbbDYJoqY0ax2itnw4aP
         Q/gzldBjFPrY8eoEXTygWpFLUpTL0nzmbUjv6fi08fcTlHhM9Ke/ORMsPvZWGHsz7w
         f0n2GJicMJgr8sLYrQvklhoydNddsFkt/HiHfOteGRrrPIMDAWI1+ZjWWt+JwfgKiT
         uujT3EFJ0EY8w==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kconfig: qconf: drop Qt4 support
Date:   Sat, 24 Oct 2020 21:38:39 +0900
Message-Id: <20201024123841.1201922-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It is possible to keep this compatible with both Qt4 and Qt5, but not
worth the efforts any more; it would require us to test this on both of
them, and prevent us from using new features in Qt5.

Qt5 was released in 2012, and now widely available.

Drop the Qt4 support.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf-cfg.sh | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/qconf-cfg.sh b/scripts/kconfig/qconf-cfg.sh
index 02ccc0ae1031..d1eb2407c35d 100755
--- a/scripts/kconfig/qconf-cfg.sh
+++ b/scripts/kconfig/qconf-cfg.sh
@@ -2,7 +2,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 PKG="Qt5Core Qt5Gui Qt5Widgets"
-PKG2="QtCore QtGui"
 
 if [ -z "$(command -v pkg-config)" ]; then
 	echo >&2 "*"
@@ -18,15 +17,8 @@ if pkg-config --exists $PKG; then
 	exit 0
 fi
 
-if pkg-config --exists $PKG2; then
-	echo cflags=\"$(pkg-config --cflags $PKG2)\"
-	echo libs=\"$(pkg-config --libs $PKG2)\"
-	echo moc=\"$(pkg-config --variable=moc_location QtCore)\"
-	exit 0
-fi
-
 echo >&2 "*"
-echo >&2 "* Could not find Qt via pkg-config."
-echo >&2 "* Please install either Qt 4.8 or 5.x. and make sure it's in PKG_CONFIG_PATH"
+echo >&2 "* Could not find Qt5 via pkg-config."
+echo >&2 "* Please install Qt5 and make sure it's in PKG_CONFIG_PATH"
 echo >&2 "*"
 exit 1
-- 
2.25.1

