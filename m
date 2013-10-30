Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:47711 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803Ab3J3VqV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Oct 2013 17:46:21 -0400
Received: by mail-wg0-f43.google.com with SMTP id b13so1946222wgh.22
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2013 14:46:20 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [pull request] Pull request for branch yem/kconfig-for-next
Date: Wed, 30 Oct 2013 22:46:17 +0100
Message-Id: <cover.1383168460.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Martin Walch <walch.martin@web.de>, Regid Ichira <regid23@nt1.in>, "\"Yann E. MORIN:" <yann.morin.1998@free.fr>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Michal, please pull these changes to kconfig for 3.13:
  - update Documentation and mconf's help  (Martin, Regid)
  - remove unneeded kconfig scanner declaration  (Martin)
  - clarify parser warning message about type redefinition  (Martin)
  - fix gstr length usage  (Martin)
  - store our Qt config settings in a proper location  (Ben)

There are still a few patches floating on the list, but I haven't yet
had time to review/test them; I'll do this in the coming days.

/me has still not entirely got over his trip to Edinburgh last week...

Regards,
Yann E. MORIN.


The following changes since commit 86eb781889ec31f6421b86ab252ea609d456322d:

  scripts/config: fix variable substitution command (2013-09-13 13:06:59 +0200)

are available in the git repository at:

  git://gitorious.org/linux-kconfig/linux-kconfig.git yem/kconfig-for-next

for you to fetch changes up to 00d4f8fc2c729b1baf723cacd2b5942b032b6784:

  xconfig: Fix the filename for GUI settings (2013-10-08 23:52:16 +0200)

----------------------------------------------------------------
Ben Hutchings (1):
      xconfig: Fix the filename for GUI settings

Martin Walch (5):
      kconfig: add short explanation to SYMBOL_WRITE
      kconfig: fix trivial typos and update mconf documentation
      kconfig: adjust warning message for conflicting types
      kconfig: remove unused definition from scanner
      kconfig: fix bug in search results string: use strlen(gstr->s), not gstr->len

Regid Ichira (1):
      Documentation/kbuild/kconfig.txt: 'make listnewconfig' replaces: yes "" | make oldconfig

 Documentation/kbuild/kconfig.txt | 11 ++------
 scripts/kconfig/expr.h           |  2 +-
 scripts/kconfig/mconf.c          | 60 +++++++++++++++++++---------------------
 scripts/kconfig/menu.c           | 11 ++++----
 scripts/kconfig/qconf.cc         |  5 ++++
 scripts/kconfig/qconf.h          |  1 +
 scripts/kconfig/symbol.c         |  2 +-
 scripts/kconfig/zconf.l          |  1 -
 8 files changed, 45 insertions(+), 48 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
