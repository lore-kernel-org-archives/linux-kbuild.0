Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4F13B5837
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2026 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370721; cv=none; b=EsKAWVcJYHTLytYKOmDYMlvPPTKCMCVQKojUoY7SOolIIZVFXXa40FyDx7cDfUODUCd6yU6ZEmeE/LNXrzKHvFMlK3Go+nyMxNJmeU6aHrphngX6fSEZMUPQU1RDCe4ca6jDyZ9+8GLT5iEggWm5LGQr33AoyhrPbOTrRxKkE34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370721; c=relaxed/simple;
	bh=hQhuAtzzd6krGuHPL0+1KvR3I6u+A62ymE2Zapij1B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeC1oF/EAjqdFyDWnvSCvrr0DyrDW19frNs7NNdtT6BXtsI3SadVAEL0nhumONDOiO26zQNTlDEPzTueDmEY03HoRK29o0qN+m4Y1SKgLLBbWPFLJL6K4J2elwFQ8MalAqT5ufMnFjP1XBnBMCYiXfO8ninnt3hR0Vyuc+gltGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+wmCftq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+wmCftq"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 87CB11F000FF;
	Mon, 14 Sep 2026 07:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789370720;
	bh=pYFJCK+AEjrBuHlLFzxfzSRBSOVcJ0xvvtw9lZ2uqB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+wmCftqzg+r5/YferPvVsprn94ZQPhQulX+6Nn7HWL2DT5Wubju47J4bw9EPTk1+
	 Buyo2M4ggH7952aNBOab/rHkpi8wP7Z0X9Wr8xE/eiDGUGMIOYSkF1xJYtf8OvuynZ
	 BFsPIRGd92cLqclOVYY38I0Fjj6ddx3RpNCD26AeiGRSOeTB3IAgN1Jf6mGBmwITOq
	 tLYcChZOJH7E4QgCZFZO52OATcHZOM4egJWMnKj/WNwHKpOaifrEiLxMexg1TEAyWq
	 qypyaJ0QkNrFl5z1A4UsHddzYBJYjuJSHZC/+tVz4f0FjcEERa3NQPks8GgwWZLkdf
	 8t2LiSCXYONJA==
Date: Mon, 14 Sep 2026 09:08:07 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Geliang Tang <geliang@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Geliang Tang <tanggeliang@kylinos.cn>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: quote glob pattern in find command for
 asm-headers
Message-ID: <aqedV_5DtnT1sRAN@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Geliang Tang <tanggeliang@kylinos.cn>, linux-kbuild@vger.kernel.org
References: <f54cae8e7da612ad558154706ce2e99f98d136c4.1789282037.git.tanggeliang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f54cae8e7da612ad558154706ce2e99f98d136c4.1789282037.git.tanggeliang@kylinos.cn>

On Sun, Sep 13, 2026 at 02:49:14PM +0800, Geliang Tang wrote:
> From: Geliang Tang <tanggeliang@kylinos.cn>
> 
> The find command in Makefile.asm-headers uses an unquoted *.h glob
> pattern inside $(shell ...):
> 
>   old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
> 
> Since $(shell ...) runs in the build output directory, the shell
> expands *.h against the current directory before passing arguments
> to find. When the output directory contains .h files (e.g. stale
> BPF skeleton headers), this produces:
> 
>   find: paths must precede expression: `xxx.skel.h'
>   find: possible unquoted pattern after predicate `-name'?
> 
> Quote the glob pattern as '*.h' so that it is passed literally to
> find, which will then expand it internally against $(obj).
> 
> Fixes: 2d69b891e646 ("kbuild: Support generated asm-headers in subdirectories")
> Signed-off-by: Geliang Tang <tanggeliang@kylinos.cn>
> ---
>  scripts/Makefile.asm-headers | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
> index b38931314ad7..9db8ab0145a4 100644
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
> -- 
> 2.53.0
> 

Thanks.  This is fixed by [1], released in v7.3-rc3 a few hours after
your mail.

Kind regards,
Nicolas

[1]: https://git.kernel.org/kbuild/c/06bb43d8c79762fa3452f292cd080e54bef5d431

-- 
Nicolas
