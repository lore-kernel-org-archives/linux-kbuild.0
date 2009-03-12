Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f164.google.com ([209.85.219.164]:39279 "EHLO
	mail-ew0-f164.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755094AbZCLNnP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2009 09:43:15 -0400
Received: by ewy8 with SMTP id 8so337400ewy.13
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2009 06:43:11 -0700 (PDT)
From: Remis Lima Baima <remis.developer@googlemail.com>
Subject: [PATCH 0/3] Generic headers implementation
Date: Thu, 12 Mar 2009 14:43:05 +0100
Message-Id: <1236865388-31590-1-git-send-email-remis.developer@googlemail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Remis Lima Baima <remis.developer@googlemail.com>

Generic headers allow ARCH maintainers to remove all dummy
arch/ARCH/include/asm/XXX.h files or, depending on the architecture, 
include/asm-ARCH/XXX.h (e.g. arch/x86/include/asm/errno.h) that only 
include the _name equivalent_ include/asm-generic/XXX.h file 
(e.g. include/asm-generic/errno.h) with _no_ changes. It was called 
generic headers for short. Arnd Bergmann gave the original idea and 
asked me to implement it.

To use it just two steps are necessary:

 - Remove all the dummy arch/ARCH/include/asm/XXX.h files 
   (e.g. rm arch/x86/include/asm/errno.h)

 - Add the variable generic-y with the names of the removed files 
   (e.g. generic-y += errno.h) in the arch/ARCH/include/asm/Kbuild 
   (e.g. arch/x86/include/asm/Kbuild)

The removed files will be automatically generated during the build 
process by the script scripts/Makefile.genericheaders.

The scripts/Makefile.headersinst was adapted to avoid errors (due to 
the removal of header files from their default locations) so it would 
pass the 'make headers_check'.

The generic headers were applyed and tested in both x86 (tested in my 
Notebook with i386_defconfig on kernel 2.6.29-rc7 of 09/Mar/2009 from 
Linus git tree) and powerpc (tested in my PS3 with ps3_defconfig on 
kernel 2.6.29-rc7 of 11/Mar/2009 from Geoff Levand git tree). Both 
compiled and booted without problems.

This approach does not reduce much LOC but, in a rough estimation, it 
would allow the removal of around 90 dummy header files among all 
architectures.

PS: This is my first e-mail/patch here. Sorry for any misbehaviour :)


Remis Lima Baima (3):
  Create the infrastructure for generic headers
  Apply generic headers for x86
  Apply generic headers for PPC

 Makefile                                     |    4 +++
 arch/powerpc/include/asm/Kbuild              |    8 ++++++
 arch/powerpc/include/asm/div64.h             |    1 -
 arch/powerpc/include/asm/emergency-restart.h |    1 -
 arch/powerpc/include/asm/irq_regs.h          |    2 -
 arch/powerpc/include/asm/poll.h              |    1 -
 arch/powerpc/include/asm/resource.h          |    1 -
 arch/powerpc/include/asm/statfs.h            |    6 ----
 arch/powerpc/include/asm/xor.h               |    1 -
 arch/x86/include/asm/Kbuild                  |    9 +++++++
 arch/x86/include/asm/cputime.h               |    1 -
 arch/x86/include/asm/errno.h                 |    1 -
 arch/x86/include/asm/fcntl.h                 |    1 -
 arch/x86/include/asm/ioctl.h                 |    1 -
 arch/x86/include/asm/poll.h                  |    1 -
 arch/x86/include/asm/resource.h              |    1 -
 arch/x86/include/asm/rtc.h                   |    1 -
 arch/x86/include/asm/sections.h              |    1 -
 scripts/Makefile.genericheaders              |   34 ++++++++++++++++++++++++++
 scripts/Makefile.headersinst                 |    4 +++
 20 files changed, 59 insertions(+), 21 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/div64.h
 delete mode 100644 arch/powerpc/include/asm/emergency-restart.h
 delete mode 100644 arch/powerpc/include/asm/irq_regs.h
 delete mode 100644 arch/powerpc/include/asm/poll.h
 delete mode 100644 arch/powerpc/include/asm/resource.h
 delete mode 100644 arch/powerpc/include/asm/statfs.h
 delete mode 100644 arch/powerpc/include/asm/xor.h
 delete mode 100644 arch/x86/include/asm/cputime.h
 delete mode 100644 arch/x86/include/asm/errno.h
 delete mode 100644 arch/x86/include/asm/fcntl.h
 delete mode 100644 arch/x86/include/asm/ioctl.h
 delete mode 100644 arch/x86/include/asm/poll.h
 delete mode 100644 arch/x86/include/asm/resource.h
 delete mode 100644 arch/x86/include/asm/rtc.h
 delete mode 100644 arch/x86/include/asm/sections.h
 create mode 100644 scripts/Makefile.genericheaders

