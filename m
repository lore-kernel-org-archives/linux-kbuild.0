Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:63200 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfC1JGx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Mar 2019 05:06:53 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x2S96htJ007241
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Mar 2019 18:06:44 +0900
Received: by mail-ua1-f46.google.com with SMTP id v7so594892uak.13
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Mar 2019 02:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190323184618.GA4916@sx9> <20190324063019.GA2555@sx9>
 <CAK7LNARM++Agci9Sg0P4XJ6NrRHG2JDEyp341cV2+vNwNeShaQ@mail.gmail.com> <20190327181250.GA2563@sx9>
In-Reply-To: <20190327181250.GA2563@sx9>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Mar 2019 18:06:06 +0900
Message-ID: <CAK7LNAT+OPWQy8wDe-OMOL+nmmJbn7E+9h3C4kUYHeUHBVZE=A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: modversions: Fix relative CRC byte order interpretation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fredrik Noring <noring@nocrew.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Maciej W. Rozycki" <macro@linux-mips.org>

On Thu, Mar 28, 2019 at 3:13 AM Fredrik Noring <noring@nocrew.org> wrote:
>
> Fix commit 56067812d5b0 ("kbuild: modversions: add infrastructure for
> emitting relative CRCs") where CRCs are interpreted in host byte order
> rather than proper kernel byte order. The bug is conditional on
> CONFIG_MODULE_REL_CRCS.
>
> For example, when loading a BE module into a BE kernel compiled with a LE
> system, the error "disagrees about version of symbol module_layout" is
> produced. A message such as "Found checksum D7FA6856 vs module 5668FAD7"
> will be given with debug enabled, which indicates an obvious endian
> problem within __kcrctab within the kernel image.
>
> The general solution is to use the macro TO_NATIVE, as is done in
> similar cases throughout modpost.c. With this correction it has been
> verified that a BE kernel compiled with a LE system accepts BE modules.
>
> This change has also been verified with a LE kernel compiled with a LE
> system, in which case TO_NATIVE returns its value unmodified since the
> byte orders match. This is by far the common case.
>
> Fixes: 56067812d5b0 ("kbuild: modversions: add infrastructure for emitting relative CRCs")
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> Cc: stable@vger.kernel.org


Applied to linux-kbuild/fixes. Thanks.



> ---
> Thank you for your review, Masahiro,
>
> Changes in v2:
> - Fix subject spelling mistake.
> - Note that the bug is conditional on CONFIG_MODULE_REL_CRCS.
> - Clarify kernel image and __kcrctab compilation details.
> - Mention verification of matching LE byte order common case.
>
> Fredrik
> ---
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0b0d1080b1c5..f277e116e0eb 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -639,7 +639,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>                                info->sechdrs[sym->st_shndx].sh_offset -
>                                (info->hdr->e_type != ET_REL ?
>                                 info->sechdrs[sym->st_shndx].sh_addr : 0);
> -                       crc = *crcp;
> +                       crc = TO_NATIVE(*crcp);
>                 }
>                 sym_update_crc(symname + strlen("__crc_"), mod, crc,
>                                 export);
>


-- 
Best Regards
Masahiro Yamada
