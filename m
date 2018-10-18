Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39087 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbeJRJrY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 05:47:24 -0400
MIME-Version: 1.0
References: <20181017000943.GA21382@WindFlash> <1f8c4570-4e56-1e96-711d-78f119f8d261@koikeco.de>
In-Reply-To: <1f8c4570-4e56-1e96-711d-78f119f8d261@koikeco.de>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Wed, 17 Oct 2018 22:48:41 -0300
Message-ID: <CADvQ+rHUgDshzDghi9jk5Q8C=BZ3WJG1VzDcoJ6CTyXNFpaeww@mail.gmail.com>
Subject: Re: [Lkcamp] [PATCH 4/4] Changes macro usage to avoid shadowing a variable.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: helen@koikeco.de
Cc: lkcamp@lists.libreplanetbr.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Matthew Wilcox <willy6545@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

Hello Helen,

On Wed, Oct 17, 2018 at 1:18 AM Helen Koike <helen@koikeco.de> wrote:
>
> Hi Leonardo,
>
> Thanks for the patch, just some small comments below.
>
> On 10/16/18 9:09 PM, Leonardo Br=C3=A1s wrote:
> > Changes the usage of DEF_FIELD_ADDR in this function to create a
> > reference and operate over it using an aux variable.
> > It also changes the loop logic used to find duplicates, to avoid
> > creating another variable.
> >
> > Signed-off-by: Leonardo Br=C3=A1s <leobras.c@gmail.com>
> > ---
> >  scripts/mod/file2alias.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > index 7be43697ff84..9ea1db2aefdb 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -641,25 +641,27 @@ static void do_pnp_card_entries(void *symval, uns=
igned long size,
> >       unsigned int i;
> >
> >       device_id_check(mod->name, "pnp", size, id_size, symval);
> > +     DEF_FIELD_ADDR(symval, pnp_card_device_id, devs);
> > +     typeof(devs) devs_last;
> >
> >       for (i =3D 0; i < count; i++) {
> >               unsigned int j;
> > -             DEF_FIELD_ADDR(symval + i*id_size, pnp_card_device_id, de=
vs);
> > +             devs_last =3D devs + i * id_size;
> >
> >               for (j =3D 0; j < PNP_MAX_DEVICES; j++) {
> > -                     const char *id =3D (char *)(*devs)[j].id;
> > -                     int i2, j2;
> > +                     const char *id =3D (char *)(*devs_last)[j].id;
> > +                     int j2;
> >                       int dup =3D 0;
> >
> >                       if (!id[0])
> >                               break;
> >
> >                       /* find duplicate, already added value */
> > -                     for (i2 =3D 0; i2 < i && !dup; i2++) {
> > -                             DEF_FIELD_ADDR(symval + i2*id_size, pnp_c=
ard_device_id, devs);
> > +                     while ((devs_last -=3D id_size) >=3D devs) {
>
> You forgot to consider the dup variable.

Sorry, I did not get it. Could you explain it?

> Also you inverted the order of this loop, I am not sure this is
> important (I just took a quick look) but you need to be careful.

It seems to be looking for a duplicate. I don't think inverting will
break anything.
But I will give a better look anyway.

>
> This is also hard to read,
Humm, IMO it looks easier to read this way. But ok, I can change it back.

> I would define another variant macro where
> you can set any name of the variable, e.g.
>
> #define DEF_FIELD_ADDR_VAR(m, devid, f, var) \
>         typeof(((struct devid *)0)->f) *var =3D ((m) + OFF_##devid##_##f)
>
> In this way you don't need to change the logic, just the name of the
> variable.
>

Good suggestion. Is it ok to create a macro for using only once?
It looks like its not worth the trouble.


> >
> >                               for (j2 =3D 0; j2 < PNP_MAX_DEVICES; j2++=
) {
> > -                                     const char *id2 =3D (char *)(*dev=
s)[j2].id;
> > +                                     const char *id2 =3D
> > +                                             (char *)(*devs_last)[j2].=
id;
> >
> >                                       if (!id2[0])
> >                                               break;
> >
>
> Regards,
> Helen

Thank you for reviewing,

Leonardo Bras
