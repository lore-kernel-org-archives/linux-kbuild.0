Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:38304 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751157Ab0BRGe0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Feb 2010 01:34:26 -0500
From: "Gadiyar, Anand" <gadiyar@ti.com>
Date: Thu, 18 Feb 2010 12:04:12 +0530
Subject: RE: Compile error with gregkh-07-usb-2.6.33-rc7.patch
Message-ID: <5A47E75E594F054BAF48C5E4FC4B92AB03215B103B@dbde02.ent.ti.com>
References: <Pine.LNX.4.44L0.1002121026420.1499-100000@iolanthe.rowland.org>
 <4B7BFE0D.4000509@suse.cz> <20100218041629.GA11556@suse.de>
In-Reply-To: <20100218041629.GA11556@suse.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@suse.de>, Michal Marek <mmarek@suse.cz>
Cc: Alan Stern <stern@rowland.harvard.edu>, jidong xiao <jidong.xiao@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Vegard Nossum <vegard.nossum@gmail.com>

<snip>

> > In the meantime, you can change
> > the logic from "select USB_SUSPEND" to "depends on USB_SUSPEND". This
> > will force one to first set USB_SUSPEND manually, but will avoid the
> > build error.
> 
> A patch to do this would probably be best so we don't run 
> into it again.
> 

Thanks for the explanations. Patch coming up in a bit, as soon
as I finish testing with a few configs.

- Anand
