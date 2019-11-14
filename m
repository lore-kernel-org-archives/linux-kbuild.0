Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:33649 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbfKNRpz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:45:55 -0500
MIME-Version: 1.0
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Nov 2019 02:45:03 +0900
Message-ID: <CAK7LNASYU4K87fR-v5xmhWGww_+3xRZ7otBGooXyshjXqfrv=w@mail.gmail.com>
Subject: Re: [PATCH 1/6] modpost: add a helper to get data pointed by a symbol
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthias Maennich <maennich@google.com>

(+CC: Matthias, who might be interested)

On Fri, Nov 15, 2019 at 2:42 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> When CONFIG_MODULE_REL_CRCS is enabled, the value of __crc_* is not
> an absolute value, but the address to the CRC data embedded in the
> .rodata section.
>
> Getting the data pointed by the symbol value is somewhat complex.
> Split it out into a new helper, sym_get_data().
>
> I will reuse it to refactor namespace_from_kstrtabns() in the next
> commit.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/mod/modpost.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 46d7f695fe7f..cd885573daaf 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -308,6 +308,18 @@ static const char *sec_name(struct elf_info *elf, int secindex)
>         return sech_name(elf, &elf->sechdrs[secindex]);
>  }
>
> +static void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym)
> +{
> +       Elf_Shdr *sechdr = &info->sechdrs[sym->st_shndx];
> +       unsigned long offset;
> +
> +       offset = sym->st_value;
> +       if (info->hdr->e_type != ET_REL)
> +               offset -= sechdr->sh_addr;
> +
> +       return (void *)info->hdr + sechdr->sh_offset + offset;
> +}
> +
>  #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
>
>  static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
> @@ -697,10 +709,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>                         unsigned int *crcp;
>
>                         /* symbol points to the CRC in the ELF object */
> -                       crcp = (void *)info->hdr + sym->st_value +
> -                              info->sechdrs[sym->st_shndx].sh_offset -
> -                              (info->hdr->e_type != ET_REL ?
> -                               info->sechdrs[sym->st_shndx].sh_addr : 0);
> +                       crcp = sym_get_data(info, sym);
>                         crc = TO_NATIVE(*crcp);
>                 }
>                 sym_update_crc(symname + strlen("__crc_"), mod, crc,
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
