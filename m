Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456590;
	b=LqJ76gxA2euw/d3xtB+iUyTbADYZxahbvrRBTQbYgiN58oM1FeyZw7RMfdI8Bic/O6io
	 aH23W2k8d6qrnLu8pvFcq4JcN5mpC6UyaYfrw8FoSRnUWTZsh8flVao1gf0HtF8Aee6g9
	 vOZ7fp/CIoWs5zS4cb+7WCIly5JTFrxU46cFh0fghhMiSfSdU5vcabhm+ac9+dBbS3RHH
	 zmXynHBn3tISdFZQpS1iBFe8i5X/zfgE/Yj7SW17SjQzb8UpVyE4TKKrYHQsO/HAafof9
	 XHNQsuDNiq2pRcpkqDMacpcl7rKMFXqwPbMRzsCyg7FclUxn7bcyd20tx60bVaEdDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456590;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LVJD6ILIWjWDMmM9kd8EyH4EMSnSkGOndkVL/qUJ8Zc=;
	b=NQ6+2ZCm+ZpfpjQcn5ZJUiVbj2aurgpPUZhF9hg8JOK84U5ORxVdMptvaUAfUAnztHqs
	 R/Ivf0u+cmLqpm7bmMZXZPYvv5CzRYB0tsn8taj3ZZEfGrLzXvzFSg6c4YUEqvpRpONMc
	 YAH/PCUTL9nZHvQanm/LKVjKU5IOdiOmH7jTG8wygLTYiq1faAOEY1qzJhc0ZXkvFFbWF
	 z5ltE482oksaDw86fExGFvLB/+3/6e60uxRwOyIBlgBfDKR5vUZcIcRZmxPjc/iuUw6Oz
	 R7I5YHX9sZNCkUNFlNSTD6+fbGzchci49NnL8JCb0XWNDXRbJ8t9PEUQKsDfiMtDIKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=atHKnvTd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B1606A325
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 00:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=atHKnvTd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15D11F000C7;
	Tue, 20 Oct 2026 00:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792456589;
	bh=LVJD6ILIWjWDMmM9kd8EyH4EMSnSkGOndkVL/qUJ8Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=atHKnvTdt5jP+22/I1Z7uipot1N6lAOdtJuKTVvxFgAhRZ+xSfAOeazOmvGGyqF01
	 zIhAWHFhySzf7sSndw8hddYQ3FByX0p4IQI3gog0xHtL+dSxbnM0YNs2Grp40ZvqSz
	 3EUcGJ62TFmn+bPAKe+IKDf6d2zUu4Fv2XwixCjBv1+2EBGH2rFpmWli0wXqct5JWe
	 AaWTpftrSaQGpyzyLbr2K53FgPeYzW4P0PxuXWXEubObzJi+KzppFy2hJnnsgvsBQd
	 8SU4brqFCLT+VuQungf0LrdF6q+XHncsajdDBLkhxLSW89MgXAvfVN2tp5wAu3p4Qs
	 +oJnyaImqE0xQ==
Date: Mon, 19 Oct 2026 17:36:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Cao Jin <pino.cao2022@gmail.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] kbuild: improve sanity check for ARCH variable on x86
Message-ID: <20261020003625.GA787785@ax162>
References: <20261020001738.2607318-1-pino.cao2022@gmail.com>
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
In-Reply-To: <20261020001738.2607318-1-pino.cao2022@gmail.com>

On Mon, Oct 19, 2026 at 05:17:38PM -0700, Cao Jin wrote:
> When building for x86, ARCH=i{4,5,6}86 and x86_32 will fail the build.

Thanks for the patch. Where is it documented that these other options
are valid? It seems like this is just expected behavior because these
are not valid values for setting ARCH for x86. At the very least, I
think something like this needs to be acked by the x86 folks.

> Make it catch all name variants.

You are missing a sign off.

> ---
>  Makefile | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 7c855e6fe544..cd397027891a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -409,12 +409,10 @@ ARCH		?= $(SUBARCH)
>  UTS_MACHINE 	:= $(ARCH)
>  SRCARCH 	:= $(ARCH)
>  
> -# Additional ARCH settings for x86
> -ifeq ($(ARCH),i386)
> -        SRCARCH := x86
> -endif
> -ifeq ($(ARCH),x86_64)
> -        SRCARCH := x86
> +# Additional sanity check for cmdline ARCH settings for x86. This catch
> +# more name variants than "i386" and "x86_64".
> +ifneq ($(findstring 86,$(ARCH)),)
> +    SRCARCH := x86
>  endif
>  
>  # Additional ARCH settings for sparc
> -- 
> 2.55.0
> 

-- 
Cheers,
Nathan
