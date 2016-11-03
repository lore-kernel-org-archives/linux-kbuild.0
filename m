Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:58904 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751147AbcKCWvP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Nov 2016 18:51:15 -0400
Message-ID: <1478213455.29107.13.camel@decadent.org.uk>
Subject: Re: [PATCH 2/2] kbuild: add -fno-PIE
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 03 Nov 2016 16:50:55 -0600
In-Reply-To: <20161102172058.13641-2-bigeasy@linutronix.de>
References: <20161102172058.13641-1-bigeasy@linutronix.de>
         <20161102172058.13641-2-bigeasy@linutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-lPoMtO12CutktXVRNZ/E"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org
Cc: Sven Joachim <svenjoac@gmx.de>, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org


--=-lPoMtO12CutktXVRNZ/E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-02 at 18:20 +0100, Sebastian Andrzej Siewior wrote:
> Debian started to build the gcc with -fPIE by default so the kernel
> build ends before it starts properly with:
> |kernel/bounds.c:1:0: error: code model kernel does not support PIC mode
>=20
>=20
> Also add to KBUILD_AFLAGSi due to:
>=20
> |gcc -Wp,-MD,arch/x86/entry/vdso/vdso32/.note.o.d =E2=80=A6 -mfentry -DCC=
_USING_FENTRY =E2=80=A6 vdso/vdso32/note.S
> |arch/x86/entry/vdso/vdso32/note.S:1:0: sorry, unimplemented: -mfentry is=
n=E2=80=99t supported for 32-bit in c ombination with -fpic
[...]

Unfortunately this isn't sufficient:

Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong availa=
ble but compiler is broken
/build/linux-4.9~rc3/Makefile:1069: recipe for target 'prepare-compiler-che=
ck' failed
make[5]: *** [prepare-compiler-check] Error 1

scripts/gcc-x86_64-has-stack-protector.sh has its own list of options
which will need to include -fno-PIE.

Ben.

--=20
Ben Hutchings
The world is coming to an end.	Please log off.

--=-lPoMtO12CutktXVRNZ/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYG79QAAoJEOe/yOyVhhEJkdQQALPxbyObMhOefbGJ6JNx52OE
Q+UJDeUVNpOJIyh+P1l1eb7kDTu2ZDKOeLi25B3e/2qlj7z3axhPgkVm19MzWck9
Oba8gFjPrb4R/iAIPb9BuOuplvWinkC0fNV6hVY/GHfrCJL709nU0jrtt7dO9JUA
DBz4lmr+goN/wCa/liCq7gdqGXJz40aqlcEaxah59ilvk0i2NoW4AR0R7CfNx6Vu
gc8EW5+dyJvf9SDeLKPNM9XxGd6d5//evATb33RDIW9SwpkvYMjaN+3QvXunDjBJ
d9a172GRDMi0Rr8u9z61qNRMtozJIC3BU/vrV2Nk5AV1v5INv0u8yTI7MR304c+l
MQLK3tkoSA+XXiTPZdov+iM2HTpatwwBmiqt5sya61VgfzN1gBh6OLjdNJ8xXBPl
41FOJO7z7MLVbHUq18jFZ57oMYn3pj/CeAjfrtW4+Pnd0ilZt/XIAqk7uVpdbd2Y
doGDDIYty4l0gZ4qrDSAr+Jh5SCbAD4fV5vtMl/hFYKLcF+37nm4qn8lG7PFTogN
wrEILmGMk5m1r5JzQJ8HMedeeIZ0ORBx/299XC0vDCulY479UpGnojbRZT2HuF0V
8Kdd92caPX026L0TZ5Q0NueNi9lOs0iYqNuTes8AOe2Vyx0fBFk2xe1vD32aizQc
KlCBZAIJ2PPZYmIQicG9
=0Ps9
-----END PGP SIGNATURE-----

--=-lPoMtO12CutktXVRNZ/E--
