Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:45802 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932276Ab3BIA6P (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Feb 2013 19:58:15 -0500
Received: by mail-we0-f180.google.com with SMTP id k14so3423286wer.39
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Feb 2013 16:58:13 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [pull request] Pull request for branch yem-kconfig-for-next
Date: Sat,  9 Feb 2013 01:58:05 +0100
Message-Id: <cover.1360371247.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Roland Eggner <edvx1@systemanalysen.net>, Dmitry Voytik <dvv.kernel@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello Michal, All!

This series by Roland, updates the help texts for the nconf frontends, and
brings it from its lingering state to (to my knowledge) an up-to-date and
complete coverage of nconf.

Please apply for 3.9.

The following changes since commit aed9934bf182c049d966bd106ad7e2b43c46c718:

  kconfig: fix a compiliation error when using make xconfig (2013-01-30 10:16:43 +0100)

are available in the git repository at:
  git://gitorious.org/linux-kconfig/linux-kconfig.git yem-kconfig-for-next

Roland Eggner (2):
      kconfig: nconf: rewrite help texts
      kconfig: nconf: rewrite labels of function keys line

 scripts/kconfig/nconf.c |  356 +++++++++++++++++++++++------------------------
 1 files changed, 174 insertions(+), 182 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

