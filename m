Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:33583 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756583AbeFOWg0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jun 2018 18:36:26 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC v6 0/1] mconf: global i-search in menu structure
Date: Sat, 16 Jun 2018 00:29:06 +0200
Message-Id: <20180615222907.23449-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dirk Gouders <dirk@gouders.net>

Hello,

version 6 of this RFC was mainly influenced by a discussion with Randy
Dunlap about a patch for i-search in nconf.

In that discussion I stated that it would be a lot of work to
implement a global i-search but while thinking about that statement
afterwards, I realized that most of the needed functionality is
already there in search_conf(), the search function for config
symbols.

The menu tree is converted in a flat menu to ease the implementation
of a cyclic i-search and the rest of the implementation does no longer
interfere so much with current menu handling.

Dirk

Changes in v6:

* The modification of the function print_autowrap() was reworked and
  is no longer a separate function.

* The i-search navigation was completely reworked and now works on the
  whole menu tree.

* Hotkeys are back, because they do not interfere that much with this
  version of i-search navigation.

Changes in v5:

* More thoroughly tested code

* Hotkey navigation concept completely dropped

* Printable characters except special ones form the search string

* Focus-sensitive help text above menu

* DEL erases search string

* Matching string is highlighted in selected menu item

* README help text adjusted

Changes in v4:

* Prototype: consequent i-search navigation concept

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
  mconf: global i-search in menu structure

 scripts/kconfig/lxdialog/checklist.c |   2 +-
 scripts/kconfig/lxdialog/dialog.h    |   3 +-
 scripts/kconfig/lxdialog/inputbox.c  |   2 +-
 scripts/kconfig/lxdialog/menubox.c   | 177 +++++++++++++++++++++++++++++-----
 scripts/kconfig/lxdialog/util.c      |  37 ++++++-
 scripts/kconfig/lxdialog/yesno.c     |   2 +-
 scripts/kconfig/mconf.c              | 181 +++++++++++++++++++++++++++++++++--
 7 files changed, 364 insertions(+), 40 deletions(-)

-- 
2.16.4

