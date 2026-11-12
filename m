Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504094;
	b=dl5jNKcSb2Tqm45HeRb/iE49cRSUuhDcTCOYrJclBYYH7tXO2myzsdUVvgPP7/CiYF2d
	 yUnXfEvaRgnk1hOUM/eUViwbhKINLYS30unFGFWmLWrbOsO+4aOIV2SUzAn3I4WgWjYj4
	 9hFYhCkUXg47HQCutYYCCoCm94VXkP5XGabbVSSaT3z71UonXtbYG1iR9+8HlBC3Vz1ht
	 vf82IyG+jp68A0lRT0Gx2skEPfrL5cxpKLGbYgn76Uf9z7voqtA23D0FvseGMl5E/ofLO
	 XJNAlYMW2zF3t4MsYgBCBrpKdheUcseEOW3KLaFV3qUf0omzAIz7skB6/LQCo7w+zZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504094;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tnvalXgW49Ysw5FO5d/oAkIaPivhfvhSp3vcrnFI3to=;
	b=Ue5KaWursFJZILyYvBoeK4pGhmlGNvIC1pGB1hJsS/VwM2ikLsm4JGXhqgrVycon+jds
	 cBGrwexSVh888D6a1VEetFaEZnsUjtfsjxanFLwZVEd0DjiFEQJyQbpU3tstXg0tZamXL
	 vZDeHY+4I5k7GUQEVhS7OryzAFl9IWRteMVpev82mxnrG8i9wAgVINns2cLuNl838CbGl
	 YQtf/cboh5rHnQnrDSWfbfqEiRmxCq06CaekOo0ND0+aPUX2bsR/BTqEtNoPE9VFBNlsb
	 aQeTlGN5ce03xnr3nwlqwowPeUnD8wzCi5iVCyLShTaoZKryIZMJQWe1YQ6/901+twA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hR5qYI+1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE139606A31C;
	Thu, 12 Nov 2026 17:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hR5qYI+1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF321F000C4;
	Thu, 12 Nov 2026 17:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504093;
	bh=tnvalXgW49Ysw5FO5d/oAkIaPivhfvhSp3vcrnFI3to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hR5qYI+1tNNfCdB4mT3Xavp6UXrwmkDoZbAkG7szDZoB5vbyW9uyPsHjmB6kK0GU3
	 yNaFi72wPr3rl+an6i9w2VRC0cG0dCD+b1uM5HiXNV2DYao/XI98Zh+YLxS4UNiRrC
	 nsVL1luqSVC/VitEr/1DmcKfX+eetD8koKYp3LHLqHrBIdyLSJbkDVTZajvDpTPCGl
	 d8tbhmM0lDTvjO2IqIhiMU4IYbfDh43IHYmN1LYKGrLNM0mYwq58LAtMqnUxbjx0KR
	 AlNJvPJQ2IjXoUZE13Ujs4H+q/jTAyzN9vqi/Mnz/6wkEr+xvHtMWP+kltt1cOjyOg
	 tdT1vTt+qfXqw==
Date: Thu, 12 Nov 2026 10:21:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
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
Message-ID: <20261112172128.GB4107043@ax162>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
 <20261111-kconfig-toolchain-updates-v2-4-b2d9415c1757@kernel.org>
 <avWiaIuhkYw_xE5A@levanger>
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
In-Reply-To: <avWiaIuhkYw_xE5A@levanger>

On Thu, Nov 12, 2026 at 12:26:32PM +0100, Nicolas Schier wrote:
> On Wed, Nov 11, 2026 at 05:52:06PM -0700, Nathan Chancellor wrote:
> > The defined symbol is CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT, not
> > CC_HAS_ASM_GOTO_TIED_OUTPUT.
> > 
> > Fixes: 4525462dd0db ("riscv: lib: Check if output in asm goto supported")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > Cc: Paul Walmsley <pjw@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: linux-riscv@lists.infradead.org
> > ---
> >  arch/riscv/lib/csum.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> 
> Thanks for catching!
> 
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> 
> Since 4525462dd0db (v6.7) still supported clang-11: shall we add 'Cc: stable'?

I was a little on the fence about the 'Cc: stable'. On the one hand, it
is definitely a bug and it would totally qualify for stable. On the
other hand, nobody has noticed for almost three years and it is
exercising a new code path. I'll leave that up to you when you apply it
(or the RISC-V people can give their input as well).

-- 
Cheers,
Nathan
