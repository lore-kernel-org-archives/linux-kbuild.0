Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:34508 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfHMGNR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 02:13:17 -0400
From: Knut Omang <knut.omang@oracle.com>
Subject: [RFC 01/19] kbuild: Fixes to rules for host-cshlib and host-cxxshlib
Date: Tue, 13 Aug 2019 08:09:16 +0200
Message-Id: <be2c361eac49ded2848b2a555b75e30cc3c24e71.1565676440.git-series.knut.omang@oracle.com>
In-Reply-To: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, Knut Omang <knut.omang@oracle.com>

C++ libraries interfacing to C APIs might sometimes need some glue
logic more easily written in C.
Allow a C++ library to also contain 0 or more C objects.

Also fix rules for both C and C++ shared libraries:
- C++ shared libraries depended on .c instead of .cc files
- Rules were referenced as -objs instead of the intended
  -cobjs and -cxxobjs following the pattern from hostprogs*.

Signed-off-by: Knut Omang <knut.omang@oracle.com>
---
 scripts/Makefile.host | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index b6a54bd..4e9bb21 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -46,8 +46,10 @@ host-cxxmulti	:= $(foreach m,$(__hostprogs),$(if $($(m)-cxxobjs),$(m)))
 host-cxxobjs	:= $(sort $(foreach m,$(host-cxxmulti),$($(m)-cxxobjs)))
 
 # Object (.o) files used by the shared libaries
-host-cshobjs	:= $(sort $(foreach m,$(host-cshlib),$($(m:.so=-objs))))
-host-cxxshobjs	:= $(sort $(foreach m,$(host-cxxshlib),$($(m:.so=-objs))))
+# Note: C++ libraries may contain both C and C++ objects, compiled differently:
+host-cshobjs	:= $(sort $(foreach m,$(host-cshlib),$($(m:.so=-cshobjs))))
+host-cshobjs	+= $(sort $(foreach m,$(host-cxxshlib),$($(m:.so=-cshobjs))))
+host-cxxshobjs	:= $(sort $(foreach m,$(host-cxxshlib),$($(m:.so=-cxxshobjs))))
 
 host-csingle	:= $(addprefix $(obj)/,$(host-csingle))
 host-cmulti	:= $(addprefix $(obj)/,$(host-cmulti))
@@ -130,14 +132,10 @@ quiet_cmd_host-cshobjs	= HOSTCC  -fPIC $@
 $(host-cshobjs): $(obj)/%.o: $(src)/%.c FORCE
 	$(call if_changed_dep,host-cshobjs)
 
-# Compile .c file, create position independent .o file
-# Note that plugin capable gcc versions can be either C or C++ based
-# therefore plugin source files have to be compilable in both C and C++ mode.
-# This is why a C++ compiler is invoked on a .c file.
-# host-cxxshobjs -> .o
+# Compile .cc (C++) file, create position independent .o file
 quiet_cmd_host-cxxshobjs	= HOSTCXX -fPIC $@
       cmd_host-cxxshobjs	= $(HOSTCXX) $(hostcxx_flags) -fPIC -c -o $@ $<
-$(host-cxxshobjs): $(obj)/%.o: $(src)/%.c FORCE
+$(host-cxxshobjs): $(obj)/%.o: $(src)/%.cc FORCE
 	$(call if_changed_dep,host-cxxshobjs)
 
 # Link a shared library, based on position independent .o files
@@ -154,7 +152,8 @@ $(call multi_depend, $(host-cshlib), .so, -objs)
 # *.o -> .so shared library (host-cxxshlib)
 quiet_cmd_host-cxxshlib	= HOSTLLD -shared $@
       cmd_host-cxxshlib	= $(HOSTCXX) $(KBUILD_HOSTLDFLAGS) -shared -o $@ \
-			  $(addprefix $(obj)/,$($(@F:.so=-objs))) \
+			  $(addprefix $(obj)/,$($(@F:.so=-cshobjs))) \
+			  $(addprefix $(obj)/,$($(@F:.so=-cxxshobjs))) \
 			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(@F))
 $(host-cxxshlib): FORCE
 	$(call if_changed,host-cxxshlib)
-- 
git-series 0.9.1
