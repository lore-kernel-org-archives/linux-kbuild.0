Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp5.pp.htv.fi ([213.243.153.39]:33005 "EHLO smtp5.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752180AbYF0NNP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Jun 2008 09:13:15 -0400
Date: Fri, 27 Jun 2008 16:11:01 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: a.out.h userspace headers not present with O=
Message-ID: <20080627131101.GE18644@cs181140183.pp.htv.fi>
References: <20080627130236.GD18644@cs181140183.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080627130236.GD18644@cs181140183.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 27, 2008 at 04:02:36PM +0300, Adrian Bunk wrote:
> Commit e53d6a152793a38aa334d6f7a4850642ae45cedc
> (Export <linux/a.out.h> to userspace again.)
> does not work properly when using O= :
> 
> <--  snip  -->
> 
> linux-2.6.26-rc8$ make O=../out headers_install
> ...
> linux-2.6.26-rc8$ find usr -name a.out.h

Wrong test...

That should have been:

linux-2.6.26-rc8$ find ../out -name a.out.h
linux-2.6.26-rc8$ 

> linux-2.6.26-rc8$ 
> 
> <--  snip  -->

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

