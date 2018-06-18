Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:39390 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935671AbeFRIUU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jun 2018 04:20:20 -0400
Date: Mon, 18 Jun 2018 01:20:17 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC PATCH 0/5] kbuild: build modules from code in multiple
 directories.
Message-ID: <20180618082017.GA4752@infradead.org>
References: <152929708853.17463.17302660556961083137.stgit@noble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152929708853.17463.17302660556961083137.stgit@noble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: NeilBrown <neilb@suse.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Mon, Jun 18, 2018 at 02:55:20PM +1000, NeilBrown wrote:
> This set of patches makes it possible to build a module from
> code in multiple directories without needing to list files from one
> directory in the Makefile of another directory.
> 
> The code was developed for lustre (which is now out-of-tree :-( ) but
> can be useful elsewhere, such as for xfs and btrfs and others.
> 
> In fs/xfs/Makefile the section:
> 
> xfs-y				+= $(addprefix libxfs/, \
> 				   xfs_ag.o \
> 				   xfs_alloc.o \
> 				.....
> 
> could become
> 
> xfs-y += libxfs/
> 
> and then in fs/xfs/libxfs/Makefile we would have
> 
> modobj-$(CONFIG_XFS_FS) += xfs_ag.o \
> 			   xfs_alloc.o \
> 			   .....
> 
> A similar process could move filenames for scrub/* from the
> fs/xfs/Makefile to fs/xfs/scrub/Makefile

How about you actually convert it as an example?
