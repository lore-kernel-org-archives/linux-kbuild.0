Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:65145 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111AbaBKAnQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Feb 2014 19:43:16 -0500
Date: Tue, 11 Feb 2014 01:43:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/2] usb/host/Kconfig: ohci- / ehci-platform make sure
 PHY_GENERIC is available
Message-ID: <20140211004308.GI5239@free.fr>
References: <1392041327-12596-2-git-send-email-hdegoede@redhat.com>
 <Pine.LNX.4.44L0.1402101059210.1593-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1402101059210.1593-100000@iolanthe.rowland.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

Alam, All,

On 2014-02-10 11:04 -0500, Alan Stern spake thusly:
> On Mon, 10 Feb 2014, Hans de Goede wrote:
> 
> > Disallow ohci- / ehci-platform being built-in, when the phy core is build as
> > a module.
> > 
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/usb/host/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > index e28cbe0..1dd73e3 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -255,7 +255,7 @@ config USB_EHCI_ATH79
> >  
> >  config USB_EHCI_HCD_PLATFORM
> >  	tristate "Generic EHCI driver for a platform device"
> > -	depends on !PPC_OF
> > +	depends on !PPC_OF && (GENERIC_PHY || !GENERIC_PHY)
> >  	default n
> >  	---help---
> >  	  Adds an EHCI host driver for a generic platform device, which
> > @@ -512,6 +512,7 @@ config USB_CNS3XXX_OHCI
> >  
> >  config USB_OHCI_HCD_PLATFORM
> >  	tristate "Generic OHCI driver for a platform device"
> > +	depends on GENERIC_PHY || !GENERIC_PHY
> >  	default n
> >  	---help---
> >  	  Adds an OHCI host driver for a generic platform device, which
> 
> I would very much like to know of a more straightforward way to do 
> this.  Yann, can you suggest anything?

Unfortunately, I don't have a better solution at hand... :-/

IIRC, this issue (or a similar issue) was discussed here on
linux-kbuild, but no better alternative was found at the time either.

At least, this construct should be documented, I think, since it is not
so obvious.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
