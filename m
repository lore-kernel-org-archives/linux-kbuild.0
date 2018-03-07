Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964922AbeCGUZY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Mar 2018 15:25:24 -0500
Date: Wed, 7 Mar 2018 20:25:14 +0000
From: James Hogan <jhogan@kernel.org>
Subject: Re: [PATCH] kbuild: Handle builtin dtb files containing hyphens
Message-ID: <20180307202511.GT4197@saruman>
References: <20180307140633.26182-1-jhogan@kernel.org>
 <7ecea7ca-2931-16bc-a110-1ecdaf17f0f2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ck3np9Ek/EMsFxRu"
Content-Disposition: inline
In-Reply-To: <7ecea7ca-2931-16bc-a110-1ecdaf17f0f2@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, linux-mips@linux-mips.org, stable@vger.kernel.org


--ck3np9Ek/EMsFxRu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 07, 2018 at 12:11:41PM -0800, Frank Rowand wrote:
> I initially misread the patch description (and imagined an entirely
> different problem).
>=20
>=20
> On 03/07/18 06:06, James Hogan wrote:
> > On dtb files which contain hyphens, the dt_S_dtb command to build the> =
dtb.S files (which allow DTB files to be built into the kernel) results> in=
 errors like the following:> > bcm3368-netgear-cvg834g.dtb.S: Assembler mes=
sages:> bcm3368-netgear-cvg834g.dtb.S:5: Error: : no such section> bcm3368-=
netgear-cvg834g.dtb.S:5: Error: junk at end of line, first unrecognized cha=
racter is `-'> bcm3368-netgear-cvg834g.dtb.S:6: Error: unrecognized opcode =
`__dtb_bcm3368-netgear-cvg834g_begin:'> bcm3368-netgear-cvg834g.dtb.S:8: Er=
ror: unrecognized opcode `__dtb_bcm3368-netgear-cvg834g_end:'> bcm3368-netg=
ear-cvg834g.dtb.S:9: Error: : no such section> bcm3368-netgear-cvg834g.dtb.=
S:9: Error: junk at end of line, first unrecognized character is `-'
> Please replace the following section:
>=20
> > This is due to the hyphen being used in symbol names. Replace all
> > hyphens=20
> > with underscores in the dt_S_dtb command to avoid this problem.
> >=20
> > Quite a lot of dts files have hyphens, but its only a problem on MIPS
> > where such files can be built into the kernel. For example when
> > CONFIG_DT_NETGEAR_CVG834G=3Dy, or on BMIPS kernels when the dtbs target=
 is
> > used (in the latter case it admitedly shouldn't really build all the
> > dtb.o files, but thats a separate issue).
>=20
> with:
>=20
>    cmd_dt_S_dtb constructs the assembly source to incorporate a devicetree
>    FDT (that is, the .dtb file) as binary data in the kernel image.
>    This assembly source contains labels before and after the binary data.
>    The label names incorporate the file name of the corresponding .dtb
>    file.  Hyphens are not legal characters in labels, so transform all
>    hyphens from the file name to underscores when constructing the labels.

Thanks, that is clearer.

I'll keep the paragraph about MIPS and the example configuration though,
as I think its important information to reproduce the problem, and to
justify why it wouldn't be appropriate to just rename the files (which
was my first reaction).

> Reviewed-by: Frank Rowand <frowand.list@gmail.com>

Thanks
James

--ck3np9Ek/EMsFxRu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlqgSqEACgkQbAtpk944
dno+qg/+OVG/O0znyZup1R3l0Cs07bQYye+qoIv2byyBKi2HJtRKIRA/9oUww8L6
b0/aBIY0NpayhhsC0/EziivmKMwTF1aQROnbN5AS1Z1B+vVnFX38jw2yc7C0RMd3
bezjC4/qxZ3Tt5Q24ITliAc8IS36fo7448F1nCRhjqHkF4wOEmZ8GzGYY7SoOIaf
u1NS/Cjl/gwEGN6XlLVVY7S6pdtNYYjOSS04UWTPBYsjqESLznkHYDeHvoS2kpsf
HOnVTAqYv5Vv03iA3g+Rfse6sOuzIA9cL79Y7y7RQgbh/eqtXQzXbYdOrboFr7ZI
cUn0p2YLSQvpbJe4wuXndmkJGotJIomhsgFZGs1B3FEyE1Hg7f/PIRzp3MTXnbDd
pvDKQ7Y3n9K0dm4XIKcp0b3BH7sLNuxOnb2l/DVbf9uSLtcnfSbRyNDwGlqqHyEH
JHvyo5odx80kL5+0w74ABX5hDOuK7bPqhF8slID+xv8zsnAt2vMIkVqx2TmIYqBo
GL6RJI3xZPZk/oDA+rN3zw4TssFdQ5JBOs9B3q3iAtkGqd0/CIKMj4P5IItxqw2E
tnucDBhc0cvbNCYpWw5X6wCiMzhhM8MdVTxnGvzKn/DAk+EWnGh6dfgvoY/Sl3r5
O3g7tS2zfrFqvdm6Wecbro58Mzs+WcctRqK2h2LTXorEjBIRjig=
=+//s
-----END PGP SIGNATURE-----

--ck3np9Ek/EMsFxRu--
