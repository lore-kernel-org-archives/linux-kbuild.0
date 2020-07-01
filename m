Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgGAGB6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 02:01:58 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A2CC061755
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jun 2020 23:01:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r12so22430862wrj.13
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jun 2020 23:01:57 -0700 (PDT)
Date: Wed, 1 Jul 2020 08:01:50 +0200
From: Marco Elver <elver@google.com>
Subject: Re: [PATCH 1/2] kbuild: remove cc-option test of -fno-stack-protector
Message-ID: <20200701060150.GA1181113@elver.google.com>
References: <20200626185913.92890-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626185913.92890-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, x86@kernel.org, linux-efi@vger.kernel.org, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, paulmck@kernel.org

On Sat, Jun 27, 2020 at 03:59AM +0900, Masahiro Yamada wrote:
> Some Makefiles already pass -fno-stack-protector unconditionally.
> For example, arch/arm64/kernel/vdso/Makefile, arch/x86/xen/Makefile.
> No problem report so far about hard-coding this option. So, we can
> assume all supported compilers know -fno-stack-protector.
> 
> GCC 4.8 and Clang support this option (https://godbolt.org/z/_HDGzN)
> 
> Get rid of cc-option from -fno-stack-protector.
> 
> Remove CONFIG_CC_HAS_STACKPROTECTOR_NONE, which should always be 'y'.
> 
> Note:
> arch/mips/vdso/Makefile adds -fno-stack-protector twice, first
> unconditionally, and second conditionally. I removed the second one.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/kconfig-language.rst | 4 ++--
>  Makefile                                  | 2 +-
>  arch/Kconfig                              | 3 ---
>  arch/arm/boot/compressed/Makefile         | 3 +--
>  arch/mips/vdso/Makefile                   | 3 +--
>  arch/powerpc/kernel/Makefile              | 2 +-
>  arch/powerpc/platforms/powermac/Makefile  | 2 +-
>  arch/sparc/vdso/Makefile                  | 4 ++--
>  arch/um/Makefile                          | 3 +--
>  arch/x86/Makefile                         | 2 +-
>  arch/x86/boot/compressed/Makefile         | 2 +-
>  arch/x86/entry/vdso/Makefile              | 4 ++--
>  arch/x86/kernel/cpu/Makefile              | 3 +--
>  arch/x86/lib/Makefile                     | 2 +-
>  arch/x86/mm/Makefile                      | 7 +++----
>  arch/x86/power/Makefile                   | 3 +--
>  arch/x86/purgatory/Makefile               | 2 +-
>  arch/x86/um/vdso/Makefile                 | 2 +-
>  arch/x86/xen/Makefile                     | 5 ++---
>  drivers/firmware/efi/libstub/Makefile     | 2 +-
>  drivers/xen/Makefile                      | 3 +--
>  kernel/kcsan/Makefile                     | 3 +--

Is it possible that this patch drops the KCSAN portion? We have a patch
that is part of a series intended for 5.9 that also removes the
cc-option from -fno-stack-protector, but can't easily be dropped from
the surrounding series.

Please see: https://lkml.kernel.org/r/20200624190236.GA6603@paulmck-ThinkPad-P72

Thanks,
-- Marco
