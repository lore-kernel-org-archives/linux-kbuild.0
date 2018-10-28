Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47511 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727150AbeJ2BUz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Oct 2018 21:20:55 -0400
MIME-Version: 1.0
References: <20181024040354.24879-1-leobras.c@gmail.com> <20181024040354.24879-2-leobras.c@gmail.com>
In-Reply-To: <20181024040354.24879-2-leobras.c@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Oct 2018 01:34:52 +0900
Message-ID: <CAK7LNAR1OQsou-i85JLuWG2GdGx17fqhh9GN36QgahMm9N+DTw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] x86/vdso: Renames variable to fix shadow warning.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>, Ingo Molnar <mingo@kernel.org>
Cc: lkcamp@lists.libreplanetbr.org, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, helen@koikeco.de, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ingo,


On Wed, Oct 24, 2018 at 1:04 PM Leonardo Bras <leobras.c@gmail.com> wrote:
>
> The go32() and go64() functions have an argument and a local variable
> called =E2=80=98name=E2=80=99.  Rename both to clarify the code and to fi=
x a warning
> with -Wshadow.
>
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>


Please take care of this in x86 tree instead of kbuild.


Thanks.


> ---
>  arch/x86/entry/vdso/vdso2c.h | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.h
> index fa847a620f40..a20b134de2a8 100644
> --- a/arch/x86/entry/vdso/vdso2c.h
> +++ b/arch/x86/entry/vdso/vdso2c.h
> @@ -7,7 +7,7 @@
>
>  static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
>                          void *stripped_addr, size_t stripped_len,
> -                        FILE *outfile, const char *name)
> +                        FILE *outfile, const char *image_name)
>  {
>         int found_load =3D 0;
>         unsigned long load_size =3D -1;  /* Work around bogus warning */
> @@ -93,11 +93,12 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_l=
en,
>                 int k;
>                 ELF(Sym) *sym =3D raw_addr + GET_LE(&symtab_hdr->sh_offse=
t) +
>                         GET_LE(&symtab_hdr->sh_entsize) * i;
> -               const char *name =3D raw_addr + GET_LE(&strtab_hdr->sh_of=
fset) +
> -                       GET_LE(&sym->st_name);
> +               const char *sym_name =3D raw_addr +
> +                                      GET_LE(&strtab_hdr->sh_offset) +
> +                                      GET_LE(&sym->st_name);
>
>                 for (k =3D 0; k < NSYMS; k++) {
> -                       if (!strcmp(name, required_syms[k].name)) {
> +                       if (!strcmp(sym_name, required_syms[k].name)) {
>                                 if (syms[k]) {
>                                         fail("duplicate symbol %s\n",
>                                              required_syms[k].name);
> @@ -134,7 +135,7 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_l=
en,
>         if (syms[sym_vvar_start] % 4096)
>                 fail("vvar_begin must be a multiple of 4096\n");
>
> -       if (!name) {
> +       if (!image_name) {
>                 fwrite(stripped_addr, stripped_len, 1, outfile);
>                 return;
>         }
> @@ -157,7 +158,7 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_l=
en,
>         }
>         fprintf(outfile, "\n};\n\n");
>
> -       fprintf(outfile, "const struct vdso_image %s =3D {\n", name);
> +       fprintf(outfile, "const struct vdso_image %s =3D {\n", image_name=
);
>         fprintf(outfile, "\t.data =3D raw_data,\n");
>         fprintf(outfile, "\t.size =3D %lu,\n", mapping_size);
>         if (alt_sec) {
> --
> 2.19.1
>


--=20
Best Regards
Masahiro Yamada
