Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46B8486404;
	Mon,  5 Oct 2026 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206423; cv=none; b=uCqtVTBW+CExYIy7OUMf0endl/nsyyOIpd6/x92YCpVLB5LgXyBuwjjRKt0lvbrAywJhjkoba6kCDAwY70RQpZCwtN5mWf8reRY5omXscjZALigvu9/6AHHeki3AJUk9kIMxQpsh0wb1Jw8PufvbTovxt4+MBcf7mRnQgo/jcnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206423; c=relaxed/simple;
	bh=5DwqDwXIiSWLHvgF7F2iphKrSj/lwK4eJF+zfDfdelw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwbFUcRL6AJavJDxXqxcICDiNC9zy3Q9pNFloxu10PoIm2lcHtmIez1NVavD0ci1QtravxRBaE5iz54SCYKd0yBSc9kOdGqk/iii/eL0LVSi6x49J8HVIxuJjU+8iFoopqcvviiFR3ES1tUkeH2+FEgFOQ98W9OLMDbzr1T27wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhLXFRsv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhLXFRsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3901F000FF;
	Mon,  5 Oct 2026 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791206399;
	bh=5DwqDwXIiSWLHvgF7F2iphKrSj/lwK4eJF+zfDfdelw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YhLXFRsv2UluxEgaCUBBxV60KvQS5EvNBbG81/s/HOLvmRPKm2LdeZAGGFXTUe1bg
	 vsFjP8RBY7xeBY4gJwEnbJyS6YkE0R62d7DzHsbuWPiEntPciOeQZN6QE5OSYEkeXH
	 egrjVHdWdIJNVcHRNI5iW7c6Anhqm2vM22Ta14AnLZ4IMQ56tIEOaIb3QfLrC1q858
	 e9xA60ZdxEkQQKMs/fFMGkyjGyGQAvA0s4iFg+kvoNSj+DwpoFShwtd6xT7s7O139W
	 KloFl4cKdRZ3eraRIn2piktlmCYxCaJtpbcCulo5oKgUYRNFfj13QEDIswc9fzMRjy
	 LVFX504IdpkYQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 2D41E1613A5E; Mon, 05 Oct 2026 14:19:56 +0100 (BST)
Date: Mon, 5 Oct 2026 15:19:56 +0200
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Wilson Felipe Pereira <wfelipe@google.com>
Subject: Re: linux-next: manual merge of the kbuild tree with the
 mm-nonmm-unstable tree
Message-ID: <asOj_J9GELQiip9b@sirena.org.uk>
References: <asN8duP-cEdNqP5I@sirena.co.uk>
 <20261005060713.afde74805e607478d6bda2ea@linux-foundation.org>
 <20261005131417.GA1097851@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VxenrHt5dJuGmhp/"
Content-Disposition: inline
In-Reply-To: <20261005131417.GA1097851@ax162>
X-Cookie: Use the Force, Luke.


--VxenrHt5dJuGmhp/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 03:14:17PM +0200, Nathan Chancellor wrote:

> That said, I fail to see where the conflict comes from between these
> changes. They don't touch the same area in init/Kconfig. If I pull
> mm-nonmm-unstable into kbuild-for-next, I don't get a conflict in
> init/Kconfig at all, I only get the one in scripts/kallsyms.c that was
> mentioned in another thread. Is something else going on here?

Yeah, I was confused about what git was complaining about with this one
too.

--VxenrHt5dJuGmhp/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrDo/sACgkQJNaLcl1U
h9BTHwf+MXBjh07LUzmBwAbcYJbdQEw54qdIPo/lFiXUjBOdwj+5igyNdXjKV/XL
8N6G/y3cWTgILDTtOJ3P8jFsmusNkai1UawDjFYRXa6UYBqQ25zTM8+l9OaqCtuS
y0r+dzsTiXehpI48Q1UlSneVDDx6w7kXoee4FHROyzgnhRUc9uB99mQtSWYVH8KH
+8SKchzJMNzJxIxbRAA5EAWfIcEcrzCEY7tK1/UW055BhHFzIJKOm4A2QGUECNk2
+x9Wnz61J+4q8DKfwTdwzGKR8MFtnZXbxiy5B8skokzsJV+UA4m/lhzIsIp7OT+B
7bOGJXDWW53l6VWhcVB8IHDbn9/Qbw==
=/rfz
-----END PGP SIGNATURE-----

--VxenrHt5dJuGmhp/--
