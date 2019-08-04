Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f194.google.com ([209.85.221.194]:42443 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbfHDRIa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Aug 2019 13:08:30 -0400
Received: by mail-vk1-f194.google.com with SMTP id 130so16280646vkn.9
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Aug 2019 10:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
In-Reply-To: <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
From: Thomas Albers <thomas.gameiro@googlemail.com>
Date: Sun, 4 Aug 2019 12:08:17 -0500
Message-ID: <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com>
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hello!

Still not sure what's happening, but here's some more data:

You can invoke make menuconfig in the build directory, and it works just fine:
~/openwrt/build_dir/target-arm_cortex-a15+neon-vfpv4_musl_eabi/linux-ipq806x/linux-4.14.134
$ make menuconfig
make -f ./scripts/Makefile.build obj=scripts/basic
  gcc -Wp,-MD,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes
-Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89      -o
scripts/basic/fixdep scripts/basic/fixdep.c
rm -f .tmp_quiet_recordmcount
make -f ./scripts/Makefile.build obj=scripts/kconfig menuconfig
/bin/sh ./scripts/kconfig/lxdialog/check-lxdialog.sh -check gcc
-D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -I/usr/include/ncursesw
-DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE  -lncursesw
-ltinfow
  gcc -Wp,-MD,scripts/kconfig/.mconf.o.d -Wall -Wmissing-prototypes
-Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
-D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -I/usr/include/ncursesw
-DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE   -c -o
scripts/kconfig/mconf.o scripts/kconfig/mconf.c
...
  gcc -Wp,-MD,scripts/kconfig/lxdialog/.menubox.o.d -Wall
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
-std=gnu89    -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600
-I/usr/include/ncursesw -DCURSES_LOC="<ncurses.h>"
-DNCURSES_WIDECHAR=1 -DLOCALE   -c -o
scripts/kconfig/lxdialog/menubox.o scripts/kconfig/lxdialog/menubox.c
  gcc  -o scripts/kconfig/mconf scripts/kconfig/mconf.o
scripts/kconfig/zconf.tab.o scripts/kconfig/lxdialog/checklist.o
scripts/kconfig/lxdialog/util.o scripts/kconfig/lxdialog/inputbox.o
scripts/kconfig/lxdialog/textbox.o scripts/kconfig/lxdialog/yesno.o
scripts/kconfig/lxdialog/menubox.o  -lncursesw -ltinfow
scripts/kconfig/mconf  Kconfig

But when you invoke it from OpenWRT buildroot this happens:
ta@pythia ~/openwrt $ make kernel_menuconfig
...
make[1]: Entering directory '/home/ta/openwrt/target/linux'
make[2]: Entering directory '/home/ta/openwrt/target/linux/ipq806x'
rm -f /home/ta/openwrt/build_dir/target-arm_cortex-a15+neon-vfpv4_musl_eabi/linux-ipq806x/linux-4.14.134/.config.prev
rm -f /home/ta/openwrt/build_dir/target-arm_cortex-a15+neon-vfpv4_musl_eabi/linux-ipq806x/linux-4.14.134/.configured
/home/ta/openwrt/scripts/kconfig.pl  +
/home/ta/openwrt/target/linux/generic/config-4.14
/home/ta/openwrt/target/linux/ipq806x/config-4.14 >
/home/ta/openwrt/build_dir/target-arm_cortex-a15+neon-vfpv4_musl_eabi/linux-ipq806x/linux-4.14.134/.config
export MAKEFLAGS= ;make -C
/home/ta/openwrt/build_dir/target-arm_cortex-a15+neon-vfpv4_musl_eabi/linux-ipq806x/linux-4.14.134
HOSTCFLAGS="-O2 -I/home/ta/openwrt/staging_dir/host/include  -Wall
-Wmissing-prototypes -Wstrict-prototypes"
CROSS_COMPILE="arm-openwrt-linux-muslgnueabi-" ARCH="arm"
KBUILD_HAVE_NLS=no KBUILD_BUILD_USER="" KBUILD_BUILD_HOST=""
KBUILD_BUILD_TIMESTAMP="Sat Aug  3 09:29:40 2019"
KBUILD_BUILD_VERSION="0"
HOST_LOADLIBES="-L/home/ta/openwrt/staging_dir/host/lib"
CONFIG_SHELL="bash" V=''  cmd_syscalls= KERNELRELEASE=4.14.134
CC="arm-openwrt-linux-muslgnueabi-gcc"  menuconfig
make[3]: Entering directory
'/home/ta/openwrt/build_dir/target-arm_cortex-a15+neon-vfpv4_musl_eabi/linux-ipq806x/linux-4.14.134'
make -f ./scripts/Makefile.build obj=scripts/basic
  gcc -Wp,-MD,scripts/basic/.fixdep.d -O2
-I/home/ta/openwrt/staging_dir/host/include  -Wall
-Wmissing-prototypes -Wstrict-prototypes
-I/home/ta/openwrt/staging_dir/host/include  -o scripts/basic/fixdep
scripts/basic/fixdep.c -L/home/ta/openwrt/staging_dir/host/lib
rm -f .tmp_quiet_recordmcount
make -f ./scripts/Makefile.build obj=scripts/kconfig menuconfig
bash ./scripts/kconfig/lxdialog/check-lxdialog.sh -check gcc
-I/home/ta/openwrt/staging_dir/host/include -I/usr/include/ncursesw
-DCURSES_LOC="<curses.h>"  -DNCURSES_WIDECHAR=1 -DLOCALE  -lncursesw
  gcc -Wp,-MD,scripts/kconfig/.mconf.o.d -O2
-I/home/ta/openwrt/staging_dir/host/include  -Wall
-Wmissing-prototypes -Wstrict-prototypes
-I/home/ta/openwrt/staging_dir/host/include -I/usr/include/ncursesw
-DCURSES_LOC="<curses.h>"  -DNCURSES_WIDECHAR=1 -DLOCALE   -c -o
scripts/kconfig/mconf.o scripts/kconfig/mconf.c
...
  gcc -Wp,-MD,scripts/kconfig/lxdialog/.menubox.o.d -O2
-I/home/ta/openwrt/staging_dir/host/include  -Wall
-Wmissing-prototypes -Wstrict-prototypes
-I/home/ta/openwrt/staging_dir/host/include -I/usr/include/ncursesw
-DCURSES_LOC="<curses.h>"  -DNCURSES_WIDECHAR=1 -DLOCALE   -c -o
scripts/kconfig/lxdialog/menubox.o scripts/kconfig/lxdialog/menubox.c
  gcc  -o scripts/kconfig/mconf scripts/kconfig/mconf.o
scripts/kconfig/zconf.tab.o scripts/kconfig/lxdialog/checklist.o
scripts/kconfig/lxdialog/util.o scripts/kconfig/lxdialog/inputbox.o
scripts/kconfig/lxdialog/textbox.o scripts/kconfig/lxdialog/yesno.o
scripts/kconfig/lxdialog/menubox.o
-L/home/ta/openwrt/staging_dir/host/lib -lncursesw
/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
scripts/kconfig/lxdialog/checklist.o: undefined reference to symbol
'keypad'
/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
/lib64/libtinfow.so.6: error adding symbols: DSO missing from command
line
collect2: error: ld returned 1 exit status

Somehow, kconfig is not linked against libtinfow. Please let me know
how I can be of assistance here, I'm still wrapping my head around the
code. This is a 4.14 kernel, but 4.19, which different architectures
use, fails in a similar manner.

Regards,
Thomas
