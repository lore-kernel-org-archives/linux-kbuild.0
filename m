Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:39568 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753645AbYBKUTe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 15:19:34 -0500
Date: Mon, 11 Feb 2008 22:19:25 +0200
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: kconfig creates strange (invalid?) configuration
Message-ID: <20080211201925.GC2959@cs181133002.pp.htv.fi>
References: <20080210143333.GC2436@cs181133002.pp.htv.fi> <Pine.LNX.4.64.0802112048070.3378@scrub.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0802112048070.3378@scrub.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Mon, Feb 11, 2008 at 09:13:47PM +0100, Roman Zippel wrote:
> Hi,
> 
> On Sun, 10 Feb 2008, Adrian Bunk wrote:
> 
> > The attached .config (with current -git) results in a compile 
> > error since it contains:
> > 
> > CONFIG_X86=y
> > # CONFIG_EMBEDDED is not set
> > CONFIG_SERIO=m
> > CONFIG_SERIO_I8042=y
> > 
> > Looking at drivers/input/serio/Kconfig I simply don't get how this 
> > can happen.
> 
> You've hit the rather subtle rules of select vs default. What happened is 
> that SERIO is selected to m, but SERIO_I8042 isn't selected so the default 
> of y is used instead.
> We already had the problem in the past that select and default don't work 
> well together, so this patch cleans this up and makes the rule hopefully 
> more straightforward. Basically now the value is calculated like this:
> 
> 	(value && dependency) || select
> 
> where the value is the user choice (if available and the symbol is 
> visible) or default.
> 
> In this case it means SERIO and SERIO_I8042 are both set to y due to their 
> default and if SERIO didn't had the default, then the SERIO_I8042 value 
> would be limited to m due to the dependency.
> 
> I tested this patch with more 10000 random configs and above case is the 
> only the difference that showed up, so I hope there is nothing that 
> depended on the old more complex and subtle rules.

Thanks, I confirm that your patch fixes my problem.

> bye, Roman
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

