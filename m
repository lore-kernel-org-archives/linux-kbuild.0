Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:34285 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757333Ab0BCPtI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Feb 2010 10:49:08 -0500
Message-Id: <20100203154605.461025238@goodmis.org>
Date: Wed, 03 Feb 2010 10:46:05 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/4][linux-next] kconfig: Updates to localmodconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Anibal Monsalve Salazar <anibal@debian.org>, Michal Marek <mmarek@suse.cz>

I'm posting the following patches for review. I've added these
to go into linux-next. They can be found in the git repo shown
below:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-kconfig.git
for-linus-2


Steven Rostedt (4):
      kconfig: Create include/generated for localmodconfig
      kconfig: Check for if conditions in Kconfig for localmodconfig
      kconfig: Look in both /bin and /sbin for lsmod in streamline_config.pl
      kconfig: Add LSMOD=file to override the lsmod for localmodconfig

----
 scripts/kconfig/Makefile             |   15 +++++++-
 scripts/kconfig/streamline_config.pl |   59 ++++++++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 4 deletions(-)
