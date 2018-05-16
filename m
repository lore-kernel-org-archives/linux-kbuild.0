Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:42469 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751595AbeEPOPV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 May 2018 10:15:21 -0400
Received: by mail-pg0-f68.google.com with SMTP id p9-v6so350444pgc.9
        for <linux-kbuild@vger.kernel.org>; Wed, 16 May 2018 07:15:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 3/4] powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS
Date: Thu, 17 May 2018 00:14:57 +1000
Message-Id: <20180516141458.18996-4-npiggin@gmail.com>
In-Reply-To: <20180516141458.18996-1-npiggin@gmail.com>
References: <20180516141458.18996-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Segher Boessenkool <segher@kernel.crashing.org>

The powerpc toolchain can compile combinations of 32/64 bit and
big/little endian, so it's convenient to consider, e.g.,

  `CC -m64 -mbig-endian`

To be the C compiler for the purpose of invoking it to build target
artifacts. So overriding the the CC variable to include these flags
works for this purpose.

Unfortunately that is not compatible with the way the proposed new
Kconfig macro language implementation, which gets confused by the
the $(CC) environment variable changing.

After previous patches in this series, these flags can be carefully
passed in using the usual kbuild flags variables instead.

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

---
Since v3:
- Added 32/64 flags to recordmcount.pl invocation of the toolchain,
  similarly to BE/LE. This fixes problems with toolchain default
  target bitness != kernel target bitness. I kept Steven's ack
  because it's much the same powerpc specific change, okay?

- Added a similar fix for mismatched toolchain default endianness
  or bitness to the gcc-check-mprofile-kernel.sh script. This was
  pulled in from patch 4 and improved (added comment and endianness
  flags).

 arch/powerpc/Makefile                          | 16 +++++++++-------
 .../powerpc/tools/gcc-check-mprofile-kernel.sh | 12 ++++++++----
 scripts/recordmcount.pl                        | 18 +++++++++++++++++-
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 167b26a0780c..6faf1d6ad9dd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -75,13 +75,15 @@ endif
 endif
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
-override LD	+= -EL
+KBUILD_CFLAGS	+= -mlittle-endian
+LDFLAGS		+= -EL
 LDEMULATION	:= lppc
 GNUTARGET	:= powerpcle
 MULTIPLEWORD	:= -mno-multiple
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
 else
-override LD	+= -EB
+KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
+LDFLAGS		+= -EB
 LDEMULATION	:= ppc
 GNUTARGET	:= powerpc
 MULTIPLEWORD	:= -mmultiple
@@ -94,19 +96,19 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
 endif
 
-cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
 ifneq ($(cc-name),clang)
   cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mno-strict-align
 endif
 
+cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
+cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 
 ifeq ($(HAS_BIARCH),y)
-override AS	+= -a$(BITS)
-override LD	+= -m elf$(BITS)$(LDEMULATION)
-override CC	+= -m$(BITS)
+KBUILD_CFLAGS	+= -m$(BITS)
+KBUILD_AFLAGS	+= -m$(BITS) -Wl,-a$(BITS)
+LDFLAGS		+= -m elf$(BITS)$(LDEMULATION)
 KBUILD_ARFLAGS	+= --target=elf$(BITS)-$(GNUTARGET)
 endif
 
diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
index 061f8035bdbe..a7dd0e5d9f98 100755
--- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
+++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
@@ -7,17 +7,21 @@ set -o pipefail
 # To debug, uncomment the following line
 # set -x
 
+# -mprofile-kernel is only supported on 64le, so this should not be invoked
+# for other targets. Therefore we can pass in -m64 and -mlittle-endian
+# explicitly, to take care of toolchains defaulting to other targets.
+
 # Test whether the compile option -mprofile-kernel exists and generates
 # profiling code (ie. a call to _mcount()).
 echo "int func() { return 0; }" | \
-    $* -S -x c -O2 -p -mprofile-kernel - -o - 2> /dev/null | \
-    grep -q "_mcount"
+    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
+    2> /dev/null | grep -q "_mcount"
 
 # Test whether the notrace attribute correctly suppresses calls to _mcount().
 
 echo -e "#include <linux/compiler.h>\nnotrace int func() { return 0; }" | \
-    $* -S -x c -O2 -p -mprofile-kernel - -o - 2> /dev/null | \
-    grep -q "_mcount" && \
+    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
+    2> /dev/null | grep -q "_mcount" && \
     exit 1
 
 echo "OK"
diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index 191eb949d52c..fe06e77c15eb 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -266,13 +266,29 @@ if ($arch eq "x86_64") {
     $objcopy .= " -O elf32-sh-linux";
 
 } elsif ($arch eq "powerpc") {
+    my $ldemulation;
+
     $local_regex = "^[0-9a-fA-F]+\\s+t\\s+(\\.?\\S+)";
     # See comment in the sparc64 section for why we use '\w'.
     $function_regex = "^([0-9a-fA-F]+)\\s+<(\\.?\\w*?)>:";
     $mcount_regex = "^\\s*([0-9a-fA-F]+):.*\\s\\.?_mcount\$";
 
+    if ($endian eq "big") {
+	    $cc .= " -mbig-endian ";
+	    $ld .= " -EB ";
+	    $ldemulation = "ppc"
+    } else {
+	    $cc .= " -mlittle-endian ";
+	    $ld .= " -EL ";
+	    $ldemulation = "lppc"
+    }
     if ($bits == 64) {
-	$type = ".quad";
+        $type = ".quad";
+        $cc .= " -m64 ";
+        $ld .= " -m elf64".$ldemulation." ";
+    } else {
+        $cc .= " -m32 ";
+        $ld .= " -m elf32".$ldemulation." ";
     }
 
 } elsif ($arch eq "arm") {
-- 
2.17.0

