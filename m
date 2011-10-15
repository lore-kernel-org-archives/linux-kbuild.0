Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:40828 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750818Ab1JOFjk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 15 Oct 2011 01:39:40 -0400
Received: by wyg36 with SMTP id 36so699691wyg.19
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Oct 2011 22:39:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E98B845.8050009@xenotime.net>
References: <4E98B845.8050009@xenotime.net>
Date: Sat, 15 Oct 2011 01:39:38 -0400
Message-ID: <CACqU3MXzypsug0kJ5kc1orFcp29Bmqm=C7_6pq6s3C6K=cKXLg@mail.gmail.com>
Subject: Re: strange build failure when kconfig symbol is bool but not when tristate
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Michal Marek <mmarek@suse.cz>, linux kbuild list <linux-kbuild@vger.kernel.org>

Hi,

On Fri, Oct 14, 2011 at 6:31 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> (my turn)
>
> I have seen this randconfig build error 2-3 times in the past 3 months:
> (this one is from linux-next of 20111014.)
>
> net/built-in.o: In function `unregister_8022_client':
> (.text+0x26157): undefined reference to `llc_sap_close'
> net/built-in.o: In function `register_8022_client':
> (.text+0x261b6): undefined reference to `llc_sap_open'
> net/built-in.o: In function `p8022_request':
> p8022.c:(.text+0x261e5): undefined reference to `llc_build_and_send_ui_pkt'
> net/built-in.o: In function `snap_request':
> psnap.c:(.text+0x26487): undefined reference to `llc_build_and_send_ui_pkt'
> net/built-in.o: In function `snap_init':
> psnap.c:(.init.text+0xb22): undefined reference to `llc_sap_open'
> net/built-in.o: In function `snap_exit':
> psnap.c:(.exit.text+0x16): undefined reference to `llc_sap_close'
>
> I finally found that if I change drivers/net/tokenring/Kconfig
> symbol TR from bool to tristate, the build completes successfully,
> but I don't understand why this is happening.
>
There was something like this not too long ago, does this:

https://github.com/lacombar/linux-2.6/tree/master/kconfig/expr-woes

helps ?

Thanks,
 - Arnaud

>
> ---
>  drivers/net/tokenring/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- next-2011-1014.orig/drivers/net/tokenring/Kconfig
> +++ next-2011-1014/drivers/net/tokenring/Kconfig
> @@ -4,7 +4,7 @@
>
>  # So far, we only have PCI, ISA, and MCA token ring devices
>  menuconfig TR
> -       bool "Token Ring driver support"
> +       tristate "Token Ring driver support"
>        depends on NETDEVICES && !UML
>        depends on (PCI || ISA || MCA || CCW || PCMCIA)
>        select LLC
>
>> make oldconfig
>
>> diff -u .config.old .config
> --- .config.old 2011-10-14 15:17:45.000000000 -0700
> +++ .config     2011-10-14 15:24:45.000000000 -0700
> @@ -876,7 +876,7 @@
>  # CONFIG_MDIO_BITBANG is not set
>  # CONFIG_PPP is not set
>  # CONFIG_SLIP is not set
> -CONFIG_TR=y
> +CONFIG_TR=m
>  CONFIG_PCMCIA_IBMTR=m
>
>
> voila.  build works cleanly.
>
> ideas?
>
> thanks,
> --
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
