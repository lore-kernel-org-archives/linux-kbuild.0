Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:41554 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726342AbfCGGhA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Mar 2019 01:37:00 -0500
Message-ID: <788870e550cb3cecafd9db14c081ddb0225edfde.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: add workaround for Debian make-kpkg
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 07 Mar 2019 06:36:40 +0000
In-Reply-To: <CAK7LNAQFWWzki-MvmhDpAn46XkDAu4_EGCQotbi5qAk5oJrgUQ@mail.gmail.com>
References: <1551888035-13329-1-git-send-email-yamada.masahiro@socionext.com>
         <5760e0a210c7c39b486aa932ccbe7f3f2c210d62.camel@decadent.org.uk>
         <CAK7LNAQFWWzki-MvmhDpAn46XkDAu4_EGCQotbi5qAk5oJrgUQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-o6KqZAJ/ZnD7AtDiZPrq"
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manoj Srivastava <manoj.srivastava.1962@gmail.com>


--=-o6KqZAJ/ZnD7AtDiZPrq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-07 at 13:03 +0900, Masahiro Yamada wrote:
[...]
> If make-kpkg will still be included in the future Debian releases,
> I'd like to change make-kpkg to make it work more reliably.
>=20
>=20
> The git URL in the control file
> "https://anonscm.debian.org/git/users/srivasta/debian/kernel-package.git"
> seems stale.
>=20
> Anyway, I found it in a new place:
>=20
> $ git clone  https://salsa.debian.org/srivasta/kernel-package
>=20
>=20
> Hmm, the last commit was three years ago.
>=20
> So, it is almost unmaintained, I guess...
[...]

Yes, though there was a more recent bug fix by another Debian
developer:
https://tracker.debian.org/news/857223/accepted-kernel-package-13018nmu1-so=
urce-into-unstable/

Ben.

--=20
Ben Hutchings
friends: People who know you well, but like you anyway.


--=-o6KqZAJ/ZnD7AtDiZPrq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlyAu/gACgkQ57/I7JWG
EQnr4hAAzSU6SAe/6oZ3zOTVMCX0u6aRfQ56X/3pC0UXsim3Zt5A7R6Ittl8BBOj
QbgzW2idWiCNmxUW9nUyoYY9eJtG98uv0cH/DBvrnw3XPscVBdjgIHycoClVJw8p
6T5DAZOLzYcrkCUPAFSaxSQQ4qF7VFKvpIG8Gkka+4YN3nPUSXKz0XT9e3VgMyB3
ONXwUz6TAzEDfATHM+aWOERFAriVGVDmwqnEPQFxJCh3WPCe4e4w/d+bv8I7gf1W
djem7TO+4Juh3DK+JQr+HbZrjC2Zm43LVadzblNmCXxp297QrhNRZWqhwjjM//hl
niMDAQ+Modd7RpCg4Fb4CbfUYL3QGjlVTgxb3WombCD6EAZEcbAsuAc5WnvGuNX0
lxGEA2O8rrJw49PKV/l9g67Uf8k3ZbifC/9Bt0DpD6gTPbBSz+NaMmtfAkTngeQb
QsuuVSfy74QIyvODPRCZ2PM75ly4SK11Bos0cmvkkOYadjV6Q2X53llU1rYZt5Xg
UTfctRneNL4a9vniAh4cO5RXq/gQNcqy1U2CRXQHGWTaB5pS4yMA1A4NXebtovB5
btEmx1gE8Mcf+eLAcbd0fPTVs08b76moi4XgkfraZmKf/C9Ib2ognGU9d0RAf0Y+
L18mA4lE+hAywak8AofdrTVM7QZze06MqMCtU7j1G3XnIBAIJFI=
=F4f5
-----END PGP SIGNATURE-----

--=-o6KqZAJ/ZnD7AtDiZPrq--
