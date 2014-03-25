Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:61658 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753585AbaCYPUG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Mar 2014 11:20:06 -0400
Received: by mail-ee0-f48.google.com with SMTP id b57so573378eek.35
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Mar 2014 08:20:05 -0700 (PDT)
From: David Graeff <david.graeff@web.de>
Subject: [RFC PATCH 0/2] kconfig: Prepare for Qt based kconfig update to Qt4/Qt5
Date: Tue, 25 Mar 2014 16:19:59 +0100
Message-Id: <1395760801-27009-1-git-send-email-david.graeff@web.de>
In-Reply-To: <kconfig-port-qt>
References: <kconfig-port-qt>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: David Graeff <david.graeff@web.de>, yann.morin.1998@free.fr

Hi Yann, all,

with this rfc patch set I would like to reorganize the kconfig directory structure
in preparation for updating the Qt3 based flavour of kconfig to Qt4/5 and the
gtk flavour (version 2->3) eventually. I renamed lxdialog to menuconfig and created
subdirectories for each flavour except the line based one.

My suggestion is to add a "qconfig" target to the buildsystem for
beeing consistent with the names of the other targets where the first character provide a hint
for the used toolkit. And to accommodate the fact that this frontend may also be used on non
xserver machines. May feel weird to type xconfig on wayland systems. Patch 2 adds that
target.

Last time (some month ago) I provided a patch-set containing all changes (buildystem+qt+gtk) at once,
that didn't worked well.

All patches can also be found at git@github.com:davidgraeff/linux.git in the kconf branch
(https://github.com/davidgraeff/linux/compare/kconf).

Regards,
David

David Graeff (2):
  kconfig: Move flavours into their own subdirectories.
  kconfig: Add qconfig makefile target additionally to the xconfig
    target

 scripts/kconfig/Makefile                           | 189 ++-------------------
 scripts/kconfig/POTFILES.in                        |  20 +--
 scripts/kconfig/gconfig/Makefile                   |  62 +++++++
 scripts/kconfig/{ => gconfig}/gconf.c              |   6 +-
 scripts/kconfig/{ => gconfig}/gconf.glade          |   0
 .../kconfig/{lxdialog => menuconfig}/.gitignore    |   0
 .../{lxdialog => menuconfig}/BIG.FAT.WARNING       |   0
 scripts/kconfig/menuconfig/Makefile                |  42 +++++
 .../{lxdialog => menuconfig}/check-lxdialog.sh     |   0
 .../kconfig/{lxdialog => menuconfig}/checklist.c   |   0
 scripts/kconfig/{lxdialog => menuconfig}/dialog.h  |   0
 .../kconfig/{lxdialog => menuconfig}/inputbox.c    |   0
 scripts/kconfig/{ => menuconfig}/mconf.c           |   4 +-
 scripts/kconfig/{lxdialog => menuconfig}/menubox.c |   0
 scripts/kconfig/{lxdialog => menuconfig}/textbox.c |   0
 scripts/kconfig/{lxdialog => menuconfig}/util.c    |   0
 scripts/kconfig/{lxdialog => menuconfig}/yesno.c   |   0
 scripts/kconfig/nconfig/Makefile                   |  26 +++
 scripts/kconfig/{ => nconfig}/nconf.c              |   2 +-
 scripts/kconfig/{ => nconfig}/nconf.gui.c          |   0
 scripts/kconfig/{ => nconfig}/nconf.h              |   0
 scripts/kconfig/qconfig/Makefile                   | 107 ++++++++++++
 scripts/kconfig/{ => qconfig}/qconf.cc             |   4 +-
 scripts/kconfig/{ => qconfig}/qconf.h              |   0
 24 files changed, 270 insertions(+), 192 deletions(-)
 create mode 100644 scripts/kconfig/gconfig/Makefile
 rename scripts/kconfig/{ => gconfig}/gconf.c (99%)
 rename scripts/kconfig/{ => gconfig}/gconf.glade (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/.gitignore (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/BIG.FAT.WARNING (100%)
 create mode 100644 scripts/kconfig/menuconfig/Makefile
 rename scripts/kconfig/{lxdialog => menuconfig}/check-lxdialog.sh (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/checklist.c (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/dialog.h (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/inputbox.c (100%)
 rename scripts/kconfig/{ => menuconfig}/mconf.c (99%)
 rename scripts/kconfig/{lxdialog => menuconfig}/menubox.c (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/textbox.c (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/util.c (100%)
 rename scripts/kconfig/{lxdialog => menuconfig}/yesno.c (100%)
 create mode 100644 scripts/kconfig/nconfig/Makefile
 rename scripts/kconfig/{ => nconfig}/nconf.c (99%)
 rename scripts/kconfig/{ => nconfig}/nconf.gui.c (100%)
 rename scripts/kconfig/{ => nconfig}/nconf.h (100%)
 create mode 100644 scripts/kconfig/qconfig/Makefile
 rename scripts/kconfig/{ => qconfig}/qconf.cc (99%)
 rename scripts/kconfig/{ => qconfig}/qconf.h (100%)

-- 
1.9.1

