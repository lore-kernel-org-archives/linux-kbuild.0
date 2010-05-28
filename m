Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:33944 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757490Ab0E1Oru (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 May 2010 10:47:50 -0400
Message-Id: <20100528144323.232583082@goodmis.org>
Date: Fri, 28 May 2010 10:43:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/3] [GIT PULL] kconfig: minor updates to streamline_config.pl
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org

Linus,

These are minor updates for the streamline_config.pl script.

Please pull the latest for-linus tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-kconfig.git

    branch: for-linus


Toralf Foerster (3):
      kconfig: Make a variable local in streamline_config.pl
      kconfig: Fix typo in comment in streamline_config.pl
      kconfig: Hide error output in find command in streamline_config.pl

----
 scripts/kconfig/streamline_config.pl |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)
