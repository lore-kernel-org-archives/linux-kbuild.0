Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:31339 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbeHTTE4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Aug 2018 15:04:56 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] initramfs: move gen_initramfs_list.sh from scripts/ to usr/
Date: Tue, 21 Aug 2018 00:47:07 +0900
Message-Id: <1534780028-6479-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, =?UTF-8?q?Bj=8F=A9=CCrn=20Forsman?= <bjorn.forsman@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, Michael Forney <forney@google.com>, Jonathan Corbet <corbet@lwn.net>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org

scripts/gen_initramfs_list.sh is only invoked from usr/Makefile.
Move it so that all tools to create initramfs are self-contained
in the usr/ directory.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/early-userspace/README                 | 6 +++---
 Documentation/filesystems/ramfs-rootfs-initramfs.txt | 2 +-
 usr/Makefile                                         | 2 +-
 {scripts => usr}/gen_initramfs_list.sh               | 0
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename {scripts => usr}/gen_initramfs_list.sh (100%)

diff --git a/Documentation/early-userspace/README b/Documentation/early-userspace/README
index 2c00b07..1e10579 100644
--- a/Documentation/early-userspace/README
+++ b/Documentation/early-userspace/README
@@ -66,17 +66,17 @@ early userspace image can be built by an unprivileged user.
 
 As a technical note, when directories and files are specified, the
 entire CONFIG_INITRAMFS_SOURCE is passed to
-scripts/gen_initramfs_list.sh.  This means that CONFIG_INITRAMFS_SOURCE
+usr/gen_initramfs_list.sh.  This means that CONFIG_INITRAMFS_SOURCE
 can really be interpreted as any legal argument to
 gen_initramfs_list.sh.  If a directory is specified as an argument then
 the contents are scanned, uid/gid translation is performed, and
 usr/gen_init_cpio file directives are output.  If a directory is
-specified as an argument to scripts/gen_initramfs_list.sh then the
+specified as an argument to usr/gen_initramfs_list.sh then the
 contents of the file are simply copied to the output.  All of the output
 directives from directory scanning and file contents copying are
 processed by usr/gen_init_cpio.
 
-See also 'scripts/gen_initramfs_list.sh -h'.
+See also 'usr/gen_initramfs_list.sh -h'.
 
 Where's this all leading?
 =========================
diff --git a/Documentation/filesystems/ramfs-rootfs-initramfs.txt b/Documentation/filesystems/ramfs-rootfs-initramfs.txt
index b176928..79637d2 100644
--- a/Documentation/filesystems/ramfs-rootfs-initramfs.txt
+++ b/Documentation/filesystems/ramfs-rootfs-initramfs.txt
@@ -164,7 +164,7 @@ Documentation/early-userspace/README for more details.)
 The kernel does not depend on external cpio tools.  If you specify a
 directory instead of a configuration file, the kernel's build infrastructure
 creates a configuration file from that directory (usr/Makefile calls
-scripts/gen_initramfs_list.sh), and proceeds to package up that directory
+usr/gen_initramfs_list.sh), and proceeds to package up that directory
 using the config file (by feeding it to usr/gen_init_cpio, which is created
 from usr/gen_init_cpio.c).  The kernel's build-time cpio creation code is
 entirely self-contained, and the kernel's boot-time extractor is also
diff --git a/usr/Makefile b/usr/Makefile
index 237a028..748f6a6 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -24,7 +24,7 @@ $(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
 # Generate the initramfs cpio archive
 
 hostprogs-y := gen_init_cpio
-initramfs   := $(CONFIG_SHELL) $(srctree)/scripts/gen_initramfs_list.sh
+initramfs   := $(CONFIG_SHELL) $(srctree)/$(src)/gen_initramfs_list.sh
 ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
 			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
 ramfs-args  := \
diff --git a/scripts/gen_initramfs_list.sh b/usr/gen_initramfs_list.sh
similarity index 100%
rename from scripts/gen_initramfs_list.sh
rename to usr/gen_initramfs_list.sh
-- 
2.7.4
