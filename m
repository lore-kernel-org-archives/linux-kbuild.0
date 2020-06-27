Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgF0MZL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 08:25:11 -0400
Date: Sat, 27 Jun 2020 14:25:05 +0200
From: Domenico Andreoli <domenico.andreoli@linux.com>
Subject: [PATCH v4] kbuild: buildtar: add dtbs support
Message-ID: <20200627122505.GA6095@dumbo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>

From: Domenico Andreoli <domenico.andreoli@linux.com>

Make 'make tar-pkg' install dtbs.

v4:
 - Install the dtbs before modules & kernel, not after
 - Check for the dtbs_install target before attempting to invoke it

v3:
 - Check for CONFIG_OF_EARLY_FLATTREE=y instead of ARCH before installing dtbs

v2:
 - Add the kernel release to the destination path

Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>

---
 scripts/package/buildtar |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: b/scripts/package/buildtar
===================================================================
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -53,6 +53,18 @@ rm -rf -- "${tmpdir}"
 mkdir -p -- "${tmpdir}/boot"
 dirs=boot
 
+
+#
+# Try to install dtbs
+#
+if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then
+	# Only some architectures with OF support have this target
+	if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
+		$MAKE ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
+    fi
+fi
+
+
 #
 # Try to install modules
 #

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
