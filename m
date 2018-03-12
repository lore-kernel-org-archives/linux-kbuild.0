Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:29296 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751368AbeCLHxw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Mar 2018 03:53:52 -0400
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com [209.85.213.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w2C7rkYP012176
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Mar 2018 16:53:46 +0900
Received: by mail-vk0-f53.google.com with SMTP id q7so5635501vkh.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Mar 2018 00:53:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+55aFxRjUCCKj6opiSrWw7gOC38yb+h7XivMrR0iMT-oRTxCg@mail.gmail.com>
References: <CAK7LNASRLcaegdM8nWwqmw9mVMZvR7nQJTu8YuPya3Hse5z6PA@mail.gmail.com>
 <CA+55aFxRjUCCKj6opiSrWw7gOC38yb+h7XivMrR0iMT-oRTxCg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 12 Mar 2018 16:53:04 +0900
Message-ID: <CAK7LNASkymceJ1M8LjBUKpoT9kwKvzdnkaa1FbVSStAxv-sRVQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v4.16-rc5
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,


2018-03-11 3:44 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> On Sat, Mar 10, 2018 at 5:48 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>
>> Please pull more Kbuild fixes for v4.16.
>
> Pulled.
>
> And I really don't think these are the reason, but I wonder if you've
> looked at why an empty build seems to have become slower lately?
>
> I do "allmodconfig" builds between each pull, and it used to be in the
> 40+ second range. Now it's in the "just over a minute" range. That's
> with absolutely nothing actually being built.
>
> That "nothing rebuilt" is actually the big expense for me for the
> later -rc handling, since it completely dominates when the pull
> requests shrink (even if *something* gets rebuilt, the one minute for
> the empty build is 90+% of the time).
>
> It might not be kbuild that has triggered this, it might be something
> else. But some trivial profiling shows that it's definitely pretty
> much all in make, although 'modpost' does show up:
>
>   83.18%  make
>   11.30%  modpost
>    5.10%  sh
>    0.31%  cat
>    0.03%  cc1
>    0.01%  grep
>    ...
>
> The above was just from
>
>     perf record -e cycles:pp make -j16
>
> and then doing a
>
>     perf report --sort=comm
>
> to see a very high-level overview.
>
> Pretty much all of the time in 'make' is spent on parsing, it seems:
>
>    5.24%  make      [.] hash_find_slot
>    3.86%  make      [.] __strlen_avx2
>    3.76%  make      [.] _int_malloc
>    3.25%  make      [.] target_environment
>    2.82%  make      [.] __memmove_avx_unaligned_erms
>    2.49%  make      [.] __strcmp_sse2_unaligned
>    2.41%  modpost   [.] parse_file
>    2.21%  make      [.] malloc
>    2.18%  make      [.] 0x000000000001e1f3
>    2.10%  make      [.] glob
>    2.06%  make      [.] __strchr_avx2
>    1.92%  make      [.] parse_variable_definition
>    1.76%  make      [.] _int_free
>    1.52%  make      [.] parse_file_seq
>    1.49%  make      [.] find_next_token
>    ....
>
> and maybe it's 'make' that has gotten upgraded and slowed down, and
> it's not our build system at all.
>
> Yes, my build times continually do go up as the kernel grows, so
> that's normal. It's just that there seems to have been a fairly big
> jump in the last month or so.
>
> I haven't tried to bisect anything, I thought I'd just mention it in
> case you go "yeah, I'm aware.."


No.  I am not aware of it.
I tried empty building for several tags.
The build time was almost constant for me.

I saw about increase by 6 seconds
between v4.15 between v4.16-rc1,
but I think this is quite normal.




The full log of my experiments are below:



[1] v4.15-rc1

masahiro@pug:~/workspace/linux$ git describe
v4.15-rc1
masahiro@pug:~/workspace/linux$ time make all
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CHK     scripts/mod/devicetable-offsets.h
  CHK     include/generated/compile.h
  CHK     kernel/config_data.h
  CHK     include/generated/uapi/linux/version.h
  DATAREL arch/x86/boot/compressed/vmlinux
Kernel: arch/x86/boot/bzImage is ready  (#38)
  Building modules, stage 2.
  MODPOST 6586 modules
WARNING: modpost: missing MODULE_LICENSE() in drivers/auxdisplay/img-ascii-lcd.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-ath79.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-iop.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/iio/accel/kxsd9-i2c.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/iio/adc/qcom-vadc-common.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
drivers/media/platform/mtk-vcodec/mtk-vcodec-common.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
drivers/media/platform/soc_camera/soc_scale_crop.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
drivers/media/platform/tegra-cec/tegra_cec.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/mtd/nand/denali_pci.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
drivers/pinctrl/pxa/pinctrl-pxa2xx.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/power/reset/zx-reboot.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
drivers/staging/comedi/drivers/ni_atmio.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in net/9p/9pnet_xen.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
sound/soc/codecs/snd-soc-pcm512x-spi.o
see include/linux/module.h for more information

real 1m42.019s
user 1m12.828s
sys 0m19.732s

[2] v4.15

masahiro@pug:~/workspace/linux$ git describe
v4.15
masahiro@pug:~/workspace/linux$ time make all
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CHK     scripts/mod/devicetable-offsets.h
  CHK     include/generated/compile.h
  CHK     kernel/config_data.h
  CHK     include/generated/uapi/linux/version.h
  DATAREL arch/x86/boot/compressed/vmlinux
Kernel: arch/x86/boot/bzImage is ready  (#33)
  Building modules, stage 2.
  MODPOST 6585 modules
WARNING: modpost: missing MODULE_LICENSE() in drivers/auxdisplay/img-ascii-lcd.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-ath79.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-iop.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/iio/accel/kxsd9-i2c.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/iio/adc/qcom-vadc-common.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
drivers/media/platform/mtk-vcodec/mtk-vcodec-common.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
drivers/media/platform/soc_camera/soc_scale_crop.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
drivers/media/platform/tegra-cec/tegra_cec.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/mtd/nand/denali_pci.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
drivers/pinctrl/pxa/pinctrl-pxa2xx.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/power/reset/zx-reboot.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in
sound/soc/codecs/snd-soc-pcm512x-spi.o
see include/linux/module.h for more information

real 1m41.114s
user 1m12.596s
sys 0m19.416s

[3] v4.16-rc1

masahiro@pug:~/workspace/linux$ git describe
v4.16-rc1
masahiro@pug:~/workspace/linux$ time make all
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CHK     scripts/mod/devicetable-offsets.h
  CHK     include/generated/compile.h
  CHK     kernel/config_data.h
  CHK     include/generated/uapi/linux/version.h
  DATAREL arch/x86/boot/compressed/vmlinux
Kernel: arch/x86/boot/bzImage is ready  (#37)
  Building modules, stage 2.
  MODPOST 6666 modules

real 1m47.057s
user 1m15.952s
sys 0m21.496s


[4] v4.16-rc2

masahiro@pug:~/workspace/linux$ git describe
v4.16-rc2
masahiro@pug:~/workspace/linux$ time make all
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CHK     scripts/mod/devicetable-offsets.h
  CHK     include/generated/compile.h
  CHK     kernel/config_data.h
  CHK     include/generated/uapi/linux/version.h
  DATAREL arch/x86/boot/compressed/vmlinux
Kernel: arch/x86/boot/bzImage is ready  (#36)
  Building modules, stage 2.
  MODPOST 6666 modules

real 1m47.064s
user 1m15.916s
sys 0m21.640s


[5] v4.16-rc5

masahiro@pug:~/workspace/linux$ git describe
v4.16-rc5
masahiro@pug:~/workspace/linux$ time make all
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CHK     scripts/mod/devicetable-offsets.h
  CHK     include/generated/compile.h
  CHK     kernel/config_data.h
  CHK     include/generated/uapi/linux/version.h
  DATAREL arch/x86/boot/compressed/vmlinux
Kernel: arch/x86/boot/bzImage is ready  (#35)
  Building modules, stage 2.
  MODPOST 6664 modules

real 1m47.242s
user 1m15.576s
sys 0m22.088s




-- 
Best Regards
Masahiro Yamada
