Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:32955 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbeEGHLx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 May 2018 03:11:53 -0400
Received: by mail-lf0-f48.google.com with SMTP id m18-v6so39041713lfb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 May 2018 00:11:53 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v2] kbuild: deb-pkg improve maintainer address generation
Date: Mon,  7 May 2018 10:11:34 +0300
Message-Id: <20180507071134.5213-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: debian-kernel@lists.debian.org, malat@debian.org, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

There is multiple issues with the genaration of maintainer string

It uses DEBEMAIL and EMAIL enviroment variables, which may contain angle brackets,
creating invalid maintainer strings. The documented KBUILD_BUILD_USER and
KBUILD_BUILD_HOST variables are not used. Undocumented and uncommon NAME
variable is used. Refactor the Maintainer string to:

- use EMAIL or DEBEMAIL directly if they are in form "name <user@host>"
- use KBUILD_BUILD_USER and KBUILD_BUILD_HOST if set before falling
  back to autodetection
- no longer use NAME variable or the useless Anonymous string

The logic is switched from multiline if/then/fi statements to compact
shell variable substition commands.

Reported-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
v2: include improvements suggested by Masahiro-san

 scripts/package/mkdebian | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 6adb3a16ba3b..985d72d1ab34 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -71,22 +71,21 @@ if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
 fi
 
-# Try to determine maintainer and email values
-if [ -n "$DEBEMAIL" ]; then
-       email=$DEBEMAIL
-elif [ -n "$EMAIL" ]; then
-       email=$EMAIL
-else
-       email=$(id -nu)@$(hostname -f 2>/dev/null || hostname)
-fi
-if [ -n "$DEBFULLNAME" ]; then
-       name=$DEBFULLNAME
-elif [ -n "$NAME" ]; then
-       name=$NAME
+email=${DEBEMAIL-$EMAIL}
+
+# use email string directly if it contains <email>
+if echo $email | grep -q '<.*>'; then
+	maintainer=$email
 else
-       name="Anonymous"
+	# or construct the maintainer string
+	user=${KBUILD_BUILD_USER-$(id -nu)}
+	name=${DEBFULLNAME-$user}
+	if [ -z "$email" ]; then
+		buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
+		email="$user@$buildhost"
+	fi
+	maintainer="$name <$email>"
 fi
-maintainer="$name <$email>"
 
 # Try to determine distribution
 if [ -n "$KDEB_CHANGELOG_DIST" ]; then
-- 
2.14.2

