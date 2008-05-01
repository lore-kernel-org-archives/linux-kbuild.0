Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp5.pp.htv.fi ([213.243.153.39]:54187 "EHLO smtp5.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755827AbYEAWIg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 18:08:36 -0400
Date: Fri, 2 May 2008 01:07:47 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not
	digestible by gas
Message-ID: <20080501220747.GV29330@cs181133002.pp.htv.fi>
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net> <20080501120616.GY29330@cs181133002.pp.htv.fi> <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net> <20080501163453.GF29330@cs181133002.pp.htv.fi> <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net> <20080501165333.GG29330@cs181133002.pp.htv.fi> <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net> <20080501191714.GM29330@cs181133002.pp.htv.fi> <20080501213952.GA8281@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080501213952.GA8281@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: sampo@symlabs.com, linux-kbuild@vger.kernel.org

On Thu, May 01, 2008 at 11:39:52PM +0200, Sam Ravnborg wrote:
> 
> Do we know why it picked up the busy box version?
> Because from the commandline it was the correct sed - and I do not
> know that make should do different.

Good point.

No, and we might actually have two issues:
- what happened with the PATH (Sampo, is it really PATH or do you use an 
                               alias?)
- we must somehow handle non-GNU sed's (either change the code or error)

> 	Sam

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

