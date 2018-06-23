Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:35235 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751470AbeFWHBJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jun 2018 03:01:09 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC v9 0/1] mconf: global i-search in menu prompts
Date: Sat, 23 Jun 2018 08:53:46 +0200
Message-Id: <20180623065347.10611-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dirk Gouders <dirk@gouders.net>

Hello,

v9 of this RFC mainly fixes an issue reported by Randy, I tested this
fix a lot and it seems it is ready to send out.

Dirk

Changes in v9:

* Move global variable declarations to lxdialog/dialog.h

* Don't do unnecessary initialization of isearch_str.

* Fix an issue with '-' and '+' not added to the search pattern.
  The historical handling of those characters now (again) happens
  after input has been checked for i-search relevance.

* Ensure the unused part of isearch_str is filled with '\0' so there
  is no need to do string termination each time a character is added.

Changes in v8:

* Get rid of flat_array and use a short helper function
  menu_get_next() for tree traversal.

* Correct typos reported by Randy Dunlap.

Changes in v7:

* make menu_isearch() return void

* Suggested-by removed, ask for Sam's permission

* Rework i-search instructions text

* Remember exact starting position in menu

* Stay on menu item if it matches pattern with a character added

* Fix print_autowrap for short texts

* Focus on buttons: use A_STANDOUT for current menu item

* Fix compiler warnings

* Don't exclude comments in searches

* ESC also clears search string

* Remove the last parameter of print_isearch and use focus_on_buttons
  instead

* Document changes to print_autowrap and conf() in commit message

* Rework comments in the code

* Rework commit message, add a motivation part

* Free serialized menu array on exit

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
  mconf: global i-search in menu prompts

 scripts/kconfig/lkc.h                |   1 +
 scripts/kconfig/lxdialog/checklist.c |   2 +-
 scripts/kconfig/lxdialog/dialog.h    |   9 +-
 scripts/kconfig/lxdialog/inputbox.c  |   2 +-
 scripts/kconfig/lxdialog/menubox.c   | 179 ++++++++++++++++++++++++++++++-----
 scripts/kconfig/lxdialog/util.c      |  45 ++++++++-
 scripts/kconfig/lxdialog/yesno.c     |   2 +-
 scripts/kconfig/mconf.c              | 169 +++++++++++++++++++++++++++++++--
 scripts/kconfig/menu.c               |  28 ++++++
 9 files changed, 398 insertions(+), 39 deletions(-)

-- 
2.13.6

