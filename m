Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgFLNrg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 09:47:36 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E94C03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 06:47:35 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id l6so8844908ilo.2
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 06:47:35 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 12 Jun 2020 15:47:23 +0200
Message-ID: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
Subject: x86/crypto: Set -no-integrated-as for specific object-file when
 building with LLVM_IAS=1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org

Hi Masahiro,

I am trying to build with clang-10, ld.lld-10 and LLVM_IAS=1.

I fell over some problems in x86/crypto area where I have found fixes.

But how on hell can I set -no-integrated-as for specific object-file?

[ arch/x86/crypto/Makefile ]

ifdef LLVM_IAS
KBUILD_CPPFLAGS += -no-integrated-as
endif

...at the top sets -no-integrated-as for all object-files.

I have two broken object-files (or more exact the corresponding *.S
file is broken):
#1: aes_ctrby8_avx-x86_64.o <--- FIXED
<https://github.com/ClangBuiltLinux/linux/issues/1008>
#2: crc32c-pcl-intel-asm_64.o <--- PATCH exist - does not work for me

I tried...

CFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
CLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as

or

CPPFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
CPPFLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as

or

cflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
cflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as

or

cppflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
cppflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as

All above also with "-fno-integrated-as" at the top and at the bottom
of the Makefile.

Can you give a hint?

Thanks.

Regards,
- Sedat -

[1] https://github.com/ClangBuiltLinux/linux/issues/1049
[1] https://github.com/ClangBuiltLinux/linux/issues/1050
