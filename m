Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35767 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753165AbbIWPuO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2015 11:50:14 -0400
Date: Wed, 23 Sep 2015 17:50:12 +0200
From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: [PATCH] kbuild: document recursive dependency limitation /
 resolution
Message-ID: <20150923155012.GD18173@wotan.suse.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <55B938EA.2080402@infradead.org>
 <55C0A8A1.2030706@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55C0A8A1.2030706@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, Randy Dunlap <rdunlap@infradead.org>, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, pebolle@tiscali.nl, herbert@gondor.apana.org.au, tiwai@suse.de, yann.morin.1998@free.fr, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc

On Tue, Aug 04, 2015 at 01:57:21PM +0200, Michal Marek wrote:
> Dne 29.7.2015 v 22:34 Randy Dunlap napsal(a):
> > On 07/29/15 13:09, Luis R. Rodriguez wrote:
> >> From: "Luis R. Rodriguez" <mcgrof@suse.com>
> >>
> >> Recursive dependency issues with kconfig are unavoidable due to
> >> some limitations with kconfig, since these issues are recurring
> >> provide a hint to the user how they can resolve these dependency
> >> issues and also document why such limitation exists.
> 
> Good idea.

Great I've expanded a bit on the future required work to feed the curious
so that we don't idle lingering what to do next but rather get folks engaged
and so that they can know where to dive in.

> 
> >> +Kconfig's limitations can be addressed by implementing a SAT solver for it,
> >> +but until then, Kconfig is limitted to require developers to use one of
> > 
> >                               limited
> 
> should I apply the patch with the typo fixed or are you going to send a v2?

I'll respin a v3 now.

  Luis
