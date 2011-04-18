Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:45391 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752987Ab1DRWVM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2011 18:21:12 -0400
Date: Tue, 19 Apr 2011 00:21:11 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 30/34] rio: Drop __DATE__ usage
Message-ID: <20110418222111.GG29882@sepie.suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
 <1302015561-21047-31-git-send-email-mmarek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1302015561-21047-31-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

On Tue, Apr 05, 2011 at 04:59:17PM +0200, Michal Marek wrote:
> The kernel already prints its build timestamp during boot, no need to
> repeat it in random drivers and produce different object files each
> time. As the buildDate field is part of the userspace API, I replaced it
> with the date of the last code change.
> 
> Cc: Greg Kroah-Hartman <gregkh@suse.de>
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  drivers/char/rio/rioinit.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Applied to kbuild-2.6.git#trivial.

Michal
