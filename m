Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:38180 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754561Ab1HaHry (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 03:47:54 -0400
Received: by iabu26 with SMTP id u26so499798iab.19
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 00:47:54 -0700 (PDT)
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH 0/6] nconf bug fixes and U/E improvements
Date: Wed, 31 Aug 2011 00:46:07 -0700
Message-Id: <1314776773-9560-1-git-send-email-crquan@gmail.com>
In-Reply-To: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

*** BLURB HERE ***

Cheng Renquan (6):
  scripts/kconfig/nconf: fix typo: unknow => unknown
  scripts/kconfig/nconf: fix memmove's length arg
  scripts/kconfig/nconf: dynamically alloc dialog_input_result
Thanks Arnaud pointing out realloc issue in previous edition;

  scripts/kconfig/nconf: fix editing long strings

  scripts/kconfig/nconf: add KEY_HOME / KEY_END for dialog_inputbox
The nconfig even has KEY_UP as KEY_RIGHT and KEY_DOWN as KEY_LEFT,
that I think more unnatural, better remove KEY_UP/KEY_DOWN in such
a one line editor, or for future possible text area editor;

  scripts/kconfig/nconf: trunc too long string display in menu

 scripts/kconfig/nconf.c     |   29 ++++++++++-------
 scripts/kconfig/nconf.gui.c |   73 ++++++++++++++++++++++++++++++++++++-------
 scripts/kconfig/nconf.h     |    2 +-
 3 files changed, 79 insertions(+), 25 deletions(-)

-- 
1.7.6

Cheng Renquan (???)
