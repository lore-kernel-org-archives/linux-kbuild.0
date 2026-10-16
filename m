Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D99D48E0DC;
	Fri, 16 Oct 2026 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155242; cv=none; b=jJ3Id2mm3APVf7QHxTZJK+gdqBRMgEGYpjVgLQqWb1A/LwMEu+bpUAvTgqr+u4TzEcD/418iwbZHV5i27fX4ir6J2al61dZt+upWsehtvdRjg7Una9wEfDUV7Om0NmyMT71hJanVdGlGNTFNlkiO5SFDO2bokch4QpmLwgqtmks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155242; c=relaxed/simple;
	bh=7G6cmy8vT1lP4Nx6FeikoL7qMjKO+zh3K3gJwFLZxLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AB/OX5rDXU4N1LhZqBmYOOMToba/euWxkweBUHVFK+m0sUuQae0yLIyXz9DJ0kRcdr8UP3F2uH8dv4y+Vw64HKLioX+2PzAW/45/AKPZ82sa0n24t/ieepxxKPfYb1tDX3tSUeDICqufnL9Jo6b/f8OY3Cy1eHrq6WFWE2z0Edc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEvchW85; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEvchW85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B985A1F000C4;
	Fri, 16 Oct 2026 12:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792155241;
	bh=5p3FsW4rBqu1iBY5n5iTvH2CHeYoZGGKw3fGbe6hU2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UEvchW85TNqdT0kfQYujgvPyFdAXTGHgaj5XCSAVd+RjNLLCFOzvZNGVsE92czVgP
	 827r84RKyf5aOLXT4Ftxow5L4YKczxaKr32Y8yRLyJ7pYSgeUCiIwr5EQb8Bf5YXkB
	 ASkfNN6xCrK1NeIf9o7tCwnrhrficrNCeudpjCHF2OeGW+lDyhnrXKuNaYbMPG63Lb
	 DoXwkRFH6TNBlkRoNj50rkqOGGWj70eGhkQnWuNaqxDz4y74/nWYZWewBnna5Q68BK
	 GL1pvsxLJaHGsToypRI6CsRhVZ0l2dWfnSr/r6bIdRZT+dznXG5fkJIlZr7lV22PYx
	 wJ1RSXOVyMlcg==
Date: Fri, 16 Oct 2026 13:53:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the kbuild
 tree
Message-ID: <da87fdb8-f359-4745-ae0b-b34950b6df54@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="ZKs0IAUvsbFxF6FK"
Content-Disposition: inline
In-Reply-To: <20261015212815.GA319266@ax162>
X-Cookie: <<<<< EVACUATION ROUTE <<<<<


--ZKs0IAUvsbFxF6FK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2026 at 02:28:15PM -0700, Nathan Chancellor wrote:

> This seems to have made its way back into -next, it is currently in the
> efi merge:

>   aa5bcff53709 ("Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git")

> I have the following applied locally on top of next-20261015.

I think I persuaded it to go away today.

--ZKs0IAUvsbFxF6FK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrSHmQACgkQJNaLcl1U
h9DbOQf9GjSynnkq6T3pddFpYMD0qCMYDHgLYLNKMud7t7s0SzXS8Gix8Xuubd7d
Ig2Yh/4CN2NFWTrYMLNjLZv9ctJt6ofp7gTZfkolkcMY/zXm0DkHFIZDmoArLxNF
J9Q1Gg3jifx5CEDvmw884dn2GixLGv+hmQMDJfhM8D2hO/LZ59hJaFtwrpCpRf9O
de1zTE1r/KWWb2jYYvxWshZECK0+Ixdt3Muj2rrbaaORfht+htb5sEKSFS2f6V9A
Trppc5OPWJ9uSEANVuOC5sbN5sK4ivEHFyXnQ3741kEDDzh8TWhcexpvjwVUycJg
2hL4/vZnKuzcF9ipXtbFyuzdugxiTg==
=zA5s
-----END PGP SIGNATURE-----

--ZKs0IAUvsbFxF6FK--
