Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:51837 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763827AbdJQS50 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 14:57:26 -0400
Received: by mail-io0-f175.google.com with SMTP id b186so3396954iof.8
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2017 11:57:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0Qa4dw_6WLsyjWFVXD3-DUa_2V=Yj9THvNE=wWMNH5VA@mail.gmail.com>
References: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
 <CAK8P3a3OZTvvT1m167Ocajo0yTLbb2q6Jq53tZGWUFuUaboibA@mail.gmail.com>
 <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
 <CAGXu5j+1+rLA4uOrEv9yc9RE9Rna4QVsNqfg0zTDSMZ6VwGzaw@mail.gmail.com>
 <CAK8P3a3fHWdgH23LjACzM+htGCY-bHgM5Y6uB8J6K5XgfT8e+g@mail.gmail.com>
 <CAGXu5j+LeV+7GBXCikUfiO-Rzu1Dnv7pMh2sfFLc_RMOSoiStg@mail.gmail.com>
 <CAK8P3a2N+QW9JjOAdp3tHsXLFU3Cmy7yR3Mr3vZvi4Vy5VbOYw@mail.gmail.com> <CAK8P3a0Qa4dw_6WLsyjWFVXD3-DUa_2V=Yj9THvNE=wWMNH5VA@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 17 Oct 2017 11:57:24 -0700
Message-ID: <CAGXu5jKb9J5mZqSMrWqvUkq0sU_jWmvUTwFGk6eh0eJHB0L0CA@mail.gmail.com>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Oct 17, 2017 at 11:47 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Oct 17, 2017 at 8:41 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tue, Oct 17, 2017 at 8:26 PM, Kees Cook <keescook@chromium.org> wrote:
>>> On Tue, Oct 17, 2017 at 8:52 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>>>> On Tue, Oct 17, 2017 at 5:34 PM, Kees Cook <keescook@chromium.org> wrote:
>>
>>>> index dbfb978..d5bc694 100755
>>>> --- a/config.guess
>>>> +++ b/config.guess
>>>> @@ -1021,7 +1021,7 @@ EOF
>>>>         echo ${UNAME_MACHINE}-dec-linux-${LIBC}
>>>>         exit ;;
>>>>      x86_64:Linux:*:*)
>>>> -       echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
>>>> +       echo ${UNAME_MACHINE}-pc-linux-${LIBC}
>>>>         exit ;;
>>>>      xtensa*:Linux:*:*)
>>>>         echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
>>>>
>>>> I still don't know why that makes a difference, but all versions
>>>> prior to gcc-6.1 have the problem for me.
>>>
>>> What happens if you add -mstack-protector-guard=tls ?
>>
>> With gcc-4.8 an earlier, I get build failure:
>>
>> cc1: error: unrecognized command line option "-mstack-protector-guard=tls"
>>
>> With gcc-4.9 and gcc-5, I get this output:
>>
>
> To clarify: with my gcc-4.9/gcc-5 build, -mstack-protector-guard=tls
> has no effect,
> the output is the same as with -mstack-protector-guard=global using the Ubuntu
> compilers of the same version.

Er, okay. So, if -mstack-protector-guard=tls is recognized and
produces references to __stack_chk_guard, something is extremely
wrong.

Stack protector works correctly for me on all the gccs I have, include
the stock builds.

$ gcc --version
gcc (Ubuntu 6.3.0-12ubuntu2) 6.3.0 20170406
...
$ echo "int foo(void) { char X[200]; return 3; }" | gcc -S -x c -c -O0
-mcmodel=kernel -fno-PIE -fstack-protector - -o -
...
        movq    %gs:40, %rax
...
$ echo "int foo(void) { char X[200]; return 3; }" | gcc
-mstack-protector-guard=tls -S -x c -c -O0 -mcmodel=kernel -fno-PIE
-fstack-protector - -o -
...
        movq    %gs:40, %rax
...
$ echo "int foo(void) { char X[200]; return 3; }" | gcc
-mstack-protector-guard=global -S -x c -c -O0 -mcmodel=kernel -fno-PIE
-fstack-protector - -o -
...
        movq    __stack_chk_guard(%rip), %rax
...


$ ~/bin/gcc-4.8/gcc --version
gcc (GCC) 4.8.5
...
$ echo "int foo(void) { char X[200]; return 3; }" | ~/bin/gcc-4.8/gcc
-S -x c -c -O0 -mcmodel=kernel -fno-PIE -fstack-protector - -o -
...
        movq    %gs:40, %rax
...


$ ~/bin/gcc-4.7/gcc --version
gcc (GCC) 4.7.4
...
$ echo "int foo(void) { char X[200]; return 3; }" | ~/bin/gcc-4.7/gcc
-S -x c -c -O0 -mcmodel=kernel -fno-PIE -fstack-protector - -o -
...
        movq    %gs:40, %rax
...


$ ~/bin/gcc-4.4/gcc --version
gcc (GCC) 4.4.4
...
$ echo "int foo(void) { char X[200]; return 3; }" | ~/bin/gcc-4.4/gcc
-S -x c -c -O0 -mcmodel=kernel -fno-PIE -fstack-protector - -o -
...
        movq    %gs:40, %rax
...


-Kees


-- 
Kees Cook
Pixel Security
