Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2493EF0CD;
	Wed, 25 Feb 2026 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048648; cv=none; b=XIYBFx8+nCjlEYtMzemmuwzKTr3fsRCVqmYEPpxOvTaMFgf+ICkCSs+6CBGQuIuCn5apUsBfL+3SQ3b0N0bIxhA0TTYYH9sQenzTwnxbLHiHJLclzmT1U1TNdJVooUFAPg+GBjoHYcvl8iCMi0DFTssNMDN8/usUuq6UBFVnM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048648; c=relaxed/simple;
	bh=YbjdPdPASyw/TkhJHb+Ft95l6T6T0wW83iVMryxo3qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8KqYSQF+rZZun1FFWljg9lTwsBZveo3qBV87ILnjsBp35CAR/FrEPvnN7snsJ6+CkyFfhyhjw5aSV52s+B0jucjulAh71ooT2q9lIOSUolbVsCOf7iPT9vGPOnn/G9ivPmfI1ilE8o/qmYsZFcElzAAFOJK0p04CycIvRWZ914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2a0jStC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2a0jStC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D9CC19422;
	Wed, 25 Feb 2026 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772048648;
	bh=YbjdPdPASyw/TkhJHb+Ft95l6T6T0wW83iVMryxo3qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2a0jStCfO6SEdegk9uhRnVBtRzQ+eTAT5EpdDHFchB0rC9hdt9qzcPZNAN3OSsb5
	 kWfy+U0tAo4HidZ7X6gD0GeSaV0wrYBM9B5Kt2rKOYc6RnXaOnpgsnWSXZ/68fikwr
	 cNJ2MTwtMuIJXCIAd2LSKjJRcRpIyIzbuW9zxz2fxTXFFxSzV6EWbw1wcNwrm2ocW9
	 cpNbVaHnJm7jchLNR2ZIYahzE8T3QbmsO6AVoBMmOz1vY2IS8n2n6AWKjyvsr30fUj
	 4qcUDyEhuaptbfcEvs8e8rp/K7h26YgTINFEL5M8NgXP2wq0x7ptMwRpDTpecnqxeD
	 zgGrLLmTPhCNg==
Date: Wed, 25 Feb 2026 12:44:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: nsc@kernel.org, rdunlap@infradead.org, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: fix potential NULL pointer dereference in
 conf_askvalue
Message-ID: <20260225194404.GD2755225@ax162>
References: <20260225072246.3475275-1-micro6947@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225072246.3475275-1-micro6947@gmail.com>

On Wed, Feb 25, 2026 at 07:22:46AM +0000, Xingjing Deng wrote:
> In conf_askvalue(), the 'def' argument (retrieved via sym_get_string_value)
> can be NULL. When the symbol is not changeable, the code calls
> printf("%s\n", def), which leads to a segmentation fault on certain
> systems/libc implementations when passing a NULL pointer to %s.

How do you reproduce this segmentation fault? Surely someone would have
hit this if it were a real problem given the Fixes tag? Or is this a
corner case?

> This patch adds a check to ensure 'def' is not NULL before printing.
> Additionally, it removes the redundant re-initialization of the 'line'
> buffer inside the !sym_is_changeable(sym) block, as it is already
> initialized at the beginning of the function.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Xingjing Deng <micro6947@gmail.com>
> ---
>  scripts/kconfig/conf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index a7b44cd8a..2771bc84e 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -297,9 +297,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
>  	line[1] = 0;
>  
>  	if (!sym_is_changeable(sym)) {
> -		printf("%s\n", def);
> -		line[0] = '\n';
> -		line[1] = 0;
> +		printf("%s\n", def ? def : "");
>  		return 0;
>  	}
>  
> @@ -307,7 +305,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
>  	case oldconfig:
>  	case syncconfig:
>  		if (sym_has_value(sym)) {
> -			printf("%s\n", def);
> +			printf("%s\n", def ? def : "");
>  			return 0;
>  		}
>  		/* fall through */
> -- 
> 2.25.1
> 
