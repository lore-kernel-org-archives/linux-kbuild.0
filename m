Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34104 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754556AbdDLQHC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Apr 2017 12:07:02 -0400
Date: Wed, 12 Apr 2017 18:06:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] scripts: kconfig: implement a sort method
Message-ID: <20170412160658.GA3531@scaer>
References: <20170411111227.20846-1-felipe.balbi@linux.intel.com>
 <7d017fc8-9e0b-f8a8-a877-edcc07c91949@infradead.org>
 <87d1ciawvn.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87d1ciawvn.fsf@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Felipe, All,

On 2017-04-12 10:49 +0300, Felipe Balbi spake thusly:
>=20
> Randy Dunlap <rdunlap@infradead.org> writes:
> > On 04/11/17 04:12, Felipe Balbi wrote:
> >> With a growing amount of Kernel configuration, it's
> >> getting ever more difficult to find anything on
> >> menuconfig. Because of that, implement mergesort for
> >> kconfig to make it a little easier for anybody
> >> building kernels.
> >
> > Search works for me, but I don't mind Sort either.
>=20
> yes, it works. It does a different thing, though. Here's what happens
> when I want to find DWC3:
>=20
> / DWC3 RET
>=20
>   | Symbol: USB_DWC3 [=3Dm]                                              =
        =E2=94=82 =20
>   =E2=94=82 Type  : tristate                                             =
              =E2=94=82 =20
>   =E2=94=82 Prompt: DesignWare USB3 DRD Core Support                     =
              =E2=94=82 =20
>   =E2=94=82   Location:                                                  =
              =E2=94=82 =20
>   =E2=94=82     -> Device Drivers                                        =
              =E2=94=82 =20
>   =E2=94=82 (1)   -> USB support (USB_SUPPORT [=3Dy])                    =
                =E2=94=82 =20
>   =E2=94=82   Defined at drivers/usb/dwc3/Kconfig:1                      =
              =E2=94=82 =20
>   =E2=94=82   Depends on: USB_SUPPORT [=3Dy] && (USB [=3Dy] || USB_GADGET=
 [=3Dy]) && HAS_DMA =E2=94=82 =20
>   =E2=94=82   Selects: USB_XHCI_PLATFORM [=3Dm]                          =
                =E2=94=82 =20
>   =E2=94=82                                                              =
              =E2=94=82 =20
>   =E2=94=82                                                              =
              =E2=94=82 =20
>   =E2=94=82 Symbol: USB_DWC3_DUAL_ROLE [=3Dn]                            =
                =E2=94=82 =20
>   =E2=94=82 Type  : boolean                                              =
              =E2=94=82 =20
>   =E2=94=82 Prompt: Dual Role mode                                       =
              =E2=94=82 =20
>   =E2=94=82   Location:                                                  =
              =E2=94=82 =20
>   =E2=94=82     -> Device Drivers                                        =
              =E2=94=82 =20
>   =E2=94=82       -> USB support (USB_SUPPORT [=3Dy])                    =
                =E2=94=82 =20
>   =E2=94=82         -> DesignWare USB3 DRD Core Support (USB_DWC3 [=3Dm])=
                =E2=94=82 =20
>   =E2=94=82 (2)       -> DWC3 Mode Selection (<choice> [=3Dy])           =
                =E2=94=82 =20
>   =E2=94=82   Defined at drivers/usb/dwc3/Kconfig:41                     =
              =E2=94=82 =20
