Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:55478 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932990AbdJQPeZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 11:34:25 -0400
Received: by mail-it0-f53.google.com with SMTP id l196so2836811itl.4
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2017 08:34:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
References: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
 <CAK8P3a3OZTvvT1m167Ocajo0yTLbb2q6Jq53tZGWUFuUaboibA@mail.gmail.com> <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 17 Oct 2017 08:34:24 -0700
Message-ID: <CAGXu5j+1+rLA4uOrEv9yc9RE9Rna4QVsNqfg0zTDSMZ6VwGzaw@mail.gmail.com>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Oct 17, 2017 at 8:26 AM, Kees Cook <keescook@chromium.org> wrote:
> On Tue, Oct 17, 2017 at 8:23 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tue, Oct 17, 2017 at 1:00 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> Hi Kees,
>>>
>>> On my test box, current linux-next kernels fail to build due to the
>>> patch that introduces CONFIG_CC_STACKPROTECTOR_AUTO, with my mainline
>>> gcc
>>> builds up to gcc-5.5.0. gcc-6 and higher work fine, as
>>> scripts/gcc-x86_64-has-stack-protector.sh returns 'y' for those.
>>>
>>> Using the compilers provided by Ubuntu (4.6/4.7/4.8/4.9), everything
>>> also works as expected, so my interpretation is that mainline gcc did
>>> not enable the stack protector until gcc-6, while distributions did.
>>>
>>> Do you agree with that interpretation?
>>
>> It's probably a little different. I tried bisecting the gcc commit that fixed
>> the issue for me, and ended up with this commit
>>
>> https://gitlab.indel.ch/thirdparty/gcc/commit/c14bac81551d6769741c2b1cc55e04d94fe8d3a7
>>
>> that caused the target to change from x86_64-unknown-linux to
>> x86_64-pc-linux, and apparently caused the compiler bootstrap
>> to incorrectly identify the capabilities of the assembler. As a result,
>> the assembler output inside of scripts/gcc-x86_64-has-stack-protector.sh
>> that should be
>> [snip]
>
> Yeah, %gs: vs __stack_chk_guard global.
>
> Do you know which gccs (of the past) had this?
>
> akpm's build error is different still, there are no warnings at all
> and then the build fails with missing __stack_chks. I'm still trying
> to figure that one out.

Oh, I think I know what's happening. I'm going to try to simulate this
and send another patch for testing...

(I'm still curious about the compiler versions, since my gcc 4.4.4
works fine for stack-protector.)

-Kees

-- 
Kees Cook
Pixel Security
