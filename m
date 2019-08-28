Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34526 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfH1SUW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 14:20:22 -0400
Date: Wed, 28 Aug 2019 11:20:17 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 2/2] kbuild: allow Clang to find unused static inline
 functions for W=1 build
Message-ID: <20190828182017.GB127646@archlinux-threadripper>
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <20190828055425.24765-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828055425.24765-2-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Sven Schnelle <svens@stackframe.org>, Xiaozhou Liu <liuxiaozhou@bytedance.com>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

On Wed, Aug 28, 2019 at 02:54:25PM +0900, Masahiro Yamada wrote:
> GCC and Clang have different policy for -Wunused-function; GCC does not
> warn unused static inline functions at all whereas Clang does if they
> are defined in source files instead of included headers although it has
> been suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
> warning for unused static inline functions").
> 
> We often miss to delete unused functions where 'static inline' is used
> in *.c files since there is no tool to detect them. Unused code remains
> until somebody notices. For example, commit 075ddd75680f ("regulator:
> core: remove unused rdev_get_supply()").
> 
> Let's remove __maybe_unused from the inline macro to allow Clang to
> start finding unused static inline functions. For now, we do this only
> for W=1 build since it is not a good idea to sprinkle warnings for the
> normal build.
> 
> My initial attempt was to add -Wno-unused-function for no W=1 build
> (https://lore.kernel.org/patchwork/patch/1120594/)
> 
> Nathan Chancellor pointed out that would weaken Clang's checks since
> we would no longer get -Wunused-function without W=1. It is true GCC
> would detect unused static non-inline functions, but it would weaken
> Clang as a standalone compiler at least.
> 
> Here is a counter implementation. The current problem is, W=... only
> controls compiler flags, which are globally effective. There is no way
> to narrow the scope to only 'static inline' functions.
> 
> This commit defines KBUILD_EXTRA_WARN[123] corresponding to W=[123].
> When KBUILD_EXTRA_WARN1 is defined, __maybe_unused is omitted from
> the 'inline' macro.
> 
> This makes the code a bit uglier, so personally I do not want to carry
> this forever. If we can manage to fix most of the warnings, we can
> drop this entirely, then enable -Wunused-function all the time.
> 
> If you contribute to code clean-up, please run "make CC=clang W=1"
> and check -Wunused-function warnings. You will find lots of unused
> functions.
> 
> Some of them are false-positives because the call-sites are disabled
> by #ifdef. I do not like to abuse the inline keyword for suppressing
> unused-function warnings because it is intended to be a hint for the
> compiler optimization. I prefer #ifdef around the definition, or
> __maybe_unused if #ifdef would make the code too ugly.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I can still see warnings from static unused functions and with W=1, I
see plenty more. I agree that this is uglier because of the
__inline_maybe_unused but I think this is better for regular developers.
I will try to work on these unused-function warnings!

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
