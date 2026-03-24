Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919DF2FBDE0;
	Tue, 24 Mar 2026 19:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382292; cv=none; b=m5p66mu2mxoGNLvUM0tdeCoaUInRcqEf4bEDG/WyoJ45mibRIMhKjG2nP0AO13j+Xpalm3nfpY/vL1UL5JjUSCu76QmJkL1UPwgHIqT/LebUwuxNepx56DaPCzLd0aXHTaAGUcufr6l94EK+me273lMZdMeC1iNmu+pB6Q+byqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382292; c=relaxed/simple;
	bh=6AqOo83XzzkbSYELummVClzb4z9wSjjyOIot1veFHKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBbQp5+v/XVNUu3+uIMlYhA46fGYaMDO5tf68ORNQBnAXyj8FkR78+tg94Zivq/cbHdJjTeLdj09v86pn/5cbmLwrO+7SDyVd5FRURTZzBqRkrD7C24acms4eQ8oMlwMxWoCrA1yoYPHvyzgH05HNWPVJDBiaiwcq9651pkRiA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CqcN2uaj; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CqcN2uaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774382288;
	bh=6AqOo83XzzkbSYELummVClzb4z9wSjjyOIot1veFHKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqcN2uaj+1Ph6r8eDU/X26qScPa0DUTbn8SIT5Sx+HccZP2mH0ECnWoR3wifdXVUX
	 oAlK2zJGHrBmPh47pMqkpkhJBU12kQ2hklum37/eVxOXqoquPCSzODNOKYAORQ+S54
	 7RyOl6xnep64pA+b5VnQmU5fTqZqCbchcc9OTr0U=
Date: Tue, 24 Mar 2026 20:58:08 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <a31f2655-2ce8-4029-a63d-321c849730f7@t-8ch.de>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <20260313235618.GA4171564@ax162>
 <3d6608fe-be15-497a-85a3-e6af2dbded0a@t-8ch.de>
 <20260324183501.GA3704429@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324183501.GA3704429@ax162>

On 2026-03-24 11:35:01-0700, Nathan Chancellor wrote:
> On Tue, Mar 24, 2026 at 06:05:34PM +0100, Thomas Weißschuh wrote:
> > On 2026-03-13 16:56:18-0700, Nathan Chancellor wrote:
> > > It sounds like the "< GCC 3.0" part of that might not be true based on
> > > Maciej's research?
> > > 
> > >   https://lore.kernel.org/alpine.DEB.2.21.2603101412520.63708@angie.orcam.me.uk/
> > 
> > Yes, indeed. In my opinion the consistency aspect is still sufficient
> > to have this change. What do you think?
> 
> Yes, I think so. Will you keep it as going from __ASSEMBLY__ to
> __ASSEMBLER__? It probably makes more sense that way given there should
> be no regressions on the compiler side and that is the intended end
> result?

I would have stuck to the old name '__ASSEMBLY__', just for robustness
and because we are late in the cycle.
Then we can switch it early in the next cycle.


Thomas
