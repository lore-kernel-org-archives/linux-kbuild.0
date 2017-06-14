Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:52049 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751821AbdFNHkw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jun 2017 03:40:52 -0400
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3wSbRiBp5xTz=L+NfkYOjDym0eq6c6VPq4w-qDEw0Kog@mail.gmail.com>
References: <20170613230854.112282-1-mka@chromium.org> <20170613230854.112282-3-mka@chromium.org>
 <CAK8P3a3wSbRiBp5xTz=L+NfkYOjDym0eq6c6VPq4w-qDEw0Kog@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Jun 2017 16:40:37 +0900
Message-ID: <CAK7LNATLopr81QFViOWPakYeR9udkj6FDEPDw3HtjyOWd1yM4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] kbuild: Add hostcc-option macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Matthias Kaehlcke <mka@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.com>, the arch/x86 maintainers <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

Hi Arnd,


2017-06-14 16:26 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Wed, Jun 14, 2017 at 1:08 AM, Matthias Kaehlcke <mka@chromium.org> wrote:
>> hostcc-option is equivalent to cc-option, but uses the host compiler
>> and HOSTCFLAGS. Change HOSTCFLAGS to a simple expanded variable to
>> allow for HOSTCFLAGS += $(call hostcc-option, ...).
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>
> Actually, we already have a hostcc-option macro. What I meant with my suggestion
> was that we could redefine the existing one using cc-option-raw.
>
> I checked again now and found that while this was added in 2016 by
> Emese Revfy, we apparently don't have any users of the helper in the
> kernel.


Oops, I missed it because
it is defined in scripts/Makefile.host instead of scripts/Kbuild.include


$(call cc-option, ...) is generally used in the top Makefile (or
arch/*/Makefile).


However, scripts/Makefile.host is not included from the top Makefile,
so $(call hostcc-option, ...) is available only under sub-directories.
I guess that is why we had no user of it.

I think the right thing to do
is to remove the former implementation from Makefile.host

Thanks!



-- 
Best Regards
Masahiro Yamada
