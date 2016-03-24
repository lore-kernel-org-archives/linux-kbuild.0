Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40006 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750886AbcCXU5D (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Mar 2016 16:57:03 -0400
Date: Thu, 24 Mar 2016 21:57:00 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild misc changes for v4.6-rc1
Message-ID: <20160324205700.GA11753@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Julia.Lawall@lip6.fr, jkosina@suse.cz, naveen.n.rao@linux.vnet.ibm.com, pabeni@redhat.com, vaishali.thakkar@oracle.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull the non-critical part of kbuild for v4.6-rc1:
- coccinelle cleanup and a new patch
- make tags rule for kprobe helpers
- make rpm fix to avoid spurious grub2 entries
- make rpm support for %postun script (Fedora only at the moment)

Michal

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to 6ef41e22a320d95a246d45b673aa7247cc1bbf7b:

  kbuild/mkspec: clean boot loader configuration on rpm removal (2016-03-04 22:59:09 +0100)

----------------------------------------------------------------
Jiri Kosina (1):
      kbuild/mkspec: fix grub2 installkernel issue

Julia Lawall (5):
      scripts/coccinelle: modernize &
      Coccinelle: reduce rule applicability
      Coccinelle: array_size: reduce rule applicability
      Coccinelle: pm_runtime: reduce rule applicability
      coccinelle: bugon: reduce rule applicability

Naveen N. Rao (1):
      scripts/tags.sh: add regex to map kprobe helpers

Paolo Abeni (1):
      kbuild/mkspec: clean boot loader configuration on rpm removal

Vaishali Thakkar (1):
      Coccinelle: Add api/setup_timer.cocci

 scripts/coccinelle/api/pm_runtime.cocci           |   2 +-
 scripts/coccinelle/api/setup_timer.cocci          | 199 ++++++++++++++++++++++
 scripts/coccinelle/iterators/use_after_iter.cocci |   2 +-
 scripts/coccinelle/misc/array_size.cocci          |   2 +-
 scripts/coccinelle/misc/badty.cocci               |   2 +-
 scripts/coccinelle/misc/bugon.cocci               |   2 +-
 scripts/package/mkspec                            |  13 +-
 scripts/tags.sh                                   |   2 +
 8 files changed, 215 insertions(+), 9 deletions(-)
 create mode 100644 scripts/coccinelle/api/setup_timer.cocci
