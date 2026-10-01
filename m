Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC955349B6;
	Thu,  1 Oct 2026 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889189; cv=none; b=bX0dfibw318uSFA/1whivDNu13iJ/xymuy81CUqG/sIFlGdUgFrncvRcvb2YouXunhwHoJ1wFfo/i5ktYh24fCXLIssbdFwIpD92vPzJAla24RJ+J3ezD6MoKfKA7ql/dCnyV7qjR/hnHgJbAuv5hCRvvQg19Rgc8Al0RHS7y3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889189; c=relaxed/simple;
	bh=YID4gXHFIqMTtUVppI1nwXzJH3gXMKv2tIPQ6gT5e4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeEeK8UEUNoma/2X6gCchImHRYXMYdzLmLbcACFygBwGn8ae3PJpT98x7PxdBC2yciPcFsDXX64e7+M8BTmQen1n6/tfvp0v5fnRso1K9bCId3vmgeRXir8yORXQE9oaWaPYRSC9a7re8piE0BtWSsKpLqau/WeMIT4hSc5TZ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YikII+iy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YikII+iy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524B11F000FF;
	Thu,  1 Oct 2026 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889188;
	bh=ozBDR9ihiLQdoV63c/CIH9/DsGrQtAF/ys9gmVy4Urw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YikII+iyAkLSbiEz9+nK24YSMOQ8TYIZJOvFUQ9DfsRFgfTcncjyz+mHZpXoWq1G6
	 jjMDH86qljrHn8jNlPffZ480UfXtKgguhAim5XnbNQ/lFYOwkDeSs2eKeSuUrrw21K
	 EhkOkhRwcGpcpKXOZHP8UpViN5eTVCJKu4irieHzelHLqw4E5oW1iW4L28GBUKqULu
	 MTGJy7RxXE2tVQ3F4z7SL0RhRp7eHpxOrSe0cOetdD82elLMKUICQxOKajSe15dVF5
	 jKkDJ69RS+6K4t7X4xSvC9DR/b6LH/zB2/2SWtre4Vcz8BFLGBTjoQCtQFlTpKHGRS
	 nQ7a1In+nA7Qg==
Date: Thu, 1 Oct 2026 22:13:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: manual merge of the random tree with the kbuild tree
Message-ID: <e7b1d231-f862-4f58-8cf2-3670066f8451@sirena.org.uk>
References: <ar5-4Yq3wtmXTWnD@sirena.org.uk>
 <20261001192731.GA713751@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QAXylKfppE/EbuiC"
Content-Disposition: inline
In-Reply-To: <20261001192731.GA713751@ax162>
X-Cookie: Do not stamp.


--QAXylKfppE/EbuiC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 09:27:31PM +0200, Nathan Chancellor wrote:
> On Thu, Oct 01, 2026 at 04:40:17PM +0100, Mark Brown wrote:

> >  -config PAHOLE_VERSION
> >  -	int
> >  -	default "$(PAHOLE_VERSION)"
> >  =20
> > - source "scripts/Kconfig.toolchain"
> > -=20

> You appear to have dropped this source line, which I believe is the root
> cause of https://lore.kernel.org/ar5-8C-j_JT5OYQm@sirena.org.uk/.
> Restore it and the resolution should be correct with no build errors.

You're quite right, sorry - I got distracted by the complictated bit
with having to update a non-conflicting file.

--QAXylKfppE/EbuiC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+zN8ACgkQJNaLcl1U
h9AJLAf/RRQDWQhKcb3EIrvJsKWP28K081YV9ICO9UPNRYX9wr3cwe+iZIBfGMPW
fMUzN5Kwn2VWuBWS63BuK4kjpXDhKkCuQRftOoJdyFBgj4t/MrJXC+ir0511DLUF
KOCYJzt9QJD4KVx5cK55WzuIrsM7T0Rguwt6uvUaXOGUOnlTCDmgFWLhEI3PctDa
JKI/KlflPr0t1CJS2j+6bjZe2EPZ0+ADh/r8r2QHrSzh6PtAlFyFVXdxyY9L2SIt
jDe3ccdEKv2zU49IY55ufA9lqnksnM+gCDboJDdImT639u9l6MpFLT13efnOPYXF
hjoAHzpP0th7h/slrsEyNpkH6/ym1Q==
=NClQ
-----END PGP SIGNATURE-----

--QAXylKfppE/EbuiC--
