Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F7E3A641F;
	Mon,  3 Aug 2026 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786702; cv=none; b=lIi6R0mOO5XcHg00d/N+QY9QFSgVdVQRuQzixHP8AP0y+utjIx1RzH+cLSk7HvqFDhVyHwSniELHGL5B6YUki5Zhhkg9QmhttHHbUALmhL7qn4hfBW8UrT3ZUnRGe/0YWYAGtYk3ZnYexnzAUxliqQUYIM0Bcgx3PG+lCbuFc8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786702; c=relaxed/simple;
	bh=hFi6ilDKNCNjSmyPE2/Q6fdC/sHjcnNd1GyPPpYk68o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ2zsJkO5vP/RHXvGoA+AwcmkDfIXu0yVazbEbkn3lEku/R2NpJ/DxR+fcoq4UP6/gTsMyYAurWlpF2MGYEDakvDWNHd541BXfzLCM2R5l8ZIqvluISQbFiODGhueuH7cDNYbxtCwmAeRaAiYqmaeA6NPpJecUw4eNNDS2jIrN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NW20t8/X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NW20t8/X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EEA1F000E9;
	Mon,  3 Aug 2026 19:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786700;
	bh=xc5E/wVZX3TK6VxbuQ//ooelqNq/7M+GTZ2+r/EG2Lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NW20t8/XfWsXKJNse2ACmovLKV2lzsSs6X96JwDv1iIFyFijyeUk4MVRmLzDB72ZM
	 qDQZIrCm0AhWQz/Zkj/OL86iW2rzOYRS3ijSPd3n0LvJEVa0FOTW1N79nIIyVQDLPT
	 5WfC+27ynIbuuxOpe/SJAGjPOnbgZ5dsr7frxEUzhDzyLze1jweIKdiZqZf1kCBoV7
	 kbDB/3HyBR9pa6j3i7xLvEgBsejdNhdQbhX3huZuaYc1DF6iZfUFT3hPV1VtLado4N
	 wLiob7aFYSamo1jF2PRRs9Q9MUGYzT0n23rpPJkj+XUTT0VKrKNCSK+TdHr+ec50ya
	 e3MOK5mjLbXrg==
Date: Mon, 3 Aug 2026 12:51:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] alpha: enable building with clang
Message-ID: <20260803195135.GA1083357@ax162>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>

Hi Matt,

On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> Two small patches to let the alpha kernel build with clang.

Nice!

> The first registers the clang target triple and stops passing -Wa,-mev6
> when the compiler is not gcc.  That flag exists to keep gas from emulating
> instructions it believes the target lacks; it is a gas-only option and
> clang's integrated assembler does not emulate instructions, so it is not
> needed there.
> 
> The second fixes two uses of local register-asm variables that clang does
> not honor.  clang treats `register unsigned long x __asm__("$N")` as the
> named register only where the variable appears as an inline-asm operand,
> so reading one to get the live $gp or $sp yields an undefined value.
> trap_init() passed that to PAL_wrkgp and load_PCB() stored it into the
> PCB for swpctx, either of which wedges an early boot.
> 
> Note that the alpha backend is not in upstream LLVM.  It lives in
> 
>   https://github.com/alphalinux-org/llvm-project
> 
> and is a work in progress, so the scripts/Makefile.clang entry has no
> effect with an upstream clang today.  I am sending this now because the
> second patch is a real bug in its own right -- the register-asm reads are
> only guaranteed to work by gcc's implementation, not by anything either
> compiler documents -- but I understand if the kbuild side would rather
> wait for the backend to land upstream.

Yeah, I am not sure how I feel taking the target triple part of the
first patch. On the one hand, I want it to be easy for you to test
against upstream Linux but on the other, I do not want people to read
this Makefile and assume that ARCH=alpha will work with an upstream
clang.

We could add a comment that the backend is currently out of tree but
that would go stale once it is actually upstream and it will be floating
around for forever. Maybe a better compromise is taking arch/alpha
changes now then landing the scripts/Makefile.clang change when you
actually start upstreaming the backend, as being able to use an upstream
version of clang should be relatively imminent at that point.

-- 
Cheers,
Nathan
