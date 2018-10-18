Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35383 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbeJRNqk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 09:46:40 -0400
Date: Thu, 18 Oct 2018 07:47:18 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 2/4] Renames variable to fix shadow warning.
Message-ID: <20181018054718.GB62071@gmail.com>
References: <20181017000834.GA21330@WindFlash>
 <20181017060151.GA1105@gmail.com>
 <CADvQ+rHD5kAam7kOc2UBUd9Pw6QW3dGhUjQj=es37NfgMeLcyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvQ+rHD5kAam7kOc2UBUd9Pw6QW3dGhUjQj=es37NfgMeLcyA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Leonardo Bras <leobras.c@gmail.com>
Cc: lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org


* Leonardo Bras <leobras.c@gmail.com> wrote:

> Thanks Ingo,
> On Wed, Oct 17, 2018 at 3:01 AM Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Leonardo Brás <leobras.c@gmail.com> wrote:
> >
> > > Renames the char variable to avoid shadowing a variable previously
> > > declared on this function.
> > >
> > > Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
> > > ---
> > >  arch/x86/entry/vdso/vdso2c.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.h
> > > index fa847a620f40..9466998d0f28 100644
> > > --- a/arch/x86/entry/vdso/vdso2c.h
> > > +++ b/arch/x86/entry/vdso/vdso2c.h
> > > @@ -93,11 +93,11 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
> > >               int k;
> > >               ELF(Sym) *sym = raw_addr + GET_LE(&symtab_hdr->sh_offset) +
> > >                       GET_LE(&symtab_hdr->sh_entsize) * i;
> > > -             const char *name = raw_addr + GET_LE(&strtab_hdr->sh_offset) +
> > > +             const char *name2 = raw_addr + GET_LE(&strtab_hdr->sh_offset) +
> > >                       GET_LE(&sym->st_name);
> > >
> > >               for (k = 0; k < NSYMS; k++) {
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
> It's changed! This change will be available on v2.

Thanks!

	Ingo
