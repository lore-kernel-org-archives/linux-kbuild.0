Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:52158 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S937413AbYEUVqq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 May 2008 17:46:46 -0400
Date: Wed, 21 May 2008 23:47:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Additional kconfig targets (cloneconfig, nonint_oldconfig etc)
Message-ID: <20080521214723.GB15136@uranus.ravnborg.org>
References: <20080429183531.GB19652@uranus.ravnborg.org> <20080502190949.GA30270@uranus.ravnborg.org> <20080521164703.61c7d715@ephemeral>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080521164703.61c7d715@ephemeral>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andres Salomon <dilinger@queued.net>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dave Jones <davej@codemonkey.org.uk>, Roland McGrath <roland@redhat.com>, Roman Zippel <zippel@linux-m68k.org>

On Wed, May 21, 2008 at 04:47:03PM -0400, Andres Salomon wrote:
> On Fri, 2 May 2008 21:09:49 +0200
> Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > With the attached patch you can do:
> > 
> > make K=my_favourite_config defconfig
> > 
> > kconfig will read all config values form 'my_favourite_config'
> > and set all other symbols to their default value.
> > The output is now dense like this:
> > # configuration is based on 'my_favourite_config'
> > #
> > # configuration written to .config
> > #
> > 
> 
> 
> Is this slated for 2.6.27?

Been busy and got sidetracked after my first version proved broken.
Will try to look at it in the weekend.

	Sam
