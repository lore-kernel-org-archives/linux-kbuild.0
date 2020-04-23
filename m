Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:42832 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgDWOYi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 10:24:38 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 3/4] kbuild: use -MMD instead of -MD to exclude system headers from dependency
Date: Thu, 23 Apr 2020 23:23:53 +0900
Message-Id: <20200423142354.312088-3-masahiroy@kernel.org>
In-Reply-To: <20200423142354.312088-1-masahiroy@kernel.org>
References: <20200423142354.312088-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This omits system headers from the generated header dependency.

System headers are not updated unless you upgrade the compiler. Nor do
they contain CONFIG options, so fixdep does not need to parse them.

Having said that, the effect of this optimization will be quite small
because the kernel code generally does not include system headers
except <stdarg.h>.

Host programs include a lot of system headers, but there are not so
many in the kernel tree. Theoretically, fixdep does not need to cater
to host programs because they should not contain CONFIG options in
the first place. fixdep actually does just because Kbuild reuses
if_changed_dep for host programs.

At first, keeping system headers in .*.cmd files might be useful to
detect the compiler update, but there is no guarantee that <stdarg.h>
is included from every file. So, I implemented a more reliable way in
the previous commit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/Kbuild.include | 2 +-
 scripts/Makefile.host  | 4 ++--
 scripts/Makefile.lib   | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 6cabf20ce66a..0c3dc983439b 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -16,7 +16,7 @@ pound := \#
 dot-target = $(dir $@).$(notdir $@)
 
 ###
-# The temporary file to save gcc -MD generated dependencies must not
+# The temporary file to save gcc -MMD generated dependencies must not
 # contain a comma
 depfile = $(subst $(comma),_,$(dot-target).d)
 
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 2045855d0b75..c8a4a033dc3e 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -88,8 +88,8 @@ _hostcxx_flags += -I $(objtree)/$(obj)
 endif
 endif
 
-hostc_flags    = -Wp,-MD,$(depfile) $(_hostc_flags)
-hostcxx_flags  = -Wp,-MD,$(depfile) $(_hostcxx_flags)
+hostc_flags    = -Wp,-MMD,$(depfile) $(_hostc_flags)
+hostcxx_flags  = -Wp,-MMD,$(depfile) $(_hostcxx_flags)
 
 #####
 # Compile programs on the host
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 97547108ee7f..a94c1e741df9 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -171,22 +171,22 @@ modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
 			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
 
-c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
+c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 -include $(srctree)/include/linux/compiler_types.h       \
 		 $(_c_flags) $(modkern_cflags)                           \
 		 $(basename_flags) $(modname_flags)
 
-a_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
+a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_a_flags) $(modkern_aflags)
 
-cpp_flags      = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
+cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_cpp_flags)
 
 ld_flags       = $(KBUILD_LDFLAGS) $(ldflags-y) $(LDFLAGS_$(@F))
 
 DTC_INCLUDE    := $(srctree)/scripts/dtc/include-prefixes
 
-dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
+dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
 		 $(addprefix -I,$(DTC_INCLUDE))                          \
 		 -undef -D__DTS__
 
-- 
2.25.1
