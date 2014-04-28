Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:52240 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751426AbaD1H0V (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Apr 2014 03:26:21 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile13) with ESMTP id s3S7QKB4023219
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Apr 2014 16:26:20 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili17) with ESMTP id s3S7QJ303123
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Apr 2014 16:26:19 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: trivial - remove trailing spaces
Date: Mon, 28 Apr 2014 16:26:18 +0900
Message-Id: <1398669978-30261-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 Makefile                             |  8 ++++----
 scripts/Makefile.build               |  4 ++--
 scripts/Makefile.fwinst              |  2 +-
 scripts/Makefile.host                |  2 +-
 scripts/Makefile.lib                 | 10 +++++-----
 scripts/conmakehash.c                | 12 ++++++------
 scripts/kconfig/streamline_config.pl |  2 +-
 scripts/mkcompile_h                  |  4 ++--
 scripts/package/builddeb             |  2 +-
 scripts/patch-kernel                 |  4 ++--
 10 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/Makefile b/Makefile
index 027a0f1..2c4612b 100644
--- a/Makefile
+++ b/Makefile
@@ -162,7 +162,7 @@ export srctree objtree VPATH
 # SUBARCH tells the usermode build what the underlying arch is.  That is set
 # first, and if a usermode build is happening, the "ARCH=um" on the command
 # line overrides the setting of ARCH below.  If a native build is happening,
-# then ARCH is assigned, getting whatever value it gets normally, and 
+# then ARCH is assigned, getting whatever value it gets normally, and
 # SUBARCH is subsequently ignored.
 
 SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
@@ -290,7 +290,7 @@ export KBUILD_CHECKSRC KBUILD_SRC KBUILD_EXTMOD
 #         cmd_cc_o_c       = $(CC) $(c_flags) -c -o $@ $<
 #
 # If $(quiet) is empty, the whole command will be printed.
-# If it is set to "quiet_", only the short version will be printed. 
+# If it is set to "quiet_", only the short version will be printed.
 # If it is set to "silent_", nothing will be printed at all, since
 # the variable $(silent_cmd_cc_o_c) doesn't exist.
 #
@@ -869,7 +869,7 @@ ifdef CONFIG_BUILD_DOCSRC
 endif
 	+$(call if_changed,link-vmlinux)
 
-# The actual objects are generated when descending, 
+# The actual objects are generated when descending,
 # make sure no implicit rule kicks in
 $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
 
@@ -1484,7 +1484,7 @@ endif
 	$(build)=$(build-dir) $(@:.ko=.o)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
-# FIXME Should go into a make.lib or something 
+# FIXME Should go into a make.lib or something
 # ===========================================================================
 
 quiet_cmd_rmdirs = $(if $(wildcard $(rm-dirs)),CLEAN   $(wildcard $(rm-dirs)))
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b5e02b6..bf3e677 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -281,7 +281,7 @@ $(real-objs-m)      : modkern_aflags := $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE)
 $(real-objs-m:.o=.s): modkern_aflags := $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE)
 
 quiet_cmd_as_s_S = CPP $(quiet_modtag) $@
-cmd_as_s_S       = $(CPP) $(a_flags)   -o $@ $< 
+cmd_as_s_S       = $(CPP) $(a_flags)   -o $@ $<
 
 $(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed_dep,as_s_S)
@@ -375,7 +375,7 @@ link_multi_deps =                     \
 $(filter $(addprefix $(obj)/,         \
 $($(subst $(obj)/,,$(@:.o=-objs)))    \
 $($(subst $(obj)/,,$(@:.o=-y)))), $^)
- 
+
 quiet_cmd_link_multi-y = LD      $@
 cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
 
diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
index 4d908d1..2c1d69c 100644
--- a/scripts/Makefile.fwinst
+++ b/scripts/Makefile.fwinst
@@ -18,7 +18,7 @@ include $(srctree)/$(obj)/Makefile
 include scripts/Makefile.host
 
 mod-fw := $(fw-shipped-m)
-# If CONFIG_FIRMWARE_IN_KERNEL isn't set, then install the 
+# If CONFIG_FIRMWARE_IN_KERNEL isn't set, then install the
 # firmware for in-kernel drivers too.
 ifndef CONFIG_FIRMWARE_IN_KERNEL
 mod-fw += $(fw-shipped-y)
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 1ac414f..0f0d6ba 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -166,5 +166,5 @@ $(host-cshlib): $(obj)/%: $(host-cshobjs) FORCE
 	$(call if_changed,host-cshlib)
 
 targets += $(host-csingle)  $(host-cmulti) $(host-cobjs)\
-	   $(host-cxxmulti) $(host-cxxobjs) $(host-cshlib) $(host-cshobjs) 
+	   $(host-cxxmulti) $(host-cxxobjs) $(host-cshlib) $(host-cshobjs)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 6a5b0de..260bf8a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -27,7 +27,7 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # ---------------------------------------------------------------------------
 # o if we encounter foo/ in $(obj-y), replace it by foo/built-in.o
 #   and add the directory to the list of dirs to descend into: $(subdir-y)
