Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD23C1D47
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883171; cv=none; b=FD9cWA7gFiqsrgWldOYK6+3kuDIFGLujX7A43QDx5DzwiHRXiB0vpxhr8KUZ3dS3tojFKgDjzN9m8fjGGZYcEV44tkC8iKprbDQo8IMt5vB0ojGR2hC69+HBb30+2gi5SirUvWpgYREpeb5HCy2XwLZ37Z+VD2ptUCyPAV7rFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883171; c=relaxed/simple;
	bh=DEULVcj56n+Jm4CwDz4DBJBHwIKGRsfZczMqtwHORCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1uPIHDTl4NtAJzKRmSW/OPD/Q/3LqcMq5zocwiQvmohtEQVaoyQQVSFWIVQvGssQUtDLFqxNSYrhB77yG/ZfJf/sHs4SimuLzuCCZBI17lYq7FRMwHrdOLK3Tyfuch7vet++gMMc5ik5Noznk8DA1tNG2DgVXLArIDtDC1emaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NQMBoN0K; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NQMBoN0K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=89x7pW+31Us0a+94mMCkdwmrJGCzwQxKlpqQTt11+hI=; b=NQMBoN0K/LDoRvppjjRFmXCS6B
	0zXhXsdAj0V0eJ84wRxuZwC6QFD+kXhCFL355XbgqWwTx5wG6zaANi1SIReyGEZHwrjl3Ems8oxrC
	ivXx4EMCZqiWGoBCxI6u9qPGo7RL73IuyMi+q1ciC7nHL8cN5QPjL1gPLQVMMA14BEcqin9LpA4mH
	vfxfdT88CkBsA5iQrMwHTfj0UBAh22AA6hBXw5CuVl9zqq/UnUgS341aBr7mkfoBJbQehvudBgh3b
	Q7EFtnkOCy2sT/6UhqVJ/BEMTnGEUHv13wLDKsNWG4bEWI6G+AP7HCPpCgDO7Uh2CdLS0DT0+LpId
	GdQ9Y6Dw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYfI-0000000CTZV-2YBD;
	Tue, 13 Oct 2026 09:19:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 24E4630015F; Tue, 13 Oct 2026 11:19:20 +0200 (CEST)
Date: Tue, 13 Oct 2026 11:19:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Aharon Robbins <arnold@skeeve.com>, linux-kbuild@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: Use of `gawk -M' in kernel build scripts
Message-ID: <20261013091920.GW4121339@noisy.programming.kicks-ass.net>
References: <E1xDQvK-00000000Kvi-2PZ4@gleep.local>
 <20261005085332.GA2094974@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005085332.GA2094974@ax162>

On Mon, Oct 05, 2026 at 10:53:32AM +0200, Nathan Chancellor wrote:
> Hi Aharon,
> 
> On Sun, Oct 04, 2026 at 09:26:58PM +0300, Aharon Robbins wrote:
> > I'm the maintainer for gawk. I see that it's used in the kernel build
> > scripts in combination with objdump.
> 
> For the record, the only place where I see '-M' used with gawk is in
> scripts/objdump-func, which is not called during the kernel build
> thankfully.
> 
> > In particular, I note that gawk is invoked with the -M option, which
> > uses MPFR for arithmetic (although the precision isn't changed beyond
> > the default which is the same as for IEEE hardware floating point).
> > 
> > I am wondering if the -M option is really needed here?  The reason I
> > ask is that I plan to deprecate MPFR support. The upcoming 6.0 release
> > (I hope in Q2 2027) will issue a deprecation warning when -M is used,
> > and 6.1 (late 2027 or early 2028, I hope) will have MPFR support removed
> > entirely.
> > 
> > So, I wanted to give you folks a heads-up. If -M isn't needed, now's a good
> > time to remove its use from the kernel build.
> 
> Adding Josh and Peter for the rest of this since they have
> added/supported this script.

I'm not sure; Josh added that when he did the upstream version. My
initial version very much does not have that -M on. Josh?
