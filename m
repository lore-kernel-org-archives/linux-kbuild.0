Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42510 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729041AbfABJXI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jan 2019 04:23:08 -0500
Received: by mail-lj1-f193.google.com with SMTP id l15-v6so26468094lja.9
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Jan 2019 01:23:06 -0800 (PST)
From: riku.voipio@linaro.org
Subject: [PATCH v2] deb-pkg: generate correct build dependencies
Date: Wed,  2 Jan 2019 11:23:04 +0200
Message-Id: <20190102092304.27262-1-riku.voipio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, manivannan.sadhasivam@linaro.org, debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

bison/flex is now needed always for building for kconfig. Some build
dependencies depend on kernel configuration, enable them as needed:

- libelf-dev when UNWINDER_ORC is set
- libssl-dev for SYSTEM_TRUSTED_KEYRING

Since the libssl-dev is needed for extract_cert binary, denote with
:native to install the libssl-dev for the build machines architecture,
rather than for the architecture of the kernel being built.

Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
v2: commit message updated
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
