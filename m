Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:25658 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfKNRqx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:46:53 -0500
MIME-Version: 1.0
References: <20191114174226.7201-1-yamada.masahiro@socionext.com> <20191114174226.7201-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191114174226.7201-2-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Nov 2019 02:46:08 +0900
Message-ID: <CAK7LNATGjv7_bmhGGpOupFpRRvvaGetvaTszE09MBKz3Ob06fQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] modpost: refactor namespace_from_kstrtabns() to not
 hard-code section name
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthias Maennich <maennich@google.com>

(+CC: Matthias, who might be interested)


On Fri, Nov 15, 2019 at 2:42 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, namespace_from_kstrtabns() relies on the fact that
> namespace strings are recorded in the __ksymtab_strings section.
> Actually, it is coded in include/linux/export.h, but modpost does
> not need to hard-code the section name.
>
> Elf_Sym::st_shndx holds the section number of the relevant section.
> Using it is a more portable way to find the namespace string.
>
> sym_get_value() takes care of it, so namespace_from_kstrtabns() can
> simply wrap it. Delete the unneeded info->ksymtab_strings .
>
> While I was here, I added more 'const' qualifiers to pointers.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/mod/modpost.c | 10 +++-------
>  scripts/mod/modpost.h |  1 -
>  2 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index cd885573daaf..d9418c58a8c0 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -356,10 +356,10 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
>                 return export_unknown;
>  }
>
> -static const char *namespace_from_kstrtabns(struct elf_info *info,
> -                                           Elf_Sym *kstrtabns)
> +static const char *namespace_from_kstrtabns(const struct elf_info *info,
> +                                           const Elf_Sym *sym)
>  {
> -       char *value = info->ksymtab_strings + kstrtabns->st_value;
> +       const char *value = sym_get_data(info, sym);
>         return value[0] ? value : NULL;
>  }
>
> @@ -601,10 +601,6 @@ static int parse_elf(struct elf_info *info, const char *filename)
>                         info->export_unused_gpl_sec = i;
>                 else if (strcmp(secname, "__ksymtab_gpl_future") == 0)
>                         info->export_gpl_future_sec = i;
> -               else if (strcmp(secname, "__ksymtab_strings") == 0)
> -                       info->ksymtab_strings = (void *)hdr +
> -                                               sechdrs[i].sh_offset -
> -                                               sechdrs[i].sh_addr;
>
>                 if (sechdrs[i].sh_type == SHT_SYMTAB) {
>                         unsigned int sh_link_idx;
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index fe6652535e4b..64a82d2d85f6 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -143,7 +143,6 @@ struct elf_info {
>         Elf_Section  export_gpl_sec;
>         Elf_Section  export_unused_gpl_sec;
>         Elf_Section  export_gpl_future_sec;
> -       char         *ksymtab_strings;
>         char         *strtab;
>         char         *modinfo;
>         unsigned int modinfo_len;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
