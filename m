Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbgFZVVB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 17:21:01 -0400
Date: Fri, 26 Jun 2020 23:20:56 +0200
From: Domenico Andreoli <domenico.andreoli@linux.com>
Subject: [PATCH v3] kbuild: buildtar: add dtbs support
Message-ID: <20200626212056.GA25753@dumbo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>

From: Domenico Andreoli <domenico.andreoli@linux.com>

Make 'make tar-pkg' install dtbs.

v3:
 - Check CONFIG_OF_EARLY_FLATTREE=y instead of ARCH before installing dtbs

v2:
 - Destination path includes the kernel version, as expected

Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>

---
 scripts/package/buildtar |    7 +++++++
 1 file changed, 7 insertions(+)

Index: b/scripts/package/buildtar
===================================================================
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -125,6 +125,13 @@ case "${ARCH}" in
 		;;
 esac
 
+#
+# Install dtbs
+#
+if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then
+	$MAKE ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
+fi
+
 if [ "${1}" = dir-pkg ]; then
 	echo "Kernel tree successfully created in $tmpdir"
 	exit 0

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
