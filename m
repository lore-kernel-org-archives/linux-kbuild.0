Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:56135 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750985AbdJTFrS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Oct 2017 01:47:18 -0400
Date: Fri, 20 Oct 2017 07:47:10 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: getconf options
Message-ID: <20171020054710.vfkkfnl3hjqqmlsb@pengutronix.de>
References: <dbf8b816-e1f7-f835-dd32-6b517e87cbc4@foxmail.com>
 <1a4f82d9999041c6a3c5ce9f37805e7f@SOC-EX01V.e01.socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a4f82d9999041c6a3c5ce9f37805e7f@SOC-EX01V.e01.socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: puck.chen@foxmail.com, ben@decadent.org.uk, linux-kbuild@vger.kernel.org

Hello,

On Fri, Oct 20, 2017 at 04:14:44AM +0000, yamada.masahiro@socionext.com wrote:
> > With commit d7f14c66c273b00aaa626f419d3155773a88d460, I got the follow
> > warning on macos.
> > 
> > getconf: no such configuration parameter `LFS_CFLAGS'
> > getconf: no such configuration parameter `LFS_LDFLAGS'
> > getconf: no such configuration parameter `LFS_LIBS'
> > scripts/kconfig/mconf  Kconfig
> > 
> > $ getconf LFS_CFLAGS
> > getconf: no such configuration parameter `LFS_CFLAGS'
> > 
> > 
> > Do you have some idea about this? Are these paremeters default to getconf?
> > 
> > -Feng
> > 
> 
> 
> Do you have a clue?
> 
> 
> Does it make sense to suppress warnings like this?
> 
> HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
> HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
> HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
> 
> 
> Or, hard-code
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> as Ben originally suggested?

I'm not a fan of hardcoding these. On 64 bit arch (and I think also a
few 32 bit archs (x32?)) they are not needed and so IMHO shouldn't be
added.

I think 2>/dev/null is fine.

Having said that, I wonder if/how LFS works on MacOS.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
