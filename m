Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f45.google.com ([209.85.128.45]:34672 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfCLJNS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Mar 2019 05:13:18 -0400
Received: by mail-wm1-f45.google.com with SMTP id o10so1624245wmc.1
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Mar 2019 02:13:17 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 12 Mar 2019 10:13:05 +0100
Message-ID: <CA+icZUVsc8fjxj1KGMWCQVPnaG+_W79HQ8xky=0Qd_vY55GU2Q@mail.gmail.com>
Subject: Fix and simplify -z noreloc-overflow" linker check in arch/x86/boot/compressed/Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org

Hi Masahiro Yamada,

do you have an idea how to fix this properly - as for example LLD
hasn't this option?
Speaking of the shell-line.
I mean use the method "call ld-option".

The below should be if $linker supports z noreloc-overflow then set
-pie together with --no-dynamic-linker.
AFAICS this is for x86-64-only?

Is it possible to simplify and have have one single line...?

KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)

[ arch/x86/boot/compressed/Makefile ]

KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
# Compressed kernel should be built as PIE since it may be loaded at any
# address by the bootloader.
ifeq ($(CONFIG_X86_32),y)
KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
else
# To build 64-bit compressed kernel as PIE, we disable relocation
# overflow check to avoid relocation overflow error with a new linker
# command-line option, -z noreloc-overflow.
KBUILD_LDFLAGS += $(shell $(LD) --help 2>&1 | grep -q "\-z noreloc-overflow" \
        && echo "-z noreloc-overflow -pie --no-dynamic-linker")
endif
LDFLAGS_vmlinux := -T

If you need more infos let me know.

Thanks.

Regards,
- Sedat -

Link: https://github.com/ClangBuiltLinux/linux/issues/411
