Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:43221 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935020AbeCENHP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Mar 2018 08:07:15 -0500
Received: by mail-lf0-f52.google.com with SMTP id q69so22969083lfi.10
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Mar 2018 05:07:14 -0800 (PST)
Received: from [84.217.165.85] (c-55a5d954.501502050104-0-757473696b74.cust.bredbandsbolaget.se. [84.217.165.85])
        by smtp.gmail.com with ESMTPSA id p74sm2720131ljp.5.2018.03.05.05.07.12
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Mar 2018 05:07:12 -0800 (PST)
From: Thomas Lindroth <thomas.lindroth@gmail.com>
Subject: Intermittent build failure with TRIM_UNUSED_KSYMS and related
 problems
Message-ID: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com>
Date: Mon, 5 Mar 2018 14:07:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

I upgraded to 4.14.23 from an earlier kernel series a while ago and turned on some new options. Soon after I noticed one of my virtual machines didn't work right. It's a kvm based VM using vfio for assigning a pci device to the VM. The guest OS could no longer initialize that pci device. After a lot of trial and error I narrowed down the problem to TRIM_UNUSED_KSYMS, which I enabled in the upgrade.

If and only if TRIM_UNUSED_KSYMS is enabled the guest gets the error "code 43" which is a generic error code meaning failure to initialize driver in windows based OS. I don't notice any other problems besides that.

As I understand it TRIM_UNUSED_KSYMS will build the kernel and modules, then check which symbols are used by the modules and remove all unused EXPORT_SYMBOL_* from the kernel and rebuild it again. When I build the kernel I get a line like "KSYMS   symbols: before=1872, after=1871, changed=17" followed by rebuild of a few files. One of the rebuilt files is always drivers/pci/access.c which looks suspicions based on the error I get.

EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
EXPORT_SYMBOL_GPL(pci_user_write_config_##size);
drivers/pci/access.c got these two exports. They stand out because they are macros instead of functions. The only place they are used in the kernel is vfio. All other uses are for accessing pci config space from userspace. I don't think anything in my userspace tries to access pci config space so that could explain why I only see a problem with the vfio based VM. I don't know why TRIM_UNUSED_KSYMS cause problems with vfio but I suspect those macros are related.

When testing various config options I would change an option, run make clean followed by make. Turns out make clean doesn't clean include/generated/autoksyms.h. That's why the KSYMS line reported before=1872 instead of before=0. I guessed the kernel build might be confused about which files needed rebuilding so I tried to use a clean build path instead. That did not help to resolve the VM problem but it did result in build failures.

The build failure is intermittent and only happens about once every 10 builds.
Here is the full "make V=1 j1" output from a failed build:
https://gist.githubusercontent.com/anonymous/3ee68c7936248c6f0772bcac8c5b6257/raw/b62df75c5329ec8f3bf556da1145bdf69d5d69f8/gistfile1.txt
Here is the same output from a build that succeeds:
https://gist.githubusercontent.com/anonymous/85331c68f448781ba64bbaafcd5cb47f/raw/55a86eff8a5e42fe93c26ce1df2aa7c96d1ae803/gistfile1.txt
Here is the .config I used:
https://gist.githubusercontent.com/anonymous/0d5eceb5ae65ffc5e853fb2664bb3acb/raw/8ca8f1a35468b5aac5b6485a12e71362e8d83ff3/gistfile1.txt

Sorry for using gist links but the output is probably too big for the mailing list and regular pastebins.

The build failure always looks something like this but the undefined symbols varies:
  Building modules, stage 2.
  MODPOST 146 modules
ERROR: "__put_user_2" [net/ipv4/netfilter/ip_tables.ko] undefined!
ERROR: "__put_user_2" [net/ipv4/netfilter/arp_tables.ko] undefined!
ERROR: "__put_user_8" [fs/udf/udf.ko] undefined!
ERROR: "__put_user_4" [fs/udf/udf.ko] undefined!
ERROR: "__put_user_8" [fs/fat/fat.ko] undefined!
ERROR: "__put_user_1" [fs/fat/fat.ko] undefined!
ERROR: "__put_user_4" [fs/fat/fat.ko] undefined!
ERROR: "__put_user_2" [fs/fat/fat.ko] undefined!
ERROR: "__put_user_4" [drivers/net/tap.ko] undefined!
ERROR: "__put_user_2" [drivers/net/tap.ko] undefined!
ERROR: "__put_user_8" [drivers/media/v4l2-core/videodev.ko] undefined!
ERROR: "__put_user_1" [drivers/media/v4l2-core/videodev.ko] undefined!
ERROR: "__put_user_4" [drivers/media/v4l2-core/videodev.ko] undefined!
ERROR: "__put_user_8" [drivers/input/joydev.ko] undefined!
ERROR: "__put_user_1" [drivers/input/joydev.ko] undefined!
ERROR: "__put_user_4" [drivers/input/joydev.ko] undefined!
ERROR: "__fill_rsb" [arch/x86/kvm/kvm-intel.ko] undefined!
make[2]: *** [/usr/src/linux-4.14.23/scripts/Makefile.modpost:92: __modpost] Error 1
make[1]: *** [/usr/src/linux-4.14.23/Makefile:1218: modules] Error 2
make[1]: Leaving directory '/home/cocobo/repository/kernel_build'

The only difference between the two pasted build logs is that the failing build doesn't rebuild arch/x86/lib/retpoline.S.

I don't know what cause the build failures but it seems like the build system can get confused about which files needs to be rebuild when trimming symbols.
