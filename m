Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:48813 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbeI2XOV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Sep 2018 19:14:21 -0400
MIME-Version: 1.0
References: <1538115715-10078-1-git-send-email-yamada.masahiro@socionext.com> <87bm8giy9l.fsf@rustcorp.com.au>
In-Reply-To: <87bm8giy9l.fsf@rustcorp.com.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 30 Sep 2018 01:44:22 +0900
Message-ID: <CAK7LNAR1PvP9UXFve9Fx=bwzy3azt3bT0eBFtMo1CvrqHvAzdQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: remove leftover symbol prefix handling for
 module device table
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>

2018=E5=B9=B49=E6=9C=8829=E6=97=A5(=E5=9C=9F) 16:01 Rusty Russell <rusty@ru=
stcorp.com.au>:
>
> Please send this to the module maintainer (CC'd).


I just sent this to Kbuild ML
since scripts/mod/ is listed in the Kbuild part.

Next time, I will try my best to remember
to CC the module maintainer.

Reviewed-by tags are appreciated.



KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
M:      Masahiro Yamada <yamada.masahiro@socionext.com>
M:      Michal Marek <michal.lkml@markovi.net>
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git
L:      linux-kbuild@vger.kernel.org
S:      Maintained
F:      Documentation/kbuild/
F:      Makefile
F:      scripts/Kbuild*
F:      scripts/Makefile*
F:      scripts/basic/
F:      scripts/mk*
F:      scripts/mod/
F:      scripts/package/






> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> > Blackfin and metag were the only architectures that prefix symbols with
> > an underscore.  They were removed by commit 4ba66a976072 ("arch: remove
> > blackfin port"), commit bb6fb6dfcc17 ("metag: Remove arch/metag/"),
> > respectively.
> >
> > It is no longer necessary to handle <prefix> part of module device
> > table symbols.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  scripts/mod/file2alias.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > index 7be4369..ba4ebc4 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -1415,11 +1415,10 @@ void handle_moddevtable(struct module *mod, str=
uct elf_info *info,
> >       if (ELF_ST_TYPE(sym->st_info) !=3D STT_OBJECT)
> >               return;
> >
> > -     /* All our symbols are of form <prefix>__mod_<name>__<identifier>=
_device_table. */
> > -     name =3D strstr(symname, "__mod_");
> > -     if (!name)
> > +     /* All our symbols are of form __mod_<name>__<identifier>_device_=
table. */
> > +     if (strncmp(symname, "__mod_", strlen("__mod_")))
> >               return;
> > -     name +=3D strlen("__mod_");
> > +     name =3D symname + strlen("__mod_");
> >       namelen =3D strlen(name);
> >       if (namelen < strlen("_device_table"))
> >               return;
> > --
> > 2.7.4



--=20
Best Regards
Masahiro Yamada
