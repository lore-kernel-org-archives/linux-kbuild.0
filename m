Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422177;
	b=sLsR9hb9gEfE5oQTm09Q0Jlx4ps84obgl7xlDjQdfg+Q7sxRF1VWUHY4D4frjAk4Myib
	 z4zOf9nHiJKfXfNj1P23ShaGjfbYXWx6m2V5lB6EQLRVAxamE4ngT5sYKX2MuLFF9LySf
	 9PHjOpZCgdXhZ65PjZMYW5BIe/+mXoPr3BT4pANZxFYyGaZnLVozPqTD77KTcWsvpd5fz
	 2gj73OLYga9wBKq9McQ4vXydwQcy7whUb1VXJKytPVaJzWuVa8dmR7Ca/ghuHHIOS4yZk
	 AN44KC6uiGnZYgR9VqEsyRlOj3aDUpjvAYcLzVdjAgPtn/skzB60zTjcqVTcAWQQR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422177;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JK0gg8xncc7NMXwv2cZIHsQ1y60eN4lRgyZXp7GqRp8=;
	b=E+tbDCky63wJf3IYTkh9ZOiJA6hFEPKeg8DZoZ0516RRkiHY6KuM4JPhCpOJ9zW94pBF
	 dtLkv623GnMSs5xS2+OGliXGTQ9Y7d9f4zvJFcCuRtRXzQcTpzjaU+sHnYkvlmUj9+IED
	 VGJlrS1fmQEac22trcYY8mvEtYgbWYD1q7qHYhxGkssQA7+Q2cRjHS+OG9qqatXK96Em2
	 yVbUJGBd8vSSmBSFpJsu/T6v22KFg8o5rSauOTjmS/83UfVqj4e6aYXz+NaH0PR39Z5Ni
	 x5RX+u49VzpefisPdm+1aBNSobjXQBaRByek70DQI5BwLqEpkz0bgG26UzSHajR3GdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2Jxu+v4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A90606A31C;
	Wed, 11 Nov 2026 18:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2Jxu+v4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017FA1F00A05;
	Wed, 11 Nov 2026 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794422176;
	bh=JK0gg8xncc7NMXwv2cZIHsQ1y60eN4lRgyZXp7GqRp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G2Jxu+v4cwZKkCloKqrgamLx/iHp+Jy74vkEQrwU710+6m1Vhf81Lc4vFnTsj6pd0
	 vFJsEo7Is79f6VCMzv1249Z3qULsa1t2vpcvOM/gzQ0MLhvZTTCwdOpEb4cWsx9myK
	 m2THKbOF3VoWT9JzEkVtGYSJfvhmjBktpwABX29yYSCJTm+BKJp//zfOZUatDsAHtl
	 0tIhOGOdS4mQdld3Df0PTB/BHot86wN+RERLsct8tHuKimVzOb+ehzHLBPWhgXLsSp
	 C/gOnOYG/pxjhaNU0Rw+3QdvTSQFHdzQv4jXS65kniNnlmvxKQM+EHHGFLZ/27XrNd
	 M4RxsGTXp9VBQ==
Date: Wed, 11 Nov 2026 11:36:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jordan Abrahams-Whitehead <ajordanr@google.com>,
	Nicolas Schier <nsc@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/4] scripts/Kconfig.toolchain: Do not dynamically probe
 '-fno-addrsig'
Message-ID: <20261111183611.GB1452558@ax162>
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
 <CAKwvOdnFG1ACEvGPXGW1XK_3QN+5UaR_9EumhmrsyKOs0aYCPQ@mail.gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnFG1ACEvGPXGW1XK_3QN+5UaR_9EumhmrsyKOs0aYCPQ@mail.gmail.com>

On Wed, Nov 11, 2026 at 08:51:05AM -0800, Nick Desaulniers wrote:
> Jordan, I know you were playing with -Wl,--icf=all recently.  Looks
> like the kernel does not use it; AFAIK, no one has ever tried.  Even
> -Wl,--icf=safe.  Worth a shot to see if it boots.  If we did, we'd
> have to update this kconfig check (the linker flag is only supported
> by LLD).  Even if the result doesn't boot, it's perhaps worth doing
> builds with BOTH to see what kind of savings are possible at the
> limit.

FWIW, ICF came up once before through OpenMandriva defaulting it on in
their toolchain.

  https://github.com/ClangBuiltLinux/linux/issues/1341

-- 
Cheers,
Nathan
