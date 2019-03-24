Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:14086 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfCXGh6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Mar 2019 02:37:58 -0400
Date: Sun, 24 Mar 2019 07:30:19 +0100
From: Fredrik Noring <noring@nocrew.org>
Subject: Re: [PATCH] kbuild: modversions: Fix relative CRC byte order
 interpretion
Message-ID: <20190324063019.GA2555@sx9>
References: <20190323184618.GA4916@sx9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190323184618.GA4916@sx9>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Maciej W. Rozycki" <macro@linux-mips.org>

Masahiro, Michal --

> Fix commit 56067812d5b0 ("kbuild: modversions: add infrastructure for
> emitting relative CRCs") where CRCs are interpreted in host byte order
> rather than proper kernel byte order.
> 
> For example, when loading BE modules compiled with a LE system, the
> error "disagrees about version of symbol module_layout" is produced.
> A message such as "Found checksum D7FA6856 vs module 5668FAD7" will be
> given with debug enabled, which indicates an obvious endian problem.

I realise that the description above is perhaps a bit too brief; although
the error is triggered by loading modules, the precise location of the
error is within __kcrctab within the kernel image.

> The general solution is to use the macro TO_NATIVE, as is done in
> similar cases throughout modpost.c. With this correction it has been
> verified that BE modules compiled with a LE system load properly into
> a BE kernel.

One could note that it has also been tested with a LE kernel compiled
with a LE system, in which case TO_NATIVE returns its value unmodified
since the byte orders match. This is by far the common case.

Would you like me to send an updated description?

Fredrik

> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> Fixes: 56067812d5b0 ("kbuild: modversions: add infrastructure for emitting relative CRCs")
> Cc: stable@vger.kernel.org
> ---
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0b0d1080b1c5..f277e116e0eb 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -639,7 +639,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>  			       info->sechdrs[sym->st_shndx].sh_offset -
>  			       (info->hdr->e_type != ET_REL ?
>  				info->sechdrs[sym->st_shndx].sh_addr : 0);
> -			crc = *crcp;
> +			crc = TO_NATIVE(*crcp);
>  		}
>  		sym_update_crc(symname + strlen("__crc_"), mod, crc,
>  				export);
