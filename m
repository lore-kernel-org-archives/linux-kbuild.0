Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A3A40B383;
	Sun, 13 Sep 2026 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339157; cv=none; b=PKWR1x4xv8A+SLdTmyPe6CwzWgEQByGsUFiOWW8I/q45MMUdbcN9vrE2K28SEGguldDmOjr4JgvAMxsVPBQo4LLG3StYM81x8bujhLmEInjlBPvwy1WKLsAxsg3pvE+CH5CIu36XCHFzbaFls1/icY55KCig7PeNtpIbOItH81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339157; c=relaxed/simple;
	bh=g5riumJB4Wux4Ybw9OiYa/U1V11OZoyeIORlkXZ5wEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3WKYGFKfvRVuprkiWnUXibzb6DnnH4ad6BNnOXaIYJmm1FVZe124QiIe/w3u/ptBQs1vFjkJgNzAOE26RMM8HiGLEwkczJFPD4VL/BIssFgj0O4oVImu2ukAU2aAeJ4RGNrS2HTJnsyoRdxgosIiU2YTvQoXnqJ+clzBV1FFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BY6H3GVm; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BY6H3GVm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=DhnW1DlVRln9P0zFNVT06Rze6k2I+nYXFtdhKqbbmzU=; b=BY6H3GVmDQVGReAN9iAB66a+SM
	/dNB8mPzB10DlGf+Tbm3UJ5cojJKZYCSm/uXVt5YfAPnOocYqpQP4KuStsfNHmptMoHOwSMdxa54C
	RFoxLuy/xP3XLbGAzRRfCwCdsjuSsZz/X2OcedyG/fJsESQhLRnvMwjQonmM1bPnpVtMKE25JVOq9
	pXqskR0IJUcASBvAmczYmu+njHKZrWTPkH3md9LWsMxTPnGze0uWipNx4ve1ht7XL9WTQFN7jOlaJ
	E0N0k8kr94xY6Wri1bx/YEFRuBkSqlJWbvO8xLzO0ay7IBgVMRIwGAHwg47qesiVwIQQne7caZp67
	rpwp4yow==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5sqm-000000025EP-3rcz;
	Sun, 13 Sep 2026 22:39:04 +0000
Message-ID: <a812debb-e5d8-4f9b-abcc-a9414983402a@infradead.org>
Date: Sun, 13 Sep 2026 15:39:02 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: fix spurious error from find when generating
 asm-headers
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org
References: <6e2a2c0cb5d7885ae0dc146025d21c23904d7b70.1789330068.git.hns@goldelico.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6e2a2c0cb5d7885ae0dc146025d21c23904d7b70.1789330068.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/13/26 1:07 PM, H. Nikolaus Schaller wrote:
> The *.h pattern should be quoted or we may see errors like
> 
>   find: paths must precede expression: elf.h
>   Usage: find [-H] [-L] [-P] [-Olevel] [-D help|tree|search|stat|rates|opt|exec] [path...] [expression]
> 
> if the working directory contains some *.h files.
> 
> This was found in a cross-compilation environment.
> 
> Fixes: 2d69b891e6461 ("kbuild: Support generated asm-headers in subdirectories")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  scripts/Makefile.asm-headers | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
> index b38931314ad7c..9db8ab0145a44 100644
> --- a/scripts/Makefile.asm-headers
> +++ b/scripts/Makefile.asm-headers
> @@ -48,7 +48,7 @@ syscall-y   := $(addprefix $(obj)/, $(syscall-y))
>  generated-y := $(addprefix $(obj)/, $(generated-y))
>  
>  # Remove stale wrappers when the corresponding files are removed from generic-y
> -old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
> +old-headers := $(shell test -d $(obj) && find $(obj) -name '*.h')
>  unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
>  
>  filechk_wrap = echo "\#include <asm-generic/$*.h>"

Same as this other patch from 13 hours earlier:

https://lore.kernel.org/linux-kbuild/f54cae8e7da612ad558154706ce2e99f98d136c4.1789282037.git.tanggeliang@kylinos.cn/T/#u

-- 
~Randy

