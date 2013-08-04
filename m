Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:55807 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097Ab3HDLCu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 Aug 2013 07:02:50 -0400
Received: by mail-wi0-f173.google.com with SMTP id en1so610667wid.0
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Aug 2013 04:02:48 -0700 (PDT)
Date: Sun, 4 Aug 2013 13:02:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v2 0/4] Gtk/Qt interface flavours ported to newest
 toolkit versions
Message-ID: <20130804110244.GA3481@free.fr>
References: <kconfig-port-gtk-qt>
 <1375612711-17140-1-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1375612711-17140-1-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Graeff <david.graeff@web.de>
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org

David, All,

On 2013-08-04 12:38 +0200, David Graeff spake thusly:
> Hi Sam, Yann, all,
> 
> I prepared a rebased V2 of the patchset. As far as I get the consensus
> is to replace the existing Qtk and Qt flavours because there exist a
                             ^^^
Qtk, a new toolkit as a merge of Gtk and Qt? ;-)
> fallback (n/mconf) for users that do not have the never libs available.

Yes, that was my understanding as well.

> I reorganized the commits and used "-D -M" flags this time for a better
> review. There are some tool generated files like gconfig/gconf.ui and
> qconfig/mainwindow.ui which surely break the 80-column readability rule
> but are best viewed in their respective editor (gtk: glade, qt: designer)
> anyway.
> 
> The Qt flavour is Qt5 compatible but I did not changed the build system
> to actually use Qt5. I've tested the Qt flavour with Qt 4.8.4, the Gtk
> flavour with Gtk 3.6.4.

As I previously said, I don't have much insight in Qt or Gtk, so I'm not
in a position to properly review those patches. I'll give them a spin at
testing, but not much more. Let's see what happens until the next merge
window. ;-)

Anyway, I like how you cleaned up scripts/kconfig by moving frontends to
their own sub-dir.

/me wonders how much kconfig-frontends [0] will be impacted by this
reordering...

> I have another question regarding the patch procedure: I've seen some
> mails here only requesting for pull requests. Is it common to send pull
> requests instead of a set of patches?

You want to send patches to the list for people to review them and
comment. You don't use pull-requests for this, since the pull-request
only contains a single mail [1] with the URL to pull from.

Once everything is OK, either the maintainer will apply those patches,
or a sub-maintainer will do it and send a pull-request for 'big' series.

So, you did well to send patches.

[0] http://ymorin.is-a-geek.org/projects/kconfig-frontends
[1] I have a script that sends a pull-request, and send individual
    patches as a reply to this mail, but standard git-request-pull
    does not.

Regards,
Yann E. MORIN.

