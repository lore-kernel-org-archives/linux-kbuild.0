Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EDC41A549;
	Fri,  9 Oct 2026 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535532; cv=none; b=PLR1BEC6R8RhCnK0g/brGYdlF4kddBy9jUyt8jdOUVYEBgHkIR9C1ZQalBQhl1Za+dhYkslGhws6cClUeCQw0IcybseO6Kw2YHcbCkSSRYjE1PnIUvaej4KKCxmqI+kt3tlEewpW3Dz6GEc9DeNzsSR1ZXRbzm0AbyhT1KQmxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535532; c=relaxed/simple;
	bh=aAPWmQ/c0ikw0hfzixw1+QO2rpJXQH37ukxbombYu0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pg51IiiQDGkLr3mb8nUxH+shwT1wIhsx901mGZGRF+HvGExIGh/zjSu4TGtEdEtIpC6/gQfjqNRcsQSPAWLSXTxs532uMpdh/J4+a2N9lBdsmhlyb0+HXxT9njZ1hlpusdyv4ClH/ZH7FCbHy1Y2hJUJ7ZLjYGrEtHwgtyqspaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1h+TGle; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1h+TGle"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBBA1F000FF;
	Fri,  9 Oct 2026 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791535530;
	bh=uhI2h5GHhoA5PJ7PNFc2EDRv4FrRwbdB5AtEoMwFUds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a1h+TGleLycixW4NTfXMuJrTCOHV6uh3BGBnAUJ3UUtw5ZEadIGdCt5fJwlAR4O44
	 jgrbgUPsRFaMHl8nekILqhkvhoMiQ4FYiNgTM48bcKcYkcPKrWE6EgEi7U4QwkZxKV
	 89aD1QTij/Jwio3lnFhDgHzrQ97F5iIpY73f6l3OiKBPcgaOQZSfawFEKJ+LaZy/pw
	 0BHj95YfpZ/FHz4oNAayAvNUt3tdBFPnXPZxstU5bJAb4uTU4cUT4cqsMjU5Vj4L+D
	 pvlVXGhJqYJj80qrqHPFV53eK9FTWARrgALos+e5Q/N+w82+UzvFM2x6uPb/ceXxvN
	 iKWioxQ8aJroA==
Date: Fri, 9 Oct 2026 10:41:17 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] scripts/Kconfig.toolchain: Drop compiler symbols
 from dependencies
Message-ID: <asiorcpffrSJ6_cM@derry.ads.avm.de>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
 <20261007-scripts-kconfig-toolchain-improvements-v1-1-1e524178da11@kernel.org>
 <202610082352.C92AC57@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610082352.C92AC57@keescook>

On Thu, Oct 08, 2026 at 11:54:30PM -0700, Kees Cook wrote:
> On Wed, Oct 07, 2026 at 05:22:21PM +0200, Nathan Chancellor wrote:
> > Commit 454e00cf8ee5 ("kbuild: avoid re-running compiler and linker
> > probes") moved many cc-option calls from the main Makefile into Kconfig.
> > In the process, code such as
> > 
> >   ifdef CONFIG_CC_IS_GCC
> >   KBUILD_CFLAGS += $(call cc-option,-foo)
> >   endif
> > 
> > was converted into Kconfig as
> > 
> >   config CC_OPT_FOO
> >       def_string "$(cc-option-str,-foo)" if CC_IS_GCC
> > 
> > The 'if CC_IS_GCC' is generally unnecessary because it does not prevent
> > the cc-option-str call from running (which is the primary reason the
> > ifdef guards exists in the Makefile), as cc-option-str and the like are
> > run before Kconfig even parses the dependency. It only impacts the
> > symbol's visibility, which does not really matter in the general case,
> > so remove these dependencies.
> 
> Hm, does this mean we're running more probes at start-up now compared to
> before (since the Makefile idef would have suppressed them)?

Yes, probing compiler flags via Kconfig results in more
useless probing calls.  That's unfortunate, but the move to Kconfig look
still reasonable to me due.

-- 
Nicolas
