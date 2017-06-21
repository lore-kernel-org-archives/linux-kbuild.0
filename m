Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34415 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751739AbdFUHTD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 03:19:03 -0400
Date: Wed, 21 Jun 2017 09:18:58 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v4 3/3] x86/build: Specify stack alignment for clang
Message-ID: <20170621071858.74cg3vg5wbhpdsht@gmail.com>
References: <20170619183757.124992-1-mka@chromium.org>
 <20170619183757.124992-4-mka@chromium.org>
 <EAA687B2-ECD0-42C7-907E-BE8BDF311EC1@zytor.com>
 <20170619204704.GP141096@google.com>
 <20170620092054.7d2mgzx6cw3jvgji@gmail.com>
 <20170620173721.GA52338@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170620173721.GA52338@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: hpa@zytor.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>


* Matthias Kaehlcke <mka@chromium.org> wrote:

> El Tue, Jun 20, 2017 at 11:20:54AM +0200 Ingo Molnar ha dit:
> 
> > 
> > * Matthias Kaehlcke <mka@chromium.org> wrote:
> > 
> > > Ingo didn't like the duplication and suggested the use of a variable, which 
> > > kinda implies a check for the compiler name.
> > 
> > I don't think it implies that: why cannot cc_stack_align_opt probe for the 
> > compiler option and use whichever is available, without hard-coding the compiler 
> > name?
> 
> We could do this:
> 
> ifneq ($(call __cc-option, $(CC), -mno-sse, -mpreferred-stack-boundary=3,),)
>         cc_stack_align_opt := -mpreferred-stack-boundary
> endif
> ifneq ($(call cc-option, -mstack-alignment=3,),)
>         cc_stack_align_opt := -mstack-alignment
> endif

The principle Looks good to me - but I'd make the second probing an 'else' branch, 
i.e. probe for a suitable compiler option until we find one. That would also not 
burden the GCC build with probing for different compiler options.

Please also add a comment in the code that explains that the first option is a GCC 
option and the second one is a Clang-ism.

> Since this solution also won't win a beauty price please let me know
> if it is acceptable before respinning the patch or if you have other
> suggestions.

This one already looks a lot cleaner to me than any of the previous ones.

Thanks,

	Ingo
