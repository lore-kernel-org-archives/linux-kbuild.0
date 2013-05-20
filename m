Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:58640 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757418Ab3ETPxn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 May 2013 11:53:43 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [pull request] Pull request for branch yem-kconfig-rc-fixes
Date: Mon, 20 May 2013 17:48:01 +0200
Message-Id: <cover.1369064712.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello Michal, All,

Please pull these two rc-fixes:
  - fix key handling in empty menus in mconf
  - fix scripts/config wrt short --*-after options

Regards,
Yann E. MORIN


The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:

  Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)

are available in the git repository at:

  git://gitorious.org/linux-kconfig/linux-kconfig.git yem-kconfig-rc-fixes

for you to fetch changes up to 8f9c6f75f603132869375a203d22e5b445f6294f:

  mconf: handle keys in empty dialogs (2013-05-20 14:15:27 +0200)

----------------------------------------------------------------
Clement Chauplannaz (1):
      scripts/config: fix assignment of parameters for short version of --*-after options

Dirk Gouders (1):
      mconf: handle keys in empty dialogs

 scripts/config                     |  2 +-
 scripts/kconfig/lxdialog/menubox.c |  8 ++++----
 scripts/kconfig/mconf.c            | 11 ++++++-----
 3 files changed, 11 insertions(+), 10 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
