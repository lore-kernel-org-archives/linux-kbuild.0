Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:50767 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871AbYKXUu2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Nov 2008 15:50:28 -0500
Date: Mon, 24 Nov 2008 21:51:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [GIT] kbuild patches
Message-ID: <20081124205150.GA32497@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Just a heads up of what I so far has applied to build-next.git

I have more queued in my mailbox pending review/applying.

If you use "make -s" you will see that we are now more
silent than before.

tags support got an overhauls and presently includes
symbols form the archs that has not yet killed include/asm-*

Everything is shortly available here:

   git://git.kernel.org/pub/scm/linux/kernel/git/sam/kbuild-next.git master

I will send patches as followup.

	Sam

Mike Frysinger (3):
      kbuild: kill output in silent mode of mkcompile_h
      kbuild: introduce $(kecho) convenience echo
      kbuild: use KECHO convenience echo

Sally, Gene (1):
      kbuild: gen_init_cpio expands shell variables in file names

Sam Ravnborg (3):
      kbuild: expand -I in KBUILD_CPPFLAGS
      kbuild: teach mkmakfile to be silent
      kbuild: move tags support to a shell script

Werner Almesberger (1):
      remove bashisms from scripts/extract-ikconfig


 Documentation/kbuild/makefiles.txt |   14 ++++
 Makefile                           |  127 ++-----------------------------
 arch/blackfin/boot/Makefile        |    2 +-
 scripts/Kbuild.include             |   18 ++--
 scripts/Makefile.lib               |   15 +++-
 scripts/extract-ikconfig           |    8 +-
 scripts/mkcompile_h                |    6 +-
 scripts/mkmakefile                 |    4 +-
 scripts/tags.sh                    |  147 ++++++++++++++++++++++++++++++++++++
 usr/gen_init_cpio.c                |   28 +++++++-
 10 files changed, 227 insertions(+), 142 deletions(-)
