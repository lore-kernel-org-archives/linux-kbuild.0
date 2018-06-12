Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:42949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753890AbeFLGDy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jun 2018 02:03:54 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCHv4 1/3] scripts: Preprocess module-common.lds
In-Reply-To: <201806120915.NeKL1aUj%fengguang.wu@intel.com>
References: <20180612003224.3658-2-labbott@redhat.com> <201806120915.NeKL1aUj%fengguang.wu@intel.com>
Date: Tue, 12 Jun 2018 16:03:40 +1000
Message-ID: <8736xsv8w3.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>, Laura Abbott <labbott@redhat.com>
Cc: kbuild-all@01.org, Andy Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org

kbuild test robot <lkp@intel.com> writes:

> Hi Laura,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.17 next-20180608]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Laura-Abbott/scripts-Preprocess-module-common-lds/20180612-083632
> config: i386-randconfig-a1-201823 (attached as .config)
> compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
>
> All errors (new ones prefixed by >>):
>
>>> ld: cannot open linker script file scripts/module-common.lds: No such file or directory

This seems to need the following.

cheers


diff --git a/Makefile b/Makefile
index 73f0bb2c7a98..55a5725b6606 100644
--- a/Makefile
+++ b/Makefile
@@ -425,7 +425,7 @@ KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
 KBUILD_AFLAGS_MODULE  := -DMODULE
 KBUILD_CFLAGS_MODULE  := -DMODULE
-KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
+KBUILD_LDFLAGS_MODULE := -T $(objtree)/scripts/module-common.lds
 LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 
