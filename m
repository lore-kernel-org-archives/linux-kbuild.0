Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41873 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752686AbcIEGhg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Sep 2016 02:37:36 -0400
Date: Mon, 5 Sep 2016 08:37:33 +0200
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] make deb-pkg fix
Message-ID: <20160905063733.GA18263@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: keescook@chromium.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de

Hi Linus,

Please pull this fix from make deb-pkg. The bug got introduced in
v4.8-rc1.

Thanks,
Michal

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git rc-fixes

for you to fetch changes up to d3e2773c4ede5c62d2a92dae20e3a09b1ca55b6e:

  builddeb: Skip gcc-plugins when not configured (2016-08-16 10:16:38 +0200)

----------------------------------------------------------------
Kees Cook (1):
      builddeb: Skip gcc-plugins when not configured

 scripts/package/builddeb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
