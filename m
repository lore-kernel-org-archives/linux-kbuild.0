Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:56927 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753103AbdKIIMN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 03:12:13 -0500
Date: Thu, 9 Nov 2017 08:06:02 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH 1/2] MIPS: dts: remove bogus bcm96358nb4ser.dtb from
 dtb-y entry
Message-ID: <20171109080601.GS15260@jhogan-linux>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
 <1509859853-27473-2-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQfK_BWQcVW-ScrpAwNAHav3MrrzV-tjn_YUjsuvd7U5A@mail.gmail.com>
 <20171106095139.GG15260@jhogan-linux>
 <CAK7LNAQ_bugEP8hHKmCif5QCz2=Pw_GpXzYz4zJeXO0HXaT_ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cYG5ZC/RuVsIq1ir"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ_bugEP8hHKmCif5QCz2=Pw_GpXzYz4zJeXO0HXaT_ag@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>

--cYG5ZC/RuVsIq1ir
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2017 at 08:00:49PM +0900, Masahiro Yamada wrote:
> 2017-11-06 19:41 GMT+09:00 James Hogan <jhogan@kernel.org>:
> > Hi,
> >
> > On Sun, Nov 05, 2017 at 11:11:38PM +0900, Masahiro Yamada wrote:
> >> +CC Ralf Baechle <ralf@linux-mips.org>
> >> +CC linux-mips@linux-mips.org
> >> +CC Kevin Cernekee <cernekee@gmail.com>
> >> +CC Florian Fainelli <f.fainelli@gmail.com>
> >>
> >>
> >> I missed to CC MIPS maintainers.
> >
> > Yes, please resend the patch so it lands in patchwork.linux-mips.org.
>=20
>=20
> This is a part of clean-up series of DT building.
>=20
> I want Acked-by from MIPS maintainers
> so that the whole series can go to a different tree.
> (DT or Kbuild).

Well FWIW, as acting MIPS maintainer right now:

Acked-by: James Hogan <jhogan@kernel.org>

Cheers
James

--cYG5ZC/RuVsIq1ir
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloEDGkACgkQbAtpk944
dnqtMQ/9EkU6LBbjrqwXDF9JqmxGykox4YXqoZwkvmKBG2aDeaqvh9MhpDEZSQmC
EIBwQH5Yej7SRh4XxSgTOwfKdKHKOqPj4ExPK+X5pO5hlg5A2cZAzAjsSrsTRAgM
B4J4yX3jPCS1LHbkXaEvzXZOJWMbCcpTmbkavHTGDfxDAnLh1ZecC8Otn75be3cF
rz8Nji/xXzlKws2GvQm/4UGAsqKTrcMFTRWqaQW3eDw3w09T10HyxFejx9X9dA/Z
YRXSTPNCSJ5Vt/UzJ8Chqp6/898VyUKj1mjmttudNiHSSnyrBQM4fu72NqVEbYnS
2GzG5VIr+uXkmpgfsZpjsxYTupNI9vmoEjF+wOnzuVkip9NIHirYQkr5snImjrx1
0zWn3dskm3Jh33tYDEVY2RYyt4jVvOxgHc+p/MY4TIB1wVVvZ9JCE8XskhF42g7X
1eXn92wVj+Yzcx/mp2haFiQ54LNP6ADbXbtgHvkYMiMpkfoAk7Um1Pg1TAdHC7pZ
ii1rg67UqB18YIiojXYn27HUuFpaoBhyfraGYuW++yt2rFWRzVsm7//dZclO+Vrr
emwzWSAogXkFrVuD1tlfAHRrpice0QSh+VJoqAp+N/gTTgQONU5LZ/B+cTEsSP8i
janm5/1JBMVbHlbd0WNwvrfwfGuzVJvMzrW1r3lECGSDPlkPrzU=
=wanZ
-----END PGP SIGNATURE-----

--cYG5ZC/RuVsIq1ir--
