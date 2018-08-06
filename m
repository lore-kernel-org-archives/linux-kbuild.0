Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54580 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732006AbeHFQqk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Aug 2018 12:46:40 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w76EU68d049092
        for <linux-kbuild@vger.kernel.org>; Mon, 6 Aug 2018 10:37:16 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2kpppdmkr6-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Aug 2018 10:37:16 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Mon, 6 Aug 2018 15:37:14 +0100
Date: Mon, 6 Aug 2018 16:37:09 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH 1/1] kbuild: allow alternate src for target's implicit
 prerequisite
References: <cover.thread-dc1802.your-ad-here.call-01533563120-ext-8550@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.thread-dc1802.your-ad-here.call-01533563120-ext-8550@work.hours>
Message-Id: <patch-1.thread-dc1802.git-dc180286abb1.your-ad-here.call-01533563120-ext-8550@work.hours>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

With kbuild there is no easy way to re-compile source files from another
directory, which is required for the decompressor on some platforms
(files like lib/ctype.c, lib/cmdline.c, etc). Writing custom build
rules for those files is not feasible since original rules are complex
and kbuild functions and variables are not exposed.

The simplest solution is to reverse include source files either into
existing files or separate files. That eliminates the need to tackle
with the kbuild rules, but is ugly.

Here is another solution to that problem, utilizing secondary expansion.
Build rules are in a form:
$(obj)/%.o: $(src)/%.c ...
$(obj)/%.o: $(src)/%.S ...

"src" variable could be changed to cover the need of specifying alternate
source file directory.
src := $(if $(SRCDIR_$(@F)),$(SRCDIR_$(@F)),$(src))

So, if there is SRCDIR_<target> set, it will be used, original "src" is
used otherwise. But that wouldn't work as it is. To be able to utilize
automatic variables in implicit prerequisite secondary expansion has to
be used and src value has to be additionally escaped.

Alternate src dir then could be specified in Makefile as:
obj-y := file1.o file2.o
SRCDIR_file1.o := file1/src/dir
SRCDIR_file2.o := file2/src/dir

Which is enough to build $(obj)/file1.o from file1/src/dir/file1.(c|S),
and $(obj)/file2.o from file2/src/dir/file2.(c|S)

Secondary expansion has been introduced with make 3.81, which is
minimal supported version by kbuild itself.

Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 scripts/Makefile.build | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 514ed63ff571..97c6ece96cfb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -70,6 +70,10 @@ $(warning kbuild: Makefile.build is included improperly)
 endif
 
 # ===========================================================================
+# Allow to specify alternate source directory of target's implicit prerequisite
+# e.g. 'SRCDIR_cmdline.o := lib'
+.SECONDEXPANSION:
+srcdir := $$(if $$(SRCDIR_$$(@F)),$$(SRCDIR_$$(@F)),$(src))
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
 lib-target := $(obj)/lib.a
@@ -134,13 +138,13 @@ $(obj-m)             : quiet_modtag := [M]
 quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
 cmd_cc_s_c       = $(CC) $(c_flags) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
 
-$(obj)/%.s: $(src)/%.c FORCE
+$(obj)/%.s: $(srcdir)/%.c FORCE
 	$(call if_changed_dep,cc_s_c)
 
 quiet_cmd_cpp_i_c = CPP $(quiet_modtag) $@
 cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 
-$(obj)/%.i: $(src)/%.c FORCE
+$(obj)/%.i: $(srcdir)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
 # These mirror gensymtypes_S and co below, keep them in synch.
@@ -157,7 +161,7 @@ cmd_cc_symtypes_c =                                                         \
     $(call cmd_gensymtypes_c,true,$@) >/dev/null;                           \
     test -s $@ || rm -f $@
 
-$(obj)/%.symtypes : $(src)/%.c FORCE
+$(obj)/%.symtypes : $(srcdir)/%.c FORCE
 	$(call cmd,cc_symtypes_c)
 
 # LLVM assembly
@@ -165,7 +169,7 @@ $(obj)/%.symtypes : $(src)/%.c FORCE
 quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
       cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -o $@ $<
 
-$(obj)/%.ll: $(src)/%.c FORCE
+$(obj)/%.ll: $(srcdir)/%.c FORCE
 	$(call if_changed_dep,cc_ll_c)
 
 # C (.c) files
@@ -313,7 +317,7 @@ cmd_undef_syms = echo
 endif
 
 # Built-in and composite module parts
-$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
+$(obj)/%.o: $(srcdir)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
@@ -330,7 +334,7 @@ quiet_cmd_cc_lst_c = MKLST   $@
 		     $(CONFIG_SHELL) $(srctree)/scripts/makelst $*.o \
 				     System.map $(OBJDUMP) > $@
 
-$(obj)/%.lst: $(src)/%.c FORCE
+$(obj)/%.lst: $(srcdir)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
 # Compile assembler sources (.S)
@@ -370,14 +374,14 @@ cmd_cc_symtypes_S =                                                         \
     $(call cmd_gensymtypes_S,true,$@) >/dev/null;                           \
     test -s $@ || rm -f $@
 
-$(obj)/%.symtypes : $(src)/%.S FORCE
+$(obj)/%.symtypes : $(srcdir)/%.S FORCE
 	$(call cmd,cc_symtypes_S)
 
 
 quiet_cmd_cpp_s_S = CPP $(quiet_modtag) $@
 cmd_cpp_s_S       = $(CPP) $(a_flags) -o $@ $<
 
-$(obj)/%.s: $(src)/%.S FORCE
+$(obj)/%.s: $(srcdir)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
@@ -413,7 +417,7 @@ cmd_modversions_S =								\
 endif
 endif
 
-$(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
+$(obj)/%.o: $(srcdir)/%.S $(objtool_dep) FORCE
 	$(call if_changed_rule,as_o_S)
 
 targets += $(filter-out $(subdir-obj-y), $(real-obj-y)) $(real-obj-m) $(lib-y)
@@ -425,7 +429,7 @@ quiet_cmd_cpp_lds_S = LDS     $@
       cmd_cpp_lds_S = $(CPP) $(cpp_flags) -P -U$(ARCH) \
 	                     -D__ASSEMBLY__ -DLINKER_SCRIPT -o $@ $<
 
-$(obj)/%.lds: $(src)/%.lds.S FORCE
+$(obj)/%.lds: $(srcdir)/%.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
 # ASN.1 grammar
@@ -434,7 +438,7 @@ quiet_cmd_asn1_compiler = ASN.1   $@
       cmd_asn1_compiler = $(objtree)/scripts/asn1_compiler $< \
 				$(subst .h,.c,$@) $(subst .c,.h,$@)
 
-$(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
+$(obj)/%.asn1.c $(obj)/%.asn1.h: $(srcdir)/%.asn1 $(objtree)/scripts/asn1_compiler
 	$(call cmd,asn1_compiler)
 
 # Build the compiled-in targets
-- 
2.18.0.13.gd42ae10

