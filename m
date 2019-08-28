Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35835 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfH1SRY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 14:17:24 -0400
Date: Wed, 28 Aug 2019 11:17:19 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
Message-ID: <20190828181719.GA127646@archlinux-threadripper>
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828055425.24765-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

On Wed, Aug 28, 2019 at 02:54:24PM +0900, Masahiro Yamada wrote:
> Instead of the warning-[123] magic, let's accumulate compiler options
> to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
> easier to understand what is going on in this file.
> 
> This commit slightly changes the behavior, I think all of which are OK.
> 
> [1] Currently, cc-option calls are needlessly evaluated. For example,
>       warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
>     needs evaluating only when W=3, but it is actually evaluated for
>     W=1, W=2 as well. With this commit, only relevant cc-option calls
>     will be evaluated. This is a slight optimization.
> 
> [2] Currently, unsupported level like W=4 is checked by:
>       $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
>     This will no longer be checked, but I do not think it is a big
>     deal.
> 
> [3] Currently, 4 Clang warnings (Winitializer-overrides, Wformat,
>     Wsign-compare, Wformat-zero-length) are shown by any of W=1, W=2,
>     and W=3. With this commit, they will be warned only by W=1. I
>     think this is a more correct behavior since each warning belongs
>     to only one warning level.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
