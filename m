Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755224AbeCHHJz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Mar 2018 02:09:55 -0500
Date: Thu, 8 Mar 2018 07:09:48 +0000
From: James Hogan <jhogan@kernel.org>
Subject: Re: [PATCH] kbuild: Handle builtin dtb files containing hyphens
Message-ID: <20180308070948.GA5187@saruman>
References: <20180307140633.26182-1-jhogan@kernel.org>
 <7ecea7ca-2931-16bc-a110-1ecdaf17f0f2@gmail.com>
 <20180307202511.GT4197@saruman>
 <a6c448df-c026-dafe-6d34-801f69ca64fe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <a6c448df-c026-dafe-6d34-801f69ca64fe@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, linux-mips@linux-mips.org, stable@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 07, 2018 at 03:19:11PM -0800, Frank Rowand wrote:
> On 03/07/18 12:25, James Hogan wrote:
> > On Wed, Mar 07, 2018 at 12:11:41PM -0800, Frank Rowand wrote:
> >> On 03/07/18 06:06, James Hogan wrote:
> >>> Quite a lot of dts files have hyphens, but its only a problem on MIPS
> >>> where such files can be built into the kernel. For example when
> >>> CONFIG_DT_NETGEAR_CVG834G=3Dy, or on BMIPS kernels when the dtbs targ=
et is
> >>> used (in the latter case it admitedly shouldn't really build all the
> >>> dtb.o files, but thats a separate issue).

> > I'll keep the paragraph about MIPS and the example configuration though,
> > as I think its important information to reproduce the problem, and to
> > justify why it wouldn't be appropriate to just rename the files (which
> > was my first reaction).
>=20
> Other than the part that says "its only a problem on MIPS".  That is
> pedantically correct because no other architecture (that I am aware
> of, not that I searched) currently has a devicetree source file name
> with a hyphen in it, where that file is compiled into the kernel as
> an asm file.  But it is potentially a problem on any architecture
> to it is misleading to label it as MIPS only.

Okay I'll reword to make it clearer and do a v2.

Thanks
James

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlqg4bYACgkQbAtpk944
dnovAA/4nglpchL1DVTyXHlb/6+dRAHxxUOorst2GnEnlVqVTErOQrKX5SYL6LH9
w2+Xoa+D/+Yp11Hl1pqigmu3LYJ4uImBaV3Es0hF7gstyyloWyBiL1EcbyMRfxbR
4e89LgGvVroW2gbkUU0ENy59QRaBQ7+yJtvcpmAfJrzd6jVDnmsmEIr/9ohaxHbQ
V9JdhtqMYeJ/PWVrGJijj+q4cvQAh5FiGhelYzrvIpa1oh/PNOPRMM7oYLVLyh2k
Mol4Bsc2mptdGiGB06y+qZ4UbUbRBS5BTMDSiXTHIkG0vCbs5RtkghnBE1asZmJP
cXVYHA6c1uDkx0zPApccbFUpH/5ySLcEiSHftJV38XL52E+L1BOTqX8QXkl36MNZ
p9E+55c6cNwgRcbsA9xhAOf5XQLf+3n6EDSZiy1WQj6GF/A1OeQV3S6nJIV9KQ9g
S0SgJ5SV9CzYay9dL4cU0obY7bK5HJHHaF74jk93tgqrPqcik3gh8/CWjplng5UJ
vPSH6L0pYltTuc02MEmwbOY9gguYKPZ9t+L4pGjHREqRUYW9XMY9J98K0ZDufFvB
sXPG9GZPtXtE+YjaKP5cWZVM0vyrQNObGqleQgUXIx/gYhLFcjtHz3t47fMiKOmj
OJT4JVHONTlaYnAmh/1zB3/HUnJqM/hn6S+VS37UC03kKVKjgA==
=tjHY
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
