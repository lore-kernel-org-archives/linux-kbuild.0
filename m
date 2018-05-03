Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:42058 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751004AbeECLrS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 May 2018 07:47:18 -0400
Received: by mail-lf0-f51.google.com with SMTP id u21-v6so25500489lfu.9
        for <linux-kbuild@vger.kernel.org>; Thu, 03 May 2018 04:47:17 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH] kbuild: deb-pkg improve maintainer address generation
Date: Thu,  3 May 2018 14:46:27 +0300
Message-Id: <20180503114627.30183-1-riku.voipio@linaro.org>
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
 scripts/package/mkdebian | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 6adb3a16ba3b..a70f20eb877a 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -71,22 +71,23 @@ if [ "$ARCH" = "um" ] ; then
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
+if echo $email|grep -q '<.*>';
+then
+	maintainer=$email
 else
-       name="Anonymous"
+	# or construct the maintainer string
+	user=${KBUILD_BUILD_USER-$(id -nu)}
+	name=${DEBFULLNAME-$user}
+	if [ -n "$email" ]; then
+		maintainer="$name <$email>"
+	else
+		buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
+		maintainer="$name <$user@$buildhost>"
+	fi
 fi
-maintainer="$name <$email>"
 
 # Try to determine distribution
 if [ -n "$KDEB_CHANGELOG_DIST" ]; then
-- 
2.14.2

