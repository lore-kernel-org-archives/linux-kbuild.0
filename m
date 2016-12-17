Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prg-ext-pat.suse.com ([213.151.95.130]:33998 "EHLO linux.suse"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752695AbcLQWGO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Dec 2016 17:06:14 -0500
Date: Sat, 17 Dec 2016 23:06:12 +0100
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild misc updates for v4.10-rc1
Message-ID: <20161217220612.GA9077@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: afd@ti.com, anton.tikhomirov@cdnetworks.com, kilobyte@angband.pl, mmarek@suse.com, vaishali.thakkar@oracle.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these non-core kbuild bits for v4.10-rc1:
- One new coccinelle check and improvements to irqf_oneshot.cocci
- make rpm POSIX compatibility fix
- make deb-pkg arm64 cross-compiling fix. I forgot to send this one
  during the v4.9 rc-phase, therefor the pull request is based on -rc6
  and not -rc1

Thanks,
Michal

The following changes since commit c6a385539175ebc603da53aafb7753d39089f32e:

  kbuild: Steal gcc's pie from the very beginning (2016-11-15 17:08:14 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to ff5b1ce6b22080379fd1ae9076ff2f5ca6519861:

  Merge branch 'kbuild/rc-fixes' into kbuild/misc (2016-12-11 21:20:34 +0100)

----------------------------------------------------------------
Adam Borowski (1):
      builddeb: fix cross-building to arm64 producing host-arch debs

Andrew F. Davis (1):
      Coccinelle: Add misc/boolconv.cocci

Anton Tikhomirov (1):
      kbuild/mkspec: avoid using brace expansion

Michal Marek (1):
      Merge branch 'kbuild/rc-fixes' into kbuild/misc

Vaishali Thakkar (3):
      Coccinelle: misc: Improve the matching of rules
      Coccinelle: misc: Improve the result given by context mode
      Coccinelle: misc: Add support for devm variant in all modes

 scripts/coccinelle/misc/boolconv.cocci     | 90 ++++++++++++++++++++++++++++++
 scripts/coccinelle/misc/irqf_oneshot.cocci | 52 +++++++++++------
 scripts/package/builddeb                   |  2 +-
 scripts/package/mkspec                     |  3 +-
 4 files changed, 129 insertions(+), 18 deletions(-)
 create mode 100644 scripts/coccinelle/misc/boolconv.cocci
