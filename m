Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:40130 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753180AbeC1Lw6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 07:52:58 -0400
MIME-Version: 1.0
In-Reply-To: <CAGXu5jK48XYSpga0M-49GPrMT3iud7rqEOD7ZpKQR-MXi=zjWw@mail.gmail.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
 <1522128575-5326-15-git-send-email-yamada.masahiro@socionext.com> <CAGXu5jK48XYSpga0M-49GPrMT3iud7rqEOD7ZpKQR-MXi=zjWw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 28 Mar 2018 20:52:01 +0900
Message-ID: <CAK7LNAQAvt7uWyY+FdnKfxzMBXHAgkxmycKm+-NRHYxo1LtLJA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] kconfig: add CC_IS_CLANG and CLANG_VERSION
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

2018-03-28 20:22 GMT+09:00 Kees Cook <keescook@chromium.org>:
> On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> This will be useful to describe the clang version dependency.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> One aspect of clang version checking that may be "weird" (and likely
> won't be meaningful for very long as we're about to raise the minimum
> gcc version), is that clang claims to be gcc version 4.2 if you look
> at #defines. This is already handled in compiler.h, but may be weird
> in Kconfig.
>


CONFIG_CLANG_VERSION gives me real clang version.


$ clang --version
clang version 7.0.0 (http://llvm.org/git/clang.git
f1d1f4c4591e81cfa80034df094b26d7eb4fa92b)
(http://llvm.org/git/llvm.git
d157ba2f80790d23d717c4ff3f5bee30d98d6a51)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /home/masahiro/toolchains/clang-latest/bin

$ make CC=clang defconfig
*** Default configuration is based on 'x86_64_defconfig'
#
# configuration written to .config
#
$ grep  CLANG_VERSION .config
CONFIG_CLANG_VERSION=70000



I am just porting
https://patchwork.kernel.org/patch/10085765/
to Kconfig.


-- 
Best Regards
Masahiro Yamada
