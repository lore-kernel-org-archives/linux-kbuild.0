Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60723 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751638AbcF0UJu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jun 2016 16:09:50 -0400
Date: Mon, 27 Jun 2016 22:09:30 +0200
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild regression fix
Message-ID: <20160627200930.GA2492@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull this kbuild regression fix. The problem is that 9c8fa9bc08f6
("kbuild: fix if_change and friends to consider argument order") fixed a
potential missed rebuild, but this results in unnnecessary rebuilds with
the packaging targets. Which is still more correct than the previous
logic, but also very annoying.

Thanks,
Michal

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git rc-fixes

for you to fetch changes up to b36fad65d61fffe4b662d4bfb1ed673c455a36a2:

  kbuild: Initialize exported variables (2016-06-07 23:39:03 +0200)

----------------------------------------------------------------
Michal Marek (1):
      kbuild: Initialize exported variables

 Makefile | 2 ++
 1 file changed, 2 insertions(+)
