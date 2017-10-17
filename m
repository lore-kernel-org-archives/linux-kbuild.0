Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:56734 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965102AbdJQPXQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 11:23:16 -0400
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
References: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 17 Oct 2017 17:23:15 +0200
Message-ID: <CAK8P3a3OZTvvT1m167Ocajo0yTLbb2q6Jq53tZGWUFuUaboibA@mail.gmail.com>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Oct 17, 2017 at 1:00 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> Hi Kees,
>
> On my test box, current linux-next kernels fail to build due to the
> patch that introduces CONFIG_CC_STACKPROTECTOR_AUTO, with my mainline
> gcc
> builds up to gcc-5.5.0. gcc-6 and higher work fine, as
> scripts/gcc-x86_64-has-stack-protector.sh returns 'y' for those.
>
> Using the compilers provided by Ubuntu (4.6/4.7/4.8/4.9), everything
> also works as expected, so my interpretation is that mainline gcc did
> not enable the stack protector until gcc-6, while distributions did.
>
> Do you agree with that interpretation?

It's probably a little different. I tried bisecting the gcc commit that fixed
the issue for me, and ended up with this commit

https://gitlab.indel.ch/thirdparty/gcc/commit/c14bac81551d6769741c2b1cc55e04d94fe8d3a7

that caused the target to change from x86_64-unknown-linux to
x86_64-pc-linux, and apparently caused the compiler bootstrap
to incorrectly identify the capabilities of the assembler. As a result,
the assembler output inside of scripts/gcc-x86_64-has-stack-protector.sh
that should be

        .file   ""
        .text
        .globl  foo
        .type   foo, @function
foo:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $208, %rsp
        movq    %gs:40, %rax
        movq    %rax, -8(%rbp)
        xorl    %eax, %eax
        movl    $3, %eax
        movq    -8(%rbp), %rdx
        xorq    %gs:40, %rdx
        je      .L3
        call    __stack_chk_fail
.L3:
        leave
        ret
        .size   foo, .-foo
        .ident  "GCC: (GNU) 6.1.1 20160729"
        .section        .note.GNU-stack,"",@progbits

ends up looking like

        .file   ""
        .text
        .globl  foo
        .type   foo, @function
foo:
.LFB0:
        pushq   %rbp
.LCFI0:
        movq    %rsp, %rbp
.LCFI1:
        subq    $208, %rsp
        movq    __stack_chk_guard(%rip), %rax
        movq    %rax, -8(%rbp)
        xorl    %eax, %eax
        movl    $3, %eax
        movq    -8(%rbp), %rdx
        xorq    __stack_chk_guard(%rip), %rdx
        je      .L3
        call    __stack_chk_fail
.L3:
        leave
.LCFI2:
        ret
.LFE0:
        .size   foo, .-foo
        .section        .eh_frame,"aw",@progbits
.Lframe1:
        .long   .LECIE1-.LSCIE1
.LSCIE1:
        .long   0
        .byte   0x3
        .string ""
        .byte   0x1
        .byte   0x78
        .byte   0x10
        .byte   0xc
        .byte   0x7
        .byte   0x8
        .byte   0x90
        .byte   0x1
        .align 8
.LECIE1:
.LSFDE1:
        .long   .LEFDE1-.LASFDE1
.LASFDE1:
        .long   .LASFDE1-.Lframe1
        .quad   .LFB0
        .quad   .LFE0-.LFB0
        .byte   0x4
        .long   .LCFI0-.LFB0
        .byte   0xe
        .byte   0x10
        .byte   0x86
        .byte   0x2
        .byte   0x4
        .long   .LCFI1-.LCFI0
        .byte   0xd
        .byte   0x6
        .byte   0x4
        .long   .LCFI2-.LCFI1
        .byte   0xc
        .byte   0x7
        .byte   0x8
        .align 8
.LEFDE1:
        .ident  "GCC: (GNU) 6.0.0 20150728 (experimental)"
        .section        .note.GNU-stack,"",@progbits
