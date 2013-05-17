Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47239 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756302Ab3EQThA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 May 2013 15:37:00 -0400
Date: Fri, 17 May 2013 21:36:58 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT] kbuild fix for v3.10-rc2
Message-ID: <20130517193658.GA32023@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lcapitulino@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

In an attempt to improve make rpm-pkg, I broke make binrpm-pkg. Please
pull the fix below.

Thanks,
Michal

The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:

  Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git for-next

Luiz Capitulino (1):
      package: Makefile: unbreak binrpm-pkg target

 scripts/package/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
