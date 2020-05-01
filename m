Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:61217 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFpA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:45:00 -0400
MIME-Version: 1.0
References: <20200417180455.1174340-1-masahiroy@kernel.org>
In-Reply-To: <20200417180455.1174340-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 May 2020 14:44:06 +0900
Message-ID: <CAK7LNAQNwHW8=UQPCs7D=bEx2qKwfoNxVVMmHiOwmPy3j4aaGQ@mail.gmail.com>
Subject: Re: [PATCH] um: do not evaluate compiler's library path when cleaning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Alex Dewar <alex.dewar@gmx.co.uk>, Erel Geron <erelx.geron@intel.com>, Johannes Berg <johannes.berg@intel.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Apr 18, 2020 at 3:06 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit a83e4ca26af8 ("kbuild: remove cc-option switch from
> -Wframe-larger-than="), 'make ARCH=um clean' emits an error message
> as follows:
>
>   $ make ARCH=um clean
>   gcc: error: missing argument to '-Wframe-larger-than='
>
> We do not care compiler flags when cleaning.
>
> Use the '=' operator for lazy expansion because we do not use
> LDFLAGS_pcap.o or LDFLAGS_vde.o when cleaning.
>
> While I was here, I removed the redundant -r option because it
> already exists in the recipe.
>
> Fixes: a83e4ca26af8 ("kbuild: remove cc-option switch from -Wframe-larger-than=")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/um/drivers/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/um/drivers/Makefile b/arch/um/drivers/Makefile
> index a290821e355c..2a249f619467 100644
> --- a/arch/um/drivers/Makefile
> +++ b/arch/um/drivers/Makefile
> @@ -18,9 +18,9 @@ ubd-objs := ubd_kern.o ubd_user.o
>  port-objs := port_kern.o port_user.o
>  harddog-objs := harddog_kern.o harddog_user.o
>
> -LDFLAGS_pcap.o := -r $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libpcap.a)
> +LDFLAGS_pcap.o = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libpcap.a)
>
> -LDFLAGS_vde.o := -r $(shell $(CC) $(CFLAGS) -print-file-name=libvdeplug.a)
> +LDFLAGS_vde.o = $(shell $(CC) $(CFLAGS) -print-file-name=libvdeplug.a)
>
>  targets := pcap_kern.o pcap_user.o vde_kern.o vde_user.o
>
> --
> 2.25.1
>


Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
