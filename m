Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:58246 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752220AbcDRPRa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2016 11:17:30 -0400
Date: Mon, 18 Apr 2016 16:17:26 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] tools: Use builtin $(abspath ...) instead of $(shell cd
 ... && pwd)
In-Reply-To: <20160418150535.GA22979@ulmo.ba.sec>
Message-ID: <alpine.LFD.2.20.1604181609540.28036@eddie.linux-mips.org>
References: <1460106959-6684-1-git-send-email-thierry.reding@gmail.com> <5714F35D.5050603@suse.com> <20160418150535.GA22979@ulmo.ba.sec>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 18 Apr 2016, Thierry Reding wrote:

> > > Avoid forking off a shell to resolve the absolute path of the output
> > > directory when make's builtin $(abspath ...) function will do an
> > > adequate job.
> > 
> > The abspath function is not available in make 3.80.
> 
> Do we really support make 3.80? It was released in 2002 and 3.81
> followed in April 2006. That makes it a decade old now. I'd be surprised
> if anyone was still using it to build recent kernels.
> 
> Is there a formal process for increasing the dependencies listed in
> Documentation/Changes? Should I simply make that change as part of this
> patch? Do we need broad approval?

 Hmm, what problem are you trying to solve here?  Your proposal looks to 
me like a gratuitous requirement for users to upgrade their tool (its age 
doesn't matter), which is often a burden and in any case requires extra 
time which could be used for something else.  Don't fix what ain't broke!

  Maciej
