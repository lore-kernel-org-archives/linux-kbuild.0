Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from skprod2.natinst.com ([130.164.80.23]:55531 "EHLO ni.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1757533AbcH3J5u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Aug 2016 05:57:50 -0400
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Subject: [PATCH] merge_config.sh: fail loudly if make also fails
Date: Tue, 30 Aug 2016 12:56:22 +0300
Message-Id: <20160830095622.26600-1-adrian.ratiu@ni.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: brad.mouring@ni.com, bruce.ashfield@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

There are cases in which the make call to fill missing symbols can fail.
I encountered one such case while building an Yocto/OpenEmbedded based
custom Linux kernel because by default after late 2014 OE poisons the
default compiler sysroot path [1], making it point to a bogus location
like /does/not/exist. This means the "--sysroot" compiler arg needs to
be passed everywhere explicitly.

If the sysroot is poisoned and no sane sysroot is passed to the make
call inside merge_config.sh it can fail silently and the continuing
build process using the borked config which does not know can generate a
kernel which will not boot (this is what happens in Yocto/OE). This was
fixed in OE by passing --sysroot (contained in $TOOLCHAIN_OPTIONS) [2].

Nevertheless, even though OE was fixed to pass a correct --sysroot and
avoid the error, this make call shouldn't fail silently and lead to
unbootable kernels. Make it fail loudly so that other build systems like
OE can pick up the error from merge_config.sh and act accordingly.

[1] http://git.openembedded.org/openembedded-core/commit/?id=04b725511a505c582a3abdf63d096967f0320779
[2] http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zedd/kernel&id=87a9f321035428d9f4f8859ff99bb9acb70bd60c

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 scripts/kconfig/merge_config.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 67d1314..5212f37 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -152,7 +152,10 @@ fi
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
 make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
-
+if [ "$?" -ne 0 ]; then
+    echo "Make failed to fill missing config symbols. Exit." >&2
+    exit 1
+fi
 
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
-- 
2.9.3

