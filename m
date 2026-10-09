Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F8D35B14E;
	Fri,  9 Oct 2026 23:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791589554; cv=none; b=TxvXjojaj18GUBOarUUl53PuTIj071PeFKNjnMJWJ5BaWkR5hOROpmqLfUKxJ3sa/TL9VjivUgScsbCEZ2rQygMs+crBwXYtXvp0BbAuy9yV5q+hkWwyo8YHUtod/0dfKZAMELxTLRDLFIdM/5YXo5WU916/1K9rCwI+HYByllY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791589554; c=relaxed/simple;
	bh=fGC9cYVG8VcGVQILyWvoaVcn+dnwCL987TcEYmV0NEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Na3DyrWuj0WfEGlvDiS2W5bgblHb3qAK8mZTR4L15DbE8t1a4XMnGQzUA/jcPwkUB7ukgBcBFFvLnKbHHrHQ4K2FIAB50XDkKlE/AHXtBqXiCcbDcRNP4H50SvOd+7mMFkgTpgCQwIY74o4EBkYy4wkY8ZNaKu0H/paTnSDBl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXTd55Rb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXTd55Rb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC47D1F000FF;
	Fri,  9 Oct 2026 23:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791589552;
	bh=eNbo8PzOcr8B2WSqp8fP1By7j7wUoHCn1MdHVPidflA=;
	h=Date:From:To:Cc:Subject;
	b=FXTd55RbTCzGjHByWAO/xUQW6/ZP3wYcYtP8q2FgD35y3OMLTho5w/FCtCZq37gj1
	 ksilQ3Nh3Gjt/nHqPQzjKQIqub00aKn6aOnjvSsl72mMLISJdXisN+TAa0axmofqwR
	 nOTZsdSeyLHNL3PEFvhupIFD01VE6kDk6KWVqJMI3eISwZc5cejzTMGPDQIE6PTgKQ
	 awSY1huxV/zOHI56C9YpS533NI1s/FnJ5Jeoy0vaaePLDTKy2PthKG4ZX7Q0VJP805
	 4d921ZqPXc8rqKWVQZMDa8Xp/2hk4ID7YZjko1yUxjuV7Kzg6MuGdV/iGCxuo+2TEx
	 OW49Zf/7orS6Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 266001AC57D0; Sat, 10 Oct 2026 00:45:50 +0100 (BST)
Date: Sat, 10 Oct 2026 01:45:50 +0200
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: linux-next: manual merge of the kapi tree with the kbuild tree
Message-ID: <asl8rgrKtHW3_-Yc@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6HgVLyPW00zx6RSH"
Content-Disposition: inline


--6HgVLyPW00zx6RSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kapi tree got a conflict in:

  Makefile

between commit:

  26d665bef44fa ("kbuild: add header check facility as a manually run stati=
c analyzer")

=66rom the kbuild tree and commit:

  6d009bd85fa4e ("kernel/api: enable kerneldoc-based API specifications")

=66rom the kapi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Makefile
index 11061c73f93e7,fd7917f78fa45..0000000000000
--- a/Makefile
+++ b/Makefile
@@@ -2262,7 -2251,7 +2262,8 @@@ clean: $(clean-dirs
  		-o -name '*.ll' \
  		-o -name '*.gcno' \
  		-o -name '*.long-type-*.txt' \
 +		-o -name '*.header-check' \
+ 		-o -name '*.apispec.h' \
  		\) -type f -print \
  		-o -name '.tmp_*' -print \
  		| xargs rm -rf

--6HgVLyPW00zx6RSH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasl8pwAKCRAv73Ows9A4
iWmJAQDuwqFg8yfhPq2UZHEBPz8z66Bez9fCfwL8s9570hopXwD5AfCQuEZJRnYa
wacv6yih8PLHTbBt7wzvFLj+m45yaAo=
=tMhU
-----END PGP SIGNATURE-----

--6HgVLyPW00zx6RSH--
