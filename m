Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp5.pp.htv.fi ([213.243.153.39]:39778 "EHLO smtp5.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752200AbYBJTew (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Feb 2008 14:34:52 -0500
Date: Sun, 10 Feb 2008 21:34:47 +0200
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: kconfig creates strange (invalid?) configuration
Message-ID: <20080210193447.GG2436@cs181133002.pp.htv.fi>
References: <20080210143333.GC2436@cs181133002.pp.htv.fi> <20080210192457.GA13733@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080210192457.GA13733@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org

On Sun, Feb 10, 2008 at 08:24:57PM +0100, Sam Ravnborg wrote:
> On Sun, Feb 10, 2008 at 04:33:33PM +0200, Adrian Bunk wrote:
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
> select is causing troubles again.
> Try:
> git grep SERIO | grep select
> 
> I did not analyze exactly where it happens but this is a typical
> select issue.

No, I think the problem is related to the fact that CONFIG_SERIO is
only m and not y, which is a problem in the direction opposite to what 
select does.

> 	Sam

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

