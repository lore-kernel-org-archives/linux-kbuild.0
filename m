Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:47098 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751025AbeFHJnB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 05:43:01 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC v3 0/1] Emacs-like isearch for mconf.
Date: Fri,  8 Jun 2018 11:35:45 +0200
Message-Id: <20180608093546.7687-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dirk Gouders <dirk@gouders.net>

Hello,

v2 went out incomplete, without the patch.
Better so, because it would have just wasted people's time.

For v4 I am planning to implement Sam's idea to kind of being in a permanent
isearch when not using special keys.

Changes in v3:

* Use current git tree to make the patch apply.

* Eliminate debugging output to stderr.

Changes in v2:

* Additionally to CTRL-s, \ can be used to start isearch.

* Raw mode is off by default an can be enabled by an environment
  variable MENUCONFIG_RAW_MODE.

* I also added a variable for toggling raw mode but did not implement
  anything else.

* The isearch indicator is now displayed as soon as isearch is
  started.

* Any key except \, CTRL-s, alphanumeric characters and space
  terminates isearch and -- except ESC ESC -- is further processed,
  e.g. ENTER terminates isearch and is then used to navigate into a
  submenu.

* Problems with mismatches and matches above the current position were
  fixed.

Dirk Gouders (1):
  Emacs-like isearch for mconf.

 Documentation/kbuild/kconfig.txt   |  18 +++-
 scripts/kconfig/lxdialog/dialog.h  |   6 ++
 scripts/kconfig/lxdialog/menubox.c | 171 +++++++++++++++++++++++++++++++++++++
 scripts/kconfig/lxdialog/util.c    |  14 +++
 scripts/kconfig/mconf.c            |  47 ++++++++++
 5 files changed, 254 insertions(+), 2 deletions(-)

-- 
2.16.4

