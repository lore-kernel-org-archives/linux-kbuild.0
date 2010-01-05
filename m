Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:60325 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752837Ab0AEPuj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Jan 2010 10:50:39 -0500
Date: Tue, 5 Jan 2010 16:50:38 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild fix for 2.6.33
Message-ID: <20100105155038.GA20834@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonathan Nieder <jrnieder@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull this to fix build with /bin/sh -> dash (as used in Ubuntu).

Thanks!
Michal

The following changes since commit 45d28b097280a78893ce25a5d0db41e6a2717853:
  Linus Torvalds (1):
        Merge branch 'reiserfs/kill-bkl' of git://git.kernel.org/.../frederic/random-tracing

are available in the git repository at:

  git://repo.or.cz/linux-kbuild.git for-33

Jonathan Nieder (1):
      kbuild: really fix bzImage build with non-bash sh

 scripts/Makefile.lib |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)
