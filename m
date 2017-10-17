Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:49679 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750992AbdJQSlR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 14:41:17 -0400
MIME-Version: 1.0
In-Reply-To: <CAGXu5j+LeV+7GBXCikUfiO-Rzu1Dnv7pMh2sfFLc_RMOSoiStg@mail.gmail.com>
References: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
 <CAK8P3a3OZTvvT1m167Ocajo0yTLbb2q6Jq53tZGWUFuUaboibA@mail.gmail.com>
 <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
 <CAGXu5j+1+rLA4uOrEv9yc9RE9Rna4QVsNqfg0zTDSMZ6VwGzaw@mail.gmail.com>
 <CAK8P3a3fHWdgH23LjACzM+htGCY-bHgM5Y6uB8J6K5XgfT8e+g@mail.gmail.com> <CAGXu5j+LeV+7GBXCikUfiO-Rzu1Dnv7pMh2sfFLc_RMOSoiStg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 17 Oct 2017 20:41:16 +0200
Message-ID: <CAK8P3a2N+QW9JjOAdp3tHsXLFU3Cmy7yR3Mr3vZvi4Vy5VbOYw@mail.gmail.com>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Oct 17, 2017 at 8:26 PM, Kees Cook <keescook@chromium.org> wrote:
> On Tue, Oct 17, 2017 at 8:52 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tue, Oct 17, 2017 at 5:34 PM, Kees Cook <keescook@chromium.org> wrote:

>> index dbfb978..d5bc694 100755
>> --- a/config.guess
>> +++ b/config.guess
>> @@ -1021,7 +1021,7 @@ EOF
>>         echo ${UNAME_MACHINE}-dec-linux-${LIBC}
>>         exit ;;
>>      x86_64:Linux:*:*)
>> -       echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
>> +       echo ${UNAME_MACHINE}-pc-linux-${LIBC}
>>         exit ;;
>>      xtensa*:Linux:*:*)
>>         echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
>>
>> I still don't know why that makes a difference, but all versions
>> prior to gcc-6.1 have the problem for me.
>
> What happens if you add -mstack-protector-guard=tls ?

With gcc-4.8 an earlier, I get build failure:

cc1: error: unrecognized command line option "-mstack-protector-guard=tls"

With gcc-4.9 and gcc-5, I get this output:

        .file   ""
        .text
        .globl  foo
        .type   foo, @function
foo:
        pushq   %rbp
        movq    %rsp, %rbp
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
        ret
        .size   foo, .-foo
        .ident  "GCC: (GNU) 5.4.1 20170626"
        .section        .note.GNU-stack,"",@progbits

     Arnd
