Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:37863 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750891AbeFGN4G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 09:56:06 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC v2 0/1] Emacs-like isearch for mconf.
Date: Thu,  7 Jun 2018 15:53:08 +0200
Message-Id: <20180607135309.16928-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>
Cc: Dirk Gouders <dirk@gouders.net>

*** BLURB HERE ***

Hello,

this is v2 of the isearch implementation, I also added Documentation changes which
probably have to be split, because the older symbol-search also was undokumented in
mconf (I basically copied the relevant documentation from Documentation/kbuild/kconfig.txt.

I could not completely let off CTRL-s but am certainly fine with get rid of it and
stay with just one special key (e.g. \) to start isearch.

Changes since v1:

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

Dirk

 Documentation/kbuild/kconfig.txt   |  18 +++-
 scripts/kconfig/lxdialog/dialog.h  |   6 ++
 scripts/kconfig/lxdialog/menubox.c | 173 +++++++++++++++++++++++++++++++++++++
 scripts/kconfig/lxdialog/util.c    |  14 +++
 scripts/kconfig/mconf.c            |  48 +++++++++-
 5 files changed, 256 insertions(+), 3 deletions(-)

-- 
2.16.4

