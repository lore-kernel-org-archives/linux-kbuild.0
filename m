Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.191]:11165 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758080AbYEVSKe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 May 2008 14:10:34 -0400
Received: by nf-out-0910.google.com with SMTP id d3so85144nfc.21
        for <linux-kbuild@vger.kernel.org>; Thu, 22 May 2008 11:10:32 -0700 (PDT)
Date: Thu, 22 May 2008 23:06:24 +0400
From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: Additional kconfig targets (cloneconfig, nonint_oldconfig etc)
Message-ID: <20080522190624.GA12322@martell.zuzino.mipt.ru>
References: <20080429183531.GB19652@uranus.ravnborg.org> <20080502190949.GA30270@uranus.ravnborg.org> <20080521164703.61c7d715@ephemeral> <20080521211139.GA22591@codemonkey.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080521211139.GA22591@codemonkey.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dave Jones <davej@codemonkey.org.uk>, Andres Salomon <dilinger@queued.net>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Roland McGrath <roland@redhat.com>, Roman Zippel <zippel@linux-m68k.org>

On Wed, May 21, 2008 at 05:11:39PM -0400, Dave Jones wrote:
> On Wed, May 21, 2008 at 04:47:03PM -0400, Andres Salomon wrote:
> 
>  > > 3) Implement newsymbolsconfig (any better name?)
>  > >    Shall list all new symbols and shall not write
>  > >    any config
>  > 
>  > I'm not sure I see the point of #3.
> 
> It's something we've had in Fedora kernels forever, because
> when rebasing to a new upstream version the process becomes
> 
> make newsymbolsconfig
> take list of symbols, and make decisions on them
> make oldconfig
> 
> 
> without it, the process would be..
> 
> make oldconfig
> note new symbol, make decision
> make oldconfig
> note a 2nd new symbol, make decision
> make oldconfig
> note a 3rd new symbol..
> make oldconfig..
> you get the idea.

It's actually

	make oldconfig
	[note new symbol, make decision]
	[note new symbol, make decision]
	[note new symbol, make decision]
	make

so the number of decisions and invocations are the same.

> The way we have it isn't perfect, (adding a new symbol may unhide
> another set of new symbols), but it reduces the number of iterations
> needed dramatically.

