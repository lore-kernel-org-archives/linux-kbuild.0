Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prg-ext-pat.suse.com ([213.151.95.130]:58272 "EHLO linux.suse"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S941060AbdAGHwM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Jan 2017 02:52:12 -0500
Date: Sat, 7 Jan 2017 08:52:10 +0100
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild fix for v4.10-rc3
Message-ID: <20170107075210.GA15987@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

The asm-prototypes.h file added in the last merge window results in
invalid code with CONFIG_KMEMCHECK=y. The net result is that genksyms
segfaults. This pull request fixes the header, the genksyms fix is in my
kbuild branch for 4.11.

Thanks,
Michal


The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git rc-fixes

for you to fetch changes up to c7858bf16c0b2cc62f475f31e6df28c3a68da1d6:

  asm-prototypes: Clear any CPP defines before declaring the functions (2017-01-05 12:57:42 +0100)

----------------------------------------------------------------
Michal Marek (1):
      asm-prototypes: Clear any CPP defines before declaring the functions

 include/asm-generic/asm-prototypes.h | 6 ++++++
 1 file changed, 6 insertions(+)
