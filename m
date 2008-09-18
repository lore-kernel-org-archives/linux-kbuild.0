Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:54398 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755848AbYIRGpP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Sep 2008 02:45:15 -0400
Date: Thu, 18 Sep 2008 09:44:48 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [PATCH] deb-pkg: Generate a debian/copyright
Message-ID: <20080918064448.GA20238@cs181140183.pp.htv.fi>
References: <1221682195-26809-1-git-send-email-max@stro.at> <1221682195-26809-2-git-send-email-max@stro.at> <1221682195-26809-3-git-send-email-max@stro.at> <1221682195-26809-4-git-send-email-max@stro.at> <1221682195-26809-5-git-send-email-max@stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1221682195-26809-5-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, dilinger@debian.org

On Wed, Sep 17, 2008 at 10:09:53PM +0200, maximilian attems wrote:
>...
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
>...
> +Copyright: 1991 - 2008 Linus Torvalds and others.
> +
> +see git history
> +git://git.eu.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
>...

I'm wondering why you are not using git.kernel.org.

Also note that if you are interested in all copyright holders then the 
git history does not contain the older information.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

