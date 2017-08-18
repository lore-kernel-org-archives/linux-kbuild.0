Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:38080 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751713AbdHRWVl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Aug 2017 18:21:41 -0400
Received: by mail-wm0-f65.google.com with SMTP id y206so5548048wmd.5
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Aug 2017 15:21:40 -0700 (PDT)
From: Nicolas Porcel <nicolasporcel06@gmail.com>
Subject: [PATCH 1/2] kconfig: Use KCONFIG_CONFIG in buildtar
Date: Sat, 19 Aug 2017 00:20:51 +0200
Message-Id: <20170818222052.22375-2-nicolasporcel06@gmail.com>
In-Reply-To: <20170818222052.22375-1-nicolasporcel06@gmail.com>
References: <20170818222052.22375-1-nicolasporcel06@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Porcel <nicolasporcel06@gmail.com>

Previously, .config was used in buildtar script regardless of the value of
KCONFIG_CONFIG.

Signed-off-by: Nicolas Porcel <nicolasporcel06@gmail.com>
---
 scripts/package/buildtar | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index e046bff33589..483ba00524d5 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -56,7 +56,7 @@ mkdir -p -- "${tmpdir}/boot"
 #
 # Try to install modules
 #
-if grep -q '^CONFIG_MODULES=y' "${objtree}/.config"; then
+if grep -q '^CONFIG_MODULES=y' "${KCONFIG_CONFIG}"; then
 	make ARCH="${ARCH}" O="${objtree}" KBUILD_SRC= INSTALL_MOD_PATH="${tmpdir}" modules_install
 fi
 
@@ -65,7 +65,7 @@ fi
 # Install basic kernel files
 #
 cp -v -- "${objtree}/System.map" "${tmpdir}/boot/System.map-${KERNELRELEASE}"
-cp -v -- "${objtree}/.config" "${tmpdir}/boot/config-${KERNELRELEASE}"
+cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
 cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 
 
-- 
2.14.1

