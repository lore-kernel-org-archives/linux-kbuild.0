Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:58452 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbfCHJ5E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 04:57:04 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] kbuild: pkg: grep include/config/auto.conf instead of $KCONFIG_CONFIG
Date: Fri,  8 Mar 2019 18:56:25 +0900
Message-Id: <1552038985-10473-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1552038985-10473-1-git-send-email-yamada.masahiro@socionext.com>
References: <1552038985-10473-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This will be a little more efficient since unset CONFIG options are
stripped away from auto.conf, and we can hard-code the path to auto.conf
since it is never overridden.

include/config/kernel.release is generated before %pkg is run.
So, it is guaranteed auto.conf is up-to-date.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/builddeb | 2 +-
 scripts/package/buildtar | 2 +-
 scripts/package/mkdebian | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index e2cb438..b03dd56 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -13,7 +13,7 @@
 set -e
 
 is_enabled() {
-	grep -q "^$1=y" $KCONFIG_CONFIG
+	grep -q "^$1=y" include/config/auto.conf
 }
 
 if_enabled_echo() {
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index cfd2a4a..2f66c81 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -56,7 +56,7 @@ dirs=boot
 #
 # Try to install modules
 #
-if grep -q '^CONFIG_MODULES=y' "${KCONFIG_CONFIG}"; then
+if grep -q '^CONFIG_MODULES=y' include/config/auto.conf; then
 	make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_install
 	dirs="$dirs lib"
 fi
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index e3726e8..dd7202f 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -7,7 +7,7 @@
 set -e
 
 is_enabled() {
-	grep -q "^$1=y" $KCONFIG_CONFIG
+	grep -q "^$1=y" include/config/auto.conf
 }
 
 if_enabled_echo() {
-- 
2.7.4
