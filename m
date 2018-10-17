Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33012 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbeJRHOZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 03:14:25 -0400
MIME-Version: 1.0
References: <20181017000834.GA21330@WindFlash> <20181017060151.GA1105@gmail.com>
 <CALCETrXxGKAHam6Q=q949XnudEkMRZbH-jnHCp3Egfe1sNexnQ@mail.gmail.com>
In-Reply-To: <CALCETrXxGKAHam6Q=q949XnudEkMRZbH-jnHCp3Egfe1sNexnQ@mail.gmail.com>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Wed, 17 Oct 2018 20:16:14 -0300
Message-ID: <CADvQ+rFBeyhxLp21SON5h4BP1T-rW6FMCyU-JZ_d_0EKOHQgdw@mail.gmail.com>
Subject: Re: [PATCH 2/4] Renames variable to fix shadow warning.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: mingo@kernel.org, lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hello Andy,
Thanks for the suggestion.
I renamed them as suggested and it will be available on v2.

Regards,

Leonardo

On Wed, Oct 17, 2018 at 2:54 PM Andy Lutomirski <luto@kernel.org> wrote:
>
> On Tue, Oct 16, 2018 at 11:01 PM Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Leonardo Br=C3=A1s <leobras.c@gmail.com> wrote:
> >
> > > Renames the char variable to avoid shadowing a variable previously
> > > declared on this function.
> > >
> > > Signed-off-by: Leonardo Br=C3=A1s <leobras.c@gmail.com>
> > > ---
> > >  arch/x86/entry/vdso/vdso2c.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2=
c.h
> > > index fa847a620f40..9466998d0f28 100644
> > > --- a/arch/x86/entry/vdso/vdso2c.h
> > > +++ b/arch/x86/entry/vdso/vdso2c.h
> > > @@ -93,11 +93,11 @@ static void BITSFUNC(go)(void *raw_addr, size_t r=
aw_len,
> > >               int k;
> > >               ELF(Sym) *sym =3D raw_addr + GET_LE(&symtab_hdr->sh_off=
set) +
> > >                       GET_LE(&symtab_hdr->sh_entsize) * i;
> > > -             const char *name =3D raw_addr + GET_LE(&strtab_hdr->sh_=
offset) +
> > > +             const char *name2 =3D raw_addr + GET_LE(&strtab_hdr->sh=
_offset) +
> > >                       GET_LE(&sym->st_name);
> > >
> > >               for (k =3D 0; k < NSYMS; k++) {
> > > -                     if (!strcmp(name, required_syms[k].name)) {
> > > +                     if (!strcmp(name2, required_syms[k].name)) {
> > >                               if (syms[k]) {
> > >                                       fail("duplicate symbol %s\n",
> > >                                            required_syms[k].name);
> >
> > NAK.
> >
> > Please read and understand the code and rename both variables to
> > meaningful names, not just a mindless name/name2 ...
> >
>
> Maybe image_name and sym_name?
>
> --Andy
