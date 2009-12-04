Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:53643 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757092AbZLDTDp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2009 14:03:45 -0500
Subject: Re: 2.6.32: scripts/kconfig/streamline_config.pl :Malfunction
From: Steven Rostedt <rostedt@goodmis.org>
Reply-To: rostedt@goodmis.org
In-Reply-To: <4B1958FA.1050104@gmx.de>
References: <4B1958FA.1050104@gmx.de>
Content-Type: text/plain
Date: Fri, 04 Dec 2009 14:03:49 -0500
Message-Id: <1259953429.12870.179.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Patrick Ringl <patrick.ringl@gmx.de>
Cc: linux-kbuild@vger.kernel.org, stripconfig@goodmis.org, zippel@linux-m68k.org

On Fri, 2009-12-04 at 19:46 +0100, Patrick Ringl wrote:
> Hi,
> 
> I have encountered the following malfunction of the recently added
> streamline_config script. When running the following occurs:
> 
> ack:~/linux-2.6.32# scripts/kconfig/streamline_config.pl >config_strip

Note, I usually use "make localmodconfig", I know you know that, but in
case anyone else is using this as a reference.


> using config: '.config'
> Use of uninitialized value $ksource in concatenation (.) or string at
> scripts/kconfig/streamline_config.pl line 117.
> dock config not found!!
> module pata_sis did not have configs CONFIG_PATA_SIS
> 
> As a result: it couldnt map one currently loaded module properly and the
> other module had been properly mapped, but somehow the
> dependency/integrity check triggered it, since it wasnt enabled properly.
> 
> I checked the output of the script and yea as I assumed CONFIG_ACPI_DOCK
> is not set.
> 
> 'dock'  refers to:
> 
> ack:~/linux-2.6.32# modinfo dock
> filename:       /lib/modules/2.6.26-2-amd64/kernel/drivers/acpi/dock.ko
> 
> and the belonging Kconfig file says:
> 
> config ACPI_DOCK
>         bool "Dock"
>         depends on EXPERIMENTAL
>         help
>           This driver supports ACPI-controlled docking stations and
> removable
>           drive bays such as the IBM Ultrabay and the Dell Module Bay.
> 
> The same with 'pata_sis' (CONFIG_PATA_SIS is also not set) ..
> 
> ack:~/linux-2.6.32# modinfo pata_sis
> filename:       /lib/modules/2.6.26-2-amd64/kernel/drivers/ata/pata_sis.ko
> 
> and the belonging Kconfig file:
> 
> config SATA_SIS
>         tristate "SiS 964/965/966/180 SATA support"
>         depends on PCI
>         select PATA_SIS
>         help
>           This option enables support for SiS Serial ATA on
>           SiS 964/965/966/180 and Parallel ATA on SiS 180.
>           The PATA support for SiS 180 requires additionally to
>           enable the PATA_SIS driver in the config.
>           If unsure, say N.
> 
> In the end (if one ignored the two missing modules) a make
> silentoldconfig didnt even work.

How did it fail?

> 
> What I did to reproduce this was using the standard kernel config of
> debian lenny's amd64 branch.

I don't know where to find that config, could you email it to me, or
post a url of it. Also send me your lsmod as well.

> 
> 
> PS: I wrote such software myself, but I am going a totally different
> approach. Your idea is not that bad actually (I am enabling kernel
> config options and I am tracking all dependencies properly, while you
> can just ignore them, since your script only disables stuff).

Yeah, I toyed with doing the dependency game, but that got quite complex
and fragile. I found the safest thing is to just turn off modules that
you don't want. 99% of the time, that's good enough.

-- Steve



