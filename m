Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44332 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751243Ab0AMMbU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jan 2010 07:31:20 -0500
Date: Wed, 13 Jan 2010 13:31:18 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild fixes for 2.6.33
Message-ID: <20100113123118.GA3794@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these two kbuild fixes for 2.6.33 (the previous pull request
seems to have lost, so I updated the branch). If there are some problems
with the patches, please tell me.

Thanks!
Michal

The following changes since commit 7284ce6c9f6153d1777df5f310c959724d1bd446:
  Linus Torvalds (1):
        Linux 2.6.33-rc4

are available in the git repository at:

  git://repo.or.cz/linux-kbuild.git for-33

Jonathan Nieder (1):
      kbuild: really fix bzImage build with non-bash sh

Michal Marek (1):
      Makefile: do not override LC_CTYPE

 Makefile               |    3 +--
 arch/sh/tools/Makefile |    2 +-
 scripts/Makefile.lib   |    9 +++++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

