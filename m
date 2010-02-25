Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:58317 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932868Ab0BYTT4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Feb 2010 14:19:56 -0500
Message-Id: <20100225191755.483925025@goodmis.org>
Date: Thu, 25 Feb 2010 14:17:55 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/5][GIT PULL] kconfig: updates to localmodconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org


Linus,

Please pull the latest for-linus-2 tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-kconfig.git
for-linus-2


Michal Marek (1):
      kconfig: Simplify LSMOD= handling

Steven Rostedt (4):
      kconfig: Create include/generated for localmodconfig
      kconfig: Check for if conditions in Kconfig for localmodconfig
      kconfig: Look in both /bin and /sbin for lsmod in streamline_config.pl
      kconfig: Add LSMOD=file to override the lsmod for localmodconfig

----
 scripts/kconfig/Makefile             |   14 +++++++-
 scripts/kconfig/streamline_config.pl |   59 ++++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 4 deletions(-)
