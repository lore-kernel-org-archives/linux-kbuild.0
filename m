Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35047 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751551AbeEBUBw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 May 2018 16:01:52 -0400
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH v2] kbuild/debian: Use KBUILD_BUILD_* when set
Date: Wed,  2 May 2018 22:01:36 +0200
Message-Id: <20180502200137.6870-1-malat@debian.org>
In-Reply-To: <20180423195055.26069-1-malat@debian.org>
References: <20180423195055.26069-1-malat@debian.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: malat@debian.org, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Be nice to the user and check env vars KBUILD_BUILD_USER &
KBUILD_BUILD_HOST when those are set.

Since DEBEMAIL accept a syntax where the full name is present, be extra
nice to user and extract email address only.

Cc: Riku Voipio <riku.voipio@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
v2: update patch since syntax of DEBEMAIL may contain full name

 scripts/package/mkdebian | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 6adb3a16ba3b..3f4e43446db3 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -73,9 +73,19 @@ fi
 
 # Try to determine maintainer and email values
 if [ -n "$DEBEMAIL" ]; then
-       email=$DEBEMAIL
+       case "$DEBEMAIL" in
+         *\ * )
+           email=$(echo $DEBEMAIL | cut -d '<' -f2 | cut -d '>' -f1)
+           echo >&2 "Extracting email from DEBEMAIL. Use DEBFULLNAME instead."
+           ;;
+         *)
+           email=$DEBEMAIL
+           ;;
+       esac
 elif [ -n "$EMAIL" ]; then
        email=$EMAIL
+elif [ -n "$KBUILD_BUILD_USER" ] && [ -n "$KBUILD_BUILD_HOST" ]; then
+       email=$KBUILD_BUILD_USER@$KBUILD_BUILD_HOST
 else
        email=$(id -nu)@$(hostname -f 2>/dev/null || hostname)
 fi
-- 
2.11.0

