Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:52855 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751752Ab1AGPCX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 Jan 2011 10:02:23 -0500
Date: Fri, 7 Jan 2011 16:02:21 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] nconf: handle comment entries within choice/endchoice
Message-ID: <20110107150221.GD1841@sepie.suse.cz>
References: <1294328565-2750-1-git-send-email-jacmet@sunsite.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1294328565-2750-1-git-send-email-jacmet@sunsite.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: nir.tzachar@gmail.com, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Thu, Jan 06, 2011 at 04:42:45PM +0100, Peter Korsgaard wrote:
> Equivalent to af6c1598 (kconfig: handle comment entries within
> choice/endchoice), but for nconfig instead.
> 
> Implement support for comment entries within choice groups. Comment entries
> are displayed visually distinct from normal configs, and selecting them is
> a no-op.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  scripts/kconfig/nconf.c |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)

OK, applied, but is this actually used somewhere?

Michal
