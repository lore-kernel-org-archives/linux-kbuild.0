Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f66.google.com ([209.85.160.66]:47133 "EHLO
	mail-pb0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934144Ab3AOXNE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Jan 2013 18:13:04 -0500
Received: by mail-pb0-f66.google.com with SMTP id wz17so375840pbc.9
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Jan 2013 15:13:04 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [pull request] Pull request for branch yem-kconfig-for-next
Date: Wed, 16 Jan 2013 00:12:52 +0100
Message-Id: <cover.1358291451.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello Michal, All!

These are the kconfig patches I've queued for 3.9.

There are a few more on the list, but they need rework first (the vi- and
readline-like-keys series).


The following changes since commit 87727d453b4677a21312712c8a4bb5dcd81a1ebe:

  menuconfig:inputbox: support navigate input position (2012-12-25 23:42:37 +0100)

are available in the git repository at:
  git://gitorious.org/linux-kconfig/linux-kconfig.git yem-kconfig-for-next

Roland Eggner (1):
      nconf: function keys line, change background color for better readability

Wang YanQing (2):
      menuconfig: Add Save/Load buttons
      menuconfig: Get rid of the top-level entries for "Load an Alternate/Save an Alternate"

 scripts/kconfig/lxdialog/menubox.c |   20 +++++++++-------
 scripts/kconfig/mconf.c            |   44 ++++++++++++++++++++---------------
 scripts/kconfig/nconf.gui.c        |    2 +-
 3 files changed, 37 insertions(+), 29 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

