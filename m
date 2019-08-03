Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44575 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388134AbfHCQo3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Aug 2019 12:44:29 -0400
Received: by mail-vs1-f67.google.com with SMTP id v129so53334034vsb.11
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Aug 2019 09:44:29 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Albers <thomas.gameiro@googlemail.com>
Date: Sat, 3 Aug 2019 11:44:18 -0500
Message-ID: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
Subject: make_kernelconfig fails in OpenWRT buildroot
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello!

When you say "make kernel_menuconfig" in OpenWRT buildroot kernel
configuration fails, like so:
$ make kernel_menuconfig
make[3]: Entering directory
'/home/ta/openwrt/build_dir/target-arm_cortex-a15+neon-vfpv4_musl_eabi/linux-ipq806x/linux-4.14.134'
  HOSTCC  scripts/kconfig/mconf.o
  HOSTCC  scripts/kconfig/lxdialog/checklist.o
  HOSTCC  scripts/kconfig/lxdialog/util.o
  HOSTCC  scripts/kconfig/lxdialog/inputbox.o
  HOSTCC  scripts/kconfig/lxdialog/textbox.o
  HOSTCC  scripts/kconfig/lxdialog/yesno.o
  HOSTCC  scripts/kconfig/lxdialog/menubox.o
  HOSTLD  scripts/kconfig/mconf
/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
scripts/kconfig/lxdialog/checklist.o: undefined reference to symbol
'keypad'
/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
/lib64/libtinfow.so.6: error adding symbols: DSO missing from command
line
collect2: error: ld returned 1 exit status

Steps to reproduce (see
https://openwrt.org/docs/guide-developer/build-system/use-buildsystem)
$ git clone https://github.com/openwrt/openwrt.git
$ make menuconfig
$ make defconfig
$ make kernel_menuconfig

It seems that the bug was introduced here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd65465b7016dc6d9fa5c2f39cc706c231c9a089
when menuconfig no longer used pkg-config to find the ncurses libraries.
Also see a related bug report from Gentoo: https://bugs.gentoo.org/457530
and the OpenWRT bug report:
https://bugs.openwrt.org/index.php?do=details&task_id=2423

Thanks,
Thomas
