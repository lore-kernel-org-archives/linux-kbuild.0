Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527386;
	b=SYGhqO9mZ9M1STFQkLmE4O3zAXKaV9zbX9pwG4TFhQkId4YVUdoNz6AxewwXNdWMIBgc
	 lYD6N1UizvDcjfOlAKYkxbOn9pgtEZXi2NArWu5EhcjZBrCQ+lyRmTBI8oouUNmCB2tcJ
	 1PSOApD4BHta47JSqUzOdhL6u/ij/IG3zQdjHDiMvwy5YFRgnMk7dXERsehAcevkErN2w
	 hdOnAaDmra1dGAZK6TYcrB6rUSHb092rte9Mpa9ZVOI4R4I70WIRHF2pig9aj+Z5R7Nr4
	 Vf/0UQdWyxUGudkd2h7rZL4fDr5ds7YSbwVo9TY7OA8R6uLlBXyJ7Ad/rrNmOguMUeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527386;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=l8nfLNB3+5ViDqBfX9n3L+eaVBFkpa6RHHMKSpIEVFQ=;
	b=WNPKSu+wyHrwuEAZgw7pgB8aFnpb0rOQCrhn1Nk2luyvz9WkPgF7AIcbRJRSWUCbD+dU
	 Tkx0uzxdVFbB7efqQIP6+RYHHLo0iQCXnPvp57wb2AkVmc9eX8RQWgG0LDGWS4Oah1Glu
	 bZuNvlTvaycU1lCawq7pH6Z9umScRSDCVQdCx81wrd4KGVZ2DBV3nzD1+KGHGTDafndBi
	 +p5GP5NCI9f5A1IMjT6x7C3O+Ep59vSTweWslj8cZmjcLO8qNIxo1eL0JfIReCGXmuczG
	 0NDzIKHEYkp3zcFT+6Dl5e85WcspvWC/TuvncPSYdbb+H7cujvkEscTn6pWTicN1iqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=PlYqRBTH;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97567606A31B;
	Tue, 20 Oct 2026 20:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97567606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=PlYqRBTH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1792527383;
	bh=t9+lk7wI4c/SelFDXwByIl2Q4CvsL2GzHqdgDMd0AqQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=PlYqRBTHQf+mnT+suDeYO08a6XnW6gnVrtiqG54A5n5pl3G++QkZukSVRG1yPrnI7
	 zy0RmvnCXZ9q1nIqa8JYB1JkNMHZJ2mHW4CkIZ8vHFulJxmZ4nmOy7vpEdgMczHUwN
	 0IUJrF6fY/2gJXqK1Y/FqGTV3K5WIopGAdXOlQxc=
Date: Tue, 20 Oct 2026 22:16:22 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nicolas Schier <nsc@kernel.org>, 
	Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Nathan Chancellor <nathan@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: allow to set package name version
Message-ID: <7bc00156-6723-4987-88bd-9d3451edc8a5@t-8ch.de>
References: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>
 <atfI0Uc3iWSmR49j@levanger>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atfI0Uc3iWSmR49j@levanger>

On 2026-10-20 22:02:25+0200, Nicolas Schier wrote:
> On Mon, Oct 19, 2026 at 09:16:14PM +0200, Guido Günther wrote:
> > Instead of hardcoding ${KERNELRELEASE} in the package name allow
> > the user to override this.
> > 
> > This can be useful if one doesn't want to accumulate different packages
> > for every commit or micro version bump by setting
> > KDEB_PKGNAMEVERSION=7.3 or even KDEB_PKGNAMEVERSION=stable.
> 
> I am not yet convinced, that this is a good idea.  Do you want to
> elaborate a bit more, why you think this is necessary?  Have you tested
> your patch?  I don't like that source package name and binary package
> name divert w/o good reasoning.

FWIW we have something similar for the Arch Linux packaging with
PACMAN_PKGBASE. It is the complement to the proposed patch, as Arch Linux
by default does *not* allow multiple installed kernel packages of a
single type at the same time. PACMAN_PKGBASE allows this.
KDEB_PKGNAMEVERSION would enable the Arch Linux behavior for the Debian
packages. Personally I would have found this convenient in the past.


Thomas
