Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40549 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600Ab3JENRr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 5 Oct 2013 09:17:47 -0400
Date: Sat, 5 Oct 2013 14:17:06 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Bug: kbuild always rebuilds compressed images on ARM
Message-ID: <20131005131706.GY12758@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org

Hi,

I've noticed that kbuild always rebuilds the compressed piggy image
on ARM.  Here's the output from running make with V=2:

  CALL    /home/rmk/git/linux-rmk/scripts/checksyscalls.sh - due to target missing
  CHK     include/generated/compile.h
  Kernel: arch/arm/boot/Image is ready
  Building modules, stage 2.
  LZO     arch/arm/boot/compressed/piggy.lzo - due to command line change
  MODPOST 17 modules - due to target is PHONY
  AS      arch/arm/boot/compressed/piggy.lzo.o - due to: arch/arm/boot/compressed/piggy.lzo
  LD      arch/arm/boot/compressed/vmlinux - due to: arch/arm/boot/compressed/piggy.lzo.o
  OBJCOPY arch/arm/boot/zImage - due to: arch/arm/boot/compressed/vmlinux
  Kernel: arch/arm/boot/zImage is ready

and with V=1:

...
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=arch/arm/boot/compressed arch/arm/boot/compressed/vmlinux
make -f /home/rmk/git/linux-rmk/scripts/Makefile.modpost
  find .tmp_versions -name '*.mod' | xargs -r grep -h '\.ko$' | sort -u | sed 's/\.ko$/.o/' | scripts/mod/modpost -m -a -o /home/rmk/git/build/imx6/Module.symvers    -S  -s -T -
  (cat arch/arm/boot/compressed/../Image | lzop -9 && printf \\010\\224\\034\\002) > arch/arm/boot/compressed/piggy.lzo || (rm -f arch/arm/boot/compressed/piggy.lzo ; false)
make -f /home/rmk/git/linux-rmk/scripts/Makefile.fwinst obj=firmware __fw_modbuild
...

The arch/arm/boot/compressed/.piggy.lzo.cmd file contains this:

cmd_arch/arm/boot/compressed/piggy.lzo := (cat arch/arm/boot/compressed/../Image | lzop -9 && printf \\\\010\\\\224\\\\034\\\\002) > arch/arm/boot/compressed/piggy.lzo || (rm -f arch/arm/boot/compressed/piggy.lzo ; false)

Any ideas why it thinks that the command has changed?

Thanks.
