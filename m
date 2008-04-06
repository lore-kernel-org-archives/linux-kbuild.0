Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:36247 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751396AbYDFBFK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 5 Apr 2008 21:05:10 -0400
Received: from midway.site ([71.117.215.127]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Sat, 5 Apr 2008 18:05:05 -0700
Date: Sat, 5 Apr 2008 18:05:05 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: "if CONFIG" versus "depends on CONFIG"
Message-Id: <20080405180505.6acb221e.rdunlap@xenotime.net>
In-Reply-To: <alpine.LFD.1.00.0804051956270.17908@localhost.localdomain>
References: <alpine.LFD.1.00.0804051956270.17908@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Sat, 5 Apr 2008 19:59:31 -0400 (EDT) Robert P. J. Day wrote:

> 
>   is there any inherent difference between having a config entry
> contain
> 
>   depends on FUBAR
> 
> as opposed to having that config option wrapped inside
> 
>   if FUBAR
>   ...
>   endif

No difference AFAICT.

> i ask since the Kconfig file drivers/usb/serial/Kconfig wraps almost
> the entire file in
> 
>   if USB_SERIAL
>   ...
>   endif
> 
> and yet still defines the majority of config entries as depending on
> USB_SERIAL, which seems redundant.

Yes, that's redundant.

---
~Randy
