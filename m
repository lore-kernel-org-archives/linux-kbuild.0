Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:46060 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464Ab3LKXel (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Dec 2013 18:34:41 -0500
Message-Id: <cover.1386804405.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Subject: [PATCH 0/3] Fix debugging info for .S files
Date: Wed, 11 Dec 2013 23:34:40 +0000
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Hi Michal,

Here are a few small patches to fixup debug info gereration for .S files.  I
tested the generated vmlinux with the ARM Fast Model debugger and ARM64 target.

Please apply.

-Geoff

The following changes since commit 374b105797c3d4f29c685f3be535c35f5689b30e:

  Linux 3.13-rc3 (2013-12-06 09:34:04 -0800)

are available in the git repository at:

  git://git.linaro.org/people/geoff.levand/linux-kexec.git for-kbuild

for you to fetch changes up to e9d530c5b8b1c9a8510d9c8db8663aedc393de8f:

  mn10300: Remove redundent debugging info flag (2013-12-11 15:15:00 -0800)

----------------------------------------------------------------
Geoff Levand (3):
      kbuild: Fix debugging info generation for .S files
      frv: Remove redundent debugging info flag
      mn10300: Remove redundent debugging info flag

 Makefile              | 2 +-
 arch/frv/Makefile     | 1 -
 arch/mn10300/Makefile | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

-- 
1.8.1.2

