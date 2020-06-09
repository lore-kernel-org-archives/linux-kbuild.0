Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:46502 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgFIIoA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 04:44:00 -0400
MIME-Version: 1.0
References: <20200511042149.1712876-1-masahiroy@kernel.org>
 <20200608020256.GA256950@roeck-us.net> <20200609062012.GA499862@kroah.com> <CAK8P3a2Pn22c8Z=w0FD15w4_+7LCWOpcbJ9b-Skh5iXzBjEx1g@mail.gmail.com>
In-Reply-To: <CAK8P3a2Pn22c8Z=w0FD15w4_+7LCWOpcbJ9b-Skh5iXzBjEx1g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 9 Jun 2020 17:42:59 +0900
Message-ID: <CAK7LNARM8UoE_L8EzhqQquu5FQwrUZLwrtjTFW_Va5ygBwhRmg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make module name conflict fatal error
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Michal Marek <michal.lkml@markovi.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 9, 2020 at 4:52 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
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


I am OK with this.
Thank you.


-- 
Best Regards
Masahiro Yamada
