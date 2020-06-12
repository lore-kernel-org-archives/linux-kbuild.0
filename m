Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLPBB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 11:01:01 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03387C03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 08:01:01 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id c75so9029692ila.8
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 08:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
In-Reply-To: <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 12 Jun 2020 17:00:47 +0200
Message-ID: <CA+icZUW8JF+2-+U4=EuvF=HgjN18P7BnfhLpMvmWxA-G7Hak_g@mail.gmail.com>
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

Hi Masahiro,

thanks for the feedback.

I could solve all breakage in arch/x86/crypto - for one issue I needed
OBJDUMP=llvm-objdump in my make-options.
So, I keep this in mind.

Can we document this in llvm.rst kernel-doc as "troubleshooting"?

Hope you are well.

Regards,
- Sedat -

>
>
>
>
>
>
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
