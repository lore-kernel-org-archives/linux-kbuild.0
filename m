Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503831;
	b=b9KaJ8Q5uXO8Q8nD2KicHDdOBp9Md+p+wijElMvkUPETChAuXBGyKbsmoDSSS0YE91FW
	 1KKHE3JjPsEb5LA4IoC/9YfyT4kmUPPOQifeawfhR4sRNQ4fC8E+nJv0w6C1MbxFwDOyL
	 jf6poF8tdCrJheTeBPgKGj+KF7MZsydJpKqv0aK3LKJkbANyrxKcAO9ZoSoESwbTvLHIj
	 42juBLa7J+T4OkyiDMMwEdyiheyUyMRNCJlm1O3kQ1ozPMcqc5ihLUT5UDOgOzwoQGUSx
	 4yJtlGsJvIxhhEejX8vqMbU2RRTl9CggDca/TXRVFWFZkFbdKO1FahWss0Bd1CTmgEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503831;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mAJUvoio1U7jK053NhvlJPhpip0OAdIw2S527UpVNZE=;
	b=rICR/pwhWDfxAOBFw+W+sUnpJvbD3Rj13ZU65A3kye1EVjU1TbWQMUFbz9xSkP5qntOc
	 evpdMGJD6rYtbjiohEzbDmyVG5akoCj5+oL+BwJIJagQwuVdo0aKerOdA7bXRcmJ27WXm
	 jN9mVHpQJAJXyfMFMi6uzk6rGOI4ouMljTH2syZPCV9YX8VCwpQ/mK2ZRzn507PRFv7nr
	 4f6jh9fDuZDKUEfCWSD4nwlb+H5qEVV46IrDeHGRoD8hP8fVS9JBx5fwo4NhOmlK8ch6H
	 YYpvBkQscxOaUUpwfP9N6xc9Ccs92VLZR4vPMKCz1a9GowGdxgYpObez3ywVV7IEDPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKBVP7Sl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D64606A31C;
	Thu, 12 Nov 2026 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKBVP7Sl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320151F000C4;
	Thu, 12 Nov 2026 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503830;
	bh=mAJUvoio1U7jK053NhvlJPhpip0OAdIw2S527UpVNZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XKBVP7SlQRcCvTXtPF4C1mkZ7YToPoGYAVI0GHtY3ItnGHRb7s5FJ2PjPtYt2OymX
	 +wm6u4C+2gYigX0aLzWnFH4elWdJrzUYRHsMQQsoKrJng19TUCGpTGeMXtLJF7YVRC
	 nGhrwff469RFHLKNaMQAVuYqFGo3BAtjdqcXR/kr0eu+hW9pglpwnL2lVvsSG+iE5j
	 k7PWnkQ100nvqMCODy9HjbhqnD7HFk6u9y7H3W6epi/6lsoTdip/KngotcGkGL+YnT
	 b+m/NHwDM9swC0mFFbjJMQv3pFd6jX7y+6R8tumXkj01ivw1/hNVmvIxrSz5UgVBck
	 FRfPmghgQMqvw==
Date: Thu, 12 Nov 2026 10:17:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nsc@kernel.org, andi@firstfloor.org, ljs@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: cleanup Kconfig entry
Message-ID: <20261112171706.GA4107043@ax162>
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

Acked-by: Nathan Chancellor <nathan@kernel.org>

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
Cheers,
Nathan
