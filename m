Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp5.pp.htv.fi ([213.243.153.39]:38853 "EHLO smtp5.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754617AbYAZKpO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Jan 2008 05:45:14 -0500
Date: Sat, 26 Jan 2008 12:45:14 +0200
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: The latest linus tree can't build
Message-ID: <20080126104514.GA18170@does.not.exist>
References: <20080126103845.GF20935@hacking>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080126103845.GF20935@hacking>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: WANG Cong <xiyou.wangcong@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Sat, Jan 26, 2008 at 06:38:45PM +0800, WANG Cong wrote:
> 
> Hi, Sam!
> 
> When I built the latest linus tree, I got this error:
> 
> ...
>   CC      sound/oss/msnd.o
> make[2]: *** No rule to make target `/etc/sound/msndperm.bin', needed by `sound/oss/msndperm.c'.  Stop.
> make[1]: *** [sound/oss] Error 2
> make: *** [sound] Error 2
> 
> My .config is just the one I sent to you in another thread.
>...

It's expected that CONFIG_STANDALONE=n allows configurations that won't 
compile.

> Regards.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

