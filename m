Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:49237 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751484Ab1EJUjK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2011 16:39:10 -0400
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: Choice visibility issue
Date: Tue, 10 May 2011 22:38:47 +0200
References: <201105100053.37010.yann.morin.1998@anciens.enib.fr> <BANLkTinRk7zbr6odrFhW2YLcHvwnuzEJtg@mail.gmail.com>
In-Reply-To: <BANLkTinRk7zbr6odrFhW2YLcHvwnuzEJtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_XJayNXDqgw5MM3q"
Message-Id: <201105102238.47557.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

--Boundary-00=_XJayNXDqgw5MM3q
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Arnaud, All,

On Tuesday 10 May 2011 20:12:11 Arnaud Lacombe wrote:
> On Mon, May 9, 2011 at 6:53 PM, Yann E. MORIN
> <yann.morin.1998@anciens.enib.fr> wrote:
> > In case a choice appears in two places, and each instance depends on
> > different conditions, the visibility of the choice item is not coherent.
[--SNIP--]
> > If neither A not B is selected, the choice is not visible (expected):
> > =A0[ ] A
> > =A0[ ] =A0 B
> > =3D=3D> OK
> >
> No, there is a first bug here, B should not appear as a child of A,
> but it is irrelevant to the other issue. [note for later,
> menu_finalize() is breaking the tree, damn dependency...]

The first I saw this behavior, I thought as you did: B should not be
considered a child of A, as it does not depend on A, but on !A.

But then, B is directly dependent on the value of A, so it kind of makes
sense to treat it as a child of A, and indent it.

Of course, I don't really mind one way or the other. :-)

[--SNIP--]
> > For the conf frontend, the issue happens only on the second run, not
> > on the first run, which somewhat makes sense. I was not able to run
> > xconfig, as I lack proper qt devel here.
> of course, your problem is in the backend.

Yes, I just wanted to confirm the behavior was common to all frontends,
just to check it was not some weirdness in mconf, then I looked at
menu.c but got /lost in translation/ when trying to understand how the
visibility of choices was established...

> > So:
> > - is this a limitation that can not be overcome?
> yes, the problem is that choice's visibility are only determined by
> the visibility of the underlying symbol. In your case, the same symbol
> appear in twice in the tree.

Good to know. Thanks! :-)

> > - if it can be overcome, where should I start to look at?
> you may want to try:
>=20
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 5fdf10d..55b6fe0 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -279,6 +279,10 @@ void menu_finalize(struct menu *parent)
>                                         }
>                                 }
>                         }
> +                       if (parent->prompt &&
> !expr_is_yes(parent->prompt->visible.expr)) {
> +                               parent->visibility =3D
> expr_alloc_and(parent->visibility,
> +                                           parent->prompt->visible.expr);
> +                       }
>                         /* set the type of the remaining choice values */
>                         for (menu =3D parent->list; menu; menu =3D menu->=
next) {
>                                 current_entry =3D menu;

\o/ Yes! It works! It fixes both the test case I submitted, and it also
fixes the use-case in crosstool-NG as well! Great! :-)

> I did not regress-tested it yet, but it seems to help in this specific
> case.

I've done a few tests here, and all seems OK. See the attached test file.
Tested against linux-next 1139a3e1bfbc0320175eaaf9c09261956271eb36 with
your patch applied on-top.

> [I anticipate that GMail is gonna wrap lines ... d'oh!]

Yep... :-)
Will you re-send a properly formatted patch, or do you want me to do so?

Thank you again!

Regards,
Yann E. MORIN.

=2D-=20
=2E-----------------.--------------------.------------------.--------------=
=2D-----.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspira=
cy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___           =
    |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is =
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspirac=
y.  |
'------------------------------^-------^------------------^----------------=
=2D---'

--Boundary-00=_XJayNXDqgw5MM3q
Content-Type: text/x-csrc;
  charset="iso 8859-15";
  name="toto.in"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="toto.in"

config TEST_ME
    bool "Say y to test"

if TEST_ME

choice A
    bool "A"
config A1
    bool "A1"
config A2
    bool "A2"
config A3
    bool "A3"
endchoice # A

endif # TEST_ME

if A2

choice C
    bool "C"
config C1
    bool "C1"
config C2
    bool "C2"
endchoice

endif # A2

if A3

choice C
    bool "C"
config C1
    bool "C1"
config C2
    bool "C2"
endchoice

endif # A3

--Boundary-00=_XJayNXDqgw5MM3q--
