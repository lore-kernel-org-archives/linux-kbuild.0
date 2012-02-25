Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50458 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755396Ab2BYJkn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 25 Feb 2012 04:40:43 -0500
Date: Sat, 25 Feb 2012 10:40:41 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT] kbuild rc fixes
Message-ID: <20120225094041.GA13304@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Gregory.Dietsche@cuw.edu, ben@decadent.org.uk, lucas.demarchi@profusion.mobi, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

three kbuild fixes for 3.3:
* make deb-pkg symlink race fix.
* make coccicheck fix.
* Dropping the check for modutils. This is not a regression, but allows
  the module-init-tools replacement kmod work with the 3.3 kernel.

  Michal


The following changes since commit dcd6c92267155e70a94b3927bce681ce74b80d1f:

  Linux 3.3-rc1 (2012-01-19 15:04:48 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git rc-fixes

Ben Hutchings (1):
      builddeb: Don't create files in /tmp with predictable names

Greg Dietsche (1):
      coccicheck: change handling of C={1,2} when M= is set

Lucas De Marchi (1):
      kbuild: do not check for ancient modutils tools

 scripts/coccicheck       |   13 ++++---------
 scripts/depmod.sh        |    6 ------
 scripts/package/builddeb |   12 ++++++------
 3 files changed, 10 insertions(+), 21 deletions(-)
