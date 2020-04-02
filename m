Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53016 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390111AbgDBRko (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:40:44 -0400
Received: by mail-pj1-f65.google.com with SMTP id ng8so1821353pjb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2020 10:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200402173842.96013-1-maskray@google.com>
In-Reply-To: <20200402173842.96013-1-maskray@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 2 Apr 2020 10:40:31 -0700
Message-ID: <CAKwvOdkHugeJW8GOa_8Pf+axPnhFiy+4t0fsOyzp2hxaDE1NAw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: fix the name of llvm-size
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Thu, Apr 2, 2020 at 10:38 AM 'Fangrui Song' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> The tool is called llvm-size, not llvm-objsize.
>
> Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
> Signed-off-by: Fangrui Song <maskray@google.com>
> ---
>  Documentation/kbuild/llvm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index d6c79eb4e23e..eefbdfa3e4d9 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -51,7 +51,7 @@ LLVM has substitutes for GNU binutils utilities. These can be invoked as
>  additional parameters to `make`.
>
>         make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
> -         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
> +         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
>           READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
>           HOSTLD=ld.lld
>
> --

OBJCOPY -> llvm-objcopy
OBJDUMP -> llvm-objdump
OBJSIZE -> llvm-size

Oops, thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
