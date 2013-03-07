Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:52314 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932333Ab3CGSUs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Mar 2013 13:20:48 -0500
Received: by mail-wg0-f44.google.com with SMTP id dr12so1418815wgb.35
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Mar 2013 10:20:46 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [pull request] Pull request for branch yem-kconfig-rc-fixes
Date: Thu,  7 Mar 2013 19:20:38 +0100
Message-Id: <cover.1362679061.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
Cc: Justin Lecher <jlec@gentoo.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello Michal, All!

Michal, please, pull to -rc-fixes, these two changes by Justin to fix
ncurses-based kconfig frontends (mconf & nconf) compilation on systems
where ncurses was built with a separate terminfo library.


The following changes since commit e3900e74f26fc924c8e9e2a922bd40369b0bb517:

  Merge branch 'kbuild/rc-fixes' into kbuild/kconfig (2013-02-25 21:51:57 +0100)

are available in the git repository at:

  git://gitorious.org/linux-kconfig/linux-kconfig.git yem-kconfig-rc-fixes

Justin Lecher (2):
      menuconfig: optionally use pkg-config to detect ncurses libs
      kconfig: optionally use pkg-config to detect ncurses libs

 scripts/kconfig/Makefile                   |    4 +++-
 scripts/kconfig/lxdialog/check-lxdialog.sh |    2 ++
 2 files changed, 5 insertions(+), 1 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
