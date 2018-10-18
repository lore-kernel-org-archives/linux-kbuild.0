Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39105 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbeJRKCb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 06:02:31 -0400
MIME-Version: 1.0
References: <20181017000912.GA21339@WindFlash> <d3185020-b1aa-3eeb-b8e7-ecaefd624236@koikeco.de>
In-Reply-To: <d3185020-b1aa-3eeb-b8e7-ecaefd624236@koikeco.de>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Wed, 17 Oct 2018 23:03:46 -0300
Message-ID: <CADvQ+rGwns4nFjA8wMRC-mY69_Rr8wwdM8dezx0vpdjUymKqSQ@mail.gmail.com>
Subject: Re: [Lkcamp] [PATCH 3/4] kbuild: Removes unnecessary shadowed local
 variable and optimize testing.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: helen@koikeco.de
Cc: lkcamp@lists.libreplanetbr.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Matthew Wilcox <willy6545@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

Hello Helen,

On Wed, Oct 17, 2018 at 12:06 AM Helen Koike <helen@koikeco.de> wrote:
>
> Hi Leonardo,
>
> On 10/16/18 9:09 PM, Leonardo Br=C3=A1s wrote:
> >     Removes an unnecessary shadowed local variable (start).
> >     Optimize test of isdigit:
> >     - If isalpha returns true, isdigit will return false, so no need to=
 test.
>
> This patch does two different things, it should be in two separated patch=
es.
Sure, no problem.

>
> >
> > Signed-off-by: Leonardo Br=C3=A1s <leobras.c@gmail.com>
> > ---
> >  scripts/asn1_compiler.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
> > index c146020fc783..08bb6e5fd6ad 100644
> > --- a/scripts/asn1_compiler.c
> > +++ b/scripts/asn1_compiler.c
> > @@ -413,7 +413,7 @@ static void tokenise(char *buffer, char *end)
> >
> >                       /* Handle string tokens */
> >                       if (isalpha(*p)) {
> > -                             const char **dir, *start =3D p;
> > +                             const char **dir;
> >
> >                               /* Can be a directive, type name or eleme=
nt
> >                                * name.  Find the end of the name.
> > @@ -454,10 +454,9 @@ static void tokenise(char *buffer, char *end)
> >
> >                               tokens[tix++].token_type =3D TOKEN_TYPE_N=
AME;
> >                               continue;
> > -                     }
> > +                     } else if (isdigit(*p)) {
> > +                             /* Handle numbers */
>
> Actually you can't do that, p is being altered in the first if statement.

Yeah, you are right. I will remove this logic for v2.

>
> >
> > -                     /* Handle numbers */
> > -                     if (isdigit(*p)) {
> >                               /* Find the end of the number */
> >                               q =3D p + 1;
> >                               while (q < nl && (isdigit(*q)))
> >
>
> Regards
> Helen

Thanks!

Leonardo Br=C3=A1s
