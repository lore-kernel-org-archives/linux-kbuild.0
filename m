Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61551 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbeJSKtF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Oct 2018 06:49:05 -0400
MIME-Version: 1.0
References: <20181017000912.GA21339@WindFlash> <d3185020-b1aa-3eeb-b8e7-ecaefd624236@koikeco.de>
 <CADvQ+rGwns4nFjA8wMRC-mY69_Rr8wwdM8dezx0vpdjUymKqSQ@mail.gmail.com>
In-Reply-To: <CADvQ+rGwns4nFjA8wMRC-mY69_Rr8wwdM8dezx0vpdjUymKqSQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 19 Oct 2018 11:44:06 +0900
Message-ID: <CAK7LNAQ58ZMjFmyNDNmtE+KaQE_LAqo1aRQ-4WpnUsgJSjNT6g@mail.gmail.com>
Subject: Re: [Lkcamp] [PATCH 3/4] kbuild: Removes unnecessary shadowed local
 variable and optimize testing.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>
Cc: helen@koikeco.de, lkcamp@lists.libreplanetbr.org, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthew Wilcox <willy6545@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

On Thu, Oct 18, 2018 at 11:04 AM Leonardo Bras <leobras.c@gmail.com> wrote:
>
> Hello Helen,
>
> On Wed, Oct 17, 2018 at 12:06 AM Helen Koike <helen@koikeco.de> wrote:
> >
> > Hi Leonardo,
> >
> > On 10/16/18 9:09 PM, Leonardo Br=C3=A1s wrote:
> > >     Removes an unnecessary shadowed local variable (start).
> > >     Optimize test of isdigit:
> > >     - If isalpha returns true, isdigit will return false, so no need =
to test.
> >
> > This patch does two different things, it should be in two separated pat=
ches.
> Sure, no problem.
>
> >
> > >
> > > Signed-off-by: Leonardo Br=C3=A1s <leobras.c@gmail.com>
> > > ---
> > >  scripts/asn1_compiler.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
> > > index c146020fc783..08bb6e5fd6ad 100644
> > > --- a/scripts/asn1_compiler.c
> > > +++ b/scripts/asn1_compiler.c
> > > @@ -413,7 +413,7 @@ static void tokenise(char *buffer, char *end)
> > >
> > >                       /* Handle string tokens */
> > >                       if (isalpha(*p)) {
> > > -                             const char **dir, *start =3D p;
> > > +                             const char **dir;
> > >
> > >                               /* Can be a directive, type name or ele=
ment
> > >                                * name.  Find the end of the name.
> > > @@ -454,10 +454,9 @@ static void tokenise(char *buffer, char *end)
> > >
> > >                               tokens[tix++].token_type =3D TOKEN_TYPE=
_NAME;
> > >                               continue;
> > > -                     }
> > > +                     } else if (isdigit(*p)) {
> > > +                             /* Handle numbers */
> >
> > Actually you can't do that, p is being altered in the first if statemen=
t.
>
> Yeah, you are right. I will remove this logic for v2.


I drop v1 from my tree.

Please send v2.


> >
> > >
> > > -                     /* Handle numbers */
> > > -                     if (isdigit(*p)) {
> > >                               /* Find the end of the number */
> > >                               q =3D p + 1;
> > >                               while (q < nl && (isdigit(*q)))
> > >
> >
> > Regards
> > Helen
>
> Thanks!
>
> Leonardo Br=C3=A1s



--=20
Best Regards
Masahiro Yamada
