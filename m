Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:62485 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751004Ab0J2FoZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Oct 2010 01:44:25 -0400
Message-Id: <20101029054310.790179545@goodmis.org>
Date: Fri, 29 Oct 2010 01:43:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/5] [GIT PULL] kconfig: Fixes to make localmodconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org


Linus,

Please pull the latest for-linus tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-kconfig.git
for-linus


Steven Rostedt (3):
      kconfig: Make localmodconfig handle environment variables
      kconfig: Fix streamline_config to read multi line deps in Kconfig files
      kconfig: Have streamline_config process menuconfigs too

hiromu (1):
      kconfig: Fix missing declaration of variable $dir in streamline_config.pl

hiromu yagura (1):
      kconfig: Fix variable name typo %prompts in streamline_config.pl

----
 scripts/kconfig/streamline_config.pl |   43 ++++++++++++++++++++++++++++-----
 1 files changed, 36 insertions(+), 7 deletions(-)
