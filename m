Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:30882 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756924Ab3D2QPy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 12:15:54 -0400
Message-ID: <1367252152.30667.19.camel@gandalf.local.home>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 12:15:52 -0400
In-Reply-To: <alpine.DEB.2.02.1304291121180.26536@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
	    <20130427153833.GC3355@free.fr>
	    <alpine.DEB.2.02.1304271325240.12586@oneiric>
	    <20130427174226.GA25088@free.fr>
	    <alpine.DEB.2.02.1304271412250.27554@oneiric>
	    <20130428202854.GC4571@free.fr>
	 <alpine.DEB.2.02.1304290645150.16211@oneiric>
	   <1367244700.28120.6.camel@fedora>
	   <alpine.DEB.2.02.1304291022320.9234@oneiric>
	  <1367246499.30667.9.camel@gandalf.local.home>
	  <alpine.DEB.2.02.1304291056410.13584@oneiric>
	 <1367248388.30667.13.camel@gandalf.local.home>
	 <alpine.DEB.2.02.1304291121180.26536@oneiric>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 11:37 -0400, Robert P. J. Day wrote:

>   again, looks good, so:
> 
> $ make localmodconfig
> using config: '.config'
> vboxnetadp config not found!!
> vboxnetflt config not found!!
> vboxdrv config not found!!
> vboxpci config not found!!
> ... snip, nothing related to atheros stuff ...
> $
> 
>   but now this doesn't look good:
> 
> $ grep CONFIG_ATH .config
> # CONFIG_ATH_CARDS is not set
> $
> 
> i don't think *that* should have happened.  on, and one last data
> point.
> 
>   if i start fresh with "make defconfig", and go through the same
> steps, "make localmodconfig" will *still* throw away the ATH-related
> stuff, that you can verify for yourself. so it would seem to be
> something in the structure of the Kconfig files for atheros stuff.
> 

Found the bug.

In drivers/net/wireless/ath/Kconfig:

---
if ATH_CARDS

config ATH_DEBUG
        bool "Atheros wireless debugging"
        ---help---
          Say Y, if you want to debug atheros wireless drivers.
          Right now only ath9k makes use of this.

source "drivers/net/wireless/ath/ath5k/Kconfig"
source "drivers/net/wireless/ath/ath9k/Kconfig"
source "drivers/net/wireless/ath/carl9170/Kconfig"
source "drivers/net/wireless/ath/ath6kl/Kconfig"
source "drivers/net/wireless/ath/ar5523/Kconfig"
source "drivers/net/wireless/ath/wil6210/Kconfig"

endif
---

The bug is in the way localmodconfig handles source files. As I wrote
the code to only have one file descriptor open at a time, I just stored
all the "source" files in an array as I parsed the current source file.
At the end, I ran the same code to parse the source files that were
found.

Unfortunately, I didn't take into account that the "if" statement would
surround including source files. Thus, the dependency work did not
detect that the "if ATH_CARDS" was required for the included files.

I don't know of another way to fix this besides just opening the files
as they are found. I might as well do that, and remove the "delayed"
logic. I'll just have to have multiple file descriptors opened in this
case. Shouldn't be too big of a deal.

Thanks,

-- Steve


