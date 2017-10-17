Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:44327 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762484AbdJQPdm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 11:33:42 -0400
MIME-Version: 1.0
In-Reply-To: <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
References: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
 <CAK8P3a3OZTvvT1m167Ocajo0yTLbb2q6Jq53tZGWUFuUaboibA@mail.gmail.com> <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 17 Oct 2017 17:33:41 +0200
Message-ID: <CAK8P3a3nOB__n2jCWLA5kEoyCa6iD=mWwOn1c1nntmgGAA_8rA@mail.gmail.com>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Oct 17, 2017 at 5:26 PM, Kees Cook <keescook@chromium.org> wrote:
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

The commit I linked to went into gcc-6.1.0, everything before that
version is affected for me. I tried gcc-4.{3,4,5,6,7,8,9} and gcc-5.5.

I'm still trying to figure out which part of the config.guess change
caused exactly fixed it and why.

       Arnd
