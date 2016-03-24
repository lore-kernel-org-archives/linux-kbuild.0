Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39812 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751236AbcCXUvV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Mar 2016 16:51:21 -0400
Date: Thu, 24 Mar 2016 21:51:19 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kconfig changes for v4.6-rc1
Message-ID: <20160324205119.GA11597@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: JBeulich@suse.com, viro@ZenIV.linux.org.uk, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

just two kconfig commits this time:
- kconfig Makefile fix for make 3.80
- Fix calculating symbols so that KCONFIG_ALLCONFIG=... does not disable
  CONFIG_MODULES silently

Michal

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kconfig

for you to fetch changes up to 6b87b70c5339f30e3c5b32085e69625906513dc2:

  unbreak allmodconfig KCONFIG_ALLCONFIG=... (2016-02-01 15:12:40 +0100)

----------------------------------------------------------------
Al Viro (1):
      unbreak allmodconfig KCONFIG_ALLCONFIG=...

Jan Beulich (1):
      scripts/kconfig: allow building with make 3.80 again

 scripts/kconfig/Makefile   |  4 +++-
 scripts/kconfig/confdata.c | 12 +++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)
