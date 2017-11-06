Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:56018 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932469AbdKFSrk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Nov 2017 13:47:40 -0500
Received: by mail-wm0-f68.google.com with SMTP id y83so16202278wmc.4
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Nov 2017 10:47:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKwvOdn1q=9E+dHH_mX+GNsoVjozfGMjGVULG32935vJgjDyuA@mail.gmail.com>
References: <CAK7LNASyP3x8wnvv_Eo_CbHehY5+pPjcpJFAn3fw8NAAi00GQA@mail.gmail.com>
 <20171027201345.87383-1-ndesaulniers@google.com> <CAK7LNAT56EEHbQguD1pbFiurU9MMa55WAUptX16KWhpOOF_BHg@mail.gmail.com>
 <CAK7LNAQuZ3iWB+_RSh5hCTundm4-rfCP2WzmnkdzLNSQYzaG0w@mail.gmail.com>
 <CAK7LNAQKjX1Xp-tuQAY1zofk6Lx7i9ynXMO0yVGJ-f588v47Fw@mail.gmail.com> <CAKwvOdn1q=9E+dHH_mX+GNsoVjozfGMjGVULG32935vJgjDyuA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 6 Nov 2017 10:47:37 -0800
Message-ID: <CAKwvOdmhuaLC6=vG2DMFAbhfXoUr74_aemM2DK7me6pQ0obW4g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix linker feature test macros when cross
 compiling with Clang
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Douglas Anderson <dianders@chromium.org>, Ingo Molnar <mingo@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Mark Charlebois <charlebm@gmail.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Comparing make V=3D1 with the suggested config before my patch, after my
patch, and after Masahiro's suggestion to add $(LDFLAGS):

before:
...
ld -m elf_i386  -pie    -T arch/x86/boot/compressed/vmlinux.lds ...
...

after my:
...
ld -m elf_i386     -T arch/x86/boot/compressed/vmlinux.lds ...
...

after my+Masahiro:
...
ld -m elf_i386 -pie    -T arch/x86/boot/compressed/vmlinux.lds ...
...

:)

Just to dig into this a little more (though I suspect we've found the issue=
):

Next is to debug what we're passing to try-run and see what errors
it's masking.  Adding to arch/x86/boot/compressed/Makefile:
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -44,6 +44,10 @@ LDFLAGS :=3D -m elf_$(UTS_MACHINE)
 # Compressed kernel should be built as PIE since it may be loaded at any
 # address by the bootloader.
 ifeq ($(CONFIG_X86_32),y)
+$(info "XXX")
+$(info "KBUILD_CPPFLAGS: ${KBUILD_CPPFLAGS}")
+$(info "CC_OPTION_CFLAGS: ${CC_OPTION_CFLAGS}")
+$(info "LDFLAGS: ${LDFLAGS}")
 LDFLAGS +=3D $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker=
)
 else
 # To build 64-bit compressed kernel as PIE, we disable relocation

then grepping for XXX in a build output:
"XXX"
"KBUILD_CPPFLAGS: -D__KERNEL__  "
"CC_OPTION_CFLAGS: -m32 -D__KERNEL__ -O2 -fno-strict-aliasing -fPIE
-DDISABLE_BRANCH_PROFILING -march=3Di386 -mno-mmx -mno-sse
-ffreestanding -fno-stack-protector"
"LD_FLAGS: "

then trying this on the command line:
=E2=9E=9C  kernel-all git:(kbuild) =E2=9C=97 cc -pie -D__KERNEL__ -m32 -D__=
KERNEL__
-O2 -fno-strict-aliasing -fPIE -DDISABLE_BRANCH_PROFILING -march=3Di386
-mno-mmx -mno-sse -ffreestanding -fno-stack-protector -x c /dev/null
-c -o temp.o
=E2=9E=9C  kernel-all git:(kbuild) =E2=9C=97 ld -pie temp.o -o temp
ld: i386 architecture of input file `temp.o' is incompatible with
i386:x86-64 output
ld: warning: cannot find entry symbol _start; defaulting to 000000000000007=
8
=E2=9E=9C  kernel-all git:(kbuild) =E2=9C=97 echo $?
1
=E2=9E=9C  kernel-all git:(kbuild) =E2=9C=97 file temp.o
temp.o: ELF 32-bit LSB  relocatable, Intel 80386, version 1 (SYSV), not str=
ipped

So it looks like without LDFLAGS, we don't tell the linker to link as
32b, causing ld-option to fail to add -pie to LDFLAGS.

=E2=9E=9C  kernel-all git:(kbuild) =E2=9C=97 ld -pie -m elf_i386 temp.o -o =
temp
ld: warning: cannot find entry symbol _start; defaulting to 000000000000018=
5
=E2=9E=9C  kernel-all git:(kbuild) =E2=9C=97 echo $?
0

sure enough, just before the call to ld-option from
arch/x86/boot/compressed/Makefile:

 43 LDFLAGS :=3D -m elf_$(UTS_MACHINE)

so looks like Masahiro's suggestion is correct.  Will send a v3.
