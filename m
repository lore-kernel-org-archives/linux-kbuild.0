Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:52776 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753517AbeFMCEJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jun 2018 22:04:09 -0400
MIME-Version: 1.0
In-Reply-To: <20180612003224.3658-2-labbott@redhat.com>
References: <20180612003224.3658-1-labbott@redhat.com> <20180612003224.3658-2-labbott@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 13 Jun 2018 11:03:08 +0900
Message-ID: <CAK7LNASJw4JjHD3RSmyBExvw+v+GE916RQiSZTQA+U-d4FXt1w@mail.gmail.com>
Subject: Re: [PATCHv4 1/3] scripts: Preprocess module-common.lds
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>, Mark Wielaard <mjw@fedoraproject.org>, "H . J . Lu" <hjl.tools@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-06-12 9:32 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>
> In preparation for some upcoming work, allow module-common.lds
> to be run through the preprocessor.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
>  scripts/.gitignore                                 | 1 +
>  scripts/Makefile                                   | 2 +-
>  scripts/{module-common.lds => module-common.lds.S} | 0
>  3 files changed, 2 insertions(+), 1 deletion(-)
>  rename scripts/{module-common.lds => module-common.lds.S} (100%)
>
> diff --git a/scripts/.gitignore b/scripts/.gitignore
> index 0442c06eefcb..afd1de57d9c6 100644
> --- a/scripts/.gitignore
> +++ b/scripts/.gitignore
> @@ -13,3 +13,4 @@ asn1_compiler
>  extract-cert
>  sign-file
>  insert-sys-cert
> +module-common.lds
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 25ab143cbe14..631d9d1a71e4 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -25,7 +25,7 @@ HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
>  HOSTLOADLIBES_sign-file = -lcrypto
>  HOSTLOADLIBES_extract-cert = -lcrypto
>
> -always         := $(hostprogs-y) $(hostprogs-m)
> +always         := $(hostprogs-y) $(hostprogs-m) module-common.lds


You do not need to generate module-common.lds all the time.
It is necessary only when the module feature is enabled.

You can do like this:

extra-$(CONFIG_MODULES)  +=  module-common.lds






-- 
Best Regards
Masahiro Yamada
