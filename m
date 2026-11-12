Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483770;
	b=sA6tssXkYJVignoWTKJcloVvdW+oUHFChIdoJ5ZnHNRVdERzoI53NDylqBYJx7Y7bt+t
	 Z3aBrV0lnLWDw8dsLSJVjHI4QlO4WBaJ+E7vSaBVmtGQKLb2N5CBohQ+yM/aEVKT13foi
	 3vZjdckML/iLC7NoYTi/ju3k/aJQ18kP0r14c5AakDfQtzYFAgt5JkwL4z9L97n4SytOs
	 S678sUmq+dLGDrBxozHzqr/EazYzW1V9zpf/LA3Tnd34n55Qp4Fh5UvLkIx6NT2edSCN5
	 Rq6HPiMWhX9GSdXkxdz3UP9DutMVvJGbdrIVJGBt/UV732WUKeWqgc/ptJSRBqkSc1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483770;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zb+yRJFS3wDdWPKfGpJ1nC16TXzIdVOWQJ5MHtEfaLQ=;
	b=2q/NK4SfOC6oN0fzX4AE9mGvuQBimPzDPDpHNQY810BNvQjnZ+X0KVgyPZkMttXI0QZY
	 adsGJahxfGOskp3TUkQjUfRImW07E2z8OEOPAeDtLNXwBVs+Uy05OdDA+UTc/J2OUULiu
	 S0yFhW+r2dDopwP9LNiq3N1jhqaa0H8lY8ZgIGaWRMPhuQ8w7vx0togGt8BsL/eAUzFHl
	 7OOYzGFYAlX5ORfKbs1N5nSffUkkjQeW4QEzoN+8+DoyI7cDKBPVYG+zF5o1tzPuUr6vm
	 hknTm5tEgBj1hxJBeCWAQDwUlmME2Hlyraf2eOd9G1FlspkT9NRfIUIfTfrViukMi3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=etVNP8yw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 785DE606A339;
	Thu, 12 Nov 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=etVNP8yw
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D00511F00A05;
	Thu, 12 Nov 2026 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483770;
	bh=zb+yRJFS3wDdWPKfGpJ1nC16TXzIdVOWQJ5MHtEfaLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=etVNP8yw3uvm5/D4tGhAAD+c0gqGbyxvCNr6yjwUP5sCtcEr8SHkLeYx+78SUrE9s
	 a/R5E1YhqPsXzaGTShf81F7OliXj6W7HPy4liEBO0IQZ3rp+2ofIEPd9lIfx08wS8g
	 S7cNzgSapQVcqa4HPZQBRyYzOB0XX4/6aQOfxg4JWvU8OKEeKj6Oe1wbYQY4AZTDvJ
	 sqfOKnaam2v4yGllwZANmYftT787+R3M8JWr2yMUHZE0D2llOtRC6bwffd7oTqXQrD
	 Og/IVCHFq3zOMK7XVNChmrmekoFDzM2jeWxnV/kWAe2TnEucnJrxOD0TQmfypAfR4t
	 w10Q7yXeB3FiQ==
Date: Thu, 12 Nov 2026 12:26:32 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/6] riscv: checksum: Fix CC_HAS_ASM_GOTO_TIED_OUTPUT
 check
Message-ID: <avWiaIuhkYw_xE5A@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
 <20261111-kconfig-toolchain-updates-v2-4-b2d9415c1757@kernel.org>
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
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-4-b2d9415c1757@kernel.org>

On Wed, Nov 11, 2026 at 05:52:06PM -0700, Nathan Chancellor wrote:
> The defined symbol is CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT, not
> CC_HAS_ASM_GOTO_TIED_OUTPUT.
> 
> Fixes: 4525462dd0db ("riscv: lib: Check if output in asm goto supported")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/lib/csum.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Thanks for catching!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

Since 4525462dd0db (v6.7) still supported clang-11: shall we add 'Cc: stable'?

-- 
Nicolas
