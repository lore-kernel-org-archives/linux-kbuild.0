Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41605 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbeJ3JX1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 05:23:27 -0400
MIME-Version: 1.0
References: <20181023011042.GA6582@WindFlash> <CAK7LNAT4uJiR8Nm1agBQwjGFDY81_7O0o6fxuqh=55WizwvhYQ@mail.gmail.com>
In-Reply-To: <CAK7LNAT4uJiR8Nm1agBQwjGFDY81_7O0o6fxuqh=55WizwvhYQ@mail.gmail.com>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Mon, 29 Oct 2018 21:32:05 -0300
Message-ID: <CADvQ+rGyM3-K8ggHzJ7883wd8=04U3QkBD=R=HYg=gbcDgk_Ng@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] Creates macro to avoid variable shadowing
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: lkcamp@lists.libreplanetbr.org, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, Helen Koike <helen@koikeco.de>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Thank you!
On Sun, Oct 28, 2018 at 1:38 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Tue, Oct 23, 2018 at 10:11 AM Leonardo Br=C3=A1s <leobras.c@gmail.com>=
 wrote:
> >
> > Creates DEF_FIELD_ADDR_VAR as a more generic version of the DEF_FIELD_A=
DD
> > macro, allowing usage of a variable name other than the struct element =
name.
> > Also, sets DEF_FIELD_ADDR as a specific usage of DEF_FILD_ADDR_VAR in w=
hich
> > the var name is the same as the struct element name.
> >
> > Signed-off-by: Leonardo Br=C3=A1s <leobras.c@gmail.com>
> > ---
>
>
> Applied to linux-kbuild.
>
>
>
> >  scripts/mod/file2alias.c | 24 +++++++++++++++++-------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > index 7be43697ff84..3015c0bdecb2 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -95,12 +95,20 @@ extern struct devtable *__start___devtable[], *__st=
op___devtable[];
> >   */
> >  #define DEF_FIELD(m, devid, f) \
> >         typeof(((struct devid *)0)->f) f =3D TO_NATIVE(*(typeof(f) *)((=
m) + OFF_##devid##_##f))
> > +
> > +/* Define a variable v that holds the address of field f of struct dev=
id
> > + * based at address m.  Due to the way typeof works, for a field of ty=
pe
> > + * T[N] the variable has type T(*)[N], _not_ T*.
> > + */
> > +#define DEF_FIELD_ADDR_VAR(m, devid, f, v) \
> > +       typeof(((struct devid *)0)->f) *v =3D ((m) + OFF_##devid##_##f)
> > +
> >  /* Define a variable f that holds the address of field f of struct dev=
id
> >   * based at address m.  Due to the way typeof works, for a field of ty=
pe
> >   * T[N] the variable has type T(*)[N], _not_ T*.
> >   */
> >  #define DEF_FIELD_ADDR(m, devid, f) \
> > -       typeof(((struct devid *)0)->f) *f =3D ((m) + OFF_##devid##_##f)
> > +       DEF_FIELD_ADDR_VAR(m, devid, f, f)
> >
> >  /* Add a table entry.  We test function type matches while we're here.=
 */
> >  #define ADD_TO_DEVTABLE(device_id, type, function) \
> > @@ -641,25 +649,27 @@ static void do_pnp_card_entries(void *symval, uns=
igned long size,
> >         unsigned int i;
> >
> >         device_id_check(mod->name, "pnp", size, id_size, symval);
> > +       DEF_FIELD_ADDR(symval, pnp_card_device_id, devs);
> > +       typeof(devs) devs_last;
> >
> >         for (i =3D 0; i < count; i++) {
> >                 unsigned int j;
> > -               DEF_FIELD_ADDR(symval + i*id_size, pnp_card_device_id, =
devs);
> > +               devs_last =3D devs + i * id_size;
> >
> >                 for (j =3D 0; j < PNP_MAX_DEVICES; j++) {
> > -                       const char *id =3D (char *)(*devs)[j].id;
> > -                       int i2, j2;
> > +                       const char *id =3D (char *)(*devs_last)[j].id;
> > +                       int j2;
> >                         int dup =3D 0;
> >
> >                         if (!id[0])
> >                                 break;
> >
> >                         /* find duplicate, already added value */
> > -                       for (i2 =3D 0; i2 < i && !dup; i2++) {
> > -                               DEF_FIELD_ADDR(symval + i2*id_size, pnp=
_card_device_id, devs);
> > +                       while ((devs_last -=3D id_size) >=3D devs && !d=
up) {
> >
> >                                 for (j2 =3D 0; j2 < PNP_MAX_DEVICES; j2=
++) {
> > -                                       const char *id2 =3D (char *)(*d=
evs)[j2].id;
> > +                                       const char *id2 =3D
> > +                                               (char *)(*devs_last)[j2=
].id;
> >
> >                                         if (!id2[0])
> >                                                 break;
> > --
> > 2.19.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada
