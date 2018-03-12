Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46667 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932326AbeCLPr7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Mar 2018 11:47:59 -0400
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com [209.85.213.44]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w2CFlnku018469
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Mar 2018 00:47:50 +0900
Received: by mail-vk0-f44.google.com with SMTP id s1so6507291vke.5
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Mar 2018 08:47:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com>
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Mar 2018 00:47:08 +0900
Message-ID: <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related problems
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Lindroth <thomas.lindroth@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicolas Pitre <nicolas.pitre@linaro.org>

+CC Nicolas Pitre


2018-03-05 22:07 GMT+09:00 Thomas Lindroth <thomas.lindroth@gmail.com>:
> I upgraded to 4.14.23 from an earlier kernel series a while ago and turne=
d on some new options. Soon after I noticed one of my virtual machines didn=
't work right. It's a kvm based VM using vfio for assigning a pci device to=
 the VM. The guest OS could no longer initialize that pci device. After a l=
ot of trial and error I narrowed down the problem to TRIM_UNUSED_KSYMS, whi=
ch I enabled in the upgrade.
>
> If and only if TRIM_UNUSED_KSYMS is enabled the guest gets the error "cod=
e 43" which is a generic error code meaning failure to initialize driver in=
 windows based OS. I don't notice any other problems besides that.
>
> As I understand it TRIM_UNUSED_KSYMS will build the kernel and modules, t=
hen check which symbols are used by the modules and remove all unused EXPOR=
T_SYMBOL_* from the kernel and rebuild it again. When I build the kernel I =
get a line like "KSYMS   symbols: before=3D1872, after=3D1871, changed=3D17=
" followed by rebuild of a few files. One of the rebuilt files is always dr=
ivers/pci/access.c which looks suspicions based on the error I get.
>
> EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
> EXPORT_SYMBOL_GPL(pci_user_write_config_##size);
> drivers/pci/access.c got these two exports. They stand out because they a=
re macros instead of functions. The only place they are used in the kernel =
is vfio. All other uses are for accessing pci config space from userspace. =
I don't think anything in my userspace tries to access pci config space so =
that could explain why I only see a problem with the vfio based VM. I don't=
 know why TRIM_UNUSED_KSYMS cause problems with vfio but I suspect those ma=
cros are related.
>
> When testing various config options I would change an option, run make cl=
ean followed by make. Turns out make clean doesn't clean include/generated/=
autoksyms.h. That's why the KSYMS line reported before=3D1872 instead of be=
fore=3D0. I guessed the kernel build might be confused about which files ne=
eded rebuilding so I tried to use a clean build path instead. That did not =
help to resolve the VM problem but it did result in build failures.
>
> The build failure is intermittent and only happens about once every 10 bu=
ilds.
> Here is the full "make V=3D1 j1" output from a failed build:
> https://gist.githubusercontent.com/anonymous/3ee68c7936248c6f0772bcac8c5b=
6257/raw/b62df75c5329ec8f3bf556da1145bdf69d5d69f8/gistfile1.txt
> Here is the same output from a build that succeeds:
> https://gist.githubusercontent.com/anonymous/85331c68f448781ba64bbaafcd5c=
b47f/raw/55a86eff8a5e42fe93c26ce1df2aa7c96d1ae803/gistfile1.txt
> Here is the .config I used:
> https://gist.githubusercontent.com/anonymous/0d5eceb5ae65ffc5e853fb2664bb=
3acb/raw/8ca8f1a35468b5aac5b6485a12e71362e8d83ff3/gistfile1.txt
>
> Sorry for using gist links but the output is probably too big for the mai=
ling list and regular pastebins.
>
> The build failure always looks something like this but the undefined symb=
ols varies:
>   Building modules, stage 2.
>   MODPOST 146 modules
> ERROR: "__put_user_2" [net/ipv4/netfilter/ip_tables.ko] undefined!
> ERROR: "__put_user_2" [net/ipv4/netfilter/arp_tables.ko] undefined!
> ERROR: "__put_user_8" [fs/udf/udf.ko] undefined!
> ERROR: "__put_user_4" [fs/udf/udf.ko] undefined!
> ERROR: "__put_user_8" [fs/fat/fat.ko] undefined!
> ERROR: "__put_user_1" [fs/fat/fat.ko] undefined!
> ERROR: "__put_user_4" [fs/fat/fat.ko] undefined!
> ERROR: "__put_user_2" [fs/fat/fat.ko] undefined!
> ERROR: "__put_user_4" [drivers/net/tap.ko] undefined!
> ERROR: "__put_user_2" [drivers/net/tap.ko] undefined!
> ERROR: "__put_user_8" [drivers/media/v4l2-core/videodev.ko] undefined!
> ERROR: "__put_user_1" [drivers/media/v4l2-core/videodev.ko] undefined!
> ERROR: "__put_user_4" [drivers/media/v4l2-core/videodev.ko] undefined!
> ERROR: "__put_user_8" [drivers/input/joydev.ko] undefined!
> ERROR: "__put_user_1" [drivers/input/joydev.ko] undefined!
> ERROR: "__put_user_4" [drivers/input/joydev.ko] undefined!
> ERROR: "__fill_rsb" [arch/x86/kvm/kvm-intel.ko] undefined!
> make[2]: *** [/usr/src/linux-4.14.23/scripts/Makefile.modpost:92: __modpo=
st] Error 1
> make[1]: *** [/usr/src/linux-4.14.23/Makefile:1218: modules] Error 2
> make[1]: Leaving directory '/home/cocobo/repository/kernel_build'
>
> The only difference between the two pasted build logs is that the failing=
 build doesn't rebuild arch/x86/lib/retpoline.S.

Indeed.  retpoline.o is not recompiled in the first log.

Is the content of arch/x86/lib/.retpoline.o.cmd between the success
case and the failure?


> I don't know what cause the build failures but it seems like the build sy=
stem can get confused about which files needs to be rebuild when trimming s=
ymbols.


I tried 20+ iterations on v4.14.23 with your .config file,
but all succeeded on my machine.


I CCed Nicolas Pitre in case this rings his bell.




--=20
Best Regards
Masahiro Yamada
