Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:47319 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758690Ab2J2LXT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Oct 2012 07:23:19 -0400
From: Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH] kbuild: Do not remove vmlinux when cleaning external module
Date: Mon, 29 Oct 2012 11:23:02 +0000
Message-Id: <1351509782-12462-1-git-send-email-pawel.moll@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>

Since commit 1f2bfbd00e466ff3489b2ca5cc75b1cccd14c123 "kbuild:
link of vmlinux moved to a script" make clean with M=3D<dir>
argument (so cleaning external module) removes vmlinux,
System.map and couple of other files from the *main* kernel
build directory! This not what was happening before and almost
certainly not what one would expect.

This patch moves makes the clean target of the script called
only when !KBUILD_EXTMOD.

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 Makefile |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5be2ee8..fa16e12 100644
--- a/Makefile
+++ b/Makefile
@@ -1008,11 +1008,14 @@ clean: rm-dirs  :=3D $(CLEAN_DIRS)
 clean: rm-files :=3D $(CLEAN_FILES)
 clean-dirs      :=3D $(addprefix _clean_, . $(vmlinux-alldirs) Documentati=
on samples)
=20
-PHONY +=3D $(clean-dirs) clean archclean
+PHONY +=3D $(clean-dirs) clean archclean vmlinuxclean
 $(clean-dirs):
 =09$(Q)$(MAKE) $(clean)=3D$(patsubst _clean_%,%,$@)
=20
-clean: archclean
+vmlinuxclean:
+=09$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
+
+clean: archclean vmlinuxclean
=20
 # mrproper - Delete all generated files, including .config
 #
@@ -1239,7 +1242,6 @@ scripts: ;
 endif # KBUILD_EXTMOD
=20
 clean: $(clean-dirs)
-=09$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
 =09$(call cmd,rmdirs)
 =09$(call cmd,rmfiles)
 =09@find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
--=20
1.7.10.4


