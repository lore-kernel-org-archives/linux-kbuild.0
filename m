Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:57427 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751231AbYEDIMp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 May 2008 04:12:45 -0400
Date: Sun, 4 May 2008 11:11:45 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: kconfig - a suggestion how to fix the select issue
Message-ID: <20080504081145.GG5838@cs181133002.pp.htv.fi>
References: <20080504071041.GA15315@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080504071041.GA15315@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Sun, May 04, 2008 at 09:10:41AM +0200, Sam Ravnborg wrote:
>...
> 
> config A
>         bool "a"
> 
> config B
>         bool "b"
>         depends on A
> 
> config C
>         bool "c"
>         require B
> 
> The require dependency will have impact on visibility.
> C shall only be visible if all symbols it require are
> visible. Note that visible does not imply 'chosen'.
> In this case C would be visible when A is chosen.
> 
> When the user then choose C and B is not chosen 
> then the user is prompted to choose B.
> 
> So user has to chose B in order to have C chosen.
>...
> Comments?


Given:

config A
	tristate "a"

config B
	tristate "b"
	depends on A

config C
	bool "c"
	require B

CONFIG_A=m


Will C be visible?


The underlying problem is that we use bool for two different cases:
- non-modular driver (answer would be "no")
- enable feature in driver (answer would be "depends on the value of D")


> 	Sam

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

