Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56926 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754559AbcEZUmj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 May 2016 16:42:39 -0400
Date: Thu, 26 May 2016 22:42:39 +0200
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kconfig updates for v4.7-rc1
Message-ID: <20160526204239.GA4875@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: dirk@gouders.net, pebolle@tiscali.nl, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

Please pull these kconfig fixes for v4.7-rc1:
- Fix for behavior of tristate choice items and fix for documentation
  of existing kconfig behavior [Dirk Gouders]
- More helpful "unexpected data" kconfig warning [Paul Bolle]

Thanks,
Michal

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kconfig

for you to fetch changes up to fa64e5f6a35efd5e77d639125d973077ca506074:

  kconfig/symbol.c: handle choice_values that depend on 'm' symbols (2016-05-10 21:14:27 +0200)

----------------------------------------------------------------
Dirk Gouders (3):
      kconfig-language: fix comment on dependency-generated menu structures.
      kconfig-language: elaborate on the type of a choice
      kconfig/symbol.c: handle choice_values that depend on 'm' symbols

Paul Bolle (1):
      kconfig: add unexpected data itself to warning

 Documentation/kbuild/kconfig-language.txt | 22 +++++++++++++---------
 scripts/kconfig/confdata.c                |  4 +++-
 scripts/kconfig/symbol.c                  | 14 ++++++++++++++
 3 files changed, 30 insertions(+), 10 deletions(-)
