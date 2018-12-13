Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44761 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbeLMIHQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Dec 2018 03:07:16 -0500
Received: by mail-lf1-f68.google.com with SMTP id z13so814918lfe.11
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Dec 2018 00:07:14 -0800 (PST)
From: riku.voipio@linaro.org
Subject: [PATCH] deb-pkg: generate correct build dependencies
Date: Thu, 13 Dec 2018 10:07:11 +0200
Message-Id: <20181213080711.8907-1-riku.voipio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, manivannan.sadhasivam@linaro.org, debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

bison/flex is now needed always for building since genksyms is always
generated. Some build dependencies depend on kernel configuration,
enable them as needed:

- libelf-dev when UNWINDER_ORC is set
- libssl-dev for SYSTEM_TRUSTED_KEYRING

Since the libssl-dev is needed for extract_cert binary, denote with
:native to install the libssl-dev for the build machines architecture,
rather than for the architecture of the kernel being built.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/mkdebian | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index edcad61fe3cd..c858abf4569e 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -134,6 +134,8 @@ fi
 
 mkdir -p debian/
 echo $debarch > debian/arch
+extra_build_depends=", $(if_enabled_echo UNWINDER_ORC libelf-dev)"
+extra_build_depends="$extra_build_depends, $(if_enabled_echo SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
 
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
@@ -170,7 +172,7 @@ Source: $sourcename
 Section: kernel
 Priority: optional
 Maintainer: $maintainer
-Build-Depends: bc, kmod, cpio
+Build-Depends: bc, kmod, cpio, bison, flex $extra_build_depends
 Homepage: http://www.kernel.org/
 
 Package: $packagename
-- 
2.19.2
