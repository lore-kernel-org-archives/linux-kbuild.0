Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35695 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbeJRHJB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 03:09:01 -0400
MIME-Version: 1.0
References: <20181017000834.GA21330@WindFlash> <b17297ec-9044-d0c4-ee0e-664b53713020@koikeco.de>
In-Reply-To: <b17297ec-9044-d0c4-ee0e-664b53713020@koikeco.de>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Wed, 17 Oct 2018 20:10:50 -0300
Message-ID: <CADvQ+rH5FTzgQN==EwQn_MogDeGR1hnScd=pyuRqHXB=QKYo_Q@mail.gmail.com>
Subject: Re: [Lkcamp] [PATCH 2/4] Renames variable to fix shadow warning.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: helen@koikeco.de
Cc: lkcamp@lists.libreplanetbr.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Matthew Wilcox <willy6545@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

Hello Helen,
Thanks for the suggestions!

On Tue, Oct 16, 2018 at 11:57 PM Helen Koike <helen@koikeco.de> wrote:
>
> Hi Leonardo,
>
> Thanks for the patch, just some small comments below.
>
> Please, check previous log messages with git log
> arch/x86/entry/vdso/vdso2c.h, you will see that most patches had the
> prefix "x86/vdso:" in the commit message.
Ok, added! This change will be available on v2.

>
> On 10/16/18 9:08 PM, Leonardo Br=C3=A1s wrote:
> > Renames the char variable to avoid shadowing a variable previously
> > declared on this function.
> >
> > Signed-off-by: Leonardo Br=C3=A1s <leobras.c@gmail.com>
> > ---
> >  arch/x86/entry/vdso/vdso2c.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.=
h
> > index fa847a620f40..9466998d0f28 100644
> > --- a/arch/x86/entry/vdso/vdso2c.h
> > +++ b/arch/x86/entry/vdso/vdso2c.h
> > @@ -93,11 +93,11 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw=
_len,
> >               int k;
> >               ELF(Sym) *sym =3D raw_addr + GET_LE(&symtab_hdr->sh_offse=
t) +
> >                       GET_LE(&symtab_hdr->sh_entsize) * i;
> > -             const char *name =3D raw_addr + GET_LE(&strtab_hdr->sh_of=
fset) +
> > +             const char *name2 =3D raw_addr + GET_LE(&strtab_hdr->sh_o=
ffset) +
> >                       GET_LE(&sym->st_name);
>
> Could you please use a more meaningful name instead of name2 please? I
> believe sym_name should be fine.

Ok, I renamed as you suggested.
Also, I renamed the "name" variable to "image_name" as Andy suggested.
This change will be available on v2.

>
> >
> >               for (k =3D 0; k < NSYMS; k++) {
> > -                     if (!strcmp(name, required_syms[k].name)) {
> > +                     if (!strcmp(name2, required_syms[k].name)) {
> >                               if (syms[k]) {
> >                                       fail("duplicate symbol %s\n",
> >                                            required_syms[k].name);
> >
>
> Regards
> Helen

Regards,
Leonardo Bras
