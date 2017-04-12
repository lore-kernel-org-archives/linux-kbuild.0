Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:51958 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751212AbdDLHt6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Apr 2017 03:49:58 -0400
From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] scripts: kconfig: implement a sort method
In-Reply-To: <7d017fc8-9e0b-f8a8-a877-edcc07c91949@infradead.org>
References: <20170411111227.20846-1-felipe.balbi@linux.intel.com> <7d017fc8-9e0b-f8a8-a877-edcc07c91949@infradead.org>
Date: Wed, 12 Apr 2017 10:49:32 +0300
Message-ID: <87d1ciawvn.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Randy Dunlap <rdunlap@infradead.org> writes:
> On 04/11/17 04:12, Felipe Balbi wrote:
>> With a growing amount of Kernel configuration, it's
>> getting ever more difficult to find anything on
>> menuconfig. Because of that, implement mergesort for
>> kconfig to make it a little easier for anybody
>> building kernels.
>
> Search works for me, but I don't mind Sort either.

yes, it works. It does a different thing, though. Here's what happens
when I want to find DWC3:

/ DWC3 RET

  | Symbol: USB_DWC3 [=3Dm]                                                =
      =E2=94=82=20=20
  =E2=94=82 Type  : tristate                                               =
            =E2=94=82=20=20
  =E2=94=82 Prompt: DesignWare USB3 DRD Core Support                       =
            =E2=94=82=20=20
  =E2=94=82   Location:                                                    =
            =E2=94=82=20=20
  =E2=94=82     -> Device Drivers                                          =
            =E2=94=82=20=20
  =E2=94=82 (1)   -> USB support (USB_SUPPORT [=3Dy])                      =
              =E2=94=82=20=20
  =E2=94=82   Defined at drivers/usb/dwc3/Kconfig:1                        =
            =E2=94=82=20=20
  =E2=94=82   Depends on: USB_SUPPORT [=3Dy] && (USB [=3Dy] || USB_GADGET [=
=3Dy]) && HAS_DMA =E2=94=82=20=20
  =E2=94=82   Selects: USB_XHCI_PLATFORM [=3Dm]                            =
              =E2=94=82=20=20
  =E2=94=82                                                                =
            =E2=94=82=20=20
  =E2=94=82                                                                =
            =E2=94=82=20=20
  =E2=94=82 Symbol: USB_DWC3_DUAL_ROLE [=3Dn]                              =
              =E2=94=82=20=20
  =E2=94=82 Type  : boolean                                                =
            =E2=94=82=20=20
  =E2=94=82 Prompt: Dual Role mode                                         =
            =E2=94=82=20=20
  =E2=94=82   Location:                                                    =
            =E2=94=82=20=20
  =E2=94=82     -> Device Drivers                                          =
            =E2=94=82=20=20
  =E2=94=82       -> USB support (USB_SUPPORT [=3Dy])                      =
              =E2=94=82=20=20
  =E2=94=82         -> DesignWare USB3 DRD Core Support (USB_DWC3 [=3Dm])  =
              =E2=94=82=20=20
  =E2=94=82 (2)       -> DWC3 Mode Selection (<choice> [=3Dy])             =
              =E2=94=82=20=20
  =E2=94=82   Defined at drivers/usb/dwc3/Kconfig:41                       =
            =E2=94=82=20=20
  =E2=94=82   Depends on: <choice> && (USB [=3Dy]=3Dy || USB [=3Dy]=3DUSB_D=
WC3 [=3Dm]) && (USB_G =E2=94=82=20=20
  =E2=94=82                                                                =
            =E2=94=82=20=20
  =E2=94=82                                                                =
            =E2=94=82=20=20
  =E2=94=82 Symbol: USB_DWC3_EXYNOS [=3Dn]                                 =
              =E2=94=82=20=20
  =E2=94=82 Type  : tristate                                               =
            =E2=94=82=20=20
  =E2=94=82 Prompt: Samsung Exynos Platform                                =
            =E2=94=82=20=20
  =E2=94=82   Location:                                                    =
            =E2=94=82=20=20
  =E2=94=82     -> Device Drivers                                          =
            =E2=94=82=20=20
  =E2=94=82       -> USB support (USB_SUPPORT [=3Dy])                      =
              =E2=94=82=20=20
  =E2=94=82 (3)     -> DesignWare USB3 DRD Core Support (USB_DWC3 [=3Dm])  =
              =E2=94=82=20=20
  =E2=94=82   Defined at drivers/usb/dwc3/Kconfig:63                       =
            =E2=94=82=20=20
  =E2=94=82   Depends on: USB_SUPPORT [=3Dy] && USB_DWC3 [=3Dm] && (ARCH_EX=
YNOS || COMPILE =E2=94=82=20=20
  =E2=94=82                                                                =
            =E2=94=82=20=20
  =E2=94=82                                                                =
            =E2=94=82=20=20
  =E2=94=82 Symbol: USB_DWC3_GADGET [=3Dy]                                 =
              =E2=94=82=20=20
  =E2=94=82 Type  : boolean                                                =
            =E2=94=82=20=20
  =E2=94=82 Prompt: Gadget only mode                                       =
            =E2=94=82=20=20
  =E2=94=82   Location:                                                    =
            =E2=94=82=20=20
  =E2=94=82     -> Device Drivers                                          =
            =E2=94=82=20=20
  =E2=94=82       -> USB support (USB_SUPPORT [=3Dy])                      =
              =E2=94=82=20=20
  =E2=94=82         -> DesignWare USB3 DRD Core Support (USB_DWC3 [=3Dm])  =
              =E2=94=82=20=20
  =E2=94=82 (4)       -> DWC3 Mode Selection (<choice> [=3Dy])             =
              =E2=94=82=20=20
  =E2=94=82   Defined at drivers/usb/dwc3/Kconfig:34                       =
            =E2=94=82=20=20
  =E2=94=82   Depends on: <choice> && (USB_GADGET [=3Dy]=3Dy || USB_GAD

Now I know where DWC3 is defined, so I navigate to Device Driver, USB
Support and search for DesignWare USB3 DRD Core Support:

  =E2=94=82 =E2=94=82    <M>     USB Test and Measurement Class support    =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82            *** NOTE: USB_STORAGE depends on SCSI but =
BLK_DEV_SD may ***=E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82            *** also be needed; see USB_STORAGE Help f=
or more info ***  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>     USB Mass Storage support                  =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    [ ]       USB Mass Storage verbose debug          =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       Realtek Card Reader support             =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    [*]         Realtek Card Reader autosuspend suppor=
t                 =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       Datafab Compact Flash Reader support    =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       Freecom USB/ATAPI Bridge support        =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       ISD-200 USB/ATA Bridge support          =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       USBAT/USBAT02-based storage support     =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       SanDisk SDDR-09 (and other SmartMedia, i=
ncluding DPCM) sup=E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       SanDisk SDDR-55 SmartMedia support      =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       Lexar Jumpshot Compact Flash Reader     =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       Olympus MAUSB-10/Fuji DPC-R1 support    =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       Support OneTouch Button on Maxtor Hard D=
rives             =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       Support for Rio Karma music player      =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       SAT emulation on Cypress USB/ATA Bridge =
with ATACB        =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       USB ENE card reader support             =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>       USB Attached SCSI                       =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82            *** USB Imaging devices ***               =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     USB Mustek MDC800 Digital Camera support  =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     Microtek X6USB scanner support            =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     USB/IP support                            =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   Inventra Highspeed Dual Role Controller (TI,=
 ADI, AW, ...)    =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   DesignWare USB3 DRD Core Support            =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   DesignWare USB2 DRD Core Support            =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   ChipIdea Highspeed Dual Role Controller     =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   NXP ISP 1760/1761 support                   =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82          *** USB port drivers ***                    =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <M>   USB Serial Converter support  --->          =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82          *** USB Miscellaneous drivers ***           =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   EMI 6|2m USB Audio interface support        =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   EMI 2|6 USB Audio interface support         =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   ADU devices from Ontrak Control Systems     =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   USB 7-Segment LED Display                   =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   USB Diamond Rio500 support                  =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   USB Lego Infrared Tower support             =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   USB LCD driver support                      =
                  =E2=94=82 =E2=94=82=20=20

Compare that to the sorted view of this same entry:

  =E2=94=82 =E2=94=82    --- USB support                                   =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   ADU devices from Ontrak Control Systems     =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   Apple Cinema Display support                =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   ChaosKey random number generator driver supp=
ort               =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   ChipIdea Highspeed Dual Role Controller     =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   Cypress CY7C63xxx USB driver support        =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   Cypress USB thermometer driver support      =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   DesignWare USB2 DRD Core Support            =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   DesignWare USB3 DRD Core Support            =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   EMI 2|6 USB Audio interface support         =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   EMI 6|2m USB Audio interface support        =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   Elan PCMCIA CardBus Adapter USB Client      =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    {M}   Functions for loading firmware on EZUSB chip=
s                 =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   IO Warrior driver support                   =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   Inventra Highspeed Dual Role Controller (TI,=
 ADI, AW, ...)    =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   NXP ISP 1760/1761 support                   =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   PlayStation 2 Trance Vibrator driver support=
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >   Siemens ID USB Mouse Fingerprint sensor supp=
ort               =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    <*>   Support for Host-side USB                   =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     BCMA usb host driver                      =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     Cypress C67x00 HCD support                =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    [*]     Dynamic USB minor allocation              =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     EHCI HCD (USB 2.0) support                =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    [*]     Enable USB persist by default             =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     FOTG210 HCD support                       =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    [ ]     HCD test mode support                     =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     ISP116X HCD support                       =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     ISP1362 HCD support                       =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     Microtek X6USB scanner support            =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82            *** Miscellaneous USB options ***         =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82            *** NOTE: USB_STORAGE depends on SCSI but =
BLK_DEV_SD may ***=E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     OHCI HCD (USB 1.1) support                =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    [ ]     OTG support                               =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     OXU210HP HCD support                      =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     R8A66597 HCD support                      =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    [ ]     Rely on OTG and EH Targeted Peripherals Li=
st                =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     SL811HS HCD support                       =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     SSB usb host driver                       =
                  =E2=94=82 =E2=94=82=20=20
  =E2=94=82 =E2=94=82    < >     Support WUSB Cable Based Association (CBA)=
                  =E2=94=82 =E2=94=82=20

much easier to find, don't you think?

> Why only menuconfig?  Is it the one that you use mostly?

shouldn't be difficult to port to nconfig.

> Any Help text for Sort?  or is it obvious what it does?  (no)

wait, it's not obvious what "Sort" means?

> In an 80x25 terminal (window), the < Sort > option wraps around
> past column 80.

not what I see here [1]

> I haven't looked at the source code (lately), but I think that it
> would OK to not have the (extra) spaces inside the <...> brackets.
> I.e., instead of
>   =E2=94=82        <Select>    < Exit >    < Help >    < Save >    < Load=
 >    < Sort=20=20
>    >
> just have
>   =E2=94=82        <Select>    <Exit>    <Help>    <Save>    <Load>    <S=
ort>
>
> Or the <Select> does not need to be indented as much as it is.

I changed that for this very reason

> And BTW, Yann made kconfig an orphan today. :(

oh well

[1] https://imgur.com/a/qyvG6

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAljt3AwACgkQzL64meEa
mQaqKQ//apX4rAxhxu8oHDMZv8T9pUnHMIVVB9pOps3Tbzxq3pH0cRJeXEgsSN5J
NMmjP+AZQ7XtcCk3thH14RPNE3ROvD98AMh8XHkHs3q91ss9xlGndQPCXs4HkASX
T7XsbHirZE+4+rxjbrhmxBAdgh7pTJIt68gVSn0Xz59RMtr9qcJVoCHg9+Pz/njB
iuh74tcW3RpjRnUtJkgBrsae2oq5+ckmhCNAkXkobrBWgToRYswR0rYdeNU3bx/C
UMNX1hlTrFAj9Kzno+UxCnsmJjIj5+sTyLogOnxSnl3n+ckYyemtt24XGvhSke8C
ZUX5ZdgjMGAOOm5NfusZt+/ba3R08+rFGhNQVi8wKx4YkUyzeeBZIR2ZJZQPPKul
8XPGv1GPPXQLl0KGJHHgzdI2VBxssjETxWwTzBje/NbZtt3rx9xXNSACJLbFZQNf
psq4ioN2hZtvQ2ax+V76fHqpoeJLN6rFKE4hKObtwnpZ9h/Pw0c8ULN/R5yPJSYY
HySPh6lj3FjyUaWsZaQLshgLjc9ye+15dNxS4dgqePcDRVPEciG4flchjXoXZc1j
D6keorC+g7FNtKxAFnn4nHUzZW3UP3cBZ5njicRQwHduyiMzhqbnuI7fy57lgzxM
uy9Ev6e3TBPLcShVx1XFbTlmGEIW4rmKMZ7JuDo2KwYkHe0R48k=
=E6kk
-----END PGP SIGNATURE-----
--=-=-=--
