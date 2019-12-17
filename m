Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:52790 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLQDJG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 22:09:06 -0500
MIME-Version: 1.0
References: <20191209035148.17048-1-masahiroy@kernel.org>
In-Reply-To: <20191209035148.17048-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Dec 2019 12:08:25 +0900
Message-ID: <CAK7LNATWqr_kJhCs7Eohxe-QSU3A+Ebh7w88zXjYK_=V6xG8Pg@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix offset overflow of kallsyms_relative_base
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Dec 9, 2019 at 12:52 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 5e5c4fa78745 ("scripts/kallsyms: shrink table before
> sorting it"), kallsyms_relative_base can be larger than _text, which
> causes overflow when building the 32-bit kernel.
>
> https://lkml.org/lkml/2019/12/7/156
>
> This is because _text is, unless --all-symbols is specified, now
> trimmed from the symbol table before record_relative_base() is called.
>
> Handle the offset signedness also for kallsyms_relative_base. Introduce
> a new helper, output_address(), to reduce the code duplication.
>
> Fixes: 5e5c4fa78745 ("scripts/kallsyms: shrink table before sorting it")
> Reported-by: Olof Johansson <olof@lixom.net>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>

Applied to linux-kbuid.

>  scripts/kallsyms.c | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index fb55f262f42d..94153732ec00 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -310,6 +310,15 @@ static void output_label(const char *label)
>         printf("%s:\n", label);
>  }
>
> +/* Provide proper symbols relocatability by their '_text' relativeness. */
> +static void output_address(unsigned long long addr)
> +{
> +       if (_text <= addr)
> +               printf("\tPTR\t_text + %#llx\n", addr - _text);
> +       else
> +               printf("\tPTR\t_text - %#llx\n", _text - addr);
> +}
> +
>  /* uncompress a compressed symbol. When this function is called, the best table
>   * might still be compressed itself, so the function needs to be recursive */
>  static int expand_symbol(const unsigned char *data, int len, char *result)
> @@ -360,19 +369,6 @@ static void write_src(void)
>
>         printf("\t.section .rodata, \"a\"\n");
>
> -       /* Provide proper symbols relocatability by their relativeness
> -        * to a fixed anchor point in the runtime image, either '_text'
> -        * for absolute address tables, in which case the linker will
> -        * emit the final addresses at build time. Otherwise, use the
> -        * offset relative to the lowest value encountered of all relative
> -        * symbols, and emit non-relocatable fixed offsets that will be fixed
> -        * up at runtime.
> -        *
> -        * The symbol names cannot be used to construct normal symbol
> -        * references as the list of symbols contains symbols that are
> -        * declared static and are private to their .o files.  This prevents
> -        * .tmp_kallsyms.o or any other object from referencing them.
> -        */
>         if (!base_relative)
>                 output_label("kallsyms_addresses");
>         else
> @@ -380,6 +376,13 @@ static void write_src(void)
>
>         for (i = 0; i < table_cnt; i++) {
>                 if (base_relative) {
> +                       /*
> +                        * Use the offset relative to the lowest value
> +                        * encountered of all relative symbols, and emit
> +                        * non-relocatable fixed offsets that will be fixed
> +                        * up at runtime.
> +                        */
> +
>                         long long offset;
>                         int overflow;
>
> @@ -402,12 +405,7 @@ static void write_src(void)
>                         }
>                         printf("\t.long\t%#x\n", (int)offset);
>                 } else if (!symbol_absolute(&table[i])) {
> -                       if (_text <= table[i].addr)
> -                               printf("\tPTR\t_text + %#llx\n",
> -                                       table[i].addr - _text);
> -                       else
> -                               printf("\tPTR\t_text - %#llx\n",
> -                                       _text - table[i].addr);
> +                       output_address(table[i].addr);
>                 } else {
>                         printf("\tPTR\t%#llx\n", table[i].addr);
>                 }
> @@ -416,7 +414,7 @@ static void write_src(void)
>
>         if (base_relative) {
>                 output_label("kallsyms_relative_base");
> -               printf("\tPTR\t_text - %#llx\n", _text - relative_base);
> +               output_address(relative_base);
>                 printf("\n");
>         }
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
