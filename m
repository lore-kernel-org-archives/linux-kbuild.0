Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502745;
	b=0WCUMrwVAEWQ8uqTPZDylRJ9v8iekWTdvMszQ69wyoYt2HhVbeiyqPz++mplWTyuRRov
	 cwo2Aa83SZ6gegT1P+Cd+Ayz5N+kn5bHK6iwhR+skZeCsUt2kO07Q3ar7eeRT7JxkegDi
	 w/YZ5ElgdFsJMIZylTyY3/yh6yJ3X0bn8h9w3ckr878O3ZAFSb7FM718Q8FRZaF86vSJx
	 vM2MjZifiuADjSIvTarG3HfFtznq87vvWoo5n2wFAilE2F0l9TvwL2eQkspMvPIS1ZXa5
	 +aBTxS7A7s0jvIXWu929B4KpkufkDmI950MSj2c+veumX9czalfioobij36Yc2i+UgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502745;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AyPB82y233JdwNd2jUiTP8ztSlPSQBSeIIlPfGIuuds=;
	b=39JH9vDJr+bCvqN2/tvwwwDETd06/Xmfgt5hoHQ7Wbo8wXhyptk1ipBTJPfvR1SrN+gE
	 fAW0JI3otmiT5WTYVmqOVxmVU4jceXVhJqRW/N9NxoAqk1P+/4AvryrQzRI5+1b1UKe6Y
	 eFpK/F45Ib41ZKwJxg5xUZv8X8X4hPs9h3BR0+NjZa2+hGlHemE0F5uv6g8hG59YVfOLH
	 3ABUVXwPVZgr23+BgrpkluS3NYU3+4Gop2zYyoolllqBvr/9/JEBGTH9C2uEnItlCOyTD
	 F2074/kGQINOQXyzGVkqdGAXOS51aK7iZosRnEWsppyGfj0LTkTs9lgLgKBWKfqXBHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7Q2jTal;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88845606A321;
	Thu, 12 Nov 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7Q2jTal
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F1A1F000C4;
	Thu, 12 Nov 2026 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794502745;
	bh=AyPB82y233JdwNd2jUiTP8ztSlPSQBSeIIlPfGIuuds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W7Q2jTal8uw6i0wMJyj6eGMgTiCwHTwUmiPbj8MKVFZHoAY+3ib42iqYa2FRNQi9D
	 ppS7gnG6hqzlmtWGnJJxwBZ4wAvccL2WFjQWRiNYZzUtS18Lci6niZEXPo6zvhzJ1F
	 aVbOh22LaYVtHnc5h0Gh/qTGP4Eey+uOPQ/cjmwxEjm0pqLE1BY1dMa44IGHLpvVfh
	 ibeyvSQw0+N0fCBrl+QxEYymrSlbMYP5+jRTNNBTqa1BllUaCfEDiRrKZEuYpYXoGA
	 MZUIYvc6FuIaxlfvlYqUr+ZPJ8ekwNdk73txmC4auKmU0V8zf7cTpOHmYPTslx3eqY
	 E00yWQ2h/I3Qg==
Date: Thu, 12 Nov 2026 16:59:00 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, andi@firstfloor.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: cleanup Kconfig entry
Message-ID: <avXwDD3oJBHMH3GL@pazuzu>
References: <20261112164826.110736-1-julianbraha@gmail.com>
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
In-Reply-To: <20261112164826.110736-1-julianbraha@gmail.com>

On Thu, Nov 12, 2026 at 04:48:26PM +0000, Julian Braha wrote:
> 'scripts/config' provides a CLI for kernel configuration, but currently is
> not included in any MAINTAINERS entry, despite the commit that created it
> using the 'kconfig:' subject:
> commit 8e54701ea85b ("kconfig: add script to manipulate .config files on the command line")
> so let's add it to the Kconfig entry.
>
> Additionally, 'scripts/Kconfig.toolchain' is used for checking various
> aspects of the active build toolchain from the host environment. It's
> merely written in Kconfig, and is not really part of Kconfig's
> implementation. Let's move it into the Kbuild entry.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Looks sensible to me so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..245bbfed8122 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14374,8 +14374,8 @@ S:	Odd Fixes
>  Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
>  F:	Documentation/kbuild/kconfig*
> +F:	scripts/config
>  F:	scripts/Kconfig.include
> -F:	scripts/Kconfig.toolchain
>  F:	scripts/kconfig/
>
>  KCORE
> @@ -14451,6 +14451,7 @@ F:	Documentation/kbuild/
>  F:	Makefile
>  F:	scripts/*vmlinux*
>  F:	scripts/Kbuild*
> +F:	scripts/Kconfig.toolchain
>  F:	scripts/Makefile*
>  F:	scripts/bash-completion/
>  F:	scripts/basic/
> --
> 2.56.0
>

--
Cheers, Lorenzo