-# o if we encounter foo/ in $(obj-m), remove it from $(obj-m) 
+# o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
 #   and add the directory to the list of dirs to descend into: $(subdir-m)
 
 # Determine modorder.
@@ -46,7 +46,7 @@ obj-m		:= $(filter-out %/, $(obj-m))
 
 subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
 
-# if $(foo-objs) exists, foo.o is a composite object 
+# if $(foo-objs) exists, foo.o is a composite object
 multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
 multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
 multi-used   := $(multi-used-y) $(multi-used-m)
@@ -91,7 +91,7 @@ obj-dirs	:= $(addprefix $(obj)/,$(obj-dirs))
 
 # These flags are needed for modversions and compiling, so we define them here
 # already
-# $(modname_flags) #defines KBUILD_MODNAME as the name of the module it will 
+# $(modname_flags) #defines KBUILD_MODNAME as the name of the module it will
 # end up in (or would, if it gets compiled in)
 # Note: Files that end up in two or more modules are compiled without the
 #       KBUILD_MODNAME definition. The reason is that any made-up name would
@@ -212,7 +212,7 @@ $(obj)/%: $(src)/%_shipped
 
 # Commands useful for building a boot image
 # ===========================================================================
-# 
+#
 #	Use as following:
 #
 #	target: source(s) FORCE
@@ -226,7 +226,7 @@ $(obj)/%: $(src)/%_shipped
 
 quiet_cmd_ld = LD      $@
 cmd_ld = $(LD) $(LDFLAGS) $(ldflags-y) $(LDFLAGS_$(@F)) \
-	       $(filter-out FORCE,$^) -o $@ 
+	       $(filter-out FORCE,$^) -o $@
 
 # Objcopy
 # ---------------------------------------------------------------------------
diff --git a/scripts/conmakehash.c b/scripts/conmakehash.c
index 263a44d..61bbda5 100644
--- a/scripts/conmakehash.c
+++ b/scripts/conmakehash.c
@@ -104,7 +104,7 @@ int main(int argc, char *argv[])
 	}
     }
 
-  /* For now we assume the default font is always 256 characters. */    
+  /* For now we assume the default font is always 256 characters. */
   fontlen = 256;
 
   /* Initialize table */
@@ -236,15 +236,15 @@ int main(int argc, char *argv[])
     }
 
   /* Okay, we hit EOF, now output hash table */
-  
+
   fclose(ctbl);
-  
+
 
   /* Compute total size of Unicode list */
   nuni = 0;
   for ( i = 0 ; i < fontlen ; i++ )
     nuni += unicount[i];
-  
+
   printf("\
 /*\n\
  * Do not edit this file; it was automatically generated by\n\
@@ -268,9 +268,9 @@ u8 dfont_unicount[%d] = \n\
       else
         printf(", ");
     }
-  
+
   printf("\nu16 dfont_unitable[%d] = \n{\n\t", nuni);
-  
+
   fp0 = 0;
   nent = 0;
   for ( i = 0 ; i < nuni ; i++ )
diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 3133172..9cb8522 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -589,7 +589,7 @@ while ($repeat) {
 
     # Now we need to see if we have to check selects;
     loop_select;
-}	    
+}
 
 my %setconfigs;
 
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index cfb8440..6fdc97e 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -68,7 +68,7 @@ UTS_TRUNCATE="cut -b -$UTS_LEN"
 
 ( echo /\* This file is auto generated, version $VERSION \*/
   if [ -n "$CONFIG_FLAGS" ] ; then echo "/* $CONFIG_FLAGS */"; fi
-  
+
   echo \#define UTS_MACHINE \"$ARCH\"
 
   echo \#define UTS_VERSION \"`echo $UTS_VERSION | $UTS_TRUNCATE`\"
@@ -84,7 +84,7 @@ UTS_TRUNCATE="cut -b -$UTS_LEN"
 # recompilations.
 # We don't consider the file changed if only the date/time changed.
 # A kernel config change will increase the generation number, thus
-# causing compile.h to be updated (including date/time) due to the 
+# causing compile.h to be updated (including date/time) due to the
 # changed comment in the
 # first line.
 
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f46e4dd..b151b63 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -130,7 +130,7 @@ if [ "$ARCH" = "um" ] ; then
 	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
 	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
 	gzip "$tmpdir/usr/share/doc/$packagename/config"
-else 
+else
 	cp System.map "$tmpdir/boot/System.map-$version"
 	cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
 fi
diff --git a/scripts/patch-kernel b/scripts/patch-kernel
index d000ea3..49b4241 100755
--- a/scripts/patch-kernel
+++ b/scripts/patch-kernel
@@ -27,7 +27,7 @@
 #       Nick Holloway <Nick.Holloway@alfie.demon.co.uk>, 2nd January 1995.
 #
 # Added support for handling multiple types of compression. What includes
-# gzip, bzip, bzip2, zip, compress, and plaintext. 
+# gzip, bzip, bzip2, zip, compress, and plaintext.
 #
 #       Adam Sulmicki <adam@cfar.umd.edu>, 1st January 1997.
 #
@@ -159,7 +159,7 @@ applyPatch () {
   fi
   # Remove backup files
   find $sourcedir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
- 
+
   return 0;
 }
 
-- 
1.8.3.2

