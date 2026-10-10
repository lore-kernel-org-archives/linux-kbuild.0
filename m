Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3462736B926;
	Sat, 10 Oct 2026 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791640020; cv=none; b=FX7HEUi1n7OeeFVQQG2fqOz/IhshcWkWCCdP12wefQc2Zz7iGznxll+z8+JY3cQ+oJetAqAl8yh023dUifCfamkPzPQP8MHOPKKFNnqDH06jhBQ8t2KV71TS6bdjpxJ++HFZMe232gAjs/2N5EiGpGWH10D1Rj2Mw2xgb/zo4Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791640020; c=relaxed/simple;
	bh=umG0WbXnWQGbQMqix313HFMJTvLnBnqJWrIRVegbq/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XS2T8ItsCqFKghYT7bnOi6Ld18hePSUKkNRcdWpFerIQWMWHn1bfA9go1jUssrmk1MqJaan1CTZx4/5acuEekR2YnXIzfSxJiStH+lr8n3J2tY1VH6Xhc8pGusQgj3D3XOVxnpafL1afcPlQOR89uCw2mGrI0I+23DpAWLX1auk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkg1bQEy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkg1bQEy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE851F000FF;
	Sat, 10 Oct 2026 13:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791640017;
	bh=2Q+gomw1WCpkmG3XGdpK8ZEdkYIMdsCv433rwM840Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gkg1bQEyhVxy1nZ3VebRgTFgjyPLsI1MNCgwiM5FbcfteEzIqvLu+xmdOQczUwU+n
	 ZUNBOK5d4DICpWOQjXIC5hWR7NeVR0J6KSSSkEbRvuRQe7IpoODQo42bj6o1eoL+FT
	 jTfeusxyuxdY8O7WEyqFAz12dgOfFRaMmsxYj4ryoJbQhaDiCKKylpxzirRqhCJz1N
	 /cDyAumwlsztB3NvhEq35PIYd3Iz0gELHluunqTTa2Y0S6IW/AOXgwBPdoCk2n8Sz2
	 WBdjU2asgoEK9qDk2JTZ4QDxV8c/FXmESgqRPO9EBjbYxIpw9k96tet679+KFoFv3m
	 x6pDKusV/E4Jw==
Date: Sat, 10 Oct 2026 14:46:53 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: manual merge of the kapi tree with the kbuild tree
Message-ID: <20261010134653.GA1853402@ax162>
References: <asl8rgrKtHW3_-Yc@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asl8rgrKtHW3_-Yc@sirena.co.uk>

On Sat, Oct 10, 2026 at 01:45:50AM +0200, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kapi tree got a conflict in:
> 
>   Makefile
> 
> between commit:
> 
>   26d665bef44fa ("kbuild: add header check facility as a manually run static analyzer")
> 
> from the kbuild tree and commit:
> 
>   6d009bd85fa4e ("kernel/api: enable kerneldoc-based API specifications")
> 
> from the kapi tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc Makefile
> index 11061c73f93e7,fd7917f78fa45..0000000000000
> --- a/Makefile
> +++ b/Makefile
> @@@ -2262,7 -2251,7 +2262,8 @@@ clean: $(clean-dirs
>   		-o -name '*.ll' \
>   		-o -name '*.gcno' \
>   		-o -name '*.long-type-*.txt' \
>  +		-o -name '*.header-check' \
> + 		-o -name '*.apispec.h' \
>   		\) -type f -print \
>   		-o -name '.tmp_*' -print \
>   		| xargs rm -rf

Looks good to me, thanks!

-- 
Cheers,
Nathan
