Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:42278 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389053AbfBRR6k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Feb 2019 12:58:40 -0500
Message-ID: <2a47f949fb4c09aeba869af8b64cb811f0c3258d.camel@decadent.org.uk>
Subject: Re: [PATCH v2] deb-pkg: generate correct build dependencies
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 18 Feb 2019 17:58:38 +0000
In-Reply-To: <ab49b0582ef12b14b1a68877263b81813e2492a2.camel@decadent.org.uk>
References: <20190102092304.27262-1-riku.voipio@linaro.org>
         <CAK7LNARFAth+L_b7i4aR4mPtVTSfDgq2zvvMJah4WR0s97Ny2A@mail.gmail.com>
         <CAK7LNASOqwrJqHLDKwT4xRU6jrFchavvWFjxqcPd_ZSmiEtsQQ@mail.gmail.com>
         <CAK7LNASiyMiCB2Ko0_aWOhB_3t6FEVhQ1xpnn-NQ=yV0X11SMg@mail.gmail.com>
         <ab49b0582ef12b14b1a68877263b81813e2492a2.camel@decadent.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-ktNfzRVEjdEL5N4S4kWv"
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, debian-kernel <debian-kernel@lists.debian.org>


--=-ktNfzRVEjdEL5N4S4kWv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-02-18 at 17:54 +0000, Ben Hutchings wrote:
[...]
> The way we dealt with this in Debian before flex was fixed was (c): use
> "flex:native".  But for reasons I don't understand that *isn't*
> compatible with (b), so to be compatible with both old and new versions
> of flex you should build-depend on:
>=20
>    flex | flex:native

And libssl-dev needs to be changed to libssl-dev:native, since it's
used to build a program that runs at build time.

Ben.

--=20
Ben Hutchings
The obvious mathematical breakthrough [to break modern encryption]
would be development of an easy way to factor large prime numbers.
                                                           - Bill Gates



--=-ktNfzRVEjdEL5N4S4kWv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlxq8k4ACgkQ57/I7JWG
EQmc8Q/8CCiaFYaWuyc2wUSaLbf9srlq2OGNBlAhSk2U2LhKrapZ8lvvdNkfK6oX
gSCi9vJAIqSYPPXhgha2nwaSQymjh02PhUW8Apf59oTfoK0mMZr11KwUOjs9ANDQ
UtnKF4O7D3sm4WyiNzrSd7A4/NjLuxFaU8W3qPFds4L2bClsj9YmOpgUppBhk2p0
unzA1iW2/PzRW3Qi3GvEWWSZmz47fmi2EOOorGO0tz+41QdlqzdaDd4niE4vVtEz
DroD5kHkDVIzkEt6y6KYm/e3HIDnXl5s5Wq01W1dAsOncpFKbQXuYsUzWmSfbzbD
kgNwIPWM9b0cGXF6aCa6ZaMMwrwuOv2NCwLvVQcuSwR5F5OTGacmBQA/gJXK/EK6
2vqV/QI5ue1+HKVKYezB4dY0MMlHM7bknKKxn0PJaXuaSQYp1nJ0IfuvtPS2/1EW
Jp/z2lAgOUe1cFAuwyYV3exmn4mgNPkXQkPQnHJqjOFamcG4Eto7oaTeYYW46vKN
5DFKzE4oDq5ihJcuHGAWy9KURQ33cUs5tkbgdI2Itrd4RzKoampUriLmNs4HgZDv
KSLZg7ZmCqoRDA+4f/vRZjXUWm8wP1GYzAZ2KHH+pUx76CQxSdrpY1HZf/kJbq7K
70A08NoR85GD3oxENwlaVvk89QHcB7rG4C9lS2m9xOlGBuvfqNQ=
=x6JX
-----END PGP SIGNATURE-----

--=-ktNfzRVEjdEL5N4S4kWv--
