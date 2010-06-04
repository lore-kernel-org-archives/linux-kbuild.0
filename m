Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:56771 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755655Ab0FDNqt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Jun 2010 09:46:49 -0400
Date: Fri, 4 Jun 2010 15:46:47 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT] kbuild fix
Message-ID: <20100604134647.GA10031@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: richard@rsk.demon.co.uk, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

There is a oneliner fix for 'make gconfig' on recent Fedora. Technically
it's not a 2.6.35-rc1 regression, it is caused by newer gtk2 or
something, but it's a safe fix to include.

Thanks,
Michal

The following changes since commit 67a3e12b05e055c0415c556a315a3d3eb637e29e:

  Linux 2.6.35-rc1 (2010-05-30 13:21:02 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git rc-fixes

Richard Kennedy (1):
      gconfig: fix build failure on fedora 13

 scripts/kconfig/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
