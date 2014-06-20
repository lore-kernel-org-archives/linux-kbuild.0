Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57382 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756469AbaFTUwU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Jun 2014 16:52:20 -0400
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 6E8DC213AE
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Jun 2014 16:52:18 -0400 (EDT)
Date: Fri, 20 Jun 2014 13:56:19 -0700
From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Makefile: version.h macros KERNEL_EXTRAVERSION,
 LINUX_EXTRAVERSION_CODE
Message-ID: <20140620205619.GB17904@kroah.com>
References: <1403189058-24103-1-git-send-email-kamal@canonical.com>
 <53A4016E.9040108@suse.cz>
 <1403279278.14743.64.camel@fourier>
 <53A49ABB.8070704@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53A49ABB.8070704@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Kamal Mostafa <kamal@canonical.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Luis Henriques <luis.henriques@canonical.com>

On Fri, Jun 20, 2014 at 10:34:03PM +0200, Michal Marek wrote:
> Dne 20.6.2014 17:47, Kamal Mostafa napsal(a):
> > On Fri, 2014-06-20 at 11:39 +0200, Michal Marek wrote:
> >> Why don't you guys simply increment the third digit in the extended
> >> stable tree and get support for KERNEL_VERSION() for free? You always
> >> start after the respective stable branch has reached EOL, don't you?
> > 
> > Yes, we only start after the stable branch has reached EOL.
> > 
> > We don't increment the third integer for the extended-stable branches
> > (we add a fourth integer instead) in order to avoid the possibility of a
> > collision if Greg KH were to ever release a "special" post-EOL version
> > of one of his branches.
> 
> The maintainers of 2.6.32.y, 3.2.y and 3.12.y have taken that risk and
> it has been working fine so far ;-).

Those maintainers are doing so on the kernel.org infrastructure, with my
help and encouragement, unlike these Canonical "stable" trees, so their
risk was a lot less :)

thanks,

greg k-h
