Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56178 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751955AbbKJUmb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Nov 2015 15:42:31 -0500
Date: Tue, 10 Nov 2015 21:42:30 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kconfig changes for v4.4-rc1
Message-ID: <20151110204230.GA3882@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: bbarbulovski@gmail.com, g2p.code@gmail.com, mcgrof@suse.com, sojkam1@fel.cvut.cz, thiago.macieira@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these kconfig changes for v4.4-rc1:
- make xconfig ported to Qt5, dropping support for Qt3
- merge_config.sh supports a single-input-file mode and also respects
  $KCONFIG_CONFIG
- Fix for incorrect display of >= and > in dependency expressions

Thanks,
Michal

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kconfig

for you to fetch changes up to be596aaa74090f553c61505ad03bb7a7460e5d23:

  Add current selection check. (2015-11-02 21:43:58 +0100)

----------------------------------------------------------------
Boris Barbulovski (38):
      Remove support for QT3 and older.
      Port xconfig to Qt5 - Use QMainWindow, QToolBar
      Port xconfig to Qt5 - Use QAction
      Port xconfig to Qt5 - Use QFileDialog
      Port xconfig to Qt5 - Use QList
      Port xconfig to Qt5 - Use QTextBrowser
      Port xconfig to Qt5 - Use QMenu
      Port xconfig to Qt5 - Remove unused #include <q3dragobject.h>
      Port xconfig to Qt5 - Replace Q3VBox with QWidget
      Port xconfig to Qt5 - Fix layout
      Port xconfig to Qt5 - Fix layout margin.
      Port xconfig to Qt5 - Update QAction checkable
      Port xconfig to Qt5 - Make single/split/full actions checkable.
      Port xconfig to Qt5 - Remove custom ListView classes.
      Port xconfig to Qt5 - Fix the code so it compiles with Qt5
      Port xconfig to Qt5 - update signals
      Port xconfig to Qt5 - Introduce Qt4/5 version of ConfigList and ConfigItem
      Port xconfig to Qt5 - Put back some of the old implementation.
      Port xconfig to Qt5 - Put back some of the old implementation(part 2).
      Port xconfig to Qt5 - Remove Qt3Support from Makefile.
      Port xconfig to Qt5 - Use correct signal names.
      Port xconfig to Qt5 - Set ConfigView object name.
      Port xconfig to Qt5 - Quick workaround to bypass app crash at startup.
      Port xconfig to Qt5 - Tree widget set column titles.
      Port xconfig to Qt5 - Add ConfigItem::nextItem to initializer list.
      Port xconfig to Qt5 - Add ConfigList::mode to initializer list.
      Port xconfig to Qt5 - Remove ConfigList::updateMenuList template.
      Port xconfig to Qt5 - Disable ConfigList soring
      Port xconfig to Qt5 - Change ConfigItem constructor parent type.
      Port xconfig to Qt5 - Add horizontal scrollbar, and scroll per pixel.
      Port xconfig to Qt5 - Source format.
      Port xconfig to Qt5 - Remove some commented code.
      Port xconfig to Qt5 - Add(back) lineedit editing.
      Port xconfig to Qt5 - Add(back) one click checkbox toggle.
      Port xconfig to Qt5 - on Back clicked, deselect old item.
      Port xconfig to Qt5 - Fix goParent issue.
      Port xconfig to Qt5 - Update copyright.
      Add current selection check.

Gabriel de Perthuis (2):
      kconfig/merge_config.sh: Support KCONFIG_CONFIG
      kconfig/merge_config.sh: Accept a single file

Luis R. Rodriguez (1):
      kbuild: document recursive dependency limitation / resolution

Michal Sojka (1):
      kconfig: Fix copy&paste error

Thiago Macieira (2):
      Update the buildsystem for KConfig finding Qt
      Use pkg-config to find Qt 4 and 5 instead of direct qmake

 Documentation/kbuild/Kconfig.recursion-issue-01 |  57 ++
 Documentation/kbuild/Kconfig.recursion-issue-02 |  63 +++
 Documentation/kbuild/Kconfig.select-break       |  33 ++
 Documentation/kbuild/kconfig-language.txt       | 161 ++++++
 scripts/kconfig/Makefile                        |  56 +-
 scripts/kconfig/expr.c                          |   2 +-
 scripts/kconfig/merge_config.sh                 |  18 +-
 scripts/kconfig/qconf.cc                        | 688 +++++++++++++-----------
 scripts/kconfig/qconf.h                         | 150 +++---
 scripts/kconfig/symbol.c                        |   2 +
 10 files changed, 794 insertions(+), 436 deletions(-)
 create mode 100644 Documentation/kbuild/Kconfig.recursion-issue-01
 create mode 100644 Documentation/kbuild/Kconfig.recursion-issue-02
 create mode 100644 Documentation/kbuild/Kconfig.select-break
