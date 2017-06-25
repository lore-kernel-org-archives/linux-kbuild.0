Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:27482 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750739AbdFYEEl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Jun 2017 00:04:41 -0400
MIME-Version: 1.0
In-Reply-To: <20170622085848.kot52wfxsntruoaz@gmail.com>
References: <20170621232805.149448-1-mka@chromium.org> <20170622085848.kot52wfxsntruoaz@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 25 Jun 2017 13:04:20 +0900
Message-ID: <CAK7LNAR42bAD_jX2esGquRUDcjLMEdrw9wp76qhP36gkQrKWew@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] x86: stack alignment for boot code and clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

2017-06-22 17:58 GMT+09:00 Ingo Molnar <mingo@kernel.org>:
>
> * Matthias Kaehlcke <mka@chromium.org> wrote:
>
>> This series fixes an issue with the stack of the x86 boot code not
>> being aligned as intended. Further it adapts the Makefile to account
>> for the fact that clang uses a different option to configure the
>> stack alignment than gcc (-mstack-alignment=N vs
>> -mpreferred-stack-boundary=N)
>>
>> Collaterally the series adds the new kbuild macro __cc-option and
>> refactors the macros cc-option and hostcc-option to make use of
>> __cc-option.
>>
>> Matthias Kaehlcke (3):
>>   kbuild: Add __cc-option macro
>>   x86/build: Use __cc-option for boot code compiler options
>>   x86/build: Specify stack alignment for clang
>>
>>  Makefile               |  2 +-
>>  arch/x86/Makefile      | 33 +++++++++++++++++++++++++--------
>>  scripts/Kbuild.include | 14 ++++++++++++--
>>  scripts/Makefile.host  |  6 ------
>>  4 files changed, 38 insertions(+), 17 deletions(-)
>
> So given that there are non-trivial kbuild changes here, I'd suggest these patches
> might have a better home in the kbuild tree. For the x86 bits:
>
> Acked-by: Ingo Molnar <mingo@kernel.org>
>
> Thanks,
>
>         Ingo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html




Series applied to linux-kbuild/kbuild.




-- 
Best Regards
Masahiro Yamada
