Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:58536 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751895AbeFXCgy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jun 2018 22:36:54 -0400
MIME-Version: 1.0
In-Reply-To: <87r2l4jkgf.fsf@xmission.com>
References: <CAK7LNASMpvFgue9gZ=6Epq_Skt2pvTVOoT9w=SzA_uGR87KP-w@mail.gmail.com>
 <87r2l4jkgf.fsf@xmission.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 24 Jun 2018 11:36:06 +0900
Message-ID: <CAK7LNATmdv+n7i0sJTAQMkbRHRVj-mihJs5nS-oi4fUkB8x8qg@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v4.18
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.

2018-06-18 22:25 GMT+09:00 Eric W. Biederman <ebiederm@xmission.com>:
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
>> - drop CONFIG_CROSS_COMPILE support
>
> aka
>> commit f1089c92da791034af73478159626007cba7f092
>> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Date:   Mon May 28 18:21:39 2018 +0900
>>
>>     kbuild: remove CONFIG_CROSS_COMPILE support
>>
>>     Kbuild provides a couple of ways to specify CROSS_COMPILE:
>>
>>     [1] Command line
>>     [2] Environment
>>     [3] arch/*/Makefile (only some architectures)
>>     [4] CONFIG_CROSS_COMPILE
>>
>>     [4] is problematic for the compiler capability tests in Kconfig.
>>     CONFIG_CROSS_COMPILE allows users to change the compiler prefix from
>>     'make menuconfig', etc.  It means, the compiler options would have
>>     to be all re-calculated everytime CONFIG_CROSS_COMPILE is changed.
>>
>>     To avoid complexity and performance issues, I'd like to evaluate
>>     the shell commands statically, i.e. only parsing Kconfig files.
>>
>>     I guess the majority is [1] or [2].  Currently, there are only
>>     5 defconfig files that specify CONFIG_CROSS_COMPILE.
>>       arch/arm/configs/lpc18xx_defconfig
>>       arch/hexagon/configs/comet_defconfig
>>       arch/nds32/configs/defconfig
>>       arch/openrisc/configs/or1ksim_defconfig
>>       arch/openrisc/configs/simple_smp_defconfig
>>
>>     Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>     Reviewed-by: Kees Cook <keescook@chromium.org>
>>
>
> I just started working against 4.18-rc1 and discovered this.
>
> This has broken my setup for building and testing changes on other
> architectures.  I have to put the name of the compiler prefix somewhere.
> The mapping between the prefix to gcc and the linux architecture is
> non-trivial.  Especially with a lot of architectures in the test pool.
>
> I am tired and frustrated this morning as this is going to keep me from
> getting done what I had planned today.
>
> This is a regression pure and simple.  It breaks my workflow.  Please
> fix it.
>
> Eric
>

Sorry, I cannot fix.

As I mentioned in the commit log,
CONFIG_CROSS_COMPILE cannot co-exist with the new Kconfig feature.

Only the possible fix is to revert almost all Kbuild/Kconfig commits
merged in the previous MW, but I do not want to.



-- 
Best Regards
Masahiro Yamada
