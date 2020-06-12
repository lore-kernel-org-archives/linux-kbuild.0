Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgFLPJq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 11:09:46 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9913CC03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 08:09:45 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t8so9064845ilm.7
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 08:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
In-Reply-To: <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 12 Jun 2020 17:09:32 +0200
Message-ID: <CA+icZUUhq5cbUV+_pd6SxKbj__OFcpZEvRA9Op7eGMGbvJRb=A@mail.gmail.com>
Subject: Re: x86/crypto: Set -no-integrated-as for specific object-file when
 building with LLVM_IAS=1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Jun 12, 2020 at 4:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Sedat,
>
>
> On Fri, Jun 12, 2020 at 10:47 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi Masahiro,
> >
> > I am trying to build with clang-10, ld.lld-10 and LLVM_IAS=1.
> >
> > I fell over some problems in x86/crypto area where I have found fixes.
> >
> > But how on hell can I set -no-integrated-as for specific object-file?
> >
> > [ arch/x86/crypto/Makefile ]
> >
> > ifdef LLVM_IAS
> > KBUILD_CPPFLAGS += -no-integrated-as
> > endif
> >
> > ...at the top sets -no-integrated-as for all object-files.
> >
> > I have two broken object-files (or more exact the corresponding *.S
> > file is broken):
> > #1: aes_ctrby8_avx-x86_64.o <--- FIXED
> > <https://github.com/ClangBuiltLinux/linux/issues/1008>
> > #2: crc32c-pcl-intel-asm_64.o <--- PATCH exist - does not work for me
> >
> > I tried...
> >
> > CFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
> > CLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as
>
>
>
> The source file is .S (assembly file),
> so
>
>    AFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
>
>
> Or,
>
>    asflags-y += -no-integrated-as
>
> , which is effective for all .S files in the directory.
>

It worked - here adapted:

git diff arch/x86/lib/Makefile
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 619107bec0d9..ff6ae9ecb0ab 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -3,10 +3,6 @@
 # Makefile for x86 specific library files.
 #

-ifdef LLVM_IAS
-KBUILD_CPPFLAGS += -no-integrated-as
-endif
-
 # Produces uninteresting flaky coverage.
 KCOV_INSTRUMENT_delay.o        := n

@@ -39,6 +35,9 @@ obj-$(CONFIG_SMP) += msr-smp.o cache-smp.o
 lib-y := delay.o misc.o cmdline.o cpu.o
 lib-y += usercopy_$(BITS).o usercopy.o getuser.o putuser.o
 lib-y += memcpy_$(BITS).o
+ifdef LLVM_IAS
+AFLAGS_memcpy_$(BITS).o += -no-integrated-as
+endif
 lib-$(CONFIG_INSTRUCTION_DECODER) += insn.o inat.o insn-eval.o
 lib-$(CONFIG_RANDOMIZE_BASE) += kaslr.o
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o

So, only memcpy_$(BITS).o is built with -no-integrated-as flag.

Thanks.

- Sedat -

> > or
> >
> > CPPFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
> > CPPFLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as
> >
> > or
> >
> > cflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
> > cflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as
> >
> > or
> >
> > cppflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
> > cppflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as
> >
> > All above also with "-fno-integrated-as" at the top and at the bottom
> > of the Makefile.
> >
> > Can you give a hint?
> >
> > Thanks.
> >
> > Regards,
> > - Sedat -
> >
> > [1] https://github.com/ClangBuiltLinux/linux/issues/1049
> > [1] https://github.com/ClangBuiltLinux/linux/issues/1050
>
>
>
> --
> Best Regards
> Masahiro Yamada
