Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ACB4FDA75;
	Fri,  9 Oct 2026 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575308; cv=none; b=ShvMA0V6z+d4vyhQgiO8PolOdT3yUNYosVOSQJKRG5A6RA8HDvYfrCNOTvORrFnCmLj9RGcBJiKX3cDHtCoQAzH1o3i2220Ne6kBgcf6AsSnzEDZSZWkPE81MjFzvieDXF4uBJmBkiJfIT3NTXUYVxdJcCBqiwQdWz08HGcEb6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575308; c=relaxed/simple;
	bh=rA9AQqgTsrdh01nCDFqVXnf0H69OychNNxObvVIdRM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVKa+4OswggpjSVWBcC5n6jBzLSBQ+VU4LH2zZ1s+e0q7BqNDXSWE3OIz7whuE3niu8pmnXy8cMWyQkAcA+1Vx4i5ei83fjmfG3TrgVij7pfUN1aXQiLCu9WgPmH5Ocm/l+OLWwdEfjmVpsf5G9WqlBva3GT05IYipNUnCwkR98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kydGAvjG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kydGAvjG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC5C1F000FF;
	Fri,  9 Oct 2026 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791575300;
	bh=5n3tJfvIFUw+oLz3qfG9wdwLNhgMy4Fp6eZnCWrqV8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kydGAvjGnkrp+Nc3rvwYr9i6yJymE1lPrVURDrMoASvsRfkdTswtICfqPjdAoDDO2
	 4thzdMw16E8KyfQvRlsBk5xwuuPdYB6Dexfo6jujvfDrxODcP8IR53u3uysNwmRh2S
	 4+Wu139UQ+j58eRbSVylz/y0MEX9MffAgL1fY53KlvjUzNrzWnOrBj9JzDKTm0QIwA
	 4594y+rT0rkmSb8LXvHDYmubG5DYgTo1CxQZV/8nnSruFXd6GcdfH2nMg69a6lQTvW
	 nBY6Hhwu5yAg1dpc6eF8qFfnr7g71XFmrv/31T8EujpvUsc42Frk8yPk6dBeOEY119
	 /tcja6xolm7ug==
Date: Fri, 9 Oct 2026 21:43:07 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Initial ergonomic improvements to
 scripts/Kconfig.toolchain
Message-ID: <aslDy2HkYdLytkDR@derry.ads.avm.de>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
 <179139172076.154975.7876331914722818497.b4-review@b4>
 <202610082355.D904DA02@keescook>
 <20261009191402.GB757048@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009191402.GB757048@ax162>

On Fri, Oct 09, 2026 at 09:14:02PM +0200, Nathan Chancellor wrote:
> On Thu, Oct 08, 2026 at 11:56:13PM -0700, Kees Cook wrote:
> > On Wed, Oct 07, 2026 at 06:48:40PM +0200, Nicolas Schier wrote:
> > > When I look into the resulting .config, I'd wish, these empty string
> > > kconfig symbols could be unset, e.g.
> > > 
> > >     # CONFIG_CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF is not set
> > >     # CONFIG_CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE is not set
> > >     CONFIG_CC_OPT_WNO_DANGLING_POINTER="-Wno-dangling-pointer"
> > >     CONFIG_CC_OPT_WVLA_LARGER_THAN="-Wvla-larger-than=1"
> > >     CONFIG_CC_HAS_WSTRINGOP_OVERFLOW=y
> > > 
> > > instead of the current:
> > > 
> > >     CONFIG_CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF=""
> > >     CONFIG_CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE=""
> > >     CONFIG_CC_OPT_WNO_DANGLING_POINTER="-Wno-dangling-pointer"
> > >     CONFIG_CC_OPT_WVLA_LARGER_THAN="-Wvla-larger-than=1"
> > >     CONFIG_CC_HAS_WSTRINGOP_OVERFLOW=y
> > > 
> > > but that would make things unneccessary more complicated, right now.
> > 
> > Yeah, it may be worth documenting somewhere that "CONFIG_CC_OPT_..."
> > will have empty strings, and if someone wants to test _availability_ of
> > a feature, they need to still create and use CONFIG_CC_HAS_... ?
> 
> I don't mind writing something up but where would be the best place to
> stick that? In scripts/Kconfig.toolchain or somewhere else?

Yes, I think scripts/Kconfig.toolchain is a good location (at least for
a pointer); but Documentation/kbuild/kconfig-language.rst should
probably also mention the new default way for compiler flag probing.

-- 
Nicolas
