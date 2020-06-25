Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405069AbgFYUvd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 16:51:33 -0400
Message-ID: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
Date: Thu, 25 Jun 2020 13:51:30 -0700 (PDT)
From: Domenico Andreoli <domenico.andreoli@linux.com>
Subject: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>

From: Domenico Andreoli <domenico.andreoli@linux.com>

Make 'make tar-pkg' install dtbs on arm64.

Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>

v2:
 - Destination path includes the kernel version, as expected

---
 scripts/package/buildtar |    9 +++++++++
 1 file changed, 9 insertions(+)

Index: b/scripts/package/buildtar
===================================================================
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -125,6 +125,15 @@ case "${ARCH}" in
 		;;
 esac
 
+#
+# Install dtbs
+#
+case "${ARCH}" in
+	arm64)
+		make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
+		;;
+esac
+
 if [ "${1}" = dir-pkg ]; then
 	echo "Kernel tree successfully created in $tmpdir"
 	exit 0

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
