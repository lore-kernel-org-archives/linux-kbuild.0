Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:49916 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754400AbeGHCE4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Jul 2018 22:04:56 -0400
MIME-Version: 1.0
In-Reply-To: <20180707001548.21854-1-kilobyte@angband.pl>
References: <20180707001548.21854-1-kilobyte@angband.pl>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 8 Jul 2018 11:04:05 +0900
Message-ID: <CAK7LNARUhSo1WbgK0M1Xxh4ACGqLSh39oq+jDqcTA2byjNJ3cA@mail.gmail.com>
Subject: Re: [PATCH resend] scripts: teach extract-vmlinux about LZ4 and ZSTD
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Paul Menzel <pmenzel+linux-kernel@molgen.mpg.de>, Pavel Machek <pavel@ucw.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Ingo Molnar <mingo@kernel.org>

2018-07-07 9:15 GMT+09:00 Adam Borowski <kilobyte@angband.pl>:
> Note that the LZ4 signature is different than that of modern LZ4 as we
> use the "legacy" format which suffers from some downsides like inability
> to disable compression.
>
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---
> The first time this was sent I managed to screw up both the subject and
> scissors line, so it's likely whatever filter you're using didn't notice
> the patch inside a thread.

Sorry for the delay.
Applied to linux-kbuild.  Thanks!



> ZSTD compression for vmlinux is not yet in, but being able to unpack it
> can't hurt.  LZ4 is in for quite a while.
>
>
>  scripts/extract-vmlinux | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
> index 5061abcc2540..e6239f39abad 100755
> --- a/scripts/extract-vmlinux
> +++ b/scripts/extract-vmlinux
> @@ -57,6 +57,8 @@ try_decompress '\3757zXZ\000' abcde unxz
>  try_decompress 'BZh'          xy    bunzip2
>  try_decompress '\135\0\0\0'   xxx   unlzma
>  try_decompress '\211\114\132' xy    'lzop -d'
> +try_decompress '\002!L\030'   xxx   'lz4 -d'
> +try_decompress '(\265/\375'   xxx   unzstd
>
>  # Bail out:
>  echo "$me: Cannot find vmlinux." >&2
> --
> 2.18.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