>   =E2=94=82   Depends on: <choice> && (USB [=3Dy]=3Dy || USB [=3Dy]=3DUSB=
_DWC3 [=3Dm]) && (USB_G =E2=94=82 =20
>   =E2=94=82                                                              =
              =E2=94=82 =20
>   =E2=94=82                                                              =
              =E2=94=82 =20
>   =E2=94=82 Symbol: USB_DWC3_EXYNOS [=3Dn]                               =
                =E2=94=82 =20
>   =E2=94=82 Type  : tristate                                             =
              =E2=94=82 =20
>   =E2=94=82 Prompt: Samsung Exynos Platform                              =
              =E2=94=82 =20
>   =E2=94=82   Location:                                                  =
              =E2=94=82 =20
>   =E2=94=82     -> Device Drivers                                        =
              =E2=94=82 =20
>   =E2=94=82       -> USB support (USB_SUPPORT [=3Dy])                    =
                =E2=94=82 =20
>   =E2=94=82 (3)     -> DesignWare USB3 DRD Core Support (USB_DWC3 [=3Dm])=
                =E2=94=82 =20
>   =E2=94=82   Defined at drivers/usb/dwc3/Kconfig:63                     =
              =E2=94=82 =20
>   =E2=94=82   Depends on: USB_SUPPORT [=3Dy] && USB_DWC3 [=3Dm] && (ARCH_=
EXYNOS || COMPILE =E2=94=82 =20
>   =E2=94=82                                                              =
              =E2=94=82 =20
>   =E2=94=82                                                              =
              =E2=94=82 =20
>   =E2=94=82 Symbol: USB_DWC3_GADGET [=3Dy]                               =
                =E2=94=82 =20
>   =E2=94=82 Type  : boolean                                              =
              =E2=94=82 =20
>   =E2=94=82 Prompt: Gadget only mode                                     =
              =E2=94=82 =20
>   =E2=94=82   Location:                                                  =
              =E2=94=82 =20
>   =E2=94=82     -> Device Drivers                                        =
              =E2=94=82 =20
>   =E2=94=82       -> USB support (USB_SUPPORT [=3Dy])                    =
                =E2=94=82 =20
>   =E2=94=82         -> DesignWare USB3 DRD Core Support (USB_DWC3 [=3Dm])=
                =E2=94=82 =20
>   =E2=94=82 (4)       -> DWC3 Mode Selection (<choice> [=3Dy])           =
                =E2=94=82 =20
>   =E2=94=82   Defined at drivers/usb/dwc3/Kconfig:34                     =
              =E2=94=82 =20
>   =E2=94=82   Depends on: <choice> && (USB_GADGET [=3Dy]=3Dy || USB_GAD
>=20
> Now I know where DWC3 is defined, so I navigate to Device Driver, USB
> Support and search for DesignWare USB3 DRD Core Support:

Or you just press '3' (the number between parenthesis), and that will
take you directly there.

When you then exit, you're back top the search results.

>   =E2=94=82 =E2=94=82    <M>     USB Test and Measurement Class support  =
                    =E2=94=82 =E2=94=82 =20
[--SNIP unsorted menu--]
>   =E2=94=82 =E2=94=82    < >   USB LCD driver support                    =
                    =E2=94=82 =E2=94=82 =20
>=20
> Compare that to the sorted view of this same entry:
>=20
>   =E2=94=82 =E2=94=82    --- USB support                                 =
                    =E2=94=82 =E2=94=82 =20
[--SNIP sorted menu--]
>   =E2=94=82 =E2=94=82    < >     Support WUSB Cable Based Association (CB=
A)                  =E2=94=82 =E2=94=82=20
>=20
> much easier to find, don't you think?

Arguably, the order may also make sense, for example to "group" related
items. So, <Sort> should be a toggle, so that it is possible to go back
to the unsorted, original order, IMHO...

> > Any Help text for Sort?  or is it obvious what it does?  (no)
> wait, it's not obvious what "Sort" means?

I guess that what Randy said was that in this context, it is not more
obvious than Load or Save, and they are documented in the help (but it
is not obvious how to get the help).

For example, go on the "General setup" entry, but do not enter the menu.
Now, select Help: you'll get a bit of help on how to use menuconfig.

There, Load and Save are documented, in Alternate Configuration Files.

> > In an 80x25 terminal (window), the < Sort > option wraps around
> > past column 80.
> not what I see here [1]

I see the same as Randy here:

    $ stty size
    25 80

    https://imgur.com/a/ku0sG

> > I haven't looked at the source code (lately), but I think that it
> > would OK to not have the (extra) spaces inside the <...> brackets.
> > I.e., instead of
> >   =E2=94=82        <Select>    < Exit >    < Help >    < Save >    < Lo=
ad >    < Sort =20
> >    >
> > just have
> >   =E2=94=82        <Select>    <Exit>    <Help>    <Save>    <Load>    =
<Sort>
> >
> > Or the <Select> does not need to be indented as much as it is.
> I changed that for this very reason

Or just always left-align the line, rather than center it?

> > And BTW, Yann made kconfig an orphan today. :(

Yes, I did a very bad job at being the maintainer over the past years,
so I could not really keep it any longer...

Regards,
Yann E. MORIN.

--=20
=2E-----------------.--------------------.------------------.--------------=
------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspira=
cy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___           =
    |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is =
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspirac=
y.  |
'------------------------------^-------^------------------^----------------=
----'
