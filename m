Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f195.google.com ([74.125.82.195]:50949 "EHLO
	mail-we0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125Ab2LYXKe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Dec 2012 18:10:34 -0500
Received: by mail-we0-f195.google.com with SMTP id u3so1988909wey.6
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Dec 2012 15:10:32 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [pull request v2] Pull request for branch yem-kconfig-rc-fixes
Date: Wed, 26 Dec 2012 00:10:23 +0100
Message-Id: <cover.1356476868.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello Michal, All!

Here is a trivial patch suitable for post-rc1:
  - remove duplicate variable declaration in kconfig/lxdialog

Changes v1..v2:
  - since changes about use of ${CONFIG_} have not been pulled in Linus'
    tree, I've dropped the previous two related patches from this branch.
  - added Wang's cleanup


The following changes since commit bad9955db1b73d7286f74a8136a0628a9b1ac017:

  menuconfig: Replace CIRCLEQ by list_head-style lists. (2012-10-25 15:06:00 +0200)

are available in the git repository at:
  git://gitorious.org/linux-kconfig/linux-kconfig.git yem-kconfig-rc-fixes

Wang YanQing (1):
      kconfig:lxdialog: remove duplicate code

 scripts/kconfig/lxdialog/dialog.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

