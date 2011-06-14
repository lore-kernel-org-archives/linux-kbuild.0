Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:53740 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030Ab1FNRsj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 13:48:39 -0400
MIME-Version: 1.0
In-Reply-To: <20110614172859.GS2353@legolas.emea.dhcp.ti.com>
References: <20110614164513.GP2353@legolas.emea.dhcp.ti.com>
	<Pine.LNX.4.44L0.1106141301000.2102-100000@iolanthe.rowland.org>
	<20110614172859.GS2353@legolas.emea.dhcp.ti.com>
Date: Tue, 14 Jun 2011 13:48:39 -0400
Message-ID: <BANLkTimRUyt-7gJc--Ja4XuAS5H0UBdNUg@mail.gmail.com>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: balbi@ti.com
Cc: Alan Stern <stern@rowland.harvard.edu>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi,

On Tue, Jun 14, 2011 at 1:29 PM, Felipe Balbi <balbi@ti.com> wrote:
> [...]
> In summary:
>
> We don't want to have library code into their own drivers because,
I am not sure to parse that correctly, could you elaborate ?

> well, you can only have one gadget driver at a time anyway. And we don't
> want separate compilation due to having stuff out of init sections.
>
on that last point, are you implying that section mapping is not kept
across the different linking steps ?

 - Arnaud

ps: about the code size issue, looking at f_acm.c, f_obex.c and
f_serial.c also highlight code duplication...

> --
> balbi
>
