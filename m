Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbgFIH6w (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 03:58:52 -0400
Date: Tue, 9 Jun 2020 09:58:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: make module name conflict fatal error
Message-ID: <20200609075848.GA509002@kroah.com>
References: <20200511042149.1712876-1-masahiroy@kernel.org>
 <20200608020256.GA256950@roeck-us.net>
 <20200609062012.GA499862@kroah.com>
 <CAK8P3a2Pn22c8Z=w0FD15w4_+7LCWOpcbJ9b-Skh5iXzBjEx1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2Pn22c8Z=w0FD15w4_+7LCWOpcbJ9b-Skh5iXzBjEx1g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Michal Marek <michal.lkml@markovi.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 09, 2020 at 09:51:46AM +0200, Arnd Bergmann wrote:
> On Tue, Jun 9, 2020 at 8:20 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Jun 07, 2020 at 07:02:56PM -0700, Guenter Roeck wrote:
> > > Hi,
> > >
> > > On Mon, May 11, 2020 at 01:21:49PM +0900, Masahiro Yamada wrote:
> > > > I think all the warnings have been fixed by now. Make it a fatal error.
> > > >
> > >
> > > Not entirely. With this patch in the tree, I get:
> > >
> > > Building sparc64:allmodconfig ... failed
> > > --------------
> > > Error log:
> > > error: the following would cause module name conflict:
> > >   drivers/char/adi.ko
> > >   drivers/input/joystick/adi.ko
> > > make[1]: *** [modules_check] Error 1
> > > make[1]: *** Waiting for unfinished jobs....
> > > make: *** [__sub-make] Error 2
> > >
> > > Reverting this patch fixes the problem.
> >
> > As it doesn't look like either of these drivers can be "auto-loaded"
> > based on hardware detection, I don't know what to suggest as for
> > renaming either of them.
> >
> > Any ideas?
> 
> I see zero chance of a kernel actually needing to provide both drivers,
> given that the hardware is 20 years apart and gameports are almost
> exclusive to x86 PCs. How about an ugly hack:
> 
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index 940b744639c7..6f73f02059b5 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -45,6 +45,7 @@ config JOYSTICK_A3D
>  config JOYSTICK_ADI
>         tristate "Logitech ADI digital joysticks and gamepads"
>         select GAMEPORT
> +       depends on ADI!=m # avoid module name conflict
>         help
>           Say Y here if you have a Logitech controller using the ADI
>           protocol over the PC gameport.
> 
>       Arnd

Looks sane to me, thanks!

greg k-h
