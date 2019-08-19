Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46846 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfHSQ7J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 12:59:09 -0400
MIME-Version: 1.0
References: <20190819105138.5053-1-yamada.masahiro@socionext.com> <20190819160920.GA108942@archlinux-threadripper>
In-Reply-To: <20190819160920.GA108942@archlinux-threadripper>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 20 Aug 2019 01:58:26 +0900
Message-ID: <CAK7LNARDQPixBfWp8od1=13w+hcycYbyTX9+G-gqEHHwXxDCvA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: enable unused-function warnings for W= build with Clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Paul Burton <paul.burton@mips.com>, Xiaozhou Liu <liuxiaozhou@bytedance.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Nathan,

On Tue, Aug 20, 2019 at 1:09 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Aug 19, 2019 at 07:51:38PM +0900, Masahiro Yamada wrote:
> > GCC and Clang have different policy for -Wunused-function; GCC does
> > not report unused-function warnings at all for the functions marked
> > as 'static inline'. Clang does report unused-function warnings if they
> > are defined in source files instead of headers.
> >
> > We could use Clang for detecting unused functions, but it has been
> > suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
> > warning for unused static inline functions").
> >
> > So, we never notice left-over code if functions in .c files are
> > marked as inline.
> >
> > Let's remove __maybe_unused from the inline macro. As always, it is
> > not a good idea to sprinkle warnings for the normal build. So, these
> > warnings will be shown for the W= build.
> >
> > If you contribute to code clean-up, please run "make CC=clang W=1"
> > and check -Wunused-function warnings. You will find lots of unused
> > functions.
> >
> > Some of them are false-positives because the call-sites are disabled
> > by #ifdef. I do not like to abuse the inline keyword for suppressing
> > unused-function warnings because it might affect the compiler's
> > optimization. When I need to fix unused-functions warnings, I prefer
> > adding #ifdef or __maybe_unused to function definitions.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> So if I understand everything correctly, this change allows us to start
> finding unused static inline functions with clang at W=1 but disables
> -Wunused-function by default... I am not sure that is a good tradeoff
> as I am pretty sure that W=1 is fairly noisy for clang although I
> haven't checked lately. I'd argue most regular developers do not build
> with W=1 meaning -Wunused-function generally will not be run with clang
> at all, missing stuff like this:


Try "git log --grep=W=1"

Some people are making efforts to fix W=1 warnings.
I believe somebody will start to remove unused static inline functions.



>
> https://lore.kernel.org/lkml/20190523010235.GA105588@archlinux-epyc/
>
> https://lore.kernel.org/lkml/1558574945-19275-1-git-send-email-skomatineni@nvidia.com/
>
> Furthermore, per the documemtation [1], -Wno-unused-function will also
> disable -Wunneeded-internal-declaration, which can help find bugs like
> commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> mlxplat_mlxcpld_msn201x_items").
>
> [1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function


How about this?

KBUILD_CFLAGS += -Wno-unused-function
KBUILD_CFLAGS += -Wunneeded-internal-declaration



> Is there a way to conditionally remove __maybe_unused from the inline
> defintion so that we keep the current behavior but we can still
> selectively find potentially unused functions?

It would be possible by tweaking include/linux/compiler_types.h
but I am not a big fan of uglifying the 'inline' replacement any more.


-- 
Best Regards
Masahiro Yamada
