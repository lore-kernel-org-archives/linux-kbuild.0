Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93122D0629;
	Fri, 16 Oct 2026 01:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113062; cv=none; b=SoFCp9TO9DnUiJ2Le2YBBJj2KVAkwVJ7FrSNGiExzYjXXxeOzom2bRQTOVEl9nVZ3ZcHsZNbnF7/3BAHIPBamHdTPvqPF5V3CKPW8jka4t4+LnZd9zAodsnI/zYrOvImmCUw8yLMS+zqHVlGO4n2mnhULbAt5D7aW1pzgTV/gNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113062; c=relaxed/simple;
	bh=hKukQIKuuZY1eN3Z0DFOHPngxOLprM3ztpY2NAAE5hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2nSmTLofHrKco/yM6/YWrkKtJPK+GUyn37oLv8RvoLnUzzhrJen1ztuAgxN8oixwlWzmGMakoyIIDXh/FJ3QHpyDNk4ETUJMAXoJ+Q5CK9WFp4mxjkoEK8D8xY8L7i/GbQ3EMHOec/6Tfu0+sSVgwdr1zmz5fMRmuyp3Uz3w9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZBpoF1p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZBpoF1p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F0F1F000C4;
	Fri, 16 Oct 2026 01:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792113060;
	bh=Gy0GTYtWlDpyR0m+b26wiIWJBULFGvl96ytiTQvAVsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mZBpoF1pt67ictOlEPIqLEsAFb82ekFTzY2Ya2jldZa0o0qRxvBcap3PkhhIRQJ9D
	 xJ4LkFs72lc9e0GoqMN5+kmNKiGPOEW6914YIsXA2KRJXvbgto1QA0ZppXLxM23WP/
	 zUVbpn4j4Zaj0+YYFgNicG/x8S68RZYiN/yfBCsv9rJn0UgaBcMECi4AHOcsWQh/rB
	 gSoRwpCu3MJGzwbFnv/m72ycqmB+a7+b9QjTipHgalJPTNb0c2Ansx6QdlXkKQinlI
	 Sssa6a/C199arCRD3xezyyRRkJPAVKj8lnc97DsdsgnOIOm/awSXfptasBRgcyClTh
	 kPqmtIU8g5Dug==
Date: Thu, 15 Oct 2026 18:10:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC] kbuild: enable pipefail for commands where possible
Message-ID: <20261016011056.GB3329673@ax162>
References: <20261014-kbuild-error-propagation-v1-1-573adaa0a076@linutronix.de>
 <20261014214043.GA3380464@ax162>
 <20261015121210-dbee14b9-538f-4069-8934-153456b3ccd3@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015121210-dbee14b9-538f-4069-8934-153456b3ccd3@linutronix.de>

On Thu, Oct 15, 2026 at 12:15:18PM +0200, Thomas Weißschuh wrote:
> It actually breaks modversions quite badly. And it is not obvious to debug

Welp, good to know I wasn't very far off with that review comment :)

> as that uses the pipe in an `if` statement which swallows the 141 silently.

Ah yeah, great point.

> Not sure what to do here.
> 
> Maybe we just provide `try-pipefail` so users can opt-in where it makes sense.

Yeah, that seems like a much more reasonable starting point, as
something like this should likely be considered on a case-by-case basis
anyways.

-- 
Cheers,
Nathan
