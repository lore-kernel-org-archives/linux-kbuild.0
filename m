Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37488 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751197AbcDYW5Z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 18:57:25 -0400
Date: Tue, 26 Apr 2016 08:57:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: kbuild fix branch for linux-next
Message-ID: <20160426085722.35a6a826@canb.auug.org.au>
In-Reply-To: <alpine.LFD.2.20.1604251203100.5091@knanqh.ubzr>
References: <alpine.LFD.2.20.1604251203100.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Nicolas,

On Mon, 25 Apr 2016 12:20:56 -0400 (EDT) Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
>
> Could you please add the following branch to the linux-next tree:
> 
> 	git://git.linaro.org/people/nicolas.pitre/linux kbuild
> 
> It includes 3 patches on top of Michal's kbuild branch already in your 
> tree. Those patches fix issues that have been reported by 3 people 
> already, and I'd like those fixes to appear in linux-next until Michal 
> picks them up, which should happen in, well, some "undefined" amount of 
> time.  ;-)

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au
