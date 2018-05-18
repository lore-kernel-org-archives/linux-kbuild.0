Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:34396 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751909AbeEREyO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 May 2018 00:54:14 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/5] kconfig: refactor package checks for GUI frontends
Date: Fri, 18 May 2018 13:52:21 +0900
Message-Id: <1526619146-1895-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Philippe Ombredanne <pombredanne@nexb.com>, Michal Marek <michal.lkml@markovi.net>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arvind Prasanna <arvindprasanna@gmail.com>

Kconfig supports 4 GUI frontends.
Each of them needs some support packages, but checks them differently:

  qconf, gconf: check packages in Makefile (pkg-config is required)
  mconf: lxdialog/check-lxdialog.sh
  nconf: needs ncurses, but its presence is not checked

This series refactor the package checks so that all of them work
in the same way.

The package check scripts have been moved to scripts/kconfig/*conf-cfg.sh

The motivation of this clean-up is Randy's following patch:
https://patchwork.kernel.org/patch/10277723/

I want to clean up existing code before adding more checks.



Masahiro Yamada (5):
  kbuild: do not display CHK for filechk
  kconfig: refactor Qt package checks for building qconf
  kconfig: refactor GTK+ package checks for building gconf
  kconfig: refactor ncurses package checks for building mconf
  kconfig: refactor ncurses package checks for building nconf

 scripts/Kbuild.include                     |   1 -
 scripts/kconfig/Makefile                   | 160 ++++++++++-------------------
 scripts/kconfig/gconf-cfg.sh               |  23 +++++
 scripts/kconfig/lxdialog/check-lxdialog.sh |  93 -----------------
 scripts/kconfig/lxdialog/dialog.h          |   2 +-
 scripts/kconfig/mconf-cfg.sh               |  24 +++++
 scripts/kconfig/nconf-cfg.sh               |  22 ++++
 scripts/kconfig/qconf-cfg.sh               |  25 +++++
 8 files changed, 148 insertions(+), 202 deletions(-)
 create mode 100755 scripts/kconfig/gconf-cfg.sh
 delete mode 100755 scripts/kconfig/lxdialog/check-lxdialog.sh
 create mode 100755 scripts/kconfig/mconf-cfg.sh
 create mode 100644 scripts/kconfig/nconf-cfg.sh
 create mode 100755 scripts/kconfig/qconf-cfg.sh

-- 
2.7.4

