Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01841477992;
	Mon,  5 Oct 2026 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196286; cv=none; b=Bkm6FokY6eDO/U1WvyEPyn1epDaBQywVfNHTuRz02wYdCdnGR68uKWzTs6798noY70Jmo9qnqmGulsVwumRKyXZwFTwcxuDhaHrjQNnzNRxKr2oDinPInmopq9Qmoz4aKOYc0sDVFeG6ebGuiEgLSPILYmNO4EgeDTew1TDSSrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196286; c=relaxed/simple;
	bh=Qu+52Dq3sjKX410gqhnKyo0/di/CxFcVtYCr2xgfgUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KeEw2xqIaxRH8JYsy2DKC77ra1cKBRnp04n1l7fZema7ZKC3NNSnWc0PqwvCFa9t8/BaPxGNtRN9xllqozVgjnnOfNT0ZHlnbAxFBtGe7J/el/BJ6Hj9A6UlF36zrMoDDZXR21F0YMsAovRc4LHniAYiIyIEe+15MMpsQN8ON1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwJC7Zix; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwJC7Zix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0031F000FF;
	Mon,  5 Oct 2026 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196284;
	bh=PP6i4zGvi7Mof3rIeaqST8mhdPaUWjwxa5OqV7XyADE=;
	h=Date:From:To:Cc:Subject;
	b=IwJC7Zix6HDsacmFiDY3zBNU6kUWXRnFDra0Z+9exzGItdj2ZX4/YlVmwt/ZCs/7E
	 7qflx+LmpoZ3pF7F/rOJxgKpiyQEozfuvL4v5Bx/H1kmrAL7e0pJlEcyvbKgChTjj3
	 ERJ1LveV2vTkf57b4ZjB27LukEs1+8UG2g2COWZ6+ArRdJ2FMnjehVDxZ1Y3pvp312
	 qGj98SOnTXFRj8p0xa7Z6kZWVnHlqlRjgoglM3MR/eZyrVclFy/QgSC+uBKiDbmq9J
	 R+cmXVukcGhymJ6zwSJEs3s6yK93MhR8TRvVwVrdGYccP6AFB4uWQxx3CXK8jagJ+R
	 MO4J0z0PPyoSw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 280C11AC57CE; Mon, 05 Oct 2026 11:31:22 +0100 (BST)
Date: Mon, 5 Oct 2026 12:31:22 +0200
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the kbuild tree with the rust tree
Message-ID: <asN8ejNILKW2YWep@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xXccm9Z+nTT9yLB8"
Content-Disposition: inline


--xXccm9Z+nTT9yLB8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  scripts/remove-stale-files

between commit:

  a41ec2936d2fe ("rust: doctest: generate Rust kunit test suites")

=66rom the rust tree and commit:

  33bef82263082 ("kbuild: Move gen_init_cpio and gen_initramfs.sh to script=
s/")

=66rom the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/remove-stale-files
index f1f776caae00a,e46337e4bfb8f..0000000000000
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@@ -27,4 -27,4 +27,6 @@@ rm -f *.spe
 =20
  rm -f lib/test_fortify.log
 =20
 +rm -f rust/doctests_kernel_generated_kunit.c
++
+ rm -f usr/gen_init_cpio

--xXccm9Z+nTT9yLB8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasN8egAKCRAv73Ows9A4
iYDmAQCdbOjOqeHvDdn+SlGdDJSlB5856qiU6FR9eDQeZDl5VQD8DLQsZjOWCceY
GiBIvfrshjfkXznRYvrsofGNM5Y81gQ=
=CU1H
-----END PGP SIGNATURE-----

--xXccm9Z+nTT9yLB8--
