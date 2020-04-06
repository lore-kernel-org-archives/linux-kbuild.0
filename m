Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39836 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729832AbgDFRND (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Apr 2020 13:13:03 -0400
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook> <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
 <CA+icZUVowLVpAxiWw=FJHfQ38KtU7AXXkVnw46D2XLM41-NCEA@mail.gmail.com>
 <CAK7LNAQ6ji3=2+7R1DL7eFveH7L7No6e3XkqfqgiH5QFyQj==A@mail.gmail.com>
 <CA+icZUV3rhvmBv91KMKCgvGSvJUoWDVfaV+08eC-kTMdThRn6w@mail.gmail.com> <202004060851.CCB538AD1@keescook>
In-Reply-To: <202004060851.CCB538AD1@keescook>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 6 Apr 2020 19:13:22 +0200
Message-ID: <CA+icZUV1wy6QFzQJFghBpvAphMnZ1DGhYrmrryfZ7vkXfPc3vw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 6, 2020 at 5:53 PM Kees Cook <keescook@chromium.org> wrote:
[ ... ]
> > How to test scripts/mkcompile_h?
>
> There's probably a better way, but I do:
>
> $ rm include/generated/compile.h init/version.o
> $ make init/version.o
> $ cat include/generated/compile.h
>

Thanks Kees.

# Clean-up
make distclean

# Prereq: Generate include/generated/autoconf.h file
cp -v /boot/config-5.6.0-2-amd64-clang .config
MAKE="make V=1" ; COMPILER="mycompiler" ; LINKER="mylinker" ;
MAKE_OPTS="CC=$COMPILER HOSTCC=$COMPILER LD=$LINKER HOSTLD=$LINKER"
yes "" | $MAKE $MAKE_OPTS oldconfig && $MAKE $MAKE_OPTS syncconfig < /dev/null

# Generate include/generated/compile.h file
$MAKE $MAKE_OPTS init/version.o

cat include/generated/compile.h

/* This file is auto generated, version 1 */
/* SMP */
#define UTS_MACHINE "x86_64"
#define UTS_VERSION "#1 SMP Mon Apr 6 19:05:53 CEST 2020"
#define LINUX_COMPILE_BY "dileks"
#define LINUX_COMPILE_HOST "iniza"
#define LINUX_COMPILER "clang version 10.0.0-2, LLD 10.0.0"

- sed@ -
