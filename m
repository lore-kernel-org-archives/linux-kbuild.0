Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:32829 "EHLO
        mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751714AbdFNQiP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jun 2017 12:38:15 -0400
Received: by mail-pf0-f181.google.com with SMTP id 83so2867385pfr.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jun 2017 09:38:15 -0700 (PDT)
Date: Wed, 14 Jun 2017 09:38:13 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 1/4] kbuild: Add cc-option-raw macro
Message-ID: <20170614163813.GM141096@google.com>
References: <20170613230854.112282-1-mka@chromium.org>
 <20170613230854.112282-2-mka@chromium.org>
 <CAK7LNAQ5zNgKLEfij_Ch1KyuFnK=6XudqDekJkXF=3uRZkEZuA@mail.gmail.com>
 <CAK8P3a0mdWAOLrEStcVLka-XAWMmyypPwZT5nSJB2gFvyxOLAQ@mail.gmail.com>
 <fd23743c-93a1-a5e2-dd70-c46b07032cfd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd23743c-93a1-a5e2-dd70-c46b07032cfd@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

El Wed, Jun 14, 2017 at 10:32:20AM +0200 Michal Marek ha dit:

> Dne 14.6.2017 v 09:31 Arnd Bergmann napsal(a):
> > On Wed, Jun 14, 2017 at 3:27 AM, Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> >> 2017-06-14 8:08 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> >>> cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
> >>> whether an option is supported or not. This is fine for options used to
> >>> build the kernel itself, however some components like the x86 boot code
> >>> use a different set of flags.
> >>>
> >>> Add the new macro cc-option-raw which serves the same purpose as
> >>> cc-option but has additional parameters. One parameter is the compiler
> >>> with which the check should be performed, the other the compiler options
> >>> to be used instead KBUILD_C*FLAGS. The compiler parameter allows other
> >>> macros like hostcc-option to be implemented on top of cc-option-raw.
> >>>
> >>> Also rework cc-option to make use of cc-option-raw.
> >>>
> >>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> >>> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >>> ---
> >>> Changes in v2:
> >>> - Changed macro name from Add cc-option-no-kbuild to cc-option-raw
> >>> - Added compiler as parameter to the macro
> >>> - Reworked cc-option to make use of cc-option-raw
> >>> - Updated commit message
> >>>
> >>>  scripts/Kbuild.include | 9 +++++++--
> >>>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>>
> >>
> >> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> (if nothing better pops up)
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Acked-by: Michal Marek <mmarek@suse.com>
> 
> 
> > Regarding the naming, __cc-option might be better than cc-option-raw,
> > but the current version is fine too.
> 
> I have no strong opinion either way :).

I'm going to change it to __cc-option since there is a slight
preference for it and I have to respin the series anyway. I'll wait
a bit for feedback from the x86 folks before sending the new version.
