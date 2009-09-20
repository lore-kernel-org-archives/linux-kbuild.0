Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:54762 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750909AbZITKbH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Sep 2009 06:31:07 -0400
Date: Sun, 20 Sep 2009 12:31:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 11/18] kconfig CROSS_COMPILE option
Message-ID: <20090920103108.GA26667@merkur.ravnborg.org>
References: <200909181949.n8IJnVSB019127@imap1.linux-foundation.org> <20090919090241.GA25877@merkur.ravnborg.org> <20090919121950.A599F2728@magilla.sf.frob.com> <20090919131316.GA26044@merkur.ravnborg.org> <20090919234823.12E5E13BA3@magilla.sf.frob.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090919234823.12E5E13BA3@magilla.sf.frob.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland McGrath <roland@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

On Sat, Sep 19, 2009 at 04:48:23PM -0700, Roland McGrath wrote:
> > Another approach would be to ask kbuild for
> > this information so we do not expose various filenames to the
> > outer world.
> 
> For shell scripts and makefiles, running a command like make and retrieving
> its output via pipe is de rigueur.  But for some other programs it might be
> substantially less hassle to just read plain files.  That's what I was
> thinking, anyway.  (I only really think that $ARCH is something that anyone
> would want to fetch before they'd run make anyway, and I guess $SUBARCH in
> the case of ARCH=um, but not $CROSS_COMPILE.)
> 
> > This is analogous to the way we ask for
> > kernelrelease and kernelversion these days.
> 
> Except that include/config/kernel.release is there for all to see (when
> referring to /lib/modules/.../build directory, e.g.), so perhaps some
> people are in fact using that.

So when I move that file to include/generated I will break users script silently - sigh.

Revised patch following your guidelines below.
Does this look better to you?

	Sam

commit 575543347b5baed0ca927cb90ba8807396fe9cc9
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Sun Sep 20 12:24:55 2009 +0200

    kbuild: save ARCH & CROSS_COMPILE when building a kernel
    
    When building a kernel for a different architecture
    kbuild requires the user always to specify ARCH and
    CROSS_COMPILE on the command-line.
    
    We use the asm symlink to detect if user forgets to
    specify the correct ARCH value - but that symlink
    is about to die. And we do now want to loose this check.
    
    This patch save the settings of ARCH and CROSS_COMPILE
    in two files named:
    
        include/generated/kernel.arch
        include/generated/kernel.cross
    
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
    Cc: Roland McGrath <roland@redhat.com>

diff --git a/Makefile b/Makefile
index 305d005..a45b0a2 100644
--- a/Makefile
+++ b/Makefile
@@ -179,9 +179,46 @@ SUBARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
 # Alternatively CROSS_COMPILE can be set in the environment.
 # Default value for CROSS_COMPILE is not to prefix executables
 # Note: Some architectures assign CROSS_COMPILE in their arch/*/Makefile
+#
+# To force ARCH and CROSS_COMPILE settings include kernel.* files
+# in the kernel tree - do not patch this file.
 export KBUILD_BUILDHOST := $(SUBARCH)
-ARCH		?= $(SUBARCH)
-CROSS_COMPILE	?=
+
+# Kbuild save the ARCH and CROSS_COMPILE setting in kernel.* files.
+# Restore these settings and check that user did not specify
+# conflicting values.
+
+saved_arch  := $(shell cat include/generated/kernel.arch  2> /dev/null)
+saved_cross := $(shell cat include/generated/kernel.cross 2> /dev/null)
+
+ifneq ($(CROSS_COMPILE),)
+        ifneq ($(saved_cross),)
+                ifneq ($(CROSS_COMPILE),$(saved_cross))
+                        $(error CROSS_COMPILE changed from \
+                                "$(saved_cross)" to \
+                                 to "$(CROSS_COMPILE)". \
+                                 Use "make mrproper" to fix it up)
+                endif
+        endif
+else
+    CROSS_COMPILE := $(saved_cross)
+endif
+
+ifneq ($(ARCH),)
+        ifneq ($(saved_arch),)
+                ifneq ($(saved_arch),$(ARCH))
+                        $(error ARCH changed from \
+                                "$(saved_arch)" to "$(ARCH)". \
+                                 Use "make mrproper" to fix it up)
+                endif
+        endif
+else
+        ifneq ($(saved_arch),)
+                ARCH := $(saved_arch)
+        else
+                ARCH := $(SUBARCH)
+        endif
+endif
 
 # Architecture as present in compile.h
 UTS_MACHINE 	:= $(ARCH)
@@ -446,6 +483,11 @@ ifeq ($(config-targets),1)
 include $(srctree)/arch/$(SRCARCH)/Makefile
 export KBUILD_DEFCONFIG KBUILD_KCONFIG
 
+# save ARCH & CROSS_COMPILE settings
+$(shell mkdir -p include/generated &&                            \
+        echo $(ARCH)          > include/generated/kernel.arch && \
+        echo $(CROSS_COMPILE) > include/generated/kernel.cross)
+
 config: scripts_basic outputmakefile FORCE
 	$(Q)mkdir -p include/linux include/config
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
