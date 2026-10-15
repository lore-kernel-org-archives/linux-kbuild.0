Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA03655D1;
	Thu, 15 Oct 2026 22:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101786; cv=none; b=Wckl+WFEZ7Muwwiecwb3mVquTcRjK3a6dzkLDh9OkNXpcAmeWCwhzHYYZSqK2UlPhp/WC/G3e+VaOGwZ9MTd2UY68Ax8eupvdjqJRZfuouvMSpnQPT5UUHGOen3OrShViW7uWlBRWacgPspFeZy1ypd/duFECx3FHWigoW4oyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101786; c=relaxed/simple;
	bh=4vtxh9NnkWRVrrntkcHnAZ8fyzzI2xv7nqAog6e0Cro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaZSCXp6QohYlN6nuFFXbd3ScGf4V3XSWAcSDzp5cDGsXIpOgh6bx4rXzV/DyfPLmjR01fUJsvlfYypyBWvVDQPQU+iya7qb7lpPjRSL5DDeojm8btZBGivf2Yk/Uqt6GImig0l6y3fYkpLjdFUay/Fp6E9fkCZhPn2CgiPd3y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyBe5tZl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyBe5tZl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439EB1F000C4;
	Thu, 15 Oct 2026 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792101784;
	bh=ejdLp2bur1llC20ZMg6ZDZzvKlXEjXu0SIzuWbZ2o1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dyBe5tZl6pb1f1QpqOdXwaqH0WbGIj2LjO22Gh6/0WPtHH7x77i/+h0/CoVebouyk
	 17wMy8shEiEYnNT3Gu65DMEnrweH+kA98OjIoUOJJGR1BCq5yUTrWfaEFLolOqfRnH
	 MoBl9uWcVBKVjm0ccDEBwbxoHHa081/OsabHuL2Ykpaqh37ps7+pAoNjgDsQOJ+xyr
	 Obf5qVuuzRFn30kF/1TCE22oiw3ViYuZaDky2JvfxviQ1Gxq8VecdTdh98jgYuPSNE
	 mQ1HqubgEtj5GF2i3CFaRoDyDCAbfBR3CxooWff4hgRLMDZPskPCOPCRe1swI8Y6h0
	 WlDBp+pdOk+5w==
Date: Thu, 15 Oct 2026 23:03:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the kbuild
 tree
Message-ID: <0cff4ea9-3476-4d7c-a403-6016830c2bd7@sirena.org.uk>
References: <asAzcgDsbNEFIfKV@sirena.co.uk>
 <20261002230632.GA314599@ax162>
 <asA6NZ4QKp4k4nGD@sirena.co.uk>
 <20261005133224.GA1108555@ax162>
 <asOoLZf9UQkB6SS5@sirena.org.uk>
 <20261015212815.GA319266@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Po/3B9IVbYnSL2wK"
Content-Disposition: inline
In-Reply-To: <20261015212815.GA319266@ax162>
X-Cookie: <<<<< EVACUATION ROUTE <<<<<


--Po/3B9IVbYnSL2wK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2026 at 02:28:15PM -0700, Nathan Chancellor wrote:
> On Mon, Oct 05, 2026 at 03:37:49PM +0200, Mark Brown wrote:

> > Done.

> This seems to have made its way back into -next, it is currently in the
> efi merge:

>   aa5bcff53709 ("Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git")

> I have the following applied locally on top of next-20261015.

Ugh, this is going to keep coming back with git rerere every time
there's a textually identical conflict, it's not something I'm manually
doing.  I guess it'll stop happening after the merge window.

--Po/3B9IVbYnSL2wK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRTZMACgkQJNaLcl1U
h9D1Wgf+MBp9gEuck4Q9kfjM5NX5DLDTvINaJbweMJMBeTjutwFGTGuTbZZLPxV9
zKCeqYPq/JIIQqTX9riVwWIJQvx1N9a4UfYRjm+SPUhHUkOTzXQdqDEQ8jnw1ZhS
KDcoNdQ97+doevPw91uIwsHb58asxt3HouBKwYGpCbiQenkG9WN8nzDVfRvgOqn7
z8tr8esRjJlmp4749pdrfi8X5rzh4cvgtiTqlt/jdPPSIQcjZiQ5ut9b2UsQuHoC
f2g5KtpZDQo4/No0/DVimsyFywrMP9lLbq2y9XTj43oCFqTO5gsWBEGKuV9RoI0b
9HdFRGxLyt8DOFDr5rxpDB6nvvLhnA==
=1wKS
-----END PGP SIGNATURE-----

--Po/3B9IVbYnSL2wK--
