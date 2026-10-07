Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C2041A547;
	Wed,  7 Oct 2026 20:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791403901; cv=none; b=namRUXaMD5aLQtSIR8EQnBpWWwmOfX9BA4fIQmQzZ8+dTgGgvlg9MwpFpYMJUm8QaDufEO/h++Bcc9VWi6IQ/NXRw1Hzyqh3CP4PobE0kegMuc6dgXA8WlmdBuG0hD4Om4P4dE9CtAz1oid6KM5mwgfK/F8DJZ+2SXEYoD7WOLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791403901; c=relaxed/simple;
	bh=2HdBqTIIiRmazvG8IU9zmyB8Qea8b/5qKc/ZCkhf+hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFJuHo71h2jnc13V5Cp5aMRTMqyqDPJ5dbT1I5G1xOmfrvn5JzKGp5yzZf16YdPYzRZBNLScqyJmQH8A9wY0WgO5ylWXMQJeUZ0DXTM+2wpJMdTAo4tDu2nLIWa+iSXG3vcOQ3ZOueIudzTMvjWHvbMuRSAjMrpXJcCGA8AFKv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJHorX/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJHorX/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E35F1F000FF;
	Wed,  7 Oct 2026 20:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791403900;
	bh=admbv9hI6fEwHAPfn4g8Yc6IVV8f4vTKqVk+7c6kAPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MJHorX/bvDKNu15Ix11PB6OQ30RlHtGoQ8u4P/mKfE7yvpDo0xHy0OBerUid1M3f9
	 976WgSx3xNNtVNxOpxS9vT4gVTzqEMf6LLVTfm+Aas1Ui2YsEIpIRliBbXt+8LGDAS
	 yRYzahhmIxDbHYbxEPea1xK65jg7k0UhzI2wi4eVnvGh/sioUlR11qlPlJyTb4JNFr
	 d9ziMX3Jye1165eRnOy5Z4fNsxE+UBU3yXGy5hl54HYKUjfckU+YFx3oHpevIrX5Pa
	 MioI8ql/UtYy+hXwNd/ojltF4hBwv3yd/89L8a7lik34ta24y9zHhXdV6If5ItMzTB
	 ZRdLFW5wHdiDA==
Date: Wed, 7 Oct 2026 22:11:35 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-man@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: Non-recursive makefiles, and static pattern rules
Message-ID: <asanWpr8jKGW8x1E@debian>
References: <asai2yXbMC1KJ-ty@debian>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="htqwiuri3m3q5vh3"
Content-Disposition: inline
In-Reply-To: <asai2yXbMC1KJ-ty@debian>


--htqwiuri3m3q5vh3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-man@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: Non-recursive makefiles, and static pattern rules
Message-ID: <asanWpr8jKGW8x1E@debian>
References: <asai2yXbMC1KJ-ty@debian>
MIME-Version: 1.0
In-Reply-To: <asai2yXbMC1KJ-ty@debian>

> Date: 2026-10-07 22:07:46+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi Miguel,
>=20
>=20
> As we talked earlier today, if you're trying to improve performance of
> the kernel makefiles, I recommend checking a few things we've done in
> the man-pages.git repo.
>=20
> In the man-pages, we have a huge set of makefiles (not as large as the
> kernel, but 120k is already huge for the scale of this project).  The
> performance seems nice, and it's a non-recursive set of makefiles.
>=20
> (If you're curious, the reason we have so much makefile code is that
>  I set up a large number of linters to run in the build system, with
>  'make -R lint'.  See 'make -R help' and 'make -R help-targets' if you

Oops, it's s/help-targets/help-list-targets/


Cheers,
Alex

>  want to look at what we have available there.)
>=20
> We use static pattern rules:
> <https://www.gnu.org/software/make/manual/html_node/Static-Pattern.html>
>=20
> That is:
>=20
> 	targets =E2=80=A6: target-pattern: prereq-patterns =E2=80=A6
> 		recipe
> 		=E2=80=A6
>=20
> This results in a huge database when make(1) runs, being 10x larger than
> what we would get with regular pattern rules.
>=20
> However, recently I tried moving to pattern rules, since I thought the
> smaller database could improve performace, but the experience was
> surprising: the run time degraded by several orders of magnitude.
> I don't remember the exact numbers, but a full
> 	'make -R -j24 build-all lint check'
> (which is building almost everything that the build system can build)
> would take a few minutes with the huge database, and several hours with
> the size-optimized database using regular pattern rules.
>=20
> I suspect it's because by having to guess for each file which rule to
> apply (and being non-recursive, it has the whole list of thousands of
> files, and around a hundred different patterns, so the combination is
> explosive) is too expensive.  By using pattern rules, make(1) doens't
> have to guess, and thus goes directly to the rule that applies to each
> file.
>=20
> I think this might solve the issues you were seeing in your experiment.
> (Or it might not.)  :-)
>=20
> Please let me know if this changes anything in your experiments!
>=20
>=20
> Have a lovely night!
> Alex
>=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--htqwiuri3m3q5vh3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrGp3cACgkQ64mZXMKQ
wql5Tw//V6CMjcKa0Q7lNjmLxOKP5dkojg2iU03qF91w0W6aTOV3BgexjAylW30g
TuweGgONEPsFmxdpHcZ5sZ1Q9T8iEwtLGTfd8XCPtgRdlpY5T5lIYDo9oIYfjkZ1
kqwxusV61AsyLw8MLdKyO0jj0PJweFJ9x6ucNndRq9CwDYQQedfLHxwagI9T6apL
tZXhcLYELVoYlK6ih7JSE5DuCE3wsT4JR3lKkopSP2j4th5rRKle+T/l/HsE7a9C
XqvGy5vfiCbodwHm7/gOq2dcIAidS0DIuPM7Sb/dO0+euL7NJFLBk7OHaVf/VP8h
IvcmtiATrZKLZz/T1nPAKXblggF4W7wcdfKUX065j3kGhjIR91bEeYWUb1OYkRbW
ZipeRV0gql/PtjGZgrowU/EzwUImq9p8WT0AFSXmyB9XPAMKLLVg34nRNlPm9iWw
T4VnoGTTrVIAZmOH+3OgUhYd7pkLaPBHjLKdApTssXHm8Tvh/0ma5/OgGnRAE/0W
rrSnerq3+mvXFIpCv0q3V86KUnJ9fQ4aQL7j0pCsLc1aCkePdnUasuKm2Wm5VETj
9jpBGkWzvLEEZ1oFPBWdNzYUY0hF+OisXHeDqbcbqJqBjZYpmXKhLb639GhGB8V0
9rfhxvKPmjHiKwmx8E1wC2Gwe5xtcZCs8Wk9OOZ3EG5gYV32fdA=
=bM5N
-----END PGP SIGNATURE-----

--htqwiuri3m3q5vh3--
