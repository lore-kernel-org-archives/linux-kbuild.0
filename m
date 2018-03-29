Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59306 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750781AbeC2AUV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 20:20:21 -0400
Message-ID: <e46ed72fab5dd0a575e22efa360150ae003db939.camel@decadent.org.uk>
Subject: Re: [PATCH v4] scripts/package/builddeb: split generating packaging
 and build
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 29 Mar 2018 01:20:08 +0100
In-Reply-To: <CAAqcGHn6mHHMGmcBFfRdwNSJwPaOfmnidw_T_hRKS66V47aryg@mail.gmail.com>
References: <20180221101032.27263-1-riku.voipio@linaro.org>
         <CAK7LNAQ+evMKMMcqQ8KX2aFGthsx=20o2X4EiQ7qu9y50ZvZjw@mail.gmail.com>
         <CAAqcGHkvKssjFmG0ebz5uBeO_PGeov5_C6MutW65ONp5riFwRg@mail.gmail.com>
         <CAAqcGHmeYqe81zG=PvoCtzhKhAU=27LT_K8OVhTykyBZGdML4A@mail.gmail.com>
         <CAK7LNASuGcv0rhX+NZ4q7D_hkq7=HqeZ2j5hOiW=F1VXeenwYA@mail.gmail.com>
         <CAAqcGHn6mHHMGmcBFfRdwNSJwPaOfmnidw_T_hRKS66V47aryg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-KXpXxwZ6mZm9WpLjtHVD"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>


--=-KXpXxwZ6mZm9WpLjtHVD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-03-28 at 11:58 +0300, Riku Voipio wrote:
[...]
> One option:
>=20
> +++ b/scripts/package/mkdebian
> cat <<EOF > debian/rules
> -#!/usr/bin/make -f
> #!$(which $MAKE)  -f
[..]

Shebang lines are interpreted by the kernel, not by a shell.  So you
can't do anything clever like that.

Ben.

--=20
Ben Hutchings
Who are all these weirdos? - David Bowie, on joining IRC


--=-KXpXxwZ6mZm9WpLjtHVD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlq8MTgACgkQ57/I7JWG
EQlKiw/8CLJmAa8nIFabmMtqZ95xlNMGt+pgGyibS4YFaJmQgwhgpEPuutZJPIx2
fUcis6zzWODNrvxocSBZ8oFYGgmghWzKDuwpcZ6fcKThPe6f38jye8CQClyar2z6
CSh9zPSYMgerkW10/+KB4nOpzrhAayGuCxG+UugHGxMICe6ZYCMvVQo5cR/LJ6LA
fHA4RbH6UPi+NMHRLPQtMZ3vqpqIM2NBrF1vj76q/vB9yhAD4uUjg6Gurjy63NfJ
ysL2AMHeASL4j7OSdNWB1v0KXGdGwhGefIKsLYOKfWpN+g/1XYgAHityrpS3RE4u
etL7q0hVbXzpnxq9bU5lD5doOnWqB+Y4TGmR+O8ReqFZRBRkirxVIjQvIn1YWDL1
+iCUL9QCrNWQnTDYfSxVC/hjmcwgYmT2hfoVAxAa67PgBVP89ulxuq96OLLkM2pM
RQOEuKrzw5IJ8pednGrBKu8LksJaS5tq0UEsNXNqxCkcUigS9P5t1UMD8atcOq4m
UIWqy7bWg3VP5T4/HtxnNJuw0XYgGy8GR63nbcwFej6T4gyRd/iJbNjq8caWCYB8
ikJLEw3rSdo92JTohYLsh5/kVxphTNRkhlH+Oif1n03Dn2IKWk6TRR2mmVmTP2P8
K1KgCmGEtFqPXdpvVswzU/nFZ86afCjCSp3FgvO9FOv6yVpJO1c=
=pyYU
-----END PGP SIGNATURE-----

--=-KXpXxwZ6mZm9WpLjtHVD--
