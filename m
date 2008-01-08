Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:36935 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751754AbYAHTlt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Jan 2008 14:41:49 -0500
Date: Tue, 8 Jan 2008 20:41:51 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] ignore cache modifiers for generating the tag files
Message-ID: <20080108194151.GA26661@uranus.ravnborg.org>
References: <1199801429-19325-1-git-send-email-Uwe.Kleine-Koenig@digi.com> <1199801784-19490-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1199801784-19490-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, Jan 08, 2008 at 03:16:24PM +0100, Uwe Kleine-König wrote:
> With this patch I'm able to find the definition of _xmit_lock defined in
> include/linux/netdevice.h as follows:
> 
> 	struct net_device {
> 		...
> 		spinlock_t _xmit_lock ____cacheline_aligned_in_smp;
> 	}
> 
> Otherwise this counts as definition of ____cacheline_aligned_in_smp.
> 
> Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Makefile |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> Hello,
> 
> I sent out an old version of this patch by mistake, please ignore the first
> post and use this one instead.

Thanks, applied.
And yes - I look after most of the changes to the top-level Makefile.

	Sam
