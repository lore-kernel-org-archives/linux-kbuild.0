Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:33534 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726340AbfCIUcU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Mar 2019 15:32:20 -0500
Message-ID: <342abfaaff17af76aec43ae36ca09ebc43ea64ad.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: add workaround for Debian make-kpkg
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sat, 09 Mar 2019 20:32:08 +0000
In-Reply-To: <CAK7LNAQzfiZejYKKtFSineEwB5M_GcUktBmLgAGs2iC7i4Cbfw@mail.gmail.com>
References: <1551888035-13329-1-git-send-email-yamada.masahiro@socionext.com>
         <5760e0a210c7c39b486aa932ccbe7f3f2c210d62.camel@decadent.org.uk>
         <CAK7LNAQFWWzki-MvmhDpAn46XkDAu4_EGCQotbi5qAk5oJrgUQ@mail.gmail.com>
         <788870e550cb3cecafd9db14c081ddb0225edfde.camel@decadent.org.uk>
         <CABkpOEUqJWn62VZoTA5UEnbDieiYR9y3diRQhZuOVe6hOoBNhA@mail.gmail.com>
         <c93a7273c89c649373761f2ba26a6ef05787d08d.camel@decadent.org.uk>
         <CAK7LNAQzfiZejYKKtFSineEwB5M_GcUktBmLgAGs2iC7i4Cbfw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-598Bn8y58ZNKN8Spruiz"
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Manoj Srivastava <manoj.srivastava.1962@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--=-598Bn8y58ZNKN8Spruiz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-08 at 15:42 +0900, Masahiro Yamada wrote:
> On Fri, Mar 8, 2019 at 6:56 AM Ben Hutchings <ben@decadent.org.uk> wrote:
[...]
> > I take it that you don't want kernel-package to be included in buster,
> > so can you open an RC bug to say so?
>=20
> Also, could you make sure it won't come back to bullseye or later ?

An RC (release-critical) bug will normally block a package from being
considered for any future release.

> How about Ubuntu? Is it out of your control?

Ubuntu's release management is independent of Debian's.  I don't know
whether they consider RC bugs in Debian.

Ben.

--=20
Ben Hutchings
Knowledge is power.  France is bacon.



--=-598Bn8y58ZNKN8Spruiz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlyEIsgACgkQ57/I7JWG
EQkoCBAAzUnkTN8eTiute3VDGS62H33aPiMOVkLXO0qRgiEOUKQ6ZFi+nGFO43lT
j1JA2ngy9HyCPb0dfGCPA21GbOaSS7fhZJ3Eni5hTrbmLfyHPFGs4s9uSjsG6BQL
ZcD/zCmqtOp6e6fvUG7f32L2EJD1bbEYCI1i0oCDfKnsVWF1YVgZTi2ShxcJht1/
xRELAQoNm1vSK1yVD0vIsz9jQJBg2SFRUGcyM1Jv6wuWB7CUCSobsfIlljyfCP4I
taHa/IM2KvOcLli1VS1HRHVAUsLVB3tPFJjXt9M9F6O3ZnPfEIse/CWRFh2MOPMj
SwhPigARthZ6HtZo5EEcfG65GHQpxWwCUbXy5I/5Wx/mqC8TArzncyKFlvOH2Uaj
6Si/QZswgLoK6MDabfrE3AEggacXkL8Y5VsPFXArKrAEII0wCamuspPlx+XxJn5w
P6h4k3V72HLZ6pQppYcbHR4BPOpiRL2HlEt7E5yS5GCSytvIuQSwSpPqcyJMeXbM
FmKqV1vn0T6ZUEgtXJIZfDVOb2EZ32toqk7J+MYHdYBJ4cyxxu/Wjx86kflizR62
q2BqeisbCyGCvv+r3zHE92rQABEBlvSENbamDvXQabCNKO5DxvXZ+nEY/0Dd+OZK
uzwXUYpl9h6Q4Zb+djefTuDzi4iyTtjQAS0KGWGOXPognDEk2yA=
=eNt0
-----END PGP SIGNATURE-----

--=-598Bn8y58ZNKN8Spruiz--
