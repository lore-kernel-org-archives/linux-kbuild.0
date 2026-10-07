Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD972D2381;
	Wed,  7 Oct 2026 20:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791403667; cv=none; b=cwE/7Ep4FKRBETvlgFD6yEm5LxFy+LvvmiLBrHYblFiDONkUdJ+Z8KP91Z+OgQb77n05aRu9DdmplWNppSLdLWGKTu4KT0Xfy5M+P6deie0MNZBajXySIjFri7c6eeb0aOhLRx+tQN77dP4jNbbthcIAfIsI3rgmSMuQ8EemDj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791403667; c=relaxed/simple;
	bh=bH3NpiRHLy6ZimCTfeOj7af4gdBlLoeTC/rXJhX10ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkmwkYNNq24jWkO7L/DhAeuY8E4dj83sCgq/d4phdc2e7zovfuWxulII4OltnobI1XDQxp45NANaOqoUPQI1lWfiyIUvhAWZotZRnPRuMNu62x3wCNzV7I5/gilibiZN/C8shB6bsahAa5cYvceqRpD0xuz82wa9exr5if7GrGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QY7bxkR4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QY7bxkR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9941F000FF;
	Wed,  7 Oct 2026 20:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791403666;
	bh=uIfV0utYMy6w3AWAoewRUL2FEQ26Nt1akZVRYxWqn0g=;
	h=Date:From:To:Cc:Subject;
	b=QY7bxkR4KI7K2QB8yDwGe7bjNFoU+P7CzEDiehJsDnv+2ydI4gcfErA7+icmAnlGZ
	 NL37G1Mh00XP1+hcK3x0cemuwFAlH7KFD9mPYPIE1JQ1fT4c3tSK/dBSSK/dvOyNPu
	 Zj5WVzBfPAwHm/Ly988nw3898QZvQYpIeVPayF173l0Wd4+Za3SM8DbVaytMWWuiui
	 lIdYYYfnlc3lU+ApPw6c3LKHCm0jXQDlZ8Tmkjh+JAVDnokmP6AhBwpoqgR5+UQ2n9
	 v8bqim9horutZhw2Z8b8avgVuSjEnAm1MzXUArotZ5igEj7RTymnJEIxiH8kwT0a4n
	 XH5JFvlp9Rymg==
Date: Wed, 7 Oct 2026 22:07:41 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-man@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Non-recursive makefiles, and static pattern rules
Message-ID: <asai2yXbMC1KJ-ty@debian>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wtmlllfu3w7appgt"
Content-Disposition: inline


--wtmlllfu3w7appgt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-man@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Non-recursive makefiles, and static pattern rules
Message-ID: <asai2yXbMC1KJ-ty@debian>
MIME-Version: 1.0

Hi Miguel,


As we talked earlier today, if you're trying to improve performance of
the kernel makefiles, I recommend checking a few things we've done in
the man-pages.git repo.

In the man-pages, we have a huge set of makefiles (not as large as the
kernel, but 120k is already huge for the scale of this project).  The
performance seems nice, and it's a non-recursive set of makefiles.

(If you're curious, the reason we have so much makefile code is that
 I set up a large number of linters to run in the build system, with
 'make -R lint'.  See 'make -R help' and 'make -R help-targets' if you
 want to look at what we have available there.)

We use static pattern rules:
<https://www.gnu.org/software/make/manual/html_node/Static-Pattern.html>

That is:

	targets =E2=80=A6: target-pattern: prereq-patterns =E2=80=A6
		recipe
		=E2=80=A6

This results in a huge database when make(1) runs, being 10x larger than
what we would get with regular pattern rules.

However, recently I tried moving to pattern rules, since I thought the
smaller database could improve performace, but the experience was
surprising: the run time degraded by several orders of magnitude.
I don't remember the exact numbers, but a full
	'make -R -j24 build-all lint check'
(which is building almost everything that the build system can build)
would take a few minutes with the huge database, and several hours with
the size-optimized database using regular pattern rules.

I suspect it's because by having to guess for each file which rule to
apply (and being non-recursive, it has the whole list of thousands of
files, and around a hundred different patterns, so the combination is
explosive) is too expensive.  By using pattern rules, make(1) doens't
have to guess, and thus goes directly to the rule that applies to each
file.

I think this might solve the issues you were seeing in your experiment.
(Or it might not.)  :-)

Please let me know if this changes anything in your experiments!


Have a lovely night!
Alex


--=20
<https://www.alejandro-colomar.es>

--wtmlllfu3w7appgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrGpoIACgkQ64mZXMKQ
wqlI1A//Xo09dUc8tNuerWPsvzfRZ2E+x0TVX49ai/TjknlZD0SYi6fDuO4lzQPU
opeC1y+OiVhdSKtZuu4E3XYyX3m7TU5Y79pfdF4qgG9Sw/F40GKcjrDRBBJOc5JU
kd15zKgJLyYlsCZ6ioXAVHutuZbHMqzlIWloDgBiZJT6cIPYeaCnAEa8Mph2uxXd
D51+TXy0b14AKGNkHaBDbZOBY4FMbcxHrTArTbxlpa8c62hyGqcj9w4Oen+fSNMT
v7n4Hd8z5zBfq90VWwHepEN5eyA/h8C0I8SKjOcgzqB+7n9YA8VrHVi02zp6lr1N
rDAjNAfZ2wfiGoFZ1t87K4l39ahHEmF3drWdZTwOHXKebNjvZtI6GtUkcXI0tH1J
hECjhbfiEwcPsv0qJIYijlEsl+BI0WlmxMeySoFv0SFp0kZioFzVq8cAIIu6IszX
lu5C51OU+H2mBS/bTo9LEQeTepFbMxSXUCKBidOP7TvBjMUNceYNci8VnKwoQH75
WJ1SwCa+pzDMbMyH1CJBz+xCqGFDZXfc9TQtKz4svU+TBtUHa0NTJlnoYE9thxvC
1ahrVPE5ZD09KFAAcvxW6VIv8BaTaVro22fKXtvpCr0XWpljHM0lEDvkAvGEotVl
gWuEbNgOGixq8xbqXhFZG05LvUQ/DpS3MVXRD/kAJuQfu1ho0iI=
=/GK6
-----END PGP SIGNATURE-----

--wtmlllfu3w7appgt--
