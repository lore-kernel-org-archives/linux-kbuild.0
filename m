Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33905 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729083AbfGYQwJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 12:52:09 -0400
Date: Thu, 25 Jul 2019 09:52:04 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: Check for unknown options with cc-option and
 clang in Kbuild
Message-ID: <20190725165204.GA80773@archlinux-threadripper>
References: <20190724235030.131144-1-swboyd@chromium.org>
 <20190725051857.GA53904@archlinux-threadripper>
 <5d39cda7.1c69fb81.6e01c.0e70@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d39cda7.1c69fb81.6e01c.0e70@mx.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, Peter Smith <peter.smith@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Douglas Anderson <dianders@chromium.org>

On Thu, Jul 25, 2019 at 08:41:25AM -0700, Stephen Boyd wrote:
> Quoting Nathan Chancellor (2019-07-24 22:18:57)
> > Hi Stephen,
> > 
> > Was the second Kbuild in the subject line supposed to be Kconfig?
> 
> Sure. I'll change it to Kconfig.
> 
> > 
> > On Wed, Jul 24, 2019 at 04:50:30PM -0700, Stephen Boyd wrote:
> > > If the particular version of clang a user has doesn't enable
> > > -Werror=unknown-warning-option by default, even though it is the
> > > default[1], then make sure to pass the option to the Kconfig cc-option
> > 
> > Hmmm interesting, I did not even know that was possible... Is that a
> > clang configuration option or an out of tree patch? Looks like it has
> > been on by default since clang 3.2: https://godbolt.org/z/mOmusu
> 
> I asked and it turns out that we force this flag off in the ChromeOS
> toolchain so that we can compile the multitude of packages in our system
> that assume various GCC specific warning flags. I guess this is easier
> than patching all the Makefiles out there.

Ah, that makes sense. I forget that most versions of clang have to
compile thousands of packages and such.

> 
> > 
> > > command so that testing options from Kconfig files works properly.
> > > Otherwise, depending on the default values setup in the clang toolchain
> > > we will silently assume options such as -Wmaybe-uninitialized are
> > > supported by clang, when they really aren't.
> > > 
> > > This issue only started happening for me once commit 589834b3a009
> > > ("kbuild: Add -Werror=unknown-warning-option to CLANG_FLAGS") was
> > > applied on top of commit b303c6df80c9 ("kbuild: compute false-positive
> > > -Wmaybe-uninitialized cases in Kconfig"). This leads kbuild to try and
> > 
> > Prior to 589834b3a009, how did cc-option work at all if
> > -Wunknown-warning-option wasn't enabled by default? I assume that clang
> > would just eat any unknown flags while returning zero so it looked like
> > the flag was supported?
> 
> Yes. But just warning options?
> 
> > 
> > > test for the existence of the -Wmaybe-uninitialized flag with the
> > > cc-option command in scripts/Kconfig.include, and it doesn't see an
> > > error returned from the option test so it sets the config value to Y.
> > 
> > It might be worth explicitly saying somewhere in here that clang will
> > not error on unknown flags without -Werror + -Wunknown-warning-option.
> 
> I think it warns on unknown flags, just not unknown warning options
> (-Wfoo), so I didn't mention this.

Ah right, duh (it's in the name of the option...), sorry wasn't
thinking.

> 
> > 
> > > Then the makefile tries to pass the unknown option on the command line
> > > and -Werror=unknown-warning-option catches the invalid option and breaks
> > > the build.
> > > 
> > > Note: this doesn't change the cc-option tests in Makefiles, because
> > > those use a different rule that includes KBUILD_CFLAGS by default, and
> > > the KBUILD_CFLAGS already has -Werror=unknown-warning-option. Thanks to
> > > Doug for pointing out the different rule.
> > > 
> > > [1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
> > > Cc: Peter Smith <peter.smith@linaro.org>
> > > Cc: Nathan Chancellor <natechancellor@gmail.com>
> > > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > 
> > > Change-Id: I3bb69d45bb062d1306acbf19bc0adfb60f706442
> > 
> > I assume that shouldn't be there?
> > 
> > Overall, seems okay to me (took me a sec to understand the bug,
> > certainly a very specific one). It might make sense to explicitly add
> > somewhere in the commit message that this syncs cc-option behavior
> > between Kconfig and Kbuild as a whole, as I didn't understand that at
> > first. Thanks for the triage and sorry for the breakage!
> > 
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> I reworded the commit text a bit now and I'll resend it soon. Thanks for
> the review.
> 

Cheers,
Nathan
