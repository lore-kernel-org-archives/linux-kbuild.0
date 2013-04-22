Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:61102 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753283Ab3DVVbh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 17:31:37 -0400
Received: by mail-wi0-f180.google.com with SMTP id h11so5197945wiv.1
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2013 14:31:36 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [pull request] Pull request for branch yem-kconfig-for-next
Date: Mon, 22 Apr 2013 23:31:19 +0200
Message-Id: <cover.1366665921.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Benjamin Poirier <bpoirier@suse.de>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Michal,

Here is the official pull-request for the kconfig-related changes I've
gathered from the list and accumulated for inclusin in 3.9:

  - memory leak fixed in mconf
  - randconfig fix when randomising choices
  - navigation breadcrumbs in mconf
  - randconfig improvements: seed, and probability skew


The following changes since commit a45c7dfb942b6c198d5cd283f8dcee145241a017:

  merge_config.sh: Avoid creating unnessary source softlinks (2013-04-10 10:55:22 +0200)

are available in the git repository at:

  git://gitorious.org/linux-kconfig/linux-kconfig.git yem-kconfig-for-next

for you to fetch changes up to 4fc22ca2dc3096784fbd87c1cfef7e2bce153f40:

  kconfig: do randomise choice entries in presence of KCONFIG_ALLCONFIG (2013-04-16 22:00:33 +0200)

----------------------------------------------------------------
Benjamin Poirier (2):
      menuconfig: Fix memory leak introduced by jump keys feature
      menuconfig: Add "breadcrumbs" navigation aid

Yann E. MORIN (4):
      kconfig/lxdialog: rationalise the include paths where to find {.n}curses{,w}.h
      kconfig: allow specifying the seed for randconfig
      kconfig: implement KCONFIG_PROBABILITY for randconfig
      kconfig: do randomise choice entries in presence of KCONFIG_ALLCONFIG

 Documentation/kbuild/kconfig.txt           |   26 ++++++++++
 scripts/kconfig/conf.c                     |   12 ++++-
 scripts/kconfig/confdata.c                 |   29 ++++++++---
 scripts/kconfig/list.h                     |   40 +++++++++++++++
 scripts/kconfig/lxdialog/check-lxdialog.sh |    4 +-
 scripts/kconfig/lxdialog/dialog.h          |    7 +++
 scripts/kconfig/lxdialog/util.c            |   45 ++++++++++++++++-
 scripts/kconfig/mconf.c                    |   74 +++++++++++++++++++++++++++-
 8 files changed, 225 insertions(+), 12 deletions(-)

Regards,
Yann E. MORIN

.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
