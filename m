Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727290AbeJRBv2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 21:51:28 -0400
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E290214C2
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Oct 2018 17:54:41 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id y140-v6so129980wmd.0
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Oct 2018 10:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20181017000834.GA21330@WindFlash> <20181017060151.GA1105@gmail.com>
In-Reply-To: <20181017060151.GA1105@gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Wed, 17 Oct 2018 10:54:28 -0700
Message-ID: <CALCETrXxGKAHam6Q=q949XnudEkMRZbH-jnHCp3Egfe1sNexnQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] Renames variable to fix shadow warning.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: leobras.c@gmail.com, lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Andrew Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, michal.lkml@markovi.net, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Oct 16, 2018 at 11:01 PM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Leonardo Br=C3=A1s <leobras.c@gmail.com> wrote:
>
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
> >
> >               for (k =3D 0; k < NSYMS; k++) {
> > -                     if (!strcmp(name, required_syms[k].name)) {
> > +                     if (!strcmp(name2, required_syms[k].name)) {
> >                               if (syms[k]) {
> >                                       fail("duplicate symbol %s\n",
> >                                            required_syms[k].name);
>
> NAK.
>
> Please read and understand the code and rename both variables to
> meaningful names, not just a mindless name/name2 ...
>

Maybe image_name and sym_name?

--Andy
