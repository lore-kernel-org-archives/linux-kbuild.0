Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ea0-f169.google.com ([209.85.215.169]:62598 "EHLO
	mail-ea0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750941Ab3HSOav (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Aug 2013 10:30:51 -0400
Received: by mail-ea0-f169.google.com with SMTP id k11so887466eaj.14
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2013 07:30:50 -0700 (PDT)
From: David Graeff <david.graeff@web.de>
Subject: [PATCH v3 0/5] Kconfig Gtk/Qt interface flavours ported to newest toolkit versions
Date: Mon, 19 Aug 2013 16:29:46 +0200
Message-Id: <1376922591-37504-1-git-send-email-david.graeff@web.de>
In-Reply-To: <kconfig-port-gtk-qt>
References: <kconfig-port-gtk-qt>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: David Graeff <david.graeff@web.de>, yann.morin.1998@free.fr, sam@ravnborg.org, mmarek@suse.cz

Hi Michal, Yann, all,

I prepared a v3 of the patch set addressing the following
comments and suggestions:
> The prefix should be "kconfig: bla bla"

Prefix is kconfig now.

>> +/* Most images are taken from the system icon theme
>> +   in modern gui toolkits nowadays.
>> +   Because we compile with -Wunused-variable, we hide
>> +   the following xmp image constants.
>> +*/
>> +#ifdef IMAGES_EXTENDED
>I see no users of this. So why not delete these?

This part of images.c is removed now.

> Please provide the full diffstat for the patch.
> git format-patch -n will do this for you.

Full diffstat provided. I've used git format-patch --summary --minimal -M.
As far as I understand this provides an applicable patch (unlike the -D option)
but is still more suitable to review.  As discussed some patches are too big for
the mailing list so additionally I provide the changes via github
in the master branch of git@github.com:davidgraeff/linux.git.

> 
> Each directory should be named after the frontend IMO.
> So lxdialog dir should be renamed to menuconfig.
I renamed lxdialog to menuconfig. I very much like this suggestion but didn't
dare to touch this directory in the first place.

>> +++ b/scripts/kconfig/gconfig/Makefile
>> [...]
>> +
>> +HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
>> +HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
>> +                          -Wno-missing-prototypes
>> +                          
>
> This blank line contains unwanted space characters (and they were not in
> scripts/kconfig/Makefile).

Removed the line. Sometimes text editors should stop thinking too much :D

>> +clean-files	+= zconf.tab.c gconfig/gconf.glade.h gconf
> zconf.tab.c should be dropped here.

Dropped zconf.tab.c from gconfig/Makefiles clean target.

>> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
>> index 844bc9d..08524cc 100644
>> --- a/scripts/kconfig/Makefile
>> +++ b/scripts/kconfig/Makefile
>> @@ -110,6 +100,7 @@ help:
>>  	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
>>  	@echo  '  menuconfig	  - Update current config utilising a menu based program'
>>  	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
>> +	@echo  '  qconfig	  - Update current config utilising a QT based front-end'
>>  	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
>>  	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
>>  	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
>
> So you sneaked in a new "qconfig" target.
> This belongs in a separate patch - and we already have xconfig so I suggest to drop it.

I've split this change into a separate patch. My suggestion is to add the qconfig target for
beeing consistent with the names of the other targets where the first character provides a hint
for the used toolkit. And to accommodate the fact that this frontend may also be used on non
xserver machines.

Regards,
David

David Graeff (5):
  kconfig: Move flavours into their own subdirectories.
  kconfig: Add qconfig makefile target additionally to the xconfig
    target
  kconfig: Update/Port Gtk flavour to use Gtk3
  kconfig: Qt interface port to Qt4/Qt5, removed Qt3 Support
  kconfig: images.c for gtk/qt gui flavour reoganized

 scripts/kconfig/Makefile                           |  189 +--
 scripts/kconfig/gconf.c                            | 1542 -----------------
 scripts/kconfig/gconfig/Makefile                   |   67 +
 scripts/kconfig/gconfig/gconf.c                    |  758 +++++++++
 scripts/kconfig/{ => gconfig}/gconf.glade          |    0
 scripts/kconfig/gconfig/gconf.h                    |   80 +
 scripts/kconfig/gconfig/gconf.ui                   |  536 ++++++
 scripts/kconfig/gconfig/gconf_treeview_model.c     |  706 ++++++++
 scripts/kconfig/gconfig/gconf_treeview_model.h     |   43 +
 scripts/kconfig/gconfig/util.h                     |   33 +
 scripts/kconfig/images.c                           |  225 +--
 .../kconfig/{lxdialog => menuconfig}/.gitignore    |    0
 .../{lxdialog => menuconfig}/BIG.FAT.WARNING       |    0
 scripts/kconfig/menuconfig/Makefile                |   42 +
 .../{lxdialog => menuconfig}/check-lxdialog.sh     |    0
 .../kconfig/{lxdialog => menuconfig}/checklist.c   |    0
 scripts/kconfig/{lxdialog => menuconfig}/dialog.h  |    0
 .../kconfig/{lxdialog => menuconfig}/inputbox.c    |    0
 scripts/kconfig/{ => menuconfig}/mconf.c           |    4 +-
 scripts/kconfig/{lxdialog => menuconfig}/menubox.c |    0
 scripts/kconfig/{lxdialog => menuconfig}/textbox.c |    0
 scripts/kconfig/{lxdialog => menuconfig}/util.c    |    0
 scripts/kconfig/{lxdialog => menuconfig}/yesno.c   |    0
 scripts/kconfig/nconfig/Makefile                   |   26 +
 scripts/kconfig/{ => nconfig}/nconf.c              |    2 +-
 scripts/kconfig/{ => nconfig}/nconf.gui.c          |    0
 scripts/kconfig/{ => nconfig}/nconf.h              |    0
 scripts/kconfig/qconf.cc                           | 1790 --------------------
 scripts/kconfig/qconf.h                            |  337 ----
 scripts/kconfig/qconfig/Makefile                   |   94 +
 scripts/kconfig/qconfig/infoViewWidget.cc          |  225 +++
 scripts/kconfig/qconfig/infoViewWidget.h           |   42 +
 scripts/kconfig/qconfig/mainwindow.cc              |  382 +++++
 scripts/kconfig/qconfig/mainwindow.h               |   73 +
 scripts/kconfig/qconfig/mainwindow.ui              |  392 +++++
 scripts/kconfig/qconfig/qconf.cc                   |   77 +
 scripts/kconfig/qconfig/qconf.h                    |   23 +
 scripts/kconfig/qconfig/searchfiltermodelproxy.cc  |   35 +
 scripts/kconfig/qconfig/searchfiltermodelproxy.h   |   35 +
 scripts/kconfig/qconfig/searchmodel.cc             |   57 +
 scripts/kconfig/qconfig/searchmodel.h              |   28 +
 41 files changed, 3783 insertions(+), 4060 deletions(-)
 delete mode 100644 scripts/kconfig/gconf.c
 create mode 100644 scripts/kconfig/gconfig/Makefile
 create mode 100644 scripts/kconfig/gconfig/gconf.c
 rename scripts/kconfig/{ => gconfig}/gconf.glade (100%)
 create mode 100644 scripts/kconfig/gconfig/gconf.h
 create mode 100644 scripts/kconfig/gconfig/gconf.ui
 create mode 100644 scripts/kconfig/gconfig/gconf_treeview_model.c
 create mode 100644 scripts/kconfig/gconfig/gconf_treeview_model.h
 create mode 100644 scripts/kconfig/gconfig/util.h
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
 delete mode 100644 scripts/kconfig/qconf.cc
 delete mode 100644 scripts/kconfig/qconf.h
 create mode 100644 scripts/kconfig/qconfig/Makefile
 create mode 100644 scripts/kconfig/qconfig/infoViewWidget.cc
 create mode 100644 scripts/kconfig/qconfig/infoViewWidget.h
 create mode 100644 scripts/kconfig/qconfig/mainwindow.cc
 create mode 100644 scripts/kconfig/qconfig/mainwindow.h
 create mode 100644 scripts/kconfig/qconfig/mainwindow.ui
 create mode 100644 scripts/kconfig/qconfig/qconf.cc
 create mode 100644 scripts/kconfig/qconfig/qconf.h
 create mode 100644 scripts/kconfig/qconfig/searchfiltermodelproxy.cc
 create mode 100644 scripts/kconfig/qconfig/searchfiltermodelproxy.h
 create mode 100644 scripts/kconfig/qconfig/searchmodel.cc
 create mode 100644 scripts/kconfig/qconfig/searchmodel.h

-- 
1.8.1.2

