Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7FF388885;
	Wed, 13 May 2026 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687234; cv=none; b=FuEbN23HrCf7xGqVAJd2IhGR+rE4B8LDPbsy9C+Ybjx2T4F+Pm4PRf2TIxFiRhGGHw40FL2MGd+FtVJF5qOmSTjbSn3eHinY86xRwr5EHdzwZsM48QDQmM5dNHtx051NhOTOCqVrFH3TrBmxWcqKU2jSk2KU3MuHZ9m8+SkTyPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687234; c=relaxed/simple;
	bh=RIjsi/WvJSz4oARnDv6hGSCoYYtBTjS6vPuJXCkLwFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y12E4C2tUSrTdPER05VbiaI64LqplmAuG1MlGWNGFwDG1wPdcGDLg0D7qqNrWzRk++2bomk3M+0mz6dBZSzXLWrAszsN1JkR809uKDD8XLFxqfm5s2sVr+2AJaFByC6rtUNgRWL7d7VG9PzJ+17pOiOF0SOIk+iKELTJXI6vlRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dI7xdBon; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dI7xdBon"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A419CC2BCB7;
	Wed, 13 May 2026 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778687234;
	bh=RIjsi/WvJSz4oARnDv6hGSCoYYtBTjS6vPuJXCkLwFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dI7xdBon//rmkJZcY0nB+foy6TNodjz0rSvfvj7A3uTsgsKag6TvJaSCqgn4uBAXN
	 wV0hgWHhwyRw3OUoxECtlbZDeK3ZG/Yve5L0gnacn2ed1wYdmw0cEyNN7lOh2FAhzC
	 mKoX3dPfkXEZSTNhSwGvYEMGNSt1CLswX4F4JDnqfp9EjLyVL5jwRPv5nPJ0LJxjo+
	 DN7bKIDdA1VyopXPtA1ABadqDn259Dx7PApti5z6+PAijaFVeX94YXebxdW4lEh5E1
	 5qnRU1dmtgTo+jUEtN0DFUuLV0JLO5V6Yjr7yD44a4+MDP9ILWC7KFctYmScFKoxZg
	 giT4EG3Y6ERVQ==
Date: Wed, 13 May 2026 17:37:07 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Viktor =?iso-8859-1?Q?J=E4gersk=FCpper?= <viktor_jaegerskuepper@freenet.de>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Christian Heusel <christian@heusel.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: pacman-pkg: package unstripped vDSO libraries
Message-ID: <agSao7trp7eYmSl3@levanger>
Mail-Followup-To: Viktor =?iso-8859-1?Q?J=E4gersk=FCpper?= <viktor_jaegerskuepper@freenet.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Christian Heusel <christian@heusel.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-kbuild-pacman-vdso-install-v1-1-48ceb31c0e80@weissschuh.net>
 <177489899701.2334687.2954985636789986091.b4-ty@b4>
 <4c443339-5aa2-442c-a581-df25cc288468@freenet.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ShTPmmoC/T+3BQFW"
Content-Disposition: inline
In-Reply-To: <4c443339-5aa2-442c-a581-df25cc288468@freenet.de>


--ShTPmmoC/T+3BQFW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 12:34:57AM +0200, Viktor J=E4gersk=FCpper wrote:
> Am 30.03.26 um 21:30 schrieb Nicolas Schier:
> > On Wed, 18 Mar 2026 21:37:20 +0100, Thomas Wei=DFschuh wrote:
> >> The unstripped vDSO files are useful for debugging.
> >> They are provided in the upstream 'linux-headers' package.
> >>
> >> Also package them as part of 'make pacman-pkg'.
> >> Make them part of the '-debug' package, as they fit there best.
> >> This differs from the upstream package as that has no '-debug' variant.
> >>
> >> [...]
> >=20
> > Applied to kbuild/linux.git (kbuild-next-unstable), thanks!
> >=20
> > [1/1] kbuild: pacman-pkg: package unstripped vDSO libraries
> >       https://git.kernel.org/kbuild/c/165e86c2
>=20
> I can't find this patch anywhere (mainline, linux-next, kbuild branches),
> but there are no further comments on the mailing lists.
>=20
> Was the patch dropped or did it get lost?

thanks for spotting!  You're right, it got lost.  I have that commit still =
in my
local git tree but w/o any branch referencing it.  I'm sorry.


Nathan, can you please pick this one up for v7.2?


Kind regards,
Nicolas

--ShTPmmoC/T+3BQFW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmoEmqMACgkQB1IKcBYm
EmlCew//dhNyozAlfSovRXDfu0RA0UJUuCwSvmPlwdLcul95AxibKd1FgJPUcblI
xmSRbAnDFncMu+gjtvgEryNmGUT33ws2p8bBZ2/zsPveEsqPPnnvGu2bRo85neoo
pwwrSqLpf9LPJB+yMq1s1+ktt6KX6ZJhvkzdBU8KndQPTfrQB9gjYrH8T+6SzX9k
UXhEfzX+yeuu4iKuJF+rIHrOAfiRpmV3l2CXz8St16pZcwwweLJID5GbKRWyFoc+
2d/208it5O2St5UjT0q3gZtPkC9uzVHqoq68WoH8JtQ+i3347sXAaMM4uenk8nE+
eXh+asoE8pk7eDiT5RUl7hYsGmmbxR4cT0yV4/h6ZmqA8ER7XcXnCG+82t2H1idf
vJdD7jYYRXmQ7Eg1jR988S254Dlj9+qKjDH2nAmR2OhE7uQXSdAVD5TBgCYwYbyi
GN0R6+ZOF2InzCGhavoRuKejmUn7wCZ2sDHhxhEjM69z0rI+VElw0b6u/FNCeLMW
dMnWVJVd2/ePoDJ385ymaNUWt5m/7rHqbfPZOhnnT0Mcra4mm4PGwyr9unFQtYTE
+7Zq1AaE8XBPkOW7WO5NTrTrqRnl8cSESadcGPXVH7H4Fw8TEn/Ns6l28bcLDqF+
WUWQVR/4hWuo/XF46f+ZwFtQ1+TCCFer/WxNQYuxgwy3x1Cot/M=
=kp0S
-----END PGP SIGNATURE-----

--ShTPmmoC/T+3BQFW--
