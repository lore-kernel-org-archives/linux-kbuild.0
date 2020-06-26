Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFZUS6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:18:58 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3461C03E979
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:18:58 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f9so5105116pfn.0
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:18:58 -0700 (PDT)
Date: Fri, 26 Jun 2020 13:18:56 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 1/2] kbuild: remove cc-option test of -fno-stack-protector
Message-ID: <202006261318.75C7FE339@keescook>
References: <20200626185913.92890-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626185913.92890-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, x86@kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jun 27, 2020 at 03:59:12AM +0900, Masahiro Yamada wrote:
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

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