> Regards,
> David
> 
> David Graeff (4):
>   KConf: Move flavours into their own subdirectories.
>   KConf: Update/Port Gtk flavour to use Gtk3
>   KConf: Qt interface port to Qt4/Qt5, removed Qt3 Support
>   KConf: images.c for gtk/qt gui flavour reoganized
> 
>  scripts/kconfig/Makefile                          |  189 +--
>  scripts/kconfig/gconf.c                           | 1542 ------------------
>  scripts/kconfig/gconfig/Makefile                  |   69 +
>  scripts/kconfig/gconfig/gconf.c                   |  758 +++++++++
>  scripts/kconfig/{ => gconfig}/gconf.glade         |    0
>  scripts/kconfig/gconfig/gconf.h                   |   80 +
>  scripts/kconfig/gconfig/gconf.ui                  |  536 ++++++
>  scripts/kconfig/gconfig/gconf_treeview_model.c    |  706 ++++++++
>  scripts/kconfig/gconfig/gconf_treeview_model.h    |   43 +
>  scripts/kconfig/gconfig/util.h                    |   33 +
>  scripts/kconfig/images.c                          |  309 ++--
>  scripts/kconfig/lxdialog/Makefile                 |   42 +
>  scripts/kconfig/{ => lxdialog}/mconf.c            |    4 +-
>  scripts/kconfig/nconfig/Makefile                  |   26 +
>  scripts/kconfig/{ => nconfig}/nconf.c             |    2 +-
>  scripts/kconfig/{ => nconfig}/nconf.gui.c         |    0
>  scripts/kconfig/{ => nconfig}/nconf.h             |    0
>  scripts/kconfig/qconf.cc                          | 1790 ---------------------
>  scripts/kconfig/qconf.h                           |  337 ----
>  scripts/kconfig/qconfig/Makefile                  |   94 ++
>  scripts/kconfig/qconfig/infoViewWidget.cc         |  225 +++
>  scripts/kconfig/qconfig/infoViewWidget.h          |   42 +
>  scripts/kconfig/qconfig/mainwindow.cc             |  382 +++++
>  scripts/kconfig/qconfig/mainwindow.h              |   73 +
>  scripts/kconfig/qconfig/mainwindow.ui             |  410 +++++
>  scripts/kconfig/qconfig/qconf.cc                  |   77 +
>  scripts/kconfig/qconfig/qconf.h                   |   23 +
>  scripts/kconfig/qconfig/searchfiltermodelproxy.cc |   35 +
>  scripts/kconfig/qconfig/searchfiltermodelproxy.h  |   35 +
>  scripts/kconfig/qconfig/searchmodel.cc            |   57 +
>  scripts/kconfig/qconfig/searchmodel.h             |   28 +
>  31 files changed, 3953 insertions(+), 3994 deletions(-)
>  delete mode 100644 scripts/kconfig/gconf.c
>  create mode 100644 scripts/kconfig/gconfig/Makefile
>  create mode 100644 scripts/kconfig/gconfig/gconf.c
>  rename scripts/kconfig/{ => gconfig}/gconf.glade (100%)
>  create mode 100644 scripts/kconfig/gconfig/gconf.h
>  create mode 100644 scripts/kconfig/gconfig/gconf.ui
>  create mode 100644 scripts/kconfig/gconfig/gconf_treeview_model.c
>  create mode 100644 scripts/kconfig/gconfig/gconf_treeview_model.h
>  create mode 100644 scripts/kconfig/gconfig/util.h
>  create mode 100644 scripts/kconfig/lxdialog/Makefile
>  rename scripts/kconfig/{ => lxdialog}/mconf.c (99%)
>  create mode 100644 scripts/kconfig/nconfig/Makefile
>  rename scripts/kconfig/{ => nconfig}/nconf.c (99%)
>  rename scripts/kconfig/{ => nconfig}/nconf.gui.c (100%)
>  rename scripts/kconfig/{ => nconfig}/nconf.h (100%)
>  delete mode 100644 scripts/kconfig/qconf.cc
>  delete mode 100644 scripts/kconfig/qconf.h
>  create mode 100644 scripts/kconfig/qconfig/Makefile
>  create mode 100644 scripts/kconfig/qconfig/infoViewWidget.cc
>  create mode 100644 scripts/kconfig/qconfig/infoViewWidget.h
>  create mode 100644 scripts/kconfig/qconfig/mainwindow.cc
>  create mode 100644 scripts/kconfig/qconfig/mainwindow.h
>  create mode 100644 scripts/kconfig/qconfig/mainwindow.ui
>  create mode 100644 scripts/kconfig/qconfig/qconf.cc
>  create mode 100644 scripts/kconfig/qconfig/qconf.h
>  create mode 100644 scripts/kconfig/qconfig/searchfiltermodelproxy.cc
>  create mode 100644 scripts/kconfig/qconfig/searchfiltermodelproxy.h
>  create mode 100644 scripts/kconfig/qconfig/searchmodel.cc
>  create mode 100644 scripts/kconfig/qconfig/searchmodel.h
> 
> -- 
> 1.8.1.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
