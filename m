Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50776 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756071AbcJNUSb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Oct 2016 16:18:31 -0400
Date: Fri, 14 Oct 2016 22:18:00 +0200
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild misc changes for 4.9-rc1
Message-ID: <20161014201759.GA28956@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Julia.Lawall@lip6.fr, elfring@users.sourceforge.net, hofrat@osadl.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

just a few patches on the kbuild.git#misc branch this time:

- New Coccinelle patch by Nicholas Mc Guire
- Existing patch fixes by Julia Lawall
- Minor comment fix by Markus Elfring


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to c8990359d4b12f14656386526ddf904635076902:

  Coccinelle: flag conditions with no effect (2016-10-11 09:57:17 +0200)

----------------------------------------------------------------
Julia Lawall (2):
      Coccinelle: limit memdup_user transformation to GFP_KERNEL case
      Coccinelle: pm_runtime: ensure relevance of pm_runtime reports

Markus Elfring (1):
      scripts/coccicheck: Update reference for the corresponding documentation

Nicholas Mc Guire (1):
      Coccinelle: flag conditions with no effect

 scripts/coccicheck                           |  2 +-
 scripts/coccinelle/api/memdup_user.cocci     |  8 ++--
 scripts/coccinelle/api/pm_runtime.cocci      | 18 +++++---
 scripts/coccinelle/misc/cond_no_effect.cocci | 64 ++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+), 12 deletions(-)
 create mode 100644 scripts/coccinelle/misc/cond_no_effect.cocci
