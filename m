Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:37942 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726585AbfCFVCA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Mar 2019 16:02:00 -0500
Message-ID: <5760e0a210c7c39b486aa932ccbe7f3f2c210d62.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: add workaround for Debian make-kpkg
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 06 Mar 2019 21:01:49 +0000
In-Reply-To: <1551888035-13329-1-git-send-email-yamada.masahiro@socionext.com>
References: <1551888035-13329-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-3foCDG+6ZtH2f72oUuhy"
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, Manoj Srivastava <manoj.srivastava.1962@gmail.com>


--=-3foCDG+6ZtH2f72oUuhy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Trying again with an alternate address for Manoj.]

kernel-package is maintained by Manoj Srivastava (cc'd), not by the
Debian kernel team.

On Thu, 2019-03-07 at 01:00 +0900, Masahiro Yamada wrote:
> Since commit 3812b8c5c5d5 ("kbuild: make -r/-R effective in top
> Makefile for old Make versions"), make-kpkg is not working.
>=20
> make-kpkg directly includes the top Makefile of Linux kernel, and
> appends some debian_* targets.
>=20
>   /usr/share/kernel-package/ruleset/kernel_version.mk:
>=20
>     # Include the kernel makefile
>     override dot-config :=3D 1
>     include Makefile
>     dot-config :=3D 1
>=20
> I did not know the kernel Makefile was used in that way, and it is
> hard to guarantee the behavior when the kernel Makefile is included
> by another Makefile from a different project.
>=20
> Looks like Debian Stretch stopped providing make-kpkg (except
> PowerPC).

kernel-package is not included in stretch at all.  I'm not sure where
you're seeing it as being present on powerpc - that architecture wasn't
included in the stretch release.

> Maybe it is obsolete and being replaced with 'make deb-pkg' etc.
> but still widely used.
[...]

kernel-package is currently planned to be included in the next release,
though I'm not sure whether it should be.

There is another bug report about kernel-package with current kernel
versions <https://bugs.debian.org/890817> but I don't know whether it
has been worked around already.

Ben.

--=20
Ben Hutchings
friends: People who know you well, but like you anyway.



--=-3foCDG+6ZtH2f72oUuhy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlyANT0ACgkQ57/I7JWG
EQkRsQ/+Ph2M0eSA6fshi/nueiBYnTirKrdWIQPXSLa4w1R4TB00qO561Sev/XCU
DYXrW4wTgmooI1TFVK25yK/3A0ysZwXSwvjMcXnl2ENaCmKJylJObqpsJi3nPIpR
AqKDmochmB/1DZ1qNNqAHp/hqwWAkuyjvw2DBtcwKybtTCRoe2HAxlV1+1shYM6e
wIxPILJS/MzakPsn/BZExwuB0SbvrgMXmYJHVWnEnHR9APa1jJmJYx+m92zU5aP0
iVmvKvTco7JL097spmT/wGGC4FymmAnkIt6ZDUfeafFbU+1zVbAURrH1PVSXVvr+
q1nlcyxW83XeSM8tmX3GEJiheMo6lIitY0jvMDxfD4fR6FSmZxKECV6n0mz2eMQa
8rF3MnV4RNu8zUNFw+jvRqGOdB01L4VNDyRSh0v9xK6naeofEw9SFLpur0VYmn4k
iaU4RunSzI+QH8vHYlbjqIb+OPqlY5NsRD1xGObV8Ic8PNYNww5nfShyAwFhlFPX
EWqMgAN+rWV4DJUFyKRakvYYJe8ZQGcQWMLpboQM/xfegtjfgKqryJuzyyWkpF3O
MsCEU7prX+MzQQq9Uq65Gg/CtjbYK3ik+SxTmmXg7EYGbsV3x2LTjG02xj9+eyzW
Sp72TvO0jniBCPwIH/sa/khD0H3QA/epj0FuvcBZJD67lcFKN6E=
=7G9C
-----END PGP SIGNATURE-----

--=-3foCDG+6ZtH2f72oUuhy--
