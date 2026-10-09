Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8950E44F56C;
	Fri,  9 Oct 2026 19:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573784; cv=none; b=B05GHiVVeRf+goJuOnukN2i7ofQ+MjkfwC0G93nDMrwBYp4fx+YZrkqreAA7NN0kUehHTp9fdZMWNAk7xrrTrUE2CeHl8Lq4Pls6WXDDmdA/L6Z32yBvsoH31d3RC02AHQUIqUeSxDvyw28mpzMtUV45q6Cztlf9050OvLX2Rh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573784; c=relaxed/simple;
	bh=9fivYErWR3az3ws/yUPKvJeJo9Q8wbp0GRcf5zpVGlo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J998U4nXA2q8RSo3+3iZrNBKCrlYCY6FpvoelvFO2utk1PffCvNPAt+AGR+qU1htyeSZt1qzK89yqKwY3Q5z1B/oFJyuM2NlvIVTFwD4x8+n6MFuR3OrJU+kQCHDh7/lDXUCrkX6KKjVV0x6JKIKTnQyrGaGwhmVjvpEkDugCDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i83PIFqe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i83PIFqe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C9A1F00893;
	Fri,  9 Oct 2026 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791573782;
	bh=bdau4Tcx1JAfLZxDR6Vp+aBRhqCnR5Up6k2LlVVNc34=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=i83PIFqe43LhS2s3vMdOG4pD/26QDSgWIj5HD3/SfTwfDmWL/PyWN1ksDKrQeyqks
	 apBc5iYGxzboi30alaXRfaYSTBoromFtjIEqj40CnFion4rMabrd8N9aF4uKuJIbBH
	 CAJPy71PtCGBqlalrjRNTLrNqldfmrwBkup0toDCM4HeVAhlXJYWmdSBmxUDNste0r
	 KQqqPuTjI5ltqeFM1TaaW+Cn72gI+UIn5ktbpdBbwyp5LLNZRpBKOeJDRyLfX8zoX7
	 X5NxJxFdCz/dQaXUMewoj4X9Uu+ElVkRjIHL0GEwH4V1uLq9V9DEKN8ggSpZzFKhIq
	 y4ty+QOWfn30Q==
Date: Fri, 9 Oct 2026 21:22:57 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Kees Cook <kees@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] scripts/Kconfig.toolchain: Drop compiler symbols
 from dependencies
Message-ID: <20261009192257.GC757048@ax162>
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
 <20261007-scripts-kconfig-toolchain-improvements-v1-1-1e524178da11@kernel.org>
 <202610082352.C92AC57@keescook>
 <asiorcpffrSJ6_cM@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asiorcpffrSJ6_cM@derry.ads.avm.de>

On Fri, Oct 09, 2026 at 10:41:17AM +0200, Nicolas Schier wrote:
> On Thu, Oct 08, 2026 at 11:54:30PM -0700, Kees Cook wrote:
> > Hm, does this mean we're running more probes at start-up now compared to
> > before (since the Makefile idef would have suppressed them)?
> 
> Yes, probing compiler flags via Kconfig results in more
> useless probing calls.  That's unfortunate, but the move to Kconfig look
> still reasonable to me due.

Right, we probe in more cases when we have to but the trade off is that
we shouldn't have to in the common case of incremental compiles with the
same toolchain.

-- 
Cheers,
Nathan
