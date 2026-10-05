Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEEB3CF1FA
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190417; cv=none; b=Qj9KrBjZVhdYIr90G+xclVxBfaGZI6d+b5OXJHT7bu+/Xp10sr0e3mOsER2fxMtVohSJEyVRHYVCbi5uc+IKR4Y8LMzVu4zPjQeV7IxCXq44vyoKJpj0cMrDQIloU6Hx043GGkWzefuKlPIKyJDYJg/Iiz3cMOwnO3oQUosWJ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190417; c=relaxed/simple;
	bh=GFoUWYPmS/hCeFs2Fg/NovXkvm9hKczNjGMQYbkzluU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ah8+n7ZpDj9p1/yDUnG2BNJ3HgM2cQO6GkvYAbHXsrBxChiVta/dWfIGXktV3nTWmCSw2LT49fUfQWmDWEikDzqAe4sbmfn9FpVb7qaXFW8SiIfbNuPXoAlBw/UoV7+EesJ8wAJ6Cy75X5kpoF1IgXagWCgVHDwvJVUJJ4gE5Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPHBoQk4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPHBoQk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027241F000FF;
	Mon,  5 Oct 2026 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791190416;
	bh=zyn1N2Yo/tF1fdgGLtj7hVfHF0pqWfKo3TJzDB3ElVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QPHBoQk4neZonroDORd/16lhir2Y/x+z8OJsslBH9D3BRpEDh/GBhkT2EBdwMNBHl
	 7+cuZGFbFwVbdUU+YQJRGci0NOnzBrQDGI6d8VdExYA3E94b2m71XdBaRpgl0fhOU6
	 foMfTmOdPWkq+QWYzpTh4BwGgTJ87Lt4YvqHqxaqkwI1BpivojTcUf68gLd393r2H8
	 EY6u4fORuvV5h2BMx6r5TEzMiDqqzB7pSUDS7rEIQPP/q9MFqrSE9mLsUhtug0v9Ro
	 0tj+m2GG7QaRybo6P2tP/PaeW+jukfT8K5KT+bIyneE6zZHnKCINiTFhtwEnkdXoDv
	 lp6/qexaDICJg==
Date: Mon, 5 Oct 2026 10:53:32 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Aharon Robbins <arnold@skeeve.com>
Cc: linux-kbuild@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: Use of `gawk -M' in kernel build scripts
Message-ID: <20261005085332.GA2094974@ax162>
References: <E1xDQvK-00000000Kvi-2PZ4@gleep.local>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1xDQvK-00000000Kvi-2PZ4@gleep.local>

Hi Aharon,

On Sun, Oct 04, 2026 at 09:26:58PM +0300, Aharon Robbins wrote:
> I'm the maintainer for gawk. I see that it's used in the kernel build
> scripts in combination with objdump.

For the record, the only place where I see '-M' used with gawk is in
scripts/objdump-func, which is not called during the kernel build
thankfully.

> In particular, I note that gawk is invoked with the -M option, which
> uses MPFR for arithmetic (although the precision isn't changed beyond
> the default which is the same as for IEEE hardware floating point).
> 
> I am wondering if the -M option is really needed here?  The reason I
> ask is that I plan to deprecate MPFR support. The upcoming 6.0 release
> (I hope in Q2 2027) will issue a deprecation warning when -M is used,
> and 6.1 (late 2027 or early 2028, I hope) will have MPFR support removed
> entirely.
> 
> So, I wanted to give you folks a heads-up. If -M isn't needed, now's a good
> time to remove its use from the kernel build.

Adding Josh and Peter for the rest of this since they have
added/supported this script.

-- 
Cheers,
Nathan
