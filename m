Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55777 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751351AbbKJUfW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Nov 2015 15:35:22 -0500
Date: Tue, 10 Nov 2015 21:35:21 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild patch for v4.4-rc1
Message-ID: <20151110203521.GA3614@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: long.wanglong@huawei.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

the kbuild branch for v4.4-rc1 only has one commit: A new make kselftest-clean
target cleans tools/testing/selftests.

Michal

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to dcb825a9fd865638f82c557fe42ce8eed35f751d:

  kselftest: add kselftest-clean rule (2015-10-08 14:20:38 +0200)

----------------------------------------------------------------
Wang Long (1):
      kselftest: add kselftest-clean rule

 Makefile | 4 ++++
 1 file changed, 4 insertions(+)
