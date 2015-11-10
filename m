Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56621 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751623AbbKJUyB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Nov 2015 15:54:01 -0500
Date: Tue, 10 Nov 2015 21:53:58 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild misc update for v4.4-rc1
Message-ID: <20151110205358.GA4406@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Julia.Lawall@lip6.fr, a.hajda@samsung.com, ben@decadent.org.uk, d.granat@samsung.com, johan@kernel.org, mpe@ellerman.id.au, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

this is the non-critical part of kbuild:
- several coccinelle updates
- make deb-pkg creates an armhf package if CONFIG_VFP=y
- make tags understands some more powerpc macros

Thanks,
Michal

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to 67afc2110a84872aa6aae44ce6b2ea6534db1438:

  coccinelle: Improve checking for missing NULL terminators (2015-10-26 22:44:51 +0100)

----------------------------------------------------------------
Andrzej Hajda (1):
      Coccinelle: fix incorrect -include option transformation

Ben Hutchings (1):
      deb-pkg: Add automatic support for armhf architecture

Daniel Granat (1):
      coccinelle: Improve checking for missing NULL terminators

Johan Hovold (1):
      coccinelle: misc: remove "complex return code" warnings

Julia Lawall (6):
      coccinelle: misc: move constants to the right
      coccinelle: tests: improve odd_ptr_err.cocci
      scripts/coccinelle: fix typos
      cocinelle: iterators: semantic patch to delete unneeded of_node_put
      coccinelle: ifnullfree: various cleanups
      coccinelle: ifnullfree: handle various destroy functions

Michael Ellerman (1):
      scripts/tags.sh: Teach tags about some powerpc macros

 scripts/coccicheck                                 |   2 +-
 scripts/coccinelle/free/ifnullfree.cocci           |  26 +--
 .../iterators/device_node_continue.cocci           | 100 ++++++++++++
 scripts/coccinelle/misc/compare_const_fl.cocci     | 171 ++++++++++++++++++++
 scripts/coccinelle/misc/of_table.cocci             |  33 +++-
 scripts/coccinelle/misc/simple_return.cocci        | 180 ---------------------
 scripts/coccinelle/null/deref_null.cocci           |   4 +-
 scripts/coccinelle/tests/odd_ptr_err.cocci         | 120 ++++++++++----
 scripts/package/builddeb                           |  11 +-
 scripts/tags.sh                                    |   2 +
 10 files changed, 415 insertions(+), 234 deletions(-)
 create mode 100644 scripts/coccinelle/iterators/device_node_continue.cocci
 create mode 100644 scripts/coccinelle/misc/compare_const_fl.cocci
 delete mode 100644 scripts/coccinelle/misc/simple_return.cocci
