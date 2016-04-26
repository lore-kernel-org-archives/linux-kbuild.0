Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52663 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751363AbcDZPTk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 11:19:40 -0400
Date: Wed, 27 Apr 2016 01:19:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: kbuild fix branch for linux-next
Message-ID: <20160427011937.13a339e9@canb.auug.org.au>
In-Reply-To: <alpine.LFD.2.20.1604261047530.5091@knanqh.ubzr>
References: <alpine.LFD.2.20.1604251203100.5091@knanqh.ubzr>
	<20160426085722.35a6a826@canb.auug.org.au>
	<alpine.LFD.2.20.1604261047530.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Nicolas,

On Tue, 26 Apr 2016 10:50:04 -0400 (EDT) Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
>
> On Tue, 26 Apr 2016, Stephen Rothwell wrote:
> 
> > On Mon, 25 Apr 2016 12:20:56 -0400 (EDT) Nicolas Pitre <nicolas.pitre@linaro.org> wrote:  
> > >
> > > Could you please add the following branch to the linux-next tree:
> > > 
> > > 	git://git.linaro.org/people/nicolas.pitre/linux kbuild
> > > 
> > > It includes 3 patches on top of Michal's kbuild branch already in your 
> > > tree. Those patches fix issues that have been reported by 3 people 
> > > already, and I'd like those fixes to appear in linux-next until Michal 
> > > picks them up, which should happen in, well, some "undefined" amount of 
> > > time.  ;-)  
> > 
> > Thanks for adding your subsystem tree as a participant of linux-next.  
> 
> You may drop this branch now.  Michal was quick to pick the most 
> important fixes in his branch (thanks Michal).

Thanks, will do.

-- 
Cheers,
Stephen Rothwell
