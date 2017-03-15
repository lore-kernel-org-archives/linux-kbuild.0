Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:35391 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751848AbdCOOu4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Mar 2017 10:50:56 -0400
Received: by mail-qt0-f179.google.com with SMTP id x35so14035285qtc.2
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Mar 2017 07:50:55 -0700 (PDT)
Date: Wed, 15 Mar 2017 10:51:18 -0400
From: Tom Rini <trini@konsulko.com>
Subject: Re: kbuild/mkspec: Fix architectures where KBUILD_IMAGE isn't a full
 path
Message-ID: <20170315145118.GA30463@bill-the-cat>
References: <1489276762-22280-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <1489276762-22280-1-git-send-email-trini@konsulko.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2017 at 11:59:22PM +0000, Tom Rini wrote:

> On some architectures, such as arm64, KBUILD_IMAGE is not a full path
> but instead just the build target.  The builddeb script handles this
> case correctly today and will try arch/$ARCH/boot/$KBUILD_IMAGE so we
> can just borrow that logic and adapt it slightly for spec file syntax.
>=20
> Cc: Michal Marek <mmarek@suse.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> It is currently a mixed-bag on if architectures will use a build target
> (arm, arm64, arc are certainly by inspection and a few others 'may') or
> a full path (x86, blackfin, s390).  Given that builddeb gets this case
> correct, I think changing mkspec is the right way to go here.

I found https://patchwork.kernel.org/patch/9442211/ today and I see that
it was brought up again just before I sent my patch.  I just want to
point out that 9442211 doesn't address arm, arc, and sh and they will
still not have a functional rpm build target.  This is at least probably
important for arm.  Of course all of those could also be addressed with
a patch similar to 9442211, and my main concern is making sure
everything gets fixed one way or another.  Thanks!

--=20
Tom

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYyVTmAAoJEIf59jXTHXZSkzgQAJbfOqHlIZ6eqrAU+eH3zFzP
O7KL10g0z8hHN/f5bFYO9zhLH37WSdTdiAHKtXFQop5kV0L4GEgwCaT7C8/jOhF8
bPZIgXvCJ2J0KMYy2HKQE4geGnZBmpCQ4Tk0Fvw8aAvVIEjjIYCijC5IUmKTeL53
hg1B3mw944zWmYH7WHCdunragC6gutbUzvARlenUaMs9SDbMZ2HqRrsj4716CUPf
KZ5sMBo7bfzhMFA1+7zS6V+PGw0gVyV8aJjyJYPIvghxBVXHoVLgFYtqeNYGcGUC
2C05W1QUPiKw1VuNC00hr+8thc9NIlKQdopGS8CElZ3gLJU0ZXuNHMvjLgMraYyf
bx5SHqi4NShKrLNOZzrn8O+DRibiCbu4ZZzce1VMIAQisiLJoAEIGzqQowKqjpnv
Ani/MmN1JIInFu3aMs/Z8pQx3Ox6wtW7pMvtWxOPaQ/HtlN8QszwlBZPi1EEh8eO
+FI1tlBPef6lUxY5o59Jr88r8FrYJoacJUui4v7gT1+c+Q3CMb6f7dNVmQbqDZoU
2GzsGb3RNhc45glqoXs2zyfIpL/A7ioq3/eNG9pUAFhYX7ub31NmOCR/V6+Usf1X
ifbVoff8GtutOqIiVHXk4QrksYijA1FKVudks24YR8mkjDINW3V9AdKfLXWb22Au
HadAVGpD0B4UlTtMm0xV
=t2Gy
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
