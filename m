Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47136 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757312Ab1FPO0M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Jun 2011 10:26:12 -0400
Date: Thu, 16 Jun 2011 16:26:09 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT] kbuild fixes for 3.0-rc4
Message-ID: <20110616142609.GA11457@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: apw@canonical.com, mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these two fixes for bugs introduced by my previously.

Thanks,
Michal

The following changes since commit 2c53b436a30867eb6b47dd7bab23ba638d1fb0d2:

  Linux 3.0-rc3 (2011-06-13 15:29:59 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git rc-fixes

Andy Whitcroft (1):
      perf: clear out make flags when calling kernel make kernelver

Michal Marek (1):
      kbuild: Call depmod.sh via shell

 Makefile                         |    3 ++-
 tools/perf/util/PERF-VERSION-GEN |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
