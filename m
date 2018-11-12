Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:34740 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbeKLNUU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Nov 2018 08:20:20 -0500
MIME-Version: 1.0
References: <1541473495-25262-1-git-send-email-yamada.masahiro@socionext.com>
 <1541473495-25262-2-git-send-email-yamada.masahiro@socionext.com>
 <CAKwvOd=JwjVu=uk3egVJxTm9vPcF=Jx2Bexx1Wx=Z-PC38X3Uw@mail.gmail.com>
 <9c4868dd-82fa-aa5c-843e-e1f78ffbc7e2@google.com> <CAK7LNAR32=QWy4jss3M3VSNj0XY=tvgWWTG5ajVEpyYD2J+Z1Q@mail.gmail.com>
 <87pnvb9kc3.fsf@concordia.ellerman.id.au>
In-Reply-To: <87pnvb9kc3.fsf@concordia.ellerman.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 12 Nov 2018 12:28:25 +0900
Message-ID: <CAK7LNATsY3_wy8DL9+g+-AytY6mStwFoeA+CMQdVFkXZ2SKdyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: consolidate Clang compiler flags
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Greg Hackmann <ghackmann@google.com>, Joel Stanley <joel@jms.id.au>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stefan Agner <stefan@agner.ch>, Matthias Kaehlcke <mka@chromium.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>

On Mon, Nov 12, 2018 at 10:05 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> > On Sat, Nov 10, 2018 at 3:35 AM Greg Hackmann <ghackmann@google.com> wrote:
> >>
> >> On 11/09/2018 10:29 AM, Nick Desaulniers wrote:
> >> > On Mon, Nov 5, 2018 at 7:05 PM Masahiro Yamada
> >> > <yamada.masahiro@socionext.com> wrote:
> >> >>
> >> >> Collect basic Clang options such as --target, --prefix, --gcc-toolchain,
> >> >> -no-integrated-as into a single variable CLANG_FLAGS so that it can be
> >> >> easily reused in other parts of Makefile.
> >> >>
> >> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> >> ---
> >> >>
> >> >> Changes in v2:
> >> >>   - Use := flavor instead of = because $(CLANG_FLAGS) is expanded soon anyway
> >> >>
> >> >>   Makefile | 13 ++++++-------
> >> >>   1 file changed, 6 insertions(+), 7 deletions(-)
> >> >>
> >> >> diff --git a/Makefile b/Makefile
> >> >> index da11700..e173a73 100644
> >> >> --- a/Makefile
> >> >> +++ b/Makefile
> >> >> @@ -487,18 +487,17 @@ endif
> >> >>
> >> >>   ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> >> >>   ifneq ($(CROSS_COMPILE),)
> >> >> -CLANG_TARGET   := --target=$(notdir $(CROSS_COMPILE:%-=%))
> >> >> +CLANG_FLAGS    := --target=$(notdir $(CROSS_COMPILE:%-=%))
> >> >>   GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
> >> >> -CLANG_PREFIX   := --prefix=$(GCC_TOOLCHAIN_DIR)
> >> >> +CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)
> >> >>   GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> >> >>   endif
> >> >>   ifneq ($(GCC_TOOLCHAIN),)
> >> >> -CLANG_GCC_TC   := --gcc-toolchain=$(GCC_TOOLCHAIN)
> >> >> +CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
> >> >>   endif
> >> >> -KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> >> >> -KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> >> >> -KBUILD_CFLAGS += -no-integrated-as
> >> >> -KBUILD_AFLAGS += -no-integrated-as
> >> >> +CLANG_FLAGS    += -no-integrated-as
> >> >> +KBUILD_CFLAGS  += $(CLANG_FLAGS)
> >> >> +KBUILD_AFLAGS  += $(CLANG_FLAGS)
> >> >>   endif
> >> >>
> >> >>   RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern -mindirect-branch-register
> >> >> --
> >> >> 2.7.4
> >> >>
> >> >
> >> > Thanks for this patch, Masahiro, it's a good simplification.
> >> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> >> >
> >> > Would you mind waiting for a tested-by from Stefan, and maybe an ack
> >> > from Greg (added to cc)?
> >> >
> >>
> >> Acked-by: Greg Hackmann <ghackmann@google.com>
> >
> >
> > Thanks for your review!
> >
> >
> > So, how to organize this series, and Joel's one together?
> >
> > I'd like Joel to use this series as a base for his work.
> > (https://lore.kernel.org/patchwork/patch/1006696/)
> >
> > It will be much cleaner.
> >
> >
> > Shall I merge all the patches to kbuild tree, or
> > maybe will they go through powerpc tree?
>
> Joel's changes are fairly small so you may as well merge them along with
> the rest of the series, if that's OK with you and Joel.


OK, I will.


Joel,
If you send v2, I will merge it to kbuild tree.



Thanks.



-- 
Best Regards
Masahiro Yamada
