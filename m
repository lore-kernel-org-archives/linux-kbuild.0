Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:36280 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933082AbeFKM7Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jun 2018 08:59:25 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC v5 0/1] i-search navigation for mconf
Date: Mon, 11 Jun 2018 14:51:54 +0200
Message-Id: <20180611125155.21470-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dirk Gouders <dirk@gouders.net>

Hello,

I reworked the prototype for the i-search navigation concept.  It is
now more thoroughly tested and hopefully not a waste of time to have a
look at it.

For the focus-sensitive help text, I modified the function
print_autowrap() and for now called it print_autowrap_fill().  It
could replace the old function but does a bit more work than it.

With this navigation concept, mconf's behavior (in i-search mode) is
quite different from the known one, most noticeably the need to switch
focus to the buttons to be able to use <y|n|m|space>.   Ideas are very
welcome.

Interesting in i-search mode is the ability to not only search item
strings, but also their selection marks.  So, one can search for items
selected as a module, for example.

Dirk

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
  i-search navigation for mconf

 scripts/kconfig/lxdialog/dialog.h  |   3 +
 scripts/kconfig/lxdialog/menubox.c | 489 +++++++++++++++++++++++++++----------
 scripts/kconfig/lxdialog/util.c    | 106 +++++++-
 scripts/kconfig/mconf.c            |  68 ++++--
 4 files changed, 506 insertions(+), 160 deletions(-)

-- 
2.16.4

