Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34306 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbfKFEml (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 23:42:41 -0500
Date: Wed, 6 Nov 2019 10:12:26 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191106044223.GA18076@Gentoo>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20191106043120.GB6355@fieldses.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 23:31 Tue 05 Nov 2019, J. Bruce Fields wrote:
>On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
>> BTW.
>> Bruce,
>> Does the current script expect RHEL or something?
>> I do not see 'new-kernel-pkg' on my Ubuntu machine.
>
>I test on Fedora.  Looks like on recent Fedora that's only provided by
>an rpm "grubby-deprecated", which is an inauspicious name....
>
>I think maybe you're supposed to use "grubby" itself now.  Do you have
>that?
>
>> It would still work with 'new-kernel-pkg: command not found'
>> warning.
>>=20
>> We could bypass it if we like.
>>=20
>> command -v new-kernel-pkg && new-kernel-pkg --remove $f
>
>Looks like it's what updates the grub configuration, which is probably a
>nice thing to do if you can.
>
>--b.

Bruce,

Two things,

If the system doesn't run grub , how the fallback policy???

This binary "new-kernel-pkg" also missing in other systems too...I can
confirm that... i.e gentoo,slackware,

So , you are only targeting the rpm based system????=20

~
Bhaskar

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3CTykACgkQsjqdtxFL
KRWY0Qf+OSbac++mWERchiwDUMOUyNUaoVi0cAGXnvWNdGZfWhHQVcEDkCZzWzrz
vdWhgESith3kZHDQ4Mp++SqWl7Ps8vj1qZob+d9DFnma9LL/4OP5SobjAVsOlfkt
j33vf8kcAzfbVmmB9qojTQ1jxRcdSGVCyBpjQtmxJZd5juYR6SRsgZblVLAZkIrh
QxdaQEVqokbsrwi02XXeL8cBo1JWLm8g0ININYHGT4Vw/H0MdJgB0wFMobl0E1Pj
5gwn+LJGtBNh9RJOnnO4slxA1oxBR+8t92KrEnAMJnYvBe0gu2ggscoJiLJ4hndU
FGqNjXncYGU2l3hhpqxdtxq2m6N7OQ==
=hHCq
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
