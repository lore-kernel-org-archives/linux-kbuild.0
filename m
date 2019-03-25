Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:51672 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfCYEEj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Mar 2019 00:04:39 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x2P44MFT016489
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Mar 2019 13:04:22 +0900
Received: by mail-vs1-f41.google.com with SMTP id f22so874496vso.7
        for <linux-kbuild@vger.kernel.org>; Sun, 24 Mar 2019 21:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190323184618.GA4916@sx9> <20190324063019.GA2555@sx9>
In-Reply-To: <20190324063019.GA2555@sx9>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 25 Mar 2019 13:03:45 +0900
Message-ID: <CAK7LNARM++Agci9Sg0P4XJ6NrRHG2JDEyp341cV2+vNwNeShaQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: modversions: Fix relative CRC byte order interpretion
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fredrik Noring <noring@nocrew.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Maciej W. Rozycki" <macro@linux-mips.org>

Hi Fredrik,



On Sun, Mar 24, 2019 at 3:37 PM Fredrik Noring <noring@nocrew.org> wrote:
>
> Masahiro, Michal --
>
> > Fix commit 56067812d5b0 ("kbuild: modversions: add infrastructure for
> > emitting relative CRCs") where CRCs are interpreted in host byte order
> > rather than proper kernel byte order.
> >
> > For example, when loading BE modules compiled with a LE system, the
> > error "disagrees about version of symbol module_layout" is produced.
> > A message such as "Found checksum D7FA6856 vs module 5668FAD7" will be
> > given with debug enabled, which indicates an obvious endian problem.
>
> I realise that the description above is perhaps a bit too brief; although
> the error is triggered by loading modules, the precise location of the
> error is within __kcrctab within the kernel image.
>
> > The general solution is to use the macro TO_NATIVE, as is done in
> > similar cases throughout modpost.c. With this correction it has been
> > verified that BE modules compiled with a LE system load properly into
> > a BE kernel.
>
> One could note that it has also been tested with a LE kernel compiled
> with a LE system, in which case TO_NATIVE returns its value unmodified
> since the byte orders match. This is by far the common case.
>
> Would you like me to send an updated description?


Either will do.

If you send v2, could you please check the possible
typo in the subject?

interpretion -> interpretation ?



Masahiro



> Fredrik
>
> > Signed-off-by: Fredrik Noring <noring@nocrew.org>
> > Fixes: 56067812d5b0 ("kbuild: modversions: add infrastructure for emitting relative CRCs")
> > Cc: stable@vger.kernel.org
> > ---
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 0b0d1080b1c5..f277e116e0eb 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -639,7 +639,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
> >                              info->sechdrs[sym->st_shndx].sh_offset -
> >                              (info->hdr->e_type != ET_REL ?
> >                               info->sechdrs[sym->st_shndx].sh_addr : 0);
> > -                     crc = *crcp;
> > +                     crc = TO_NATIVE(*crcp);
> >               }
> >               sym_update_crc(symname + strlen("__crc_"), mod, crc,
> >                               export);



-- 
Best Regards
Masahiro Yamada
