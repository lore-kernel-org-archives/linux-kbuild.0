Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38189 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752892Ab1DRWUq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2011 18:20:46 -0400
Date: Tue, 19 Apr 2011 00:20:45 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 23/34] scsi/wd33c93: Drop __TIME__ usage
Message-ID: <20110418222045.GF29882@sepie.suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
 <1302015561-21047-24-git-send-email-mmarek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1302015561-21047-24-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org

On Tue, Apr 05, 2011 at 04:59:10PM +0200, Michal Marek wrote:
> The kernel already prints its build timestamp during boot, no need to
> repeat it in random drivers and produce different object files each
> time.
> 
> Cc: "James E.J. Bottomley" <James.Bottomley@suse.de>
> Cc: linux-scsi@vger.kernel.org
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  drivers/scsi/wd33c93.c |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)

Applied to kbuild-2.6.git#trivial.

Michal

