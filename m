Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60368 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754672AbeFRE4V (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jun 2018 00:56:21 -0400
From: NeilBrown <neilb@suse.com>
Date: Mon, 18 Jun 2018 14:55:20 +1000
Subject: [PATCH 4/5] kbuild: disable KBUILD_MODNAME when building for mod.a
Message-ID: <152929772052.17463.10728056000221362647.stgit@noble>
In-Reply-To: <152929708853.17463.17302660556961083137.stgit@noble>
References: <152929708853.17463.17302660556961083137.stgit@noble>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

When building an object to be included in mod.a we
cannot know the name of the module.  So don't define
KBUILD_MODNAME.  This will ensure attempt to use
that macro when the module name isn't know will
trigger an error.

Signed-off-by: NeilBrown <neilb@suse.com>
---
 scripts/Makefile.lib |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index c84167169a59..d09246474f2e 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -96,7 +96,7 @@ subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, all of them are
 # concatenated with a colon separator.
-modname-multi = $(subst $(space),:,$(sort $(foreach m,$(multi-used),\
+modname-multi = $(subst $(space),:,$(sort $(foreach m,$(multi-used) modobj.o,\
 		$(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=)))))
 
 modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
@@ -106,7 +106,7 @@ modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
 # end up in (or would, if it gets compiled in)
 name-fix = $(squote)$(quote)$(subst $(comma),_,$(subst -,_,$1))$(quote)$(squote)
 basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
-modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(modname))
+modname_flags  = $(if $(filter-out modobj,$(modname)),-DKBUILD_MODNAME=$(call name-fix,$(modname)))
 
 orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) \
                  $(ccflags-y) $(CFLAGS_$(basetarget).o)


