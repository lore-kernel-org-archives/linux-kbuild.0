Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48859 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753417Ab0IFLsi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Sep 2010 07:48:38 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 0/3] make clean fixes
Date: Mon,  6 Sep 2010 13:48:13 +0200
Message-Id: <1283773696-3911-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Two fixes and one cleanup of 'make clean'

Michal

Michal Marek (3):
  kbuild: Really don't clean bounds.h and asm-offsets.h
  kbuild: Do not run make clean in $(srctree)
  kbuild: Use a single clean rule for kernel and external modules

 Documentation/kbuild/makefiles.txt |    7 +++++++
 Kbuild                             |    4 ++--
 Makefile                           |   33 +++++++++++++--------------------
 scripts/Makefile.clean             |    2 ++
 4 files changed, 24 insertions(+), 22 deletions(-)

