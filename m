Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59895 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbfG0M4T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jul 2019 08:56:19 -0400
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com>
In-Reply-To: <20190714152817.24693-1-efremov@linux.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 27 Jul 2019 21:55:37 +0900
Message-ID: <CAK7LNATg1m_pzsZqGDUOUZHzv6jn2K0My8vFWbOVdUSTMQ05Ug@mail.gmail.com>
Subject: Re: [RFC PATCH] modpost: check for static EXPORT_SYMBOL* functions
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.

Thanks, this patch is very nice.


On Mon, Jul 15, 2019 at 12:28 AM Denis Efremov <efremov@linux.com> wrote:
>
> This patch adds a check to warn about static EXPORT_SYMBOL* functions
> during the modpost. In most of the cases, a static symbol marked for
> exporting is an odd combination that should be fixed either by deleting
> the exporting mark or by removing the static attribute and adding the
> appropriate declaration to headers.
>
> If this check will be considered useful, I will resend the patch with
> review fixes.
>
> Currently, this check emits the warnings on the following symbols, most
> of which are accepted to be fixed:
> 1. "sas_wait_eh" [drivers/scsi/libsas/libsas]
>    Patch: https://lkml.org/lkml/2019/7/8/970 (accepted)
> 2. "torture_onoff_cleanup" [kernel/torture]
>    "torture_shuffle_cleanup" [kernel/torture]
>    Patch: https://lkml.org/lkml/2019/7/4/411 (accepted)
> 3. "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress]
>    Patch: https://lkml.org/lkml/2019/7/8/842
> 4. "drm_client_close" [drivers/gpu/drm/drm]
>    Patch: https://lkml.org/lkml/2019/7/3/758 (accepted)
> 5. "gve_probe" [drivers/net/ethernet/google/gve/gve]
>    Patch: https://lkml.org/lkml/2019/7/14/65
> 6. "i2c_new_client_device" [vmlinux]
>    "i2c_new_dummy_device" [vmlinux]
>    Patch: https://lkml.org/lkml/2019/7/7/226 (fixed in a different patch)
> 7. "ahci_em_messages" [drivers/ata/libahci]
>    Patch: https://lkml.org/lkml/2019/7/10/550 (reviwed)
> 8. "ftrace_set_clr_event" [vmlinux]
>    Patch: https://lkml.org/lkml/2019/7/4/609 (reviwed)
> 9. "rmi_2d_sensor_set_input_params" [drivers/input/rmi4/rmi_core]
>    Patch: https://lkml.org/lkml/2019/7/8/999
> 10. "empty_zero_page" [vmlinux]
> 11. "phys_base" [vmlinux]
> 12. "hypercall_page" [vmlinux]

Could you drop the solved ones from the list?

I still see the following at least, but I will apply this patch anyway.

WARNING: "phys_base" [vmlinux] is a static EXPORT_SYMBOL symbol
WARNING: "drm_client_close" [vmlinux] is a static EXPORT_SYMBOL symbol
WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL symbol
WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL symbol
WARNING: "empty_zero_page" [vmlinux] is a static EXPORT_SYMBOL symbol


The code looks good to me.
I commented on some minor style issues.


> Similar commits:
> 1. 54638c6eaf44 ("net: phy: make exported variables non-static")
> 2. 98ef2046f28b ("mm: remove the exporting of totalram_pages")
> 3. 73df167c819e ("s390/zcrypt: remove the exporting of ap_query_configuration")
> 4. a57caf8c527f ("sunrpc/cache: remove the exporting of cache_seq_next")
> 5. e4e4730698c9 ("crypto: skcipher - remove the exporting of skcipher_walk_next")
>
> Build time impact, allmodconfig, Dell XPS 15 9570 (measurements 3x):
> $ make mrproper; make allmodconfig; time make -j12; \
>   git checkout HEAD~1; \
>   make mrproper; make allmodconfig; time make -j12
> 1.
>    (with patch) 17635,94s user 1895,54s system 1085% cpu 29:59,22 total
>    (w/o  patch) 17275,42s user 1803,87s system 1112% cpu 28:35,66 total
> 2.
>    (with patch) 17369,51s user 1763,28s system 1111% cpu 28:41,47 total
>    (w/o  patch) 16880,50s user 1670,93s system 1113% cpu 27:46,56 total
> 3.
>    (with patch) 17937,88s user 1842,53s system 1109% cpu 29:42,26 total
>    (w/o  patch) 17267,55s user 1725,09s system 1111% cpu 28:28,17 total
>
> Thus, the current implementation adds approx. 1 min for allmodconfig.
> However, it's possible to do the check in a more optimal way if it will
> be considered useful.
>
> Also, this kind of check could be implemented as a separate script instead.
> Here is the implementation:
> https://gist.github.com/evdenis/bf2322d094f0c02c0f60fe0a225848b2
>
> Signed-off-by: Denis Efremov <efremov@linux.com>



> @@ -199,8 +200,9 @@ static struct symbol *alloc_symbol(const char *name, unsigned int weak,
>
>         memset(s, 0, sizeof(*s));
>         strcpy(s->name, name);
> -       s->weak = weak;
> -       s->next = next;
> +       s->weak      = weak;
> +       s->next      = next;

Could you drop this change?
I do not think we need to align the '=' operator.


> +       s->is_static = 1;
>         return s;
>  }
>
> @@ -1980,6 +1982,21 @@ static void read_symbols(const char *modname)
>                 handle_modversions(mod, &info, sym, symname);
>                 handle_moddevtable(mod, &info, sym, symname);
>         }
> +
> +       // check for static EXPORT_SYMBOL_* functions && global vars
> +       for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
> +               unsigned char bind = ELF_ST_BIND(sym->st_info);
> +               unsigned char type = ELF_ST_TYPE(sym->st_info);
> +
> +               if (type == STT_OBJECT || type == STT_FUNC) {
> +                       struct symbol *s =
> +                           find_symbol(remove_dot(info.strtab + sym->st_name));
> +
> +                       if (s && (bind == STB_GLOBAL || bind == STB_WEAK))
> +                               s->is_static = 0;
> +               }
> +       }
> +
>         if (!is_vmlinux(modname) || vmlinux_section_warnings)
>                 check_sec_ref(mod, modname, &info);
>
> @@ -2425,6 +2442,7 @@ int main(int argc, char **argv)
>         char *dump_write = NULL, *files_source = NULL;
>         int opt;
>         int err;
> +       size_t n;
>         struct ext_sym_list *extsym_iter;
>         struct ext_sym_list *extsym_start = NULL;
>
> @@ -2520,6 +2538,19 @@ int main(int argc, char **argv)
>         if (sec_mismatch_count && sec_mismatch_fatal)
>                 fatal("modpost: Section mismatches detected.\n"
>                       "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
> +       for (n = 0; n < SYMBOL_HASH_SIZE ; n++) {
> +               struct symbol *s = symbolhash[n];
> +
> +               while (s) {
> +                       if (s->is_static)
> +                               warn("\"%s\" [%s] is a static %s symbol\n",
> +                                       s->name, s->module->name,
> +                                               export_str(s->export));

Could you follow the checkpatch.pl suggestion?

CHECK: Alignment should match open parenthesis
#2550: FILE: scripts/mod/modpost.c:2550:
    + warn("\"%s\" [%s] is a static %s symbol\n",
    + s->name, s->module->name,


(This file already has tons of checkpatch warnings,
but I want to try my best to not add new ones.)


Thanks.

-- 
Best Regards
Masahiro Yamada
