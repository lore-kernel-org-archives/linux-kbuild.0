Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51432 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753323AbdFNB2d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 21:28:33 -0400
MIME-Version: 1.0
In-Reply-To: <20170613230854.112282-3-mka@chromium.org>
References: <20170613230854.112282-1-mka@chromium.org> <20170613230854.112282-3-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Jun 2017 10:28:28 +0900
Message-ID: <CAK7LNATA1HX8hNOiyesOTcVz+vOU2YJ502H5Mg2WF-268M9vdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] kbuild: Add hostcc-option macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

2017-06-14 8:08 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> hostcc-option is equivalent to cc-option, but uses the host compiler
> and HOSTCFLAGS. Change HOSTCFLAGS to a simple expanded variable to
> allow for HOSTCFLAGS += $(call hostcc-option, ...).
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

-- 
Best Regards
Masahiro Yamada
