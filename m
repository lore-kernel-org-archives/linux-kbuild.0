Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25561 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbdFPAtK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2017 20:49:10 -0400
MIME-Version: 1.0
In-Reply-To: <20170615173715.40882-2-mka@chromium.org>
References: <20170615173715.40882-1-mka@chromium.org> <20170615173715.40882-2-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Jun 2017 09:48:50 +0900
Message-ID: <CAK7LNATWoG9ZWG+7rhF2HFXNjUzm=GgiKgJiG14f=e2fqQ0sGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] kbuild: Add __cc-option macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

2017-06-16 2:37 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
> whether an option is supported or not. This is fine for options used to
> build the kernel itself, however some components like the x86 boot code
> use a different set of flags.
>
> Add the new macro __cc-option which is a more generic version of
> cc-option with additional parameters. One parameter is the compiler
> with which the check should be performed, the other the compiler options
> to be used instead KBUILD_C*FLAGS.
>
> Refactor cc-option and hostcc-option to use __cc-option and move
> hostcc-option to scripts/Kbuild.include.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada
