Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60278 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754383AbeFREz4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jun 2018 00:55:56 -0400
From: NeilBrown <neilb@suse.com>
Date: Mon, 18 Jun 2018 14:55:20 +1000
Subject: [RFC PATCH 0/5] kbuild: build modules from code in multiple
 directories.
Message-ID: <152929708853.17463.17302660556961083137.stgit@noble>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

This set of patches makes it possible to build a module from
code in multiple directories without needing to list files from one
directory in the Makefile of another directory.

The code was developed for lustre (which is now out-of-tree :-( ) but
can be useful elsewhere, such as for xfs and btrfs and others.

In fs/xfs/Makefile the section:

xfs-y				+= $(addprefix libxfs/, \
				   xfs_ag.o \
				   xfs_alloc.o \
				.....

could become

xfs-y += libxfs/

and then in fs/xfs/libxfs/Makefile we would have

modobj-$(CONFIG_XFS_FS) += xfs_ag.o \
			   xfs_alloc.o \
			   .....

A similar process could move filenames for scrub/* from the
fs/xfs/Makefile to fs/xfs/scrub/Makefile

Apart from improving modularity, this means that partial makes such
as:

  make fs/xfs/libxfs/

or

  make fs/xfs/scrub/attr.s

can work.

Comments and review most welcome.

Thanks,
NeilBrown

---

NeilBrown (5):
      kbuild: detect directories in components of a module.
      kbuild: treat a directory listed in a composite object as foo/mod.a
      kbuild: support building of per-directory mod.a
      kbuild: disable KBUILD_MODNAME when building for mod.a
      kbuild: Add documentation for modobj-m


 Documentation/kbuild/makefiles.txt |   65 ++++++++++++++++++++++++++++++++++--
 scripts/Makefile.build             |   57 ++++++++++++++++++++++----------
 scripts/Makefile.lib               |   63 ++++++++++++++++++++++-------------
 3 files changed, 141 insertions(+), 44 deletions(-)

--
Signature

