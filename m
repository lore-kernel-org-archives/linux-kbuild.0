Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74A3E5A38;
	Tue,  4 Aug 2026 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868247; cv=none; b=NPDtxAL6PZ7Nu8SqIcysibtDf4sBoz4bsRHRF7B8F35APHW4H5/P2iaV6vNcd8pxtlerjoU6c/JRt0FC9SgQqPUCV8R3xLkbYJ5daHKVFnbz25lRVuCiVicMGlp1wX0lvMXIKFrkBA32D8N2Xq3DDJehGHL+GLUFfM7Q9tXjuu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868247; c=relaxed/simple;
	bh=RaZhF9xrvSbqL1xpVdpqP7VGUjhQRdvrxhEQjjJH5PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBI10z/Sa3To8CPAXQLURV5NKT0+Thxheh2lwI67XHoiCsrtKawSnQsWz/vpRppTHvQoRDi2YU8IlEn9skoHpcISInUzPgYCr/DzcnH2VkduKJcLdhzrXyIwkuyVVVYmt+CZYQk2bb3jH4/amb9dT3D0tO93HVNOsZrEY4TlrCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ckd8T7bE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ckd8T7bE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEC51F000E9;
	Tue,  4 Aug 2026 18:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785868246;
	bh=soiJPE91vuB6fYDToj6IclXGS7/Cy9sFu8bFH3T8pAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ckd8T7bE7kfYPV1zePODf0dSDtH64y04IgECjp8K2veeH8nXZA0juHJPQzRp/rk2R
	 tlRtyJ+EbhxmclGUTntLp+c7rUAcR+aat+5jK9KVodKh3hFCCOZgLpDgWZHPr84y2K
	 VUPJvuzrOnB689voZTGpRf2q1tN1ZoX3/O2QXj3fIFRitSAFl5/fFHHTLAslzbUuPb
	 DLNNzaAiyMLdnR0QNobsPYW6wjd8i+TK3YSrs4N3Six49H4/hUx17HvuhhJNxb+0qV
	 4pZ2WxpNpvdBCyqUzKZlTGhE5WRlGJNymuFFSiyHsGO3ft5VhhbHMj+U2mvBeYsuTs
	 1XDZ/DRLbd7+g==
Date: Tue, 4 Aug 2026 11:30:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Julian Braha as Kconfig reviewer
Message-ID: <20260804183042.GA300797@ax162>
References: <20260804141436.1451211-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804141436.1451211-1-julianbraha@gmail.com>

On Tue, Aug 04, 2026 at 03:14:36PM +0100, Julian Braha wrote:
> Add myself as Kconfig reviewer, as privately discussed with the Kconfig
> maintainers.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Yes please :) thanks a lot for stepping up!

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 03febbc91a06..e248136bf3dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14029,6 +14029,7 @@ F:	scripts/Makefile.kasan
>  KCONFIG
>  M:	Nathan Chancellor <nathan@kernel.org>
>  M:	Nicolas Schier <nsc@kernel.org>
> +R:	Julian Braha <julianbraha@gmail.com>
>  L:	linux-kbuild@vger.kernel.org
>  S:	Odd Fixes
>  Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
> -- 
> 2.55.0
> 

-- 
Cheers,
Nathan
