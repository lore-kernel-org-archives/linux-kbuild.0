Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:35798 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbeHIHnp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Aug 2018 03:43:45 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove deprecated host-progs variable
Date: Thu,  9 Aug 2018 14:19:31 +0900
Message-Id: <1533791971-27504-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-xtensa@linux-xtensa.org, Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Max Filippov <jcmvbkbc@gmail.com>

The host-progs has been supported as an alias of hostprogs-y at least
since the beginning of Git era, with the clear prompt:
  Usage of host-progs is deprecated. Please replace with hostprogs-y!

Enough time for the migration has passed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/xtensa/boot/Makefile | 3 +--
 scripts/Makefile.build    | 7 -------
 scripts/Makefile.clean    | 1 -
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
index 53e4178..dc9e0ba 100644
--- a/arch/xtensa/boot/Makefile
+++ b/arch/xtensa/boot/Makefile
@@ -30,8 +30,7 @@ Image: boot-elf
 zImage: boot-redboot
 uImage: $(obj)/uImage
 
-boot-elf boot-redboot: $(addprefix $(obj)/,$(subdir-y)) \
-		       $(addprefix $(obj)/,$(host-progs))
+boot-elf boot-redboot: $(addprefix $(obj)/,$(subdir-y))
 	$(Q)$(MAKE) $(build)=$(obj)/$@ $(MAKECMDGOALS)
 
 OBJCOPYFLAGS = --strip-all -R .comment -R .note.gnu.build-id -O binary
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ba1c83b..b134b37 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -53,13 +53,6 @@ endif
 
 include scripts/Makefile.lib
 
-ifdef host-progs
-ifneq ($(hostprogs-y),$(host-progs))
-$(warning kbuild: $(obj)/Makefile - Usage of host-progs is deprecated. Please replace with hostprogs-y!)
-hostprogs-y += $(host-progs)
-endif
-endif
-
 # Do not include host rules unless needed
 ifneq ($(hostprogs-y)$(hostprogs-m)$(hostlibs-y)$(hostlibs-m)$(hostcxxlibs-y)$(hostcxxlibs-m),)
 include scripts/Makefile.host
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index 17ef94c..0b80e320 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -38,7 +38,6 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
 
 __clean-files	:= $(extra-y) $(extra-m) $(extra-)       \
 		   $(always) $(targets) $(clean-files)   \
-		   $(host-progs)                         \
 		   $(hostprogs-y) $(hostprogs-m) $(hostprogs-) \
 		   $(hostlibs-y) $(hostlibs-m) $(hostlibs-) \
 		   $(hostcxxlibs-y) $(hostcxxlibs-m)
-- 
2.7.4

