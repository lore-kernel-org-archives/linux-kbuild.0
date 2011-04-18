Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46332 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751587Ab1DRNFC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2011 09:05:02 -0400
Date: Mon, 18 Apr 2011 15:05:00 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 02/34] kbuild: Call gzip with -n
Message-ID: <20110418130500.GB9715@sepie.suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
 <1302015561-21047-3-git-send-email-mmarek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1302015561-21047-3-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On Tue, Apr 05, 2011 at 04:58:49PM +0200, Michal Marek wrote:
> The timestamps recorded in the .gz files add no value.
> 
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  scripts/Makefile.lib          |    2 +-
>  scripts/gen_initramfs_list.sh |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Pushed to kbuild-2.6.git#kbuild.

Michal
