Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B036B910;
	Fri,  9 Oct 2026 06:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528975; cv=none; b=icV9tbuBsiBLG+hcrWVqAovhB+yoylYtPxn/d+yjwjeH5yWtw9MwFdlyh0vYXINff4S8L2zLQ6JsijpyDRhgnKOTwY9Xms09f6CV+pW/69M3WJnpwTDTQ9tHBzPlvIKAXyVxeZesfTFU8zZrGU6qC+0EbQaCfO27E49FqhLPkUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528975; c=relaxed/simple;
	bh=0iCbDi61UpmcCHXdfg/G61aSFZzT/N51dKZO3m1YycM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVF8+hteu4/8q9nijMEZGF0A96NvVXNRrrzkhNqtvwMB4Q8Q+VJ8Y+UZfF2nyEUKB5jT/AB2UuUtv77Dj3F25ygNbDRkOGmCSPS9lC1OTK0DKGxiNbrPnpR3aStTd9vcxflwkydiSprW5P4u57xJ5tlgG+97pWfWkToSVGMJHAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlzrlOj4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlzrlOj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8F11F000FF;
	Fri,  9 Oct 2026 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791528974;
	bh=kqzy6vEz0RfryQ6x1GPlflYy3LT5Qzbfi9fT1N1rBz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VlzrlOj4yjeCjQFmjvNduRQOQr2Dp+5OM+Gxqdjv38vAnEHixCgCtyGZw2hWBMswg
	 hDnXP5OyOdPh83hWNe9Xu5s02CoxdYLcjLZ3TjNmbqrrZ0mHBisRV+OpnIKRPfnVgY
	 ByO7cFfFKV7MjFP9krDXQ1G9yxadG9ulRYthKC40T0GOexBu7n7ZbXs8x/iV1+Klkq
	 dZ3dWmwGpVgRL1+Wcl9OshwGOU14kJQV8XF3yHswqQ9ZoMqdm+7Sjo0bJyNldCpy/+
	 PpAh/6Dr4UMko77NPR/A9QG9IgIa2TtAZeYTPLku19e7bD7MJrHih34uwyKDndoDHQ
	 aOptluwE98khQ==
Date: Thu, 8 Oct 2026 23:56:13 -0700
From: Kees Cook <kees@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Initial ergonomic improvements to
 scripts/Kconfig.toolchain
Message-ID: <202610082355.D904DA02@keescook>
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
 <179139172076.154975.7876331914722818497.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179139172076.154975.7876331914722818497.b4-review@b4>

On Wed, Oct 07, 2026 at 06:48:40PM +0200, Nicolas Schier wrote:
> When I look into the resulting .config, I'd wish, these empty string
> kconfig symbols could be unset, e.g.
> 
>     # CONFIG_CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF is not set
>     # CONFIG_CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE is not set
>     CONFIG_CC_OPT_WNO_DANGLING_POINTER="-Wno-dangling-pointer"
>     CONFIG_CC_OPT_WVLA_LARGER_THAN="-Wvla-larger-than=1"
>     CONFIG_CC_HAS_WSTRINGOP_OVERFLOW=y
> 
> instead of the current:
> 
>     CONFIG_CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF=""
>     CONFIG_CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE=""
>     CONFIG_CC_OPT_WNO_DANGLING_POINTER="-Wno-dangling-pointer"
>     CONFIG_CC_OPT_WVLA_LARGER_THAN="-Wvla-larger-than=1"
>     CONFIG_CC_HAS_WSTRINGOP_OVERFLOW=y
> 
> but that would make things unneccessary more complicated, right now.

Yeah, it may be worth documenting somewhere that "CONFIG_CC_OPT_..."
will have empty strings, and if someone wants to test _availability_ of
a feature, they need to still create and use CONFIG_CC_HAS_... ?

-- 
Kees Cook
