Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f49.google.com ([209.85.213.49]:35087 "EHLO
	mail-vk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752444AbcADLZo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jan 2016 06:25:44 -0500
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <CA+icZUVEs_+XiWeqtJ+34HBSx5LJYyEgoo2DLFzVr6yc9oxx2Q@mail.gmail.com>
References: <CA+icZUVEs_+XiWeqtJ+34HBSx5LJYyEgoo2DLFzVr6yc9oxx2Q@mail.gmail.com>
Date: Mon, 4 Jan 2016 12:25:43 +0100
Message-ID: <CA+icZUXJr7X4m6MosFv3Z+fK6Df14yMmwp9zZyAB8CsCW8cn5w@mail.gmail.com>
Subject: Re: Thoughts about introducing OPTIMIZATION_CFLAG
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>
Cc: linux-kbuild@vger.kernel.org, Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>

On Mon, Jan 4, 2016 at 11:54 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> [ Not sure if I have addressed all the correct people and mailing-lists ]
>
> Hi,
>
> while still digging into a llvmlinux issue with workqueue I saw that
> the wrong optimization compiler-flag was used on x86 architecture and
> acpi subsystem.
>
> CLANG requires '-Oz' whereas GCC requires '-Os'.
>
> As acpi-daemon was throwing out the regression I looked by accident
> over the *_CFLAGS.
> As said... I checked only for x86 and acpi only.
>
> For example '-Os' is hardcoded in...
>
> arch/x86/Makefile
> arch/x86/purgatory/Makefile
>
> drivers/acpi/Makefile
> drivers/acpi/acpica/Makefile
>
> For acpi part we have currently both used '-O2' and '-Os' ('-Oz' for
> llvmlinux) in approx 200 make-lines.
>
> $ grep '\-O2' build-log_4.4.0-rc8-2-llvmlinux-amd64.txt | grep acpi | wc -l
> 226
> $ grep '\-Oz' build-log_4.4.0-rc8-2-llvmlinux-amd64.txt | grep acpi |
> grep '\-O2' | wc -l
> 200
>
> So, which optimization-cflags is now used if I have both in one
> make-line (and how can I check this)?
>
> [ EXAMPLE ]
>
> $ mycompiler --version
> clang version 3.7.0 (tags/RELEASE_370/final)
> Target: x86_64-unknown-linux-gnu
> Thread model: posix
>
> $  mycompiler -Wp,-MD,drivers/acpi/.video_detect.o.d  -nostdinc
> -isystem /opt/llvm-toolchain-3.7.0/bin/../lib/clang/3.7.0/include
> -nostdinc -isystem
> /opt/llvm-toolchain-3.7.0/bin/../lib/clang/3.7.0/include
> -I./arch/x86/include -Iarch/x86/include/generated/uapi
> -Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi
> -Iarch/x86/include/generated/uapi -I./include/uapi
> -Iinclude/generated/uapi -include ./include/linux/kconfig.h
> -D__KERNEL__ -Qunused-arguments -Wno-unknown-warning-option -Wall
> -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing
> -fno-common -Werror-implicit-function-declaration -Wno-format-security
> -std=gnu89 -no-integrated-as -mno-sse -mno-mmx -mno-sse2 -mno-3dnow
> -mno-avx -m64 -mtune=generic -mno-red-zone -mcmodel=kernel
> -funit-at-a-time -DCONFIG_X86_X32_ABI -DCONFIG_AS_CFI=1
> -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1
> -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1
> -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare
> -fno-asynchronous-unwind-tables *** -O2 *** -Wframe-larger-than=1024
> -fno-stack-protector -Wno-unused-variable
> -Wno-format-invalid-specifier -Wno-gnu -Wno-asm-operand-widths
> -Wno-initializer-overrides -fno-builtin -Wno-tautological-compare
> -mno-global-merge -fno-omit-frame-pointer -fno-optimize-sibling-calls
> -pg -Wdeclaration-after-statement -Wno-pointer-sign
> -fno-strict-overflow -Werror=implicit-int -Werror=strict-prototypes
> -Werror=date-time -Wno-initializer-overrides -Wno-unused-value
> -Wno-format -Wno-unknown-warning-option -Wno-sign-compare
> -Wno-format-zero-length -Wno-uninitialized *** -Oz *** -DMODULE
> -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(video_detect)"
> -D"KBUILD_MODNAME=KBUILD_STR(video)" -c -o
> drivers/acpi/.tmp_video_detect.o drivers/acpi/video_detect.c
>
> How can I switch a optimization-cflags for certain code-parts in the
> Linux-kernel (with or without the kbuild-system)?
> ( So the default optimization-cflags is '-O2' whereas parts wants '-Os'. )
>
> What to do when using CONFIG_CC_OPTIMIZE_FOR_SIZE=y which sets '-Os' explicitly?
>
> Below tools/ directory we have also an OPTIMIZATION variable used.
>
> Something like a "global" solution is desired from my side.
>
> I have attached a patchset on top of my llvmlinux-amd64-fixes-4.4,
> hope this helps a bit to see what I mean.
> It is not doing what I desire - still WIP.
>
> Thoughts?
>
> Thanks in advance.
>

We have also hardcoded '-O2' in arch/x86...

$ grep '\-O2' -nr arch/x86/
arch/x86/boot/compressed/Makefile:24:KBUILD_CFLAGS := -m$(BITS)
-D__KERNEL__ $(LINUX_INCLUDE) -O2
arch/x86/entry/vdso/Makefile:67:CFL := $(PROFILING) -mcmodel=small
-fPIC -O2 -fasynchronous-unwind-tables -m64 \
arch/x86/um/vdso/Makefile:40:CFL := $(PROFILING) -mcmodel=small -fPIC
-O2 -fasynchronous-unwind-tables -m64 \

Is that explicitly required?

- Sedat -
