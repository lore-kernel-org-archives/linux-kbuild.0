Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:46871 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1041363AbdDUQjc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 12:39:32 -0400
Message-ID: <1492787077.31767.24.camel@decadent.org.uk>
Subject: Re: [PATCH 3/3] builddeb: add make fastdeb-pkg target
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 21 Apr 2017 16:04:37 +0100
In-Reply-To: <CAK7LNAQ5V-B+Os2WZZb3H6hqCOsNtSvTZJw-kJmt5hP_xS+QcA@mail.gmail.com>
References: <20170331130941.5250-1-riku.voipio@linaro.org>
         <20170331130941.5250-4-riku.voipio@linaro.org>
         <CAK7LNAQT8pSjgW5ujnWWP3MKfU0=XnFKWVeNu-fx5NRRX0XgMg@mail.gmail.com>
         <CAAqcGHk80P4tKFn+j5n6M=77XaDFkc_e30RZ04+MmMf=qJDyzw@mail.gmail.com>
         <CAK7LNAQ5V-B+Os2WZZb3H6hqCOsNtSvTZJw-kJmt5hP_xS+QcA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-qCCQEatzlre3AG7V8OO1"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>


--=-qCCQEatzlre3AG7V8OO1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-04-21 at 18:57 +0900, Masahiro Yamada wrote:
[...]
> In hindsight, it seems more straightforward to me
> to build the binary packages from the source package.
> But, I know this refactoring will need lots of changes, which may
> break something.
>=20
> Once we support this fastdeb-pkg target,
> we will not be able to convert the script in that way.
> (because we do not have a standard way to generate a particular binary
> package from *.dsc)
[...]

We kind of do, though it's a relatively new feature:
https://wiki.debian.org/BuildProfileSpec

Ben.

--=20
Ben Hutchings
I'm not a reverse psychological virus.=C2=A0=C2=A0Please don't copy me into=
 your
sig.

--=-qCCQEatzlre3AG7V8OO1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlj6H4UACgkQ57/I7JWG
EQngUQ/8C4UiJLnLvhDcK9ViWQeo0dJjSZQFwfvcWLL0gSWh0CyX2hiosN6iUdIW
WZcW0RpGeulzbz2wchv0exEBd5OrRbb8tJAyMAgJhDlGmIRTbmc942AljXcy17sB
UTXasOIy5C8rJxM+l6aIkn+4xJvDnMRhSSneQ6YC9QKdujcN3kfv3+5BNef6BIgN
U5da3H5QVSAgJflaWs0W6xLYu+XT52mVqM8Lahv18ee/3lP3r1SHIWZCtaW3ADY3
R2DlGaG6oMJQxpuyUQrrDPkS6FHjV2KORxU9YX2RPntCCjMcKjU3falzJiJTv4DK
bpaw1YDUI7qQ1OFUfr7zKrJfVdVkROwM9JL8zf0lhmsu0ACJfDC4ozhkJ4YlRlBO
gn/RTgxfMhTxXsXt9T2BP3NP2BjVtPNQr9QeGnC8p/P07EDoYCoK34ReS1vr3xlC
fD0OxSW5SVn65RzCR6LGjBzTvMhBBvpYX4wMUSE6IfIfxzV2U3IzwtSpuiOA9Y1v
hWWgsevyu3lyVynoFmK9zAbL+Qz+ECVm31B4JQxwm5YTcEw3HlvazHwrjYFcEmw3
bWp5Qht8qjTBcLVGm8/H1whzAYRyCwHE1ywXJTJHjf151q1xlAaIr2QjWPYQ3pQs
/CjDREY0t6QuKDkIk+2wm+8CnQfA+rpG1zvW8e8VImE7s3kjjA4=
=Sewq
-----END PGP SIGNATURE-----

--=-qCCQEatzlre3AG7V8OO1--
