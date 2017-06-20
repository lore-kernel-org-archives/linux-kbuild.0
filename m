Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f50.google.com ([74.125.83.50]:35539 "EHLO
        mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750987AbdFTRhY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jun 2017 13:37:24 -0400
Received: by mail-pg0-f50.google.com with SMTP id 132so31962755pgb.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jun 2017 10:37:23 -0700 (PDT)
Date: Tue, 20 Jun 2017 10:37:21 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v4 3/3] x86/build: Specify stack alignment for clang
Message-ID: <20170620173721.GA52338@google.com>
References: <20170619183757.124992-1-mka@chromium.org>
 <20170619183757.124992-4-mka@chromium.org>
 <EAA687B2-ECD0-42C7-907E-BE8BDF311EC1@zytor.com>
 <20170619204704.GP141096@google.com>
 <20170620092054.7d2mgzx6cw3jvgji@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170620092054.7d2mgzx6cw3jvgji@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: hpa@zytor.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

El Tue, Jun 20, 2017 at 11:20:54AM +0200 Ingo Molnar ha dit:

> 
> * Matthias Kaehlcke <mka@chromium.org> wrote:
> 
> > Ingo didn't like the duplication and suggested the use of a variable, which 
> > kinda implies a check for the compiler name.
> 
> I don't think it implies that: why cannot cc_stack_align_opt probe for the 
> compiler option and use whichever is available, without hard-coding the compiler 
> name?

We could do this:

ifneq ($(call __cc-option, $(CC), -mno-sse, -mpreferred-stack-boundary=3,),)
        cc_stack_align_opt := -mpreferred-stack-boundary
endif
ifneq ($(call cc-option, -mstack-alignment=3,),)
        cc_stack_align_opt := -mstack-alignment
endif

If preferred cc-option could be used to probe for
-mpreferred-stack-boundary , however it would require REALMODE_CFLAGS
to be moved further down in the Makefile.

Since this solution also won't win a beauty price please let me know
if it is acceptable before respinning the patch or if you have other
suggestions.

> > I also think this is a cleaner solution. [...]
> 
> I concur with hpa: hard-coding compiler is awfully fragile and ugly as well.
> 
> With the proper probing of compiler options it will be possible for compilers to 
> consolidate their options, and it would be possible for a third compiler to use a 
> mixture of GCC and Clang options. With hard-coding none of that flexibility is 
> available.
> 
> > but I'm happy to respin the patch if you have another suggestion that is ok for 
> > both of you.
> 
> Please do.
> 
> Thanks,
> 
> 	Ingo
