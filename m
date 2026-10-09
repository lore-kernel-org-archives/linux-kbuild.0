Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DEC34EF03;
	Fri,  9 Oct 2026 19:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573247; cv=none; b=RhG/nH5hBnaVFRvfDOAS/yC0ha4s042aknqncP4BcB15718njJmhwkBEWmt/MOmkOlddUlX7reBB/WDvCPkNEeaMAd5QImGnMtUuaQRRrBbsSS/lubBKszctHpf/rp6vf9oV6LTUbZeuE+NWbqUp5cJ+ADYLRIGMHqsHW/QOKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573247; c=relaxed/simple;
	bh=8RQ2CkOY3ZvyyWl22fo/tbc1UZYXk9KnY4ZNkYt5PWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN/gJJPT+W4J4DYoiWPjoJ1YxdQRD+L1ts83sIvWILI4rxfcfP2SxjoIW62oQ6H2NfmIv4r04mlpSI4aR1/zu3zTgeUv9sUrWd+O9JBiLW3gXW7DUm2F+S9Qvx9Jug3bwl+d9WpHCWsBQ0Tu6J9OBhWEIPngGEvo9S/oJ7jXPvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOXZY7Nt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOXZY7Nt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B901F000FF;
	Fri,  9 Oct 2026 19:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791573246;
	bh=ph4cjoAW4zlCNyJdoIYXG/zsT5+rNeGV7htEubQN6Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOXZY7Nt2XWQSCPTaP6C/DpG+laevYCg68QyQdVy5ll+J1zTh3qpYVsq7dd+dsHxp
	 DMVTbKEeLOohZKsespkjrItKKEiDcJgNH7aFZnJuUfRepgkxepGDETsnko5a5b3Qyt
	 Z5VH4nJIweVDM/yBj8V7jiCoo1lPEynwq1fSgVROdvSn61msRNQljkh2E/fgTgZIOM
	 1Iv2k4Y+nVuD3kyTikLC3r0Bz6GFETYqygU2B8klHlm82xryWGUMEbEzPxdNIWnbWA
	 TFNYEX8fVXuTWQq99mZX/dZeAAehBvnr15wGW7TIpFIqh3hovKCSiwa/vrs0FlxLS3
	 ShczXEyMqdk8g==
Date: Fri, 9 Oct 2026 21:14:02 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Initial ergonomic improvements to
 scripts/Kconfig.toolchain
Message-ID: <20261009191402.GB757048@ax162>
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
 <179139172076.154975.7876331914722818497.b4-review@b4>
 <202610082355.D904DA02@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610082355.D904DA02@keescook>

On Thu, Oct 08, 2026 at 11:56:13PM -0700, Kees Cook wrote:
> On Wed, Oct 07, 2026 at 06:48:40PM +0200, Nicolas Schier wrote:
> > When I look into the resulting .config, I'd wish, these empty string
> > kconfig symbols could be unset, e.g.
> > 
> >     # CONFIG_CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF is not set
> >     # CONFIG_CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE is not set
> >     CONFIG_CC_OPT_WNO_DANGLING_POINTER="-Wno-dangling-pointer"
> >     CONFIG_CC_OPT_WVLA_LARGER_THAN="-Wvla-larger-than=1"
> >     CONFIG_CC_HAS_WSTRINGOP_OVERFLOW=y
> > 
> > instead of the current:
> > 
> >     CONFIG_CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF=""
> >     CONFIG_CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE=""
> >     CONFIG_CC_OPT_WNO_DANGLING_POINTER="-Wno-dangling-pointer"
> >     CONFIG_CC_OPT_WVLA_LARGER_THAN="-Wvla-larger-than=1"
> >     CONFIG_CC_HAS_WSTRINGOP_OVERFLOW=y
> > 
> > but that would make things unneccessary more complicated, right now.
> 
> Yeah, it may be worth documenting somewhere that "CONFIG_CC_OPT_..."
> will have empty strings, and if someone wants to test _availability_ of
> a feature, they need to still create and use CONFIG_CC_HAS_... ?

I don't mind writing something up but where would be the best place to
stick that? In scripts/Kconfig.toolchain or somewhere else?

-- 
Cheers,
Nathan
