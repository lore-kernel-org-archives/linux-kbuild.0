Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:41010 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgFLOzD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 10:55:03 -0400
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 05CEshxc013313
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 23:54:44 +0900
Received: by mail-vk1-f176.google.com with SMTP id n188so2300399vkc.11
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 07:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
In-Reply-To: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 12 Jun 2020 23:54:06 +0900
Message-ID: <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
Subject: Re: x86/crypto: Set -no-integrated-as for specific object-file when
 building with LLVM_IAS=1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Sedat,


On Fri, Jun 12, 2020 at 10:47 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi Masahiro,
>
> I am trying to build with clang-10, ld.lld-10 and LLVM_IAS=1.
>
> I fell over some problems in x86/crypto area where I have found fixes.
>
> But how on hell can I set -no-integrated-as for specific object-file?
>
> [ arch/x86/crypto/Makefile ]
>
> ifdef LLVM_IAS
> KBUILD_CPPFLAGS += -no-integrated-as
> endif
>
> ...at the top sets -no-integrated-as for all object-files.
>
> I have two broken object-files (or more exact the corresponding *.S
> file is broken):
> #1: aes_ctrby8_avx-x86_64.o <--- FIXED
> <https://github.com/ClangBuiltLinux/linux/issues/1008>
> #2: crc32c-pcl-intel-asm_64.o <--- PATCH exist - does not work for me
>
> I tried...
>
> CFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
> CLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as



The source file is .S (assembly file),
so

   AFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as


Or,

   asflags-y += -no-integrated-as

, which is effective for all .S files in the directory.







> or
>
> CPPFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
> CPPFLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as
>
> or
>
> cflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
> cflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as
>
> or
>
> cppflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
> cppflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as
>
> All above also with "-fno-integrated-as" at the top and at the bottom
> of the Makefile.
>
> Can you give a hint?
>
> Thanks.
>
> Regards,
> - Sedat -
>
> [1] https://github.com/ClangBuiltLinux/linux/issues/1049
> [1] https://github.com/ClangBuiltLinux/linux/issues/1050



-- 
Best Regards
Masahiro Yamada
