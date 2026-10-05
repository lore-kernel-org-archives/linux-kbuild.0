Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9419E4052B6;
	Mon,  5 Oct 2026 11:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198308; cv=none; b=oUAbkEsP5VTRklc8XHYblB/9lCCo7Pe+Xm53IgBKZOBLpwitjvhbRWcbkFG1J2YO6WwHsbPFOe6W6f2HbPc3JJF+kZGZs1kmU84ICHbOP/XDdV7N1QVNOMlz0HRHr0ziEUPFeu0vKCTGKsEKJ6JQ0NHrRGvXtlxKr5kwbvznHsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198308; c=relaxed/simple;
	bh=X4JH2RKNz5ops4o41CmHzvgGZwRG5jnC1ihF7ad8GU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWTl7FyDJQ+AMsJDsfGbH6cVRQNGUL0s2wRz820a2LhQT0aKTfxxgGKuj4SQ6cEtWBHsrfvLIHg91EJHNrEn05Yyl3/rdbfT6lythPvnmIxxFtTfJoBMpFnrQkzBLba+vWHIpFZxjOJpvPJQ+yxjPfJ2vtWMwyK2CIOumUSsyPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkXbsirI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkXbsirI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0A01F00893;
	Mon,  5 Oct 2026 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791198307;
	bh=rLTOI5qMt6+OcZNzKlZGKWBrvYlFRltA+A6dOm1NAyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZkXbsirIFalIU+Rzp08UWkeJ8fi0RpeziDyweJGWt+a8WYEdczL4AoM9bdksMggjO
	 oe4lgLBIVYgA0asNsQwg7+jCMHdpxqocj/2UeqrJGQIsgs4HrFiCrCPwDS/yivUySN
	 rHBHydOzCI1UL1G7SrZYkwnWT94QEtSCuc5HlNGoBQQMYnqiXdhT1N3oo/Ej3jClvL
	 iXVQhGXptMx/H622pWPRQnqIukmq2oe2ISxPyV4G7PjYRnAv9Ze1p+yMi4dQw/xEdb
	 6aTFtMPEq8AeRGjzjbEVqfDHcE/kinnmIfsltbO9WkvqQRx2m8clldLNIfStzKLtjJ
	 OlX4pEOBhWerA==
Date: Mon, 5 Oct 2026 13:05:03 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: linux-next: manual merge of the kbuild tree with the rust tree
Message-ID: <20261005110503.GA1026747@ax162>
References: <asN8ejNILKW2YWep@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asN8ejNILKW2YWep@sirena.co.uk>

On Mon, Oct 05, 2026 at 12:31:22PM +0200, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kbuild tree got a conflict in:
> 
>   scripts/remove-stale-files
> 
> between commit:
> 
>   a41ec2936d2fe ("rust: doctest: generate Rust kunit test suites")
> 
> from the rust tree and commit:
> 
>   33bef82263082 ("kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/")
> 
> from the kbuild tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc scripts/remove-stale-files
> index f1f776caae00a,e46337e4bfb8f..0000000000000
> --- a/scripts/remove-stale-files
> +++ b/scripts/remove-stale-files
> @@@ -27,4 -27,4 +27,6 @@@ rm -f *.spe
>   
>   rm -f lib/test_fortify.log
>   
>  +rm -f rust/doctests_kernel_generated_kunit.c
> ++
> + rm -f usr/gen_init_cpio

Thanks, looks good to me.

-- 
Cheers,
Nathan
