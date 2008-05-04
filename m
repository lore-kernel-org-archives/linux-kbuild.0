Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:40226 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750820AbYEDMLP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 May 2008 08:11:15 -0400
Date: Sun, 4 May 2008 15:10:14 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [2.6 patch] kconfig-language.txt: remove bogus hint
Message-ID: <20080504121014.GJ5838@cs181133002.pp.htv.fi>
References: <20080503231535.GY5838@cs181133002.pp.htv.fi> <20080504061741.GA14784@uranus.ravnborg.org> <20080504080137.GF5838@cs181133002.pp.htv.fi> <20080504112741.GA18379@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080504112741.GA18379@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-kbuild@vger.kernel.org

On Sun, May 04, 2008 at 01:27:41PM +0200, Sam Ravnborg wrote:
> On Sun, May 04, 2008 at 11:01:37AM +0300, Adrian Bunk wrote:
> > On Sun, May 04, 2008 at 08:17:41AM +0200, Sam Ravnborg wrote:
> > > On Sun, May 04, 2008 at 02:15:35AM +0300, Adrian Bunk wrote:
> > > > This kconfig construct described here is required in a different and 
> > > > much more complicated situation.
> > > Please elaborate...
> > 
> > In the hint C is described as a tristate.
> > 
> > But you need this idiom only when A is a tristate and C is a bool.
> Thats another case.
> What is described is following simple situation:
> 
> config FOO
>         bool "Modules"
>         option modules
> 
> config A
>         tristate "a"
> 
> config B
>         tristate "b"
>         depends on A
> 
> config C
>         tristate "c"
>         depends on B
>         depends on A = y || A = B
> 
> 
> C uses a symbol defined by A - let us name it foo().
> If C is build-in and A is a module => 
> 	link error - unable to resolve foo.
> 
> So we say: 
> if A is buildin C may be built-in or module.
> if A is a module C may not be built-in.
> 
> This is what this hint describes.

In your example C does not need any dependency on A at all since it 
is already handled through the dependency chain C->B->A.

> I would certainly love to see some of the other typical cases 
> described too.
> 
> We need a description that covers the LED case. And I think
> you would be the best to come up with a description considering
> the time you have spent investigating it.
> Could you try to come up with either a suggested wording
> or a patch?

Roman is the one who actually fixed it:
  http://lkml.org/lkml/2008/4/30/615

I'm not sure whether we have often the opportunity to solve something 
this way.

> Thanks,
> 	Sam

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

