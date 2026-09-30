Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BC24C6517;
	Wed, 30 Sep 2026 11:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768841; cv=none; b=drC9vGowDhHIgjkclKbPsySl7nocjvR3FmynVCBv9BiofBOWIkaWEKvgRi2Enjy7RsNMg5PnV5CLLGTyKcTieazJ0XYAtl084tSN9W6HPamwkPs9xw9fYOg5Pel8y6h8KFyoWURP7OM82UhmGMscZcbhg0+fqhH4dAeAxfnT95c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768841; c=relaxed/simple;
	bh=clWyNGsfSJqZtXJMRLbf4XTOh8iBtytqKh15DZPSEcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1T4U7iW4UJDKwMzf1z5yDBx3EMz7g3phAW9sv9Da9wDXILwavIZPGBlxEtqUMFyPZWDtuQlppL0UfyunSJJAArtj5g0IzJ8GKejsnAutTZSH2AlXYG7MTIANHXYi+NVsM9Pi3UKZYm37fZq8lvBOxmklIMRLCngaSsFhZP9REQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDy84lWY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDy84lWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9915E1F000FF;
	Wed, 30 Sep 2026 11:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790768837;
	bh=0HGWfOyUn8j4y1bLUmw8qS3uaMiLbaqoWI/p4mxeGsA=;
	h=Date:From:To:Cc:Subject;
	b=jDy84lWYg7Q4MWNDWGgGgQHKqiPLoqeYqIkMNvbbUSZWr/KPV4DJPwkwoJTS8HNGH
	 phbi6IbvorvIk2XYepc7NOi4PuPkLxwImC6Cr50899IY9R+OntnfhxG0zZcU7E0Iaf
	 yYSQ07bDBfImsSttg+XlXd1NW7S7slq8ePF/TdjnVwAUuCSU/1+4RjqT1Ay3wdAiis
	 +jFF5jvFjlk1cb9SiKH7MxQN19D899/6kH20LhiT18qemz+Ka4ufyrgFI/SUgdv4Yg
	 cmgAYs3BeF3C5Mn2hP7qcGU48opyv3hWa8SZHuOnlTkK9s/Bw++tyQlLRxZn7F6Ivj
	 Y6GH8bY2BIN0w==
Date: Wed, 30 Sep 2026 12:47:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jim Cromie <jim.cromie@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: linux-next: manual merge of the kbuild tree with the
 mm-nonmm-unstable tree
Message-ID: <arz2wQWcnS9499di@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+DJpCzYxDgLzMFaU"
Content-Disposition: inline


--+DJpCzYxDgLzMFaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  scripts/kallsyms.c

between commit:

  edd7005a42d42 ("kallsyms: increase marker density to 16:1 to accelerate l=
ookups")

=66rom the mm-nonmm-unstable tree and commit:

  531980b4b17e9 ("kallsyms: reimplement mksysmap in C")

=66rom the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/kallsyms.c
index be42a91113500,ecb444078c1ca..0000000000000
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@@ -26,12 -33,10 +33,11 @@@
  #include <string.h>
  #include <ctype.h>
  #include <limits.h>
-=20
+ #include <sys/stat.h>
  #include <xalloc.h>
 =20
 +#include "../kernel/kallsyms_internal.h"
-=20
- #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
+ #include "kallsyms.h"
 =20
  #define KSYM_NAME_LEN		512
 =20
@@@ -359,10 -412,11 +415,11 @@@ static void write_src(FILE *out_bin_fil
  	markers =3D xmalloc(sizeof(*markers) * markers_cnt);
 =20
  	output_label("kallsyms_names");
+ 	bin_start =3D bin_pos(out_bin_file);
  	off =3D 0;
  	for (i =3D 0; i < table_cnt; i++) {
 -		if ((i & 0xFF) =3D=3D 0)
 -			markers[i >> 8] =3D off;
 +		if ((i & KALLSYMS_MARKER_MASK) =3D=3D 0)
 +			markers[i >> KALLSYMS_MARKER_SHIFT] =3D off;
  		table[i]->seq =3D i;
 =20
  		/* There cannot be any symbol of length zero. */

--+DJpCzYxDgLzMFaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq89sAACgkQJNaLcl1U
h9C7gQf+KAxV3rtWpsJ+5cfu8PHwNcHrk8ufC+CumR7tWJVy3DUUadts4q3jDuK1
X/6BBjFDZ56hnMPjILn+/dJaRtg/9tK86JrnE30/ToVnTDUF1yxgh3cBX0iEaBE8
zID0Am3fijAe58+Godlr4BMgJ/jeDGW9HQ4juEnm/rcAt4C98ONicYoqRtSmfmoL
/k7FPvRn5e4rfhVDaQbtBtBZGZBRBXvC17hUVGzP2yqbe5xu8C0w1e065Nyxir+w
Dush7Vdg4niU/0+75CKJ3Ml/3ZkevPUeJlwMkaFIJOb8VusiISfT+7OZ3qk9oNyF
ElqaQtuaDgtam+SHPIrbrqBDXWORZw==
=lX94
-----END PGP SIGNATURE-----

--+DJpCzYxDgLzMFaU--
