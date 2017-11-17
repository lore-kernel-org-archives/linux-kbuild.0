Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:23438 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751863AbdKQRe1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 12:34:27 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 Nov 2017 02:33:25 +0900
Message-ID: <CAK7LNAQGnPkrk43Gdbzy47zzCbONKmbA2Hbh=agGzn-z150fiQ@mail.gmail.com>
Subject: [GIT PULL 2/2] Kbuild misc updates for v4.15
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Here are some updates of misc scripts for v4.15.  Please pull!


The following changes since commit 9e66317d3c92ddaab330c125dfe9d06eee268aff:

  Linux 4.14-rc3 (2017-10-01 14:54:54 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-misc-v4.15

for you to fetch changes up to e9e716ff2d4d8618aefac55691a4c4483abecc37:

  docs: dev-tools: coccinelle: delete out of date wiki reference
(2017-11-16 08:56:43 +0900)

----------------------------------------------------------------
Kbuild misc updates for v4.15

- Clean up and fix RPM package build

- Fix a warning in DEB package build

- Improve coccicheck script

- Improve some semantic patches

----------------------------------------------------------------
Julia Lawall (7):
      Coccinelle: setup_timer: improve messages from setup_timer
      coccinelle: api: detect identical chip data arrays
      Coccinelle: make DEBUG_FILE option more useful
      Coccinelle: use false positive annotation
      coccinelle: use exists to improve efficiency
      coccinelle: orplus: reorganize to improve performance
      docs: dev-tools: coccinelle: delete out of date wiki reference

Kees Cook (1):
      coccinelle: Improve setup_timer.cocci matching

Masahiro Yamada (11):
      kbuild: rpm-pkg: remove ppc64 specific image handling
      kbuild: rpm-pkg: install vmlinux.bz2 unconditionally
      kbuild: rpm-pkg: clean up mkspec
      kbuild: rpm-pkg: refactor mkspec with here doc
      kbuild: rpm-pkg: fix build error when CONFIG_MODULES is disabled
      kbuild: rpm-pkg: replace $RPM_BUILD_ROOT with %{buildroot}
      kbuild: rpm-pkg: fix jobserver unavailable warning
      kbuild: rpm-pkg: keep spec file until make mrproper
      kbuild: rpm-pkg: do not force -jN in submake
      coccinelle: grep Options and Requires fields more precisely
      coccinelle: fix verbose message about .cocci file being run

Sven Joachim (1):
      builddeb: Pass the kernel:debarch substvar to dpkg-genchanges

 .gitignore                                           |   5 +
 Documentation/dev-tools/coccinelle.rst               |   3 -
 scripts/coccicheck                                   |  26 ++-
 scripts/coccinelle/api/check_bq27xxx_data.cocci      | 161 +++++++++++++
 scripts/coccinelle/api/setup_timer.cocci             | 144 +++++++++---
 scripts/coccinelle/iterators/list_entry_update.cocci |   2 +-
 scripts/coccinelle/misc/ifcol.cocci                  |   8 +-
 scripts/coccinelle/misc/orplus.cocci                 |  43 ++--
 scripts/coccinelle/null/badzero.cocci                |   2 +-
 scripts/package/Makefile                             |   9 +-
 scripts/package/builddeb                             |   4 +-
 scripts/package/mkspec                               | 269
++++++++++------------
 12 files changed, 457 insertions(+), 219 deletions(-)
 create mode 100644 scripts/coccinelle/api/check_bq27xxx_data.cocci

-- 
Best Regards
Masahiro Yamada
