Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [195.41.46.236] ([195.41.46.236]:56833 "EHLO pfepb.post.tele.dk"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753174AbZISJCn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 19 Sep 2009 05:02:43 -0400
Date: Sat, 19 Sep 2009 11:02:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 11/18] kconfig CROSS_COMPILE option
Message-ID: <20090919090241.GA25877@merkur.ravnborg.org>
References: <200909181949.n8IJnVSB019127@imap1.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200909181949.n8IJnVSB019127@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org, Roland McGrath <roland@redhat.com>
Cc: linux-kbuild@vger.kernel.org

On Fri, Sep 18, 2009 at 12:49:30PM -0700, akpm@linux-foundation.org wrote:
> From: Roland McGrath <roland@redhat.com>
> 
> This adds CROSS_COMPILE as a kconfig string so you can store it in
> .config.  Then you can use plain "make" in the configured kernel build
> directory to do the right cross compilation without setting the
> command-line or environment variable every time.
> 
> With this, you can set up different build directories for different kernel
> configurations, whether native or cross-builds, and then use the simple:
> 
> 	make -C /build/dir M=module-source-dir
> 
> idiom to build modules for any given target kernel, indicating which one
> by nothing but the build directory chosen.
> 
> I tried a version that defaults the string with env="CROSS_COMPILE" so
> that in a "make oldconfig" with CROSS_COMPILE in the environment you can
> just hit return to store the way you're building it.  But the kconfig
> prompt for strings doesn't give you any way to say you want an empty
> string instead of the default, so I punted that.
> 
> Signed-off-by: Roland McGrath <roland@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>


I had queued this patch (but for various reasons it had
not hit -next - sigh).
It does not save/restore SUBARCH - but that should
be doable too.

For my testing it works and we save both ARCH and CROSS_COMPILE.

	Sam

commit 07d291e7ad3bff028e7a452e5c2ad66dfdeef146
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Mon Jul 20 11:49:54 2009 +0200

    kbuild: save ARCH & CROSS_COMPILE when building a kernel
    
    When building a kernel for a different architecture
    kbuild requires the user always to specify ARCH and
    CROSS_COMPILE on the command-line.
    
    We use the asm symlink to detect if user forgets to
    specify the correct ARCH value - but that symlink
    is about to die. And we do now want to loose this check.
    
    This patch save the settings of ARCH and CROSS_COMPILE
    in a file named ".kbuild".
    The settings are saved during "make *config" time
    and always read.
    
    If user try to change the settings we error out.
    
    This works both for plain builds and for O=...
    builds.
    So now you can do:
    $ mkdir sparc64
    $ make O=sparc64 ARCH=sparc64 CROSS_COMPILE=sparc64-linux- defconfig
    $ cd sparc64
    $ make
    
    Notice that you no longer need to tell kbuild
    the settings of ARCH and CROSS_COMPILE when you type make
    in the output directory.
    Likewise for plain builds where you do not use O=...
    
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

diff --git a/Makefile b/Makefile
index 305d005..d46f688 100644
--- a/Makefile
+++ b/Makefile
@@ -179,9 +179,36 @@ SUBARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
 # Alternatively CROSS_COMPILE can be set in the environment.
 # Default value for CROSS_COMPILE is not to prefix executables
 # Note: Some architectures assign CROSS_COMPILE in their arch/*/Makefile
+#
+# To force ARCH and CROSS_COMPILE settings include .kbuild
+# in the kernel tree - do not patch this file.
 export KBUILD_BUILDHOST := $(SUBARCH)
-ARCH		?= $(SUBARCH)
-CROSS_COMPILE	?=
+
+# Kbuild save the ARCH and CROSS_COMPILE setting in .kbuild
+# Restore these settings and check that user did not specify
+# conflicting values.
+ifneq ($(wildcard .kbuild),)
+        -include .kbuild
+        ifneq ($(CROSS_COMPILE),)
+                 ifneq ($(CROSS_COMPILE),$(KBUILD_CROSS_COMPILE))
+                        $(error CROSS_COMPILE changed from \
+                                "$(KBUILD_CROSS_COMPILE)" to \
+                                to "$(CROSS_COMPILE)". \
+                                Use "make mrproper" to fix it up)
+                endif
+        endif
+        ifneq ($(ARCH),)
+                ifneq ($(KBUILD_ARCH),$(ARCH))
+                        $(error ARCH changed from \
+                                "$(KBUILD_ARCH)" to "$(ARCH)". \
+                                Use "make mrproper" to fix it up)
+                endif
+        endif
+        CROSS_COMPILE := $(KBUILD_CROSS_COMPILE)
+        ARCH          := $(KBUILD_ARCH)
+else
+        ARCH ?= $(SUBARCH)
+endif
 
 # Architecture as present in compile.h
 UTS_MACHINE 	:= $(ARCH)
@@ -446,6 +473,10 @@ ifeq ($(config-targets),1)
 include $(srctree)/arch/$(SRCARCH)/Makefile
 export KBUILD_DEFCONFIG KBUILD_KCONFIG
 
+# save ARCH & CROSS_COMPILE settings
+$(shell (echo KBUILD_ARCH := $(ARCH) && \
+         echo KBUILD_CROSS_COMPILE := $(CROSS_COMPILE)) > .kbuild)
+
 config: scripts_basic outputmakefile FORCE
 	$(Q)mkdir -p include/linux include/config
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
@@ -1197,6 +1228,7 @@ CLEAN_FILES +=	vmlinux System.map \
 # Directories & files removed with 'make mrproper'
 MRPROPER_DIRS  += include/config include2 usr/include include/generated
 MRPROPER_FILES += .config .config.old include/asm .version .old_version \
+                  .kbuild                                               \
                   include/linux/autoconf.h include/linux/version.h      \
                   include/linux/utsrelease.h                            \
                   include/linux/bounds.h include/asm*/asm-offsets.h     \
