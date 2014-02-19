Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:50497 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750966AbaBSASC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 19:18:02 -0500
Date: Wed, 19 Feb 2014 11:17:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next
Message-Id: <20140219111753.23912fa4bdbfeba7aa6a6c52@canb.auug.org.au>
In-Reply-To: <5303C695.4030403@converseincode.com>
References: <5303C695.4030403@converseincode.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__19_Feb_2014_11_17_53_+1100_wZr79W+LtUFRYCeZ"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Behan Webster <behanw@converseincode.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Wed__19_Feb_2014_11_17_53_+1100_wZr79W+LtUFRYCeZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 18 Feb 2014 12:46:13 -0800 Behan Webster <behanw@converseincode.com=
> wrote:
>
> I'm assuming this is the right way to ask about being added to=20
> linux-next. If it isn't please point me in the right direction.

Correct, but usually you would cc any interested parties so that I can
get some feel for when this code might be merged into Linus' tree.

> The LLVMLinux project would like to participate in the linux-next tree=20
> if possible. We have a branch in our kernel git tree now into which we=20
> have put some of our patches. At the moment, the patches in next are=20
> some of the most core changes which enable clang in Kbuild, but don't=20
> get in the way of the use of gcc.We'll put more patches in the branch as=
=20
> our other changes are accepted. We'd like more visibility of some of the=
=20
> changes we'd like in order to enable clang, and a way to help make sure=20
> that we aren't breaking anything in other people's work.
>=20
> http://git.linuxfoundation.org/llvmlinux/kernel.git (for-next branch)

Normally you would cite the git:// URL ..

> Otherwise we're publishing all of our patches in the master branch of=20
> this git tree.  Currently we're working on enabling clang support for=20
> x86, arm, and arm64.
>=20
> The LLVMLinux project is working on changes to the LLVM/clang toolchain=20
> as well as to the linux kernel code in order to be able to compile the=20
> kernel with clang.

I have no objection to this, but would like to see more of these patches
reviewed by (among others) the kbuild guys (cc'd).  I also could not find
some of these patches published on lkml (where I would expect to see
them).  And the top patch has a very uninformative commit message :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__19_Feb_2014_11_17_53_+1100_wZr79W+LtUFRYCeZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTA/g2AAoJEMDTa8Ir7ZwVOBEP+QHbjk8CoQrzkZn3tlQN9fBw
lJGdR7CAhAaTTK82W7G5FUqXbAUrL1bki6EqqMPnCA/oRac6Iy9uSZ5+J1pjMGQR
yprLi1kdGLVakignGmxSb6MphpVNjvhwHVSmmjcxcE/k8eBC5wXSkYIy/R5zQRS9
1sHrnD1B4KlK5Zp1+1iNiwuzjmn345LDU29ipMpEmL7jBFN8DNZpTHSeeNOCUCy+
fxeIvqFtgyYvWa8x0Stovxqy8InsZZ1GECe1EFfiHMm4JxlYJ7HbPvfIH4I5goJw
BIPmXXTVk7ta5jegCEFXP2oWWoZVcC/M4//jjcQaFFpyx3Y6f5eqWpXOMYo+gIkO
YubxYIfTI6/KjSGhwYBL4FFmb5+/TtFfT4PIG+CIIur7UZLQjGB0nMiZ6t3DO4tS
fAHbv2bBWiAwCtnP3pfWKthFVM3xaBuiq9vG6BvULXFn9dBjBOpYvrUSoggGOK/l
FDwjBFoibFxX1x46FPOwHBrUO9vCdTg2AN1m6gvPJQjQaemjXbO8u//i5g31lDOo
2wh+jh5CLwTbb8d9e+Z+R19uOFV+dyHYsVzewQQJPYa4QCPN6ETIAIQFZrevOj4K
1NYUgeoXW+Y+sZl9CA6KfZXVkcO3Oi02aVPEok/6ZwxxgGB1Dpr9DO7wTmOgiHqy
3DiBYDCdXjOI15Lk7SRL
=VWF5
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Feb_2014_11_17_53_+1100_wZr79W+LtUFRYCeZ--
