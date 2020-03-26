Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:60039 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZUvf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 16:51:35 -0400
MIME-Version: 1.0
References: <CAKwvOdmLWqVq_EQk2S4FUSUCU7yoppYD4oiL+P7taWoDTyrb9w@mail.gmail.com>
 <20200326202600.7086-1-Jason@zx2c4.com>
In-Reply-To: <20200326202600.7086-1-Jason@zx2c4.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Mar 2020 05:50:34 +0900
Message-ID: <CAK7LNASVciXgqwfaEbH5i2GT++hHhbjabtzN_s=tzXh4up93ZA@mail.gmail.com>
Subject: Re: [PATCH] x86: update AS_* macros to binutils >=2.23, supporting
 ADX and AVX2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>

On Fri, Mar 27, 2020 at 5:26 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Now that the kernel specifies binutils 2.23 as the minimum version, we
> can remove ifdefs for AVX2 and ADX throughout.
>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>
>
> Masahiro - here's an updated patch based on -next, as Nick requested.
> Whether or not you'd prefer this one to the other one based on Linus'
> tree is up to you, but here it is in case it's helpful.


Thanks.

When the netfilter PR is pulled,
I will rebase on top of Linus' tree.


> diff --git a/net/netfilter/Makefile b/net/netfilter/Makefile
> index 292e71dc7ba4..cd0d6ad48650 100644
> --- a/net/netfilter/Makefile
> +++ b/net/netfilter/Makefile
> @@ -83,10 +83,8 @@ nf_tables-objs := nf_tables_core.o nf_tables_api.o nft_chain_filter.o \
>                   nft_set_pipapo.o
>
>  ifdef CONFIG_X86_64
> -ifneq (,$(findstring -DCONFIG_AS_AVX2=1,$(KBUILD_CFLAGS)))
>  nf_tables-objs += nft_set_pipapo_avx2.o
>  endif
> -endif


This hunk should go to:

[v2,10/16] x86: probe assembler capabilities via kconfig instead of makefile


I will try my best to remember this.


--
Best Regards
Masahiro Yamada
