Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46367 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753300Ab1DRNGT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2011 09:06:19 -0400
Date: Mon, 18 Apr 2011 15:06:17 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v2] initramfs: Use KBUILD_BUILD_TIMESTAMP for generated
 entries
Message-ID: <20110418130617.GF9715@sepie.suse.cz>
References: <gen-initramfs-timestamp@mdm.bga.com>
 <1302534382-20077-1-git-send-email-mmarek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1302534382-20077-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: miltonm@bga.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 11, 2011 at 05:06:22PM +0200, Michal Marek wrote:
> gen_init_cpio gets the current time and uses it for each symlink,
> special file, and directory.  Grab the current time once and make it
> possible to override it with the KBUILD_BUILD_TIMESTAMP variable for
> reproducible builds.
> 
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  Documentation/kbuild/kbuild.txt |    3 +-
>  scripts/gen_initramfs_list.sh   |    9 ++++++-
>  usr/gen_init_cpio.c             |   53 +++++++++++++++++++++++++++++---------
>  3 files changed, 50 insertions(+), 15 deletions(-)

Pushed to kbuild-2.6.git#kbuild.

Michal

