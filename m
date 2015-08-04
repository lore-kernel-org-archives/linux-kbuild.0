Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44157 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755974AbbHDM00 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Aug 2015 08:26:26 -0400
Date: Tue, 4 Aug 2015 14:26:26 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild fixes for v4.2-rc6
Message-ID: <20150804122626.GA26806@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jason@zx2c4.com, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these two fixes for kbuild:
- The new ARCH_{CPP,A,C}FLAGS variables are reset before including the
  arch Makefile
- Fix calling make modules_install twice when module compression is
  enabled

Thanks,
Michal


The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git rc-fixes

for you to fetch changes up to 3d1450d54a4fc277fc4598acf2335f74b66b08fc:

  Makefile: Force gzip and xz on module install (2015-07-22 17:47:12 +0200)

----------------------------------------------------------------
Jason A. Donenfeld (1):
      Makefile: Force gzip and xz on module install

Michal Marek (1):
      kbuild: Do not pick up ARCH_{CPP,A,C}FLAGS from the environment

 Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
