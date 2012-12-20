Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f195.google.com ([74.125.82.195]:40379 "EHLO
	mail-we0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751274Ab2LTWIz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Dec 2012 17:08:55 -0500
Received: by mail-we0-f195.google.com with SMTP id u3so749189wey.2
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Dec 2012 14:08:54 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [pull request] Pull request for branch yem-kconfig-rc-fixes
Date: Thu, 20 Dec 2012 23:08:45 +0100
Message-Id: <cover.1356041188.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello Michal, All!

Here are two patches for kconfig since we now can get the CONFIG_ prefix
form an environment variable:
  - document the use of that variable
  - ensure we use 'CONFIG_' even if $CONFIG_ is set

Regards,
Yann E. MORIN

The following changes since commit 409f117e2d6b38d714ab26def840801e33dfe115:

  merge_config.sh: Add option to specify output dir (2012-12-09 18:22:17 +0100)

are available in the git repository at:
  git://gitorious.org/linux-kconfig/linux-kconfig.git yem-kconfig-rc-fixes

Yann E. MORIN (2):
      kconfig: document use of CONFIG_ environement variable
      kconfig: ensure we use proper CONFIG_ prefix

 Documentation/kbuild/kconfig.txt |    6 ++++++
 Makefile                         |    1 +
 2 files changed, 7 insertions(+), 0 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

