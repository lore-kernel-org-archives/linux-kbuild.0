Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33173 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729626AbfH0T2P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 15:28:15 -0400
Date: Tue, 27 Aug 2019 12:28:11 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2] kbuild: enable unused-function warnings for W= build
 with Clang
Message-ID: <20190827192811.GA24626@archlinux-threadripper>
References: <20190827103621.1073-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827103621.1073-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

On Tue, Aug 27, 2019 at 07:36:21PM +0900, Masahiro Yamada wrote:
> GCC and Clang have different policy for -Wunused-function; GCC never
> reports unused-function warnings for 'static inline' functions whereas
> Clang reports them if they are defined in source files instead of
> included headers although it has been suppressed since commit
> abb2ea7dfd82 ("compiler, clang: suppress warning for unused static
> inline functions").
> 
> We often miss to remove unused functions where 'static inline' is used
> in .c files since there is no tool to detect them. Unused code remains
> until somebody notices. For example, commit 075ddd75680f ("regulator:
> core: remove unused rdev_get_supply()").
> 
> Let's remove __maybe_unused from the inline macro to allow Clang to
> start finding unused static inline functions. As always, it is not a
> good idea to sprinkle warnings for the normal build, so I added
> -Wno-unsued-function for no W= build.
> 
> Per the documentation [1], -Wno-unused-function will also disable
> -Wunneeded-internal-declaration, which can help find bugs like
> commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
> I added -Wunneeded-internal-declaration to address it.
> 
> If you contribute to code clean-up, please run "make CC=clang W=1"
> and check -Wunused-function warnings. You will find lots of unused
> functions.
> 
> Some of them are false-positives because the call-sites are disabled
> by #ifdef. I do not like to abuse the inline keyword for suppressing
> unused-function warnings because it is intended to be a hint for the
> compiler's optimization. I prefer __maybe_unused or #ifdef around the
> definition.
> 
> [1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

I am still not a big fan of this as I think it weakens clang as a
standalone compiler but the change itself looks good so if it is going
in anyways:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

I'm sure Nick would like to weigh in as well before this gets merged.
