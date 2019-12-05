Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39576 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbfLEDZU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 22:25:20 -0500
Date: Thu, 5 Dec 2019 08:55:07 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
Message-ID: <20191205032503.GA3981@debian>
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
 <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
 <20191204150728.GD2734@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <20191204150728.GD2734@twin.jikos.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dsterba@suse.cz, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16:07 Wed 04 Dec 2019, David Sterba wrote:
>On Wed, Dec 04, 2019 at 12:10:25PM +0900, Masahiro Yamada wrote:
>> On Tue, Dec 3, 2019 at 6:49 PM Bhaskar Chowdhury <unixbhaskar@gmail.com>=
 wrote:
>> > +awk '{print $1}' "/proc/modules" | xargs modinfo | awk '/^(filename|d=
esc|depends)/'
>>=20
>> I want to see a good reason (e.g. useful for other developers) for upstr=
eaming.
>> This script looks like your custom script, which you can maintain locall=
y.
>
>I think the verbosity should be added to either lsmod or modinfo, not
>some script in kernel git.

lsmod and modinfo already are pretty verbose and the one liner is using
one of them to cut thing out of it....can you give it another look???

Moreover,this is sort and precise and can be parsed by other scripts.

The whole point behind this is to give the developers a convenient point
without going through all the rigorous details.

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3oeIsACgkQsjqdtxFL
KRX3RQf9Ebo/O6Fv1Psf3ytEbvXQWfRvqqK6lVruZnNzgdDAW4mkeGWevG+9viHd
4Vdx94bKDHNGDRPSJs1lsm1aZH7k+Jwr6tHMUWDAFzcXHOQz3bnwM57r2gmsd0nb
YAlNscQGYEO5g6Q2TWgm+7gZVcCSupoyNrx8z8GWERhF+gsR9aUrqNyV26qGeI2T
PpkBqMhuXigTF0qkS7V5IPWNX7B2TT/caB3jrEIYHwTAVk2ozuENsQxqD27QvUPu
pdGyf+0XYAnhkJy0nvxPmurQrTcpyd5dMUW9gUymJdogQGxImZ0Hyg83f6nv8yqU
Wkwkpahx3O/d7p68WismcO9e+ssO2A==
=QvmI
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
