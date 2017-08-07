Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f54.google.com ([74.125.83.54]:36185 "EHLO
        mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751505AbdHGSdg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Aug 2017 14:33:36 -0400
Received: by mail-pg0-f54.google.com with SMTP id v77so4732963pgb.3
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Aug 2017 11:33:36 -0700 (PDT)
Date: Mon, 7 Aug 2017 11:33:33 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 1/2] kbuild: Add macros cc-option-3 and __cc-option-3
Message-ID: <20170807183333.GK84665@google.com>
References: <20170721215657.81631-1-mka@chromium.org>
 <20170802164650.GG84665@google.com>
 <CAK7LNAQY6eWiD=JVFbKtEoq2pdLhGJc18OfP97GkyVuFUoAEpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQY6eWiD=JVFbKtEoq2pdLhGJc18OfP97GkyVuFUoAEpA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>

Hi Masahiro,

El Mon, Aug 07, 2017 at 10:01:41AM +0900 Masahiro Yamada ha dit:

> Hi Matthias,
> 
> Sorry for my late reply.
> 
> 2017-08-03 1:46 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> > El Fri, Jul 21, 2017 at 02:56:56PM -0700 Matthias Kaehlcke ha dit:
> >
> >> The macro cc-option receives two parameters (the second may be empty). It
> >> returns the first parameter if it is a valid compiler option, otherwise
> >> the second one. It is not evaluated if the second parameter is a valid
> >> compiler option. This seems to be fine in virtually all cases, however
> >> there are scenarios where the second paramater needs to be evaluated too,
> >> and an empty value (or a third option) should be returned if it is not
> >> valid.
> >>
> >> The macro cc-option-3 receives three parameters and returns parameter 1
> >> or 2 (in this order) if one of them is found to be a valid compiler
> >> option, and otherwise paramater 3. The macro __cc-option-3 works
> >> analogously.
> >
> > Any comment on this?
> >
> > Thanks
> >
> > Matthias
> >
> >> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >> ---
> >>  scripts/Kbuild.include | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> >> index dd8e2dde0b34..dc83635f2317 100644
> >> --- a/scripts/Kbuild.include
> >> +++ b/scripts/Kbuild.include
> >> @@ -113,6 +113,11 @@ as-instr = $(call try-run,\
> >>  __cc-option = $(call try-run,\
> >>       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> >>
> >> +# __cc-option-3
> >> +# Usage: MY_CFLAGS += $(call __cc-option-3,$(CC),$(MY_CFLAGS),\
> >> +#    -mpreferred-stack-boundary=2,-mstack-alignment=4,)
> >> +__cc-option-3 = $(call __cc-option,$(1),$(2),$(3),$(call __cc-option,$(1),$(2),$(4),$(5)))
> >> +
> >>  # Do not attempt to build with gcc plugins during cc-option tests.
> >>  # (And this uses delayed resolution so the flags will be up to date.)
> >>  CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
> >> @@ -123,6 +128,10 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
> >>  cc-option = $(call __cc-option, $(CC),\
> >>       $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
> >>
> >> +# cc-option-3
> >> +# Usage: cflags-y += $(call cc-option-3,-mpreferred-stack-boundary=3,-mstack-alignment=8,)
> >> +cc-option-3 = $(call cc-option,$(1),$(call cc-option,$(2),$(3)))
> 
> 
> I do not like this macro much for the following reasons:
> 
> 
> [1]
> I guess your motivation is to evaluate the second option,
> not receive the third option.

In this case yes, a future use case could be to support another
compiler with different option names, but I suppose we can focus
on the present for now.

> If this is the demand, I thought it might be nicer to
> change cc-option to always evaluate the second option.

I considered that, but was reluctant to change current behavior,
though in practice it shouldn't make a difference.

> (I do no have a good idea for the implementation.)

One option could be a variant of the try-run macro, that receives the
'base command' as first parameter:

try-run-opt = $(shell set -e;           \
        TMP="$(TMPOUT).$$$$.tmp";       \
        TMPO="$(TMPOUT).$$$$.o";        \
        if ($(1) $(2)) >/dev/null 2>&1; \
        then echo "$(2)";               \
        elif [ -n "${3}" ] && ($(1) $(3)) >/dev/null 2>&1;      \
        then echo "$(3)";               \
        else echo "";                   \
        fi;                             \
        rm -f "$$TMP" "$$TMPO")

__cc-option = $(call try-run-opt,\
        $(1) -Werror $(2) -c -x c /dev/null -o "$$TMP",$(3),$(4))

try-run-opt assumes that is is valid to append an option to the end
of the base command.

For consistency we'd probably want to adapt other suitable xx-option
macros as well.

Does this look reasonable to you?

> cc-option-3 = $(call cc-option,$(1),$(call cc-option,$(2),$(3)))
> 
> evaluates the inner $(call cc-option,) first.
> 
> This works a bit differently from our expectation.
> 
> 
> For example, let's consider the following case.
> 
>  $(call cc-option-3,-Oz,-Os,-O2)
> 
> 
> I think we generally expect -Oz, -Os are tested in this order.
> (If -Oz is supported by the compiler, the test for -Os will be skipped.)
> 
> 
> In fact, cc-option-3 tests  -Os, -Oz in this order
> because inner cc-option is evaluated before the outer one.
> The test for -Os may or may not be necessary.

I agree, running the check for the alternative options always is not
desirable.
