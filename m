Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.emlix.com ([188.40.240.192]:33306 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbfDKIwp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 04:52:45 -0400
From: Rolf Eike Beer <eb@emlix.com>
Subject: Re: [PATCH linux] objtool: fix pkg-config query in case of cross-compilation
Date: Thu, 11 Apr 2019 10:52:39 +0200
Message-ID: <4208204.4d101oJ1v5@devpool35>
In-Reply-To: <20190411083940.3911-1-nicolas.dichtel@6wind.com>
References: <20190411083940.3911-1-nicolas.dichtel@6wind.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2978754.nR1pzekyYs"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: tglx@linutronix.de, jpoimboe@redhat.com, yamada.masahiro@socionext.com, peterz@infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart2978754.nR1pzekyYs
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Donnerstag, 11. April 2019, 10:39:40 CEST schrieb Nicolas Dichtel:
> In case of cross-compilation, there may be two pkg-config tools, one for
> the host and one for the target. Enable to override the default name.
>=20
> Fixes: 056d28d135bc ("objtool: Query pkg-config for libelf location")
> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>

If you do that, you have to fix a lot of other places, too. This starts in=
=20
scripts/kconfig/ and also includes e.g. tools/testing/.

Usually you have pkg-config for host and ${target_platform}-pkg-config for =
the=20
target, and the PKG_CONFIG variable for the target, usually initialized to $
(CROSS_COMPILE)pkg-config. I have sent a bunch of patches to replace the us=
age=20
of plain pkg-config at several places with the cross-aware version, but sad=
ly=20
a lot of them have not been picked up. It break cross-building tests basica=
lly=20
all the time. One example is here:=20

https://marc.info/?l=3Dlinux-acpi&m=3D153544231529066&w=3D2

=46or me it looks like you are trying to go into the wrong direction.

Greetings,

Eike
=2D-=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix - smart embedded open source
--nextPart2978754.nR1pzekyYs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCXK8AVwAKCRCr5FH7Xu2t
/G6lA/45lcxPk+/3m0YJ8VVw6OLpcHgHlSur8IN9N0e5FhbqBm8IKPAZvhTmJP3z
PZeZ8vPEVQT8o07ZFKxG3W5G1k06dUgfzUxP0ozURgXQ8ZZCKyiwATm/y24es/io
urnEOZdqgaC8IqyKX888N266OmyWedJ01I/IEQ4k79jTYUoQ5A==
=gC/P
-----END PGP SIGNATURE-----

--nextPart2978754.nR1pzekyYs--
