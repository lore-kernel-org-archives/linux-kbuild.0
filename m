Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33613 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934308AbcATJJX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Jan 2016 04:09:23 -0500
Date: Wed, 20 Jan 2016 10:09:20 +0100
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild changes for v4.5-rc1
Message-ID: <20160120090920.GA7478@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lee.jones@linaro.org, mmarek@suse.com, mmarek@suse.cz, nicolas.iooss_linux@m4x.org, udknight@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these kbuild changes for v4.5-rc1:
- Make <modname>-m in makefiles work like <modname>-y and fix the
  fallout
- Minor genksyms fix
- Fix race with make -j install modules_install
- Move -Wsign-compare from make W=1 to W=2
- Other minor fixes

Thanks,
Michal

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to 7599ea8b4e25fd8dea26cb64f100cf265d1e6bf3:

  kbuild: Demote 'sign-compare' warning to W=2 (2016-01-12 16:07:03 +0100)

----------------------------------------------------------------
Lee Jones (1):
      kbuild: Demote 'sign-compare' warning to W=2

Michal Marek (6):
      staging/ad7606: Actually build the interface modules
      kbuild: Allow to specify composite modules with modname-m
      Revert "drm: Hack around CONFIG_AGP=m build failures"
      ath10k: Fix build with CONFIG_THERMAL=m
      genksyms: Handle string literals with spaces in reference files
      kbuild: Do not run modules_install and install in paralel

Nicolas Iooss (1):
      fixdep: constify strrcmp arguments

Wang YanQing (1):
      Makefile: revert "Makefile: Document ability to make file.lst and file.S" partially

 Makefile                                  | 8 +++++++-
 drivers/gpu/drm/Makefile                  | 2 --
 drivers/misc/ibmasm/ibmasm.h              | 2 +-
 drivers/net/wireless/ath/ath10k/thermal.h | 2 +-
 drivers/staging/iio/adc/Kconfig           | 4 ++--
 drivers/staging/iio/adc/Makefile          | 7 +++----
 drivers/staging/iio/adc/ad7606_core.c     | 4 ++++
 drivers/usb/chipidea/otg_fsm.h            | 2 +-
 fs/logfs/logfs.h                          | 2 +-
 scripts/Makefile.build                    | 8 ++++++--
 scripts/Makefile.extrawarn                | 2 ++
 scripts/Makefile.lib                      | 4 ++--
 scripts/basic/fixdep.c                    | 2 +-
 scripts/genksyms/genksyms.c               | 6 ++++--
 14 files changed, 35 insertions(+), 20 deletions(-)
