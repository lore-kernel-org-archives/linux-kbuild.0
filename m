Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:36555 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfLSIe1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 03:34:27 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] kbuild: pass KBUILD_MODFILE when compiling builtin objects
Date: Thu, 19 Dec 2019 17:33:28 +0900
Message-Id: <20191219083329.5926-3-masahiroy@kernel.org>
In-Reply-To: <20191219083329.5926-1-masahiroy@kernel.org>
References: <20191219083329.5926-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When compiling, Kbuild passes KBUILD_BASENAME (basename of the object)
and KBUILD_MODNAME (basename of the module).

This commit adds another one, KBUILD_MODFILE, which is the path of
the module. (or, the path of the module it would end up in if it were
compiled as a module.)

The next commit will use this to generate modules.builtin without
tristate.conf.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index e4c47ad2899d..056f7eb3dcdd 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -80,12 +80,14 @@ multi-used-m	:= $(addprefix $(obj)/,$(multi-used-m))
 subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 
 # Finds the multi-part object the current object will be linked into.
-# If the object belongs to two or more multi-part objects, all of them are
-# concatenated with a colon separator.
-modname-multi = $(subst $(space),:,$(sort $(foreach m,$(multi-used),\
-		$(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=)))))
+# If the object belongs to two or more multi-part objects, list them all.
+modname-multi = $(sort $(foreach m,$(multi-used),\
+		$(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=))))
 
-modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
+__modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
+
+modname = $(subst $(space),:,$(__modname))
+modfile = $(addprefix $(obj)/,$(__modname))
 
 # target with $(obj)/ and its suffix stripped
 target-stem = $(basename $(patsubst $(obj)/%,%,$@))
@@ -96,6 +98,7 @@ target-stem = $(basename $(patsubst $(obj)/%,%,$@))
 name-fix = $(call stringify,$(subst $(comma),_,$(subst -,_,$1)))
 basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
 modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(modname))
+modfile_flags  = -DKBUILD_MODFILE=$(call stringify,$(modfile))
 
 orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) \
                  $(ccflags-y) $(CFLAGS_$(target-stem).o)
@@ -154,7 +157,7 @@ quiet_modtag = $(if $(part-of-module),[M],   )
 modkern_cflags =                                          \
 	$(if $(part-of-module),                           \
 		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
-		$(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
+		$(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL) $(modfile_flags))
 
 modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
-- 
2.17.1
