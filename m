Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B12741B6;
	Sat, 13 Jun 2026 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781369864; cv=none; b=eoPO54xlcP/VPCvaV9o4iPhZ6dej2Wtnww12SbOM7NO1odnA+HWB5IuRGWKMs4Eu7JTIuNm7e8TsxPB/n4tV9NjYYRqSQDWxMqwmRxOQwHa3Uq8BU9lOtCpmwsrDNIbAFSjcwlTA9v5/Yu6IFC8h+HpUV1wyp75FiyZVFkEU8tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781369864; c=relaxed/simple;
	bh=gBl6HYf2cYjTVKCP6gyydKpLvyLum+plGHiCXwPUrxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFnyTu1xkkZbxQ8bNDkYbUt4A2xXYWgHdpVdlBRbxybJxUevlQTtm9YPmdvYISq6F212Z0wWg5pKZMyACAmH4zZK36kQaG/DbptOeH7+ahfSO1Z8bVJAhOdOlgulZFQvcl4pX00ZSONr70W3PA/NuDxkEsYh9z3tuHXqdE0WJRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F244cEWm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F244cEWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC1A1F000E9;
	Sat, 13 Jun 2026 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781369862;
	bh=35IHbTu3tEKf360Pfg5kvbRcvSef/I2tzHiMDnwImus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F244cEWmHnbJibbpiKRprqc6qHovylKhChnoyg4aofPNwbGTnM1haO2LY6NXOpyuN
	 8CTBMDShd4n3g1JV9phkkK21tJ7HzEwSQ5rmm3rgH97eWphy8KSEgLdBCcs1GuzDFk
	 Kl4dthrklx3MvAN7Zne0uBiqDoKxzcxdhh0yHFhMu1hYWifobF1Lorx8X6F7oUjhlO
	 MhTeEYvghJOA49XDzksMbxRHdW0fFBTs1RCbrSu0CqJSp3s/AlIIP6XdTRQrpVsGK+
	 jrphqAuz+sz8LywVc/Lv2We1GWQ+QORKn0MEsnntsVQpKyhbZhg24FrfN0EZ8UlxWY
	 VSYFlXYe1AdTQ==
Date: Sat, 13 Jun 2026 12:57:38 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Arnd Bergmann <arnd@arndb.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <20260613165738.GA3152432@ax162>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <20260313235618.GA4171564@ax162>
 <3d6608fe-be15-497a-85a3-e6af2dbded0a@t-8ch.de>
 <20260324183501.GA3704429@ax162>
 <a31f2655-2ce8-4029-a63d-321c849730f7@t-8ch.de>
 <ai0tYULNorM5UDqd@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ai0tYULNorM5UDqd@levanger>

On Sat, Jun 13, 2026 at 12:13:53PM +0200, Nicolas Schier wrote:
> On Tue, Mar 24, 2026 at 08:58:08PM +0100, Thomas Weißschuh wrote:
> > On 2026-03-24 11:35:01-0700, Nathan Chancellor wrote:
> > > On Tue, Mar 24, 2026 at 06:05:34PM +0100, Thomas Weißschuh wrote:
> > > > On 2026-03-13 16:56:18-0700, Nathan Chancellor wrote:
> > > > > It sounds like the "< GCC 3.0" part of that might not be true based on
> > > > > Maciej's research?
> > > > > 
> > > > >   https://lore.kernel.org/alpine.DEB.2.21.2603101412520.63708@angie.orcam.me.uk/
> > > > 
> > > > Yes, indeed. In my opinion the consistency aspect is still sufficient
> > > > to have this change. What do you think?
> > > 
> > > Yes, I think so. Will you keep it as going from __ASSEMBLY__ to
> > > __ASSEMBLER__? It probably makes more sense that way given there should
> > > be no regressions on the compiler side and that is the intended end
> > > result?
> > 
> > I would have stuck to the old name '__ASSEMBLY__', just for robustness
> > and because we are late in the cycle.
> > Then we can switch it early in the next cycle.
> 
> What's the state with this?  Shall this show up in linux-next early this
> cycle?

This fell off my radar. I think the commit message needs some small
updates based on my review upthread but once resent, we should be able
to take it when 7.2-rc1 is out?

-- 
Cheers,
Nathan
