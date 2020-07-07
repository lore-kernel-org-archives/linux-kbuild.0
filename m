Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42452 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728164AbgGGQnk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 12:43:40 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 067GhC59026304
        for <linux-kbuild@vger.kernel.org>; Wed, 8 Jul 2020 01:43:13 +0900
Received: by mail-vs1-f42.google.com with SMTP id x13so18147252vsx.13
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jul 2020 09:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <87lfjvbfkw.fsf@miraculix.mork.no>
In-Reply-To: <87lfjvbfkw.fsf@miraculix.mork.no>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 8 Jul 2020 01:42:35 +0900
Message-ID: <CAK7LNAS=1M0NXeQUMnD63O=fAKTptnSRwjE_o6_jVKUv3_7q5Q@mail.gmail.com>
Subject: Re: Kbuild support for rebuilding a single driver gone?
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Jul 7, 2020 at 11:01 PM Bj=C3=B8rn Mork <bjorn@mork.no> wrote:
>
> [ previously posted to kernelnewbies ]
>
> I have "always" tested simple patches by rebuilding just the affected
> driver on whatever kernel I happen to run.  Like this:
>
> bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/4.19.0-9-a=
md64/build M=3D$(pwd)/drivers/net/usb clean
> make: Entering directory '/usr/src/linux-headers-4.19.0-9-amd64'
>   CLEAN   /usr/local/src/git/linux/drivers/net/usb/Module.symvers
> make: Leaving directory '/usr/src/linux-headers-4.19.0-9-amd64'
> bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/4.19.0-9-a=
md64/build M=3D$(pwd)/drivers/net/usb qmi_wwan.ko
> make: Entering directory '/usr/src/linux-headers-4.19.0-9-amd64'
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.o
>   MODPOST 1 modules
>   CC      /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.mod.o
>   LD [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.ko
> make: Leaving directory '/usr/src/linux-headers-4.19.0-9-amd64'
>
>
> But this is broken for some reason with recent Debian (bullseye/sid)
> kernels, based on 5.6 or 5.7 kernels.  They will always compile all
> source files in the directory, even of most of them are not necessary
> for the requested target:
>
>
> bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/5.7.0-1-am=
d64/build M=3D$(pwd)/drivers/net/usb clean
> make: Entering directory '/usr/src/linux-headers-5.7.0-1-amd64'
>   CLEAN   /usr/local/src/git/linux/drivers/net/usb/Module.symvers
> make: Leaving directory '/usr/src/linux-headers-5.7.0-1-amd64'
> bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/5.7.0-1-am=
d64/build M=3D$(pwd)/drivers/net/usb qmi_wwan.ko
> make: Entering directory '/usr/src/linux-headers-5.7.0-1-amd64'
>   AR      /usr/local/src/git/linux/drivers/net/usb/built-in.a
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/catc.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/kaweth.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/pegasus.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/rtl8150.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/r8152.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/hso.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/lan78xx.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/asix_devices.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/asix_common.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/ax88172a.o
>   LD [M]  /usr/local/src/git/linux/drivers/net/usb/asix.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/ax88179_178a.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_ether.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_eem.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/dm9601.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/sr9700.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/sr9800.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/smsc75xx.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/smsc95xx.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/gl620a.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/net1080.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/plusb.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/rndis_host.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_subset.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/zaurus.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/mcs7830.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/usbnet.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/int51x1.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc-phonet.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/kalmia.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/ipheth.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/sierra_net.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/cx82310_eth.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_ncm.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/huawei_cdc_ncm.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/lg-vl600.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_mbim.o
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/ch9200.o
>   MODPOST 1 modules
>   CC [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.mod.o
>   LD [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.ko
> make: Leaving directory '/usr/src/linux-headers-5.7.0-1-amd64'
>
>
>
>
> Why is this? Am I doing something wrong here?

Thanks for the report.

You are not doing anything wrong.

This is a regression of f566e1fbadb6

Please check this:
https://patchwork.kernel.org/patch/11649263/


It will be included in the next pull request,
and eventually back-ported to stable kernels.

Meanwhile, if M=3D build is not important,
you can compile-test a particular module
with in-tree build:


$ make drivers/net/usb/qmi_wwan.ko



--=20
Best Regards
Masahiro Yamada
