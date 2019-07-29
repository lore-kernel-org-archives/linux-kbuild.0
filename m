Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bilbo.ozlabs.org ([203.11.71.1]:36367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbfG2NHf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 09:07:35 -0400
Date: Mon, 29 Jul 2019 23:07:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
Message-ID: <20190729230730.75b9cdb2@canb.auug.org.au>
In-Reply-To: <65ea1c44-ac7f-b63f-8ba0-85bb12349383@linux.com>
References: <20190714152817.24693-1-efremov@linux.com>
        <20190728100906.18847-1-efremov@linux.com>
        <20190729151351.24f9eeb9@canb.auug.org.au>
        <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
        <20190729224007.2f7fdcb4@canb.auug.org.au>
        <65ea1c44-ac7f-b63f-8ba0-85bb12349383@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2W90F=MHXEZ4iTRH57J9Hgw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/2W90F=MHXEZ4iTRH57J9Hgw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Denis,

On Mon, 29 Jul 2019 15:52:15 +0300 Denis Efremov <efremov@linux.com> wrote:
>
> Is it worth to include your measurements instead of mine in the commit
> description? Maybe the note about performance downgrade could be omitted
> at all in this case?

Just leave your measurements (they are yours after all), but maybe say
"less than a minute" rather than "approx. 1 min".

--=20
Cheers,
Stephen Rothwell

--Sig_/2W90F=MHXEZ4iTRH57J9Hgw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0+75IACgkQAVBC80lX
0GyKvgf/VAVbgQo5Pnmqvd2qHZi+Wx3xxNAm6IaFnvO5V+25wBz0vhmDdtBkaY0N
1OvWOOZgC31NXxaiXtnDCkRqYgEm16t+pC8DUxoD/17q61Lz7/rqqmKMyZgROkKj
ybMhUUQ4o51SUVoF7gRT5OnjmR4L6OVs079NVTYZpZ/cR2VZ4M6kh2QDLPhR1qA9
FVX8J20RBIRCpNKuf+YMTqxqhR06lXHvkK3FpcZKY0M3oukKRG7kQlUcNNeSPXlq
p1EsoRb3NxdLi2CdbgggBL0yFxsGCEfxYS/99/J3wuNUvERocPMtlJGGtXiZfzE8
BE27RusVNM0P87NoV1UEdM99STT0QA==
=O4kY
-----END PGP SIGNATURE-----

--Sig_/2W90F=MHXEZ4iTRH57J9Hgw--
