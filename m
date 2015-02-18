Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39059 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752012AbbBRV1r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Feb 2015 16:27:47 -0500
Date: Wed, 18 Feb 2015 22:27:45 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild misc changes for v3.20-rc1
Message-ID: <20150218212745.GA27680@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: mmarek@suse.cz, sedat.dilek@gmail.com, yamada.m@jp.panasonic.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

just a few non-critical kbuild changes for v3.20-rc1 (or v4.0-rc1 or
vYearOfTheGoatKernel-rc1 or whatever it's called):

- builddeb adds the actual distribution name in the changelog
- documentation fixes

Michal

The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:

  Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to 31a4af7f7d3cd3090c1c9201d62d4ede54dc5969:

  kbuild: trivial - fix the help doc of CONFIG_CC_OPTIMIZE_FOR_SIZE (2015-01-08 14:53:50 +0100)

----------------------------------------------------------------
Masahiro Yamada (1):
      kbuild: trivial - fix the help doc of CONFIG_CC_OPTIMIZE_FOR_SIZE

Michal Marek (1):
      kbuild: Update documentation of clean-files and clean-dirs

Sedat Dilek (2):
      builddeb: Update year and git repository URL in debian/copyright
      builddeb: Try to determine distribution

 Documentation/kbuild/makefiles.txt | 11 +++++------
 init/Kconfig                       |  4 ++--
 scripts/package/builddeb           | 17 ++++++++++++++---
 3 files changed, 21 insertions(+), 11 deletions(-)
