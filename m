Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:33138 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751615AbYBJTYv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Feb 2008 14:24:51 -0500
Date: Sun, 10 Feb 2008 20:24:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kconfig creates strange (invalid?) configuration
Message-ID: <20080210192457.GA13733@uranus.ravnborg.org>
References: <20080210143333.GC2436@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080210143333.GC2436@cs181133002.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org

On Sun, Feb 10, 2008 at 04:33:33PM +0200, Adrian Bunk wrote:
> The attached .config (with current -git) results in a compile 
> error since it contains:
> 
> CONFIG_X86=y
> # CONFIG_EMBEDDED is not set
> CONFIG_SERIO=m
> CONFIG_SERIO_I8042=y
> 
> Looking at drivers/input/serio/Kconfig I simply don't get how this 
> can happen.
select is causing troubles again.
Try:
git grep SERIO | grep select

I did not analyze exactly where it happens but this is a typical
select issue.

	Sam
