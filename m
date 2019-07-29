Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55524 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbfG2QER (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 12:04:17 -0400
Date: Mon, 29 Jul 2019 09:04:12 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: initialize CLANG_FLAGS correctly in the top
 Makefile
Message-ID: <20190729160412.GA100132@archlinux-threadripper>
References: <20190729091517.5334-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729091517.5334-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

On Mon, Jul 29, 2019 at 06:15:17PM +0900, Masahiro Yamada wrote:
> CLANG_FLAGS is initialized by the following line:
> 
>   CLANG_FLAGS     := --target=$(notdir $(CROSS_COMPILE:%-=%))
> 
> ..., which is run only when CROSS_COMPILE is set.
> 
> Some build targets (bindeb-pkg etc.) recurse to the top Makefile.
> 
> When you build the kernel with Clang but without CROSS_COMPILE,
> the same compiler flags such as -no-integrated-as are accumulated
> into CLANG_FLAGS.
> 
> If you run 'make CC=clang' and then 'make CC=clang bindeb-pkg',
> Kbuild will recompile everything needlessly due to the build command
> change.
> 
> Fix this by correctly initializing CLANG_FLAGS.
> 
> Fixes: 238bcbc4e07f ("kbuild: consolidate Clang compiler flags")
> Cc: <stable@vger.kernel.org> # v4.20+
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
