Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF4A21D00A;
	Mon, 23 Mar 2026 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274070; cv=none; b=lKeongjm8gJCWYAZjksMVTwPRtujARMH6OeoFXcaE/ppXfpHIkcMBWdyMaIEbByGJ+wFLFlbe59YUewt8j9kG1ACIewG1gy8LypieFoHHQLF73nYTaRfV6Se0qGu6Ds7UaczHUa9jeZWSe6w1kVQELf9qSe8avJAkkGLFEh6bYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274070; c=relaxed/simple;
	bh=2/XBTB87GrlUNJZddLpCGE+4XhXu902RPGnPRLytH2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZazD2zIdAbgVqFJqnSCGHL07YBtErTBQYIBoPSyf9QZQrG5vGcSdyhN23D8wJFxh9NemOe2HjahM3Y/W9nfBatwx3OnJ+p0PZRVcSHAOIxq3w+0I/ZDNOD7GzQ4K1ox/hNiFD3+yieLpaA53hF6nDx0ih4mXYTzotbat/sfQRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2j0DwAz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2j0DwAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5646BC2BC9E;
	Mon, 23 Mar 2026 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774274069;
	bh=2/XBTB87GrlUNJZddLpCGE+4XhXu902RPGnPRLytH2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2j0DwAzlmvBKd4e/6HcTL2rh8800PVIc21bjtqQIikh3rCuEvv73eyHeOmtX4S+F
	 lfpQxfvR0/mQ+1I77YFM7NDAuaibxX/qHgPKB2NKhlgYJkzrO7EHvOCUcDT05WijVo
	 zUWWhC2v8glwgs2zvu4m2dJCDmg0AASkGfpkpNuOCZ3GvyzIFEJcK3D2/fgsdcgl15
	 my2EWqLPtptTIxO+td1+qfdyU9vfXS+dfjZBZa6Ts9Ro53GaqHtezbbuw/zJNUui8y
	 1ml+/hXsulQF09cSECMU3vTl0ML3XAYbEo7BN5hZCC61iDDz5Xm2NewrzMcHDcH3j6
	 gisCLKTDVfAVQ==
Date: Mon, 23 Mar 2026 13:54:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jean Delvare <khali@linux-fr.org>, linux-kernel@vger.kernel.org,
	a.hindborg@kernel.org, acourbot@nvidia.com,
	akpm@linux-foundation.org, aliceryhl@google.com,
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net,
	gary@garyguo.net, johannes@sipsolutions.net, justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-mm@kvack.org, linux-um@lists.infradead.org,
	linux@armlinux.org.uk, llvm@lists.linux.dev, lossin@kernel.org,
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com,
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
	richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	urezki@gmail.com, will@kernel.org
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Message-ID: <4fba0163-547e-4099-8b37-5d8429bda6da@sirena.org.uk>
Mail-Followup-To: Miguel Ojeda <ojeda@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jean Delvare <khali@linux-fr.org>, linux-kernel@vger.kernel.org,
	a.hindborg@kernel.org, acourbot@nvidia.com,
	akpm@linux-foundation.org, aliceryhl@google.com,
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net,
	gary@garyguo.net, johannes@sipsolutions.net, justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-mm@kvack.org, linux-um@lists.infradead.org,
	linux@armlinux.org.uk, llvm@lists.linux.dev, lossin@kernel.org,
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com,
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
	richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	urezki@gmail.com, will@kernel.org
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260322193830.89324-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="01f7rP5tz95f7re7"
Content-Disposition: inline
In-Reply-To: <20260322193830.89324-1-ojeda@kernel.org>
X-Cookie: Avoid gunfire in the bathroom tonight.


--01f7rP5tz95f7re7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 22, 2026 at 08:38:30PM +0100, Miguel Ojeda wrote:

>   - The docs on `regulator_get()` don't say it may return `NULL`. It
>     originally that case, but commit be1a50d4eba4 ("regulator: Let
>     drivers know when they use the stub API") changed that without
>     changing the docs.

Callers should never treat NULL any differently to any other non-error
pointer, this is not a value intended for inspection by users.

>     The original sentence (which still is there) says that nothing
>     should look at the value, but then it goes onto say that drivers may
>     actually look at the value.

Having specific handling for NULLs is very much not a preferred
interface, and most things shouldn't.  The caller should probably have
it's own !CONFIG_REGULATOR checks rather than using the return value.

--01f7rP5tz95f7re7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBRgsACgkQJNaLcl1U
h9C71gf9GpM/jjG7XngTH0kbbP53phsB1+ihdqiu8gRSA2NkhE0CDNEtrjeo8HK+
YFX9N3jSxdG8Xb07O5JUW+IXTMGCeLvz1uSBXZdXIabxC9f1LMtKTabWh0ZHf713
HWaiw2tyL04gxzoGRUMOxAdjtJO/AHPk+s6yJ/mQq30LL2Ct3q4SD2EtDeCiBi24
uVumpIb9BMTfIXF2ygQqJYC2bsstGVbR9LCepYNRWzl6pJ+8qpCwRMNb90/Fc54c
L2PQmhNC1Q8X3ghZTF3R48f7nMOug5EndZ2txdR3Z3qvY7xacpJH5R55yoodXcVg
aFFTXPyWGRpSqwmfdF6DFkUEV7QZAQ==
=T4pk
-----END PGP SIGNATURE-----

--01f7rP5tz95f7re7--
