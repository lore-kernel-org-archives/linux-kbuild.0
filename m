Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:49507 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfKWGnm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 01:43:42 -0500
MIME-Version: 1.0
References: <20191114174226.7201-1-yamada.masahiro@socionext.com> <20191114174226.7201-4-yamada.masahiro@socionext.com>
In-Reply-To: <20191114174226.7201-4-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 23 Nov 2019 15:42:45 +0900
Message-ID: <CAK7LNAQtttcb78nog1SMg9Ng37OT7EyX1vs612oCro7R=c1O5g@mail.gmail.com>
Subject: Re: [PATCH 4/6] modpost: stop symbol preloading for modversion CRC
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Nov 15, 2019 at 2:42 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> It is complicated to add mocked-up symbols to pre-handle CRC.
> Handle CRC after all the export symbols in the relevant module
> are registered.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/mod/modpost.c | 64 +++++++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 29 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 6735ae3da4c2..73bdf27c41fe 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -169,7 +169,7 @@ struct symbol {
>         unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
>         unsigned int kernel:1;     /* 1 if symbol is from kernel
>                                     *  (only for external modules) **/
> -       unsigned int preloaded:1;  /* 1 if symbol from Module.symvers, or crc */
> +       unsigned int preloaded:1;  /* 1 if symbol from Module.symvers */
>         unsigned int is_static:1;  /* 1 if symbol is not global */
>         enum export  export;       /* Type of export */
>         char name[0];
> @@ -410,15 +410,15 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
>         return s;
>  }
>
> -static void sym_update_crc(const char *name, struct module *mod,
> -                          unsigned int crc, enum export export)
> +static void sym_set_crc(const char *name, const struct module *mod,
> +                       unsigned int crc)
>  {
>         struct symbol *s = find_symbol(name);
>
>         if (!s) {
> -               s = new_symbol(name, mod, export);
> -               /* Don't complain when we find it later. */
> -               s->preloaded = 1;
> +               warn("%s: '__crc_%s' is invalid use. __crc_* is reserved for modversion\n",
> +                    mod->name, name);

I notice this can produce false positive warnings.

ARCH=arm allyesconfig produces the following:

WARNING: vmlinux: '__crc_ccitt_veneer' is invalid use. __crc_* is
reserved for modversion
WARNING: vmlinux: '__crc_ccitt_veneer' is invalid use. __crc_* is
reserved for modversion
WARNING: vmlinux: '__crc_ccitt_veneer' is invalid use. __crc_* is
reserved for modversion
WARNING: vmlinux: '__crc_itu_t_veneer' is invalid use. __crc_* is
reserved for modversion
WARNING: vmlinux: '__crc_itu_t_veneer' is invalid use. __crc_* is
reserved for modversion
WARNING: vmlinux: '__crc_itu_t_veneer' is invalid use. __crc_* is
reserved for modversion


The ARM compiler inserts veneers automatically.

I will remove this warn(), and add commit messages as follows:

    In some cases, I see atand-alone __crc_* without __ksymtab_*.
    For example, ARCH=arm allyesconfig produces __crc_ccitt_veneer and
    __crc_itu_t_veneer. I guess they come from crc_ccitt, crc_itu_t,
    respectively. Since __*_veneer are auto-generated symbols, just
    ignore them.



> +               return;
>         }
>         s->crc = crc;
>         s->crc_valid = 1;
> @@ -683,12 +683,34 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
>         return 0;
>  }
>
> +static void handle_modversion(const struct module *mod,
> +                             const struct elf_info *info,
> +                             const Elf_Sym *sym, const char *symname)
> +{
> +       unsigned int crc;
> +
> +       if (sym->st_shndx == SHN_UNDEF) {
> +               warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
> +                    symname, mod->name, is_vmlinux(mod->name) ? "":".ko");
> +               return;
> +       }
> +
> +       if (sym->st_shndx == SHN_ABS) {
> +               crc = sym->st_value;
> +       } else {
> +               unsigned int *crcp;
> +
> +               /* symbol points to the CRC in the ELF object */
> +               crcp = sym_get_data(info, sym);
> +               crc = TO_NATIVE(*crcp);
> +       }
> +       sym_set_crc(symname, mod, crc);
> +}
> +
>  static void handle_symbol(struct module *mod, struct elf_info *info,
>                           const Elf_Sym *sym, const char *symname)
>  {
> -       unsigned int crc;
>         enum export export;
> -       bool is_crc = false;
>         const char *name;
>
>         if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
> @@ -697,21 +719,6 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
>         else
>                 export = export_from_sec(info, get_secindex(info, sym));
>
> -       /* CRC'd symbol */
> -       if (strstarts(symname, "__crc_")) {
> -               is_crc = true;
> -               crc = (unsigned int) sym->st_value;
> -               if (sym->st_shndx != SHN_UNDEF && sym->st_shndx != SHN_ABS) {
> -                       unsigned int *crcp;
> -
> -                       /* symbol points to the CRC in the ELF object */
> -                       crcp = sym_get_data(info, sym);
> -                       crc = TO_NATIVE(*crcp);
> -               }
> -               sym_update_crc(symname + strlen("__crc_"), mod, crc,
> -                               export);
> -       }
> -
>         switch (sym->st_shndx) {
>         case SHN_COMMON:
>                 if (strstarts(symname, "__gnu_lto_")) {
> @@ -746,11 +753,6 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
>                 }
>  #endif
>
> -               if (is_crc) {
> -                       const char *e = is_vmlinux(mod->name) ?"":".ko";
> -                       warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
> -                            symname + strlen("__crc_"), mod->name, e);
> -               }
>                 mod->unres = alloc_symbol(symname,
>                                           ELF_ST_BIND(sym->st_info) == STB_WEAK,
>                                           mod->unres);
> @@ -2063,6 +2065,10 @@ static void read_symbols(const char *modname)
>                         sym_update_namespace(symname + strlen("__kstrtabns_"),
>                                              namespace_from_kstrtabns(&info,
>                                                                       sym));
> +
> +               if (strstarts(symname, "__crc_"))
> +                       handle_modversion(mod, &info, sym,
> +                                         symname + strlen("__crc_"));
>         }
>
>         // check for static EXPORT_SYMBOL_* functions && global vars
> @@ -2476,7 +2482,7 @@ static void read_dump(const char *fname, unsigned int kernel)
>                 s->kernel    = kernel;
>                 s->preloaded = 1;
>                 s->is_static = 0;
> -               sym_update_crc(symname, mod, crc, export_no(export));
> +               sym_set_crc(symname, mod, crc);
>                 sym_update_namespace(symname, namespace);
>         }
>         release_file(file, size);
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
