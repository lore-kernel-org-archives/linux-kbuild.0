Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533248;
	b=cW6p2qhfA44SUkUtwmxqFeHdLvHavFtKvgBYH/X/KQEyoCdbWeqHyYBe1ShQnqTFm5oY
	 ks4oMfaF0xD3Qw9kmlHoztb+cy/g+x+1yfd8uVNwi6SUIR4l/swnp4vJjLXymqo7xE7LZ
	 f+6L9umPUOWTsudTVewsxi9d7w3bw55hGYDgOb80D/2gsg2kbw616XY4j/25fD3KriOVy
	 EWC4rJzKvUKndnnqydxHQtsQZBNUT3t92hkixbWLiCNlDqCoBtpGmNycgGM58+H082CfM
	 toqHTc+le7geSH6iMuTSg0iHW614oJ6L1A6x+6/t91J/7EHcUDYb5u6JmF+MbQknauw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533248;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=k4KgVOGYeUb15cZGuPuqEbUxLk/aEfGa3iScrYjDnxk=;
	b=vDJB/eMZ3NDF8BHtwDK1EdGX0llPmfwFWNBHVDXVpsk0peS5Vp5c24gOLCChLm576EH/
	 eFfwqPNppsEf9T1XICosN+xuOFHlGpY6AsBlckXEEpt0jxMEdBvXpcXZ4lZU5lJxnPbbr
	 DFlbnyc6h/oKdnzyrYWmY2aQMTiLbdLdY2qJSuGP88qT7z8TDNvwtssE9DVZ+pwjVkZxL
	 n3niq9fJv0aPOkyWINYwVhcR4psWT8U9aKe/7flkk0U0XNWHrNlbf55QPBz+ITxSzvudb
	 63bsku/A/MiEnnGO0GD+6wsVu3FK4MLDBBPaT5ZG+NR+Koq5y6Ex4axGOh9i+gXxx3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a6DALVU+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4B2606A319;
	Tue, 20 Oct 2026 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a6DALVU+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292221F000C9;
	Tue, 20 Oct 2026 21:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792533247;
	bh=k4KgVOGYeUb15cZGuPuqEbUxLk/aEfGa3iScrYjDnxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a6DALVU+jJUGusplV0Zg4VBRJSU/pu/FyTPFZakA1DBmRJ8k1iQJm5KPLCD4g9y70
	 nLUgRBQv5hbe98K64EyoqCTzoEL5/XOMnOGBoDtAbz1QP8NdEmiQrebyErlGuWYtIj
	 auCN0OFSHM+MBTOU51OuAwRqBEqgWpgNxYweLV9lNRo2mL4gqmcynwbbSy1PWj6k9L
	 RXrd+4nicvmnhfgt8B0wVdutzErV+mT/o031t36YQ+F9V/LyvaHgF4vhWWREJQb4BP
	 G8rQA3GwO8BJbYcsrTRQvobRZuYKRRcMW9W4BBpiy53P22RAhXeVhOAyumQOrw0XTb
	 zbXhDrXZu6Sag==
Date: Tue, 20 Oct 2026 14:54:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: pass -fno-pic when probing for -mfentry
Message-ID: <20261020215403.GA2506074@ax162>
References: <20261020-pie-v1-1-9be09f2324b1@chromium.org>
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
In-Reply-To: <20261020-pie-v1-1-9be09f2324b1@chromium.org>

Hi Ricardo,

On Tue, Oct 20, 2026 at 06:10:52AM +0000, Ricardo Ribalda wrote:
> Some distros (namely Debian) configure their 32-bit toolchain with
> --enable-default-pie.
> 
> To properly probe for -mfentry on them we need to pass -fno-pic,
> otherwise allmodconfig will fail with:
> 
> ./arch/x86/include/asm/ftrace.h:9:3: error: #error Compiler does not support fentry?
> 
> Fixes: 454e00cf8ee5 ("kbuild: avoid re-running compiler and linker probes")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> I found this while testing next with media-ci.
> 
> Full logs:
> https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/113299249#L4729

Thanks a lot for the patch/report. I noticed another problem with this
check and the fix is quite ugly, so I think I would rather just back out
of this move altogether, along with documenting these pitfalls for
future travelers:

  https://lore.kernel.org/20261020-kconfig-fix-mfentry-check-v1-0-428258bc0fc0@kernel.org/

> ---
>  scripts/Kconfig.toolchain | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index b0b9a663ddbe..53b361cf365a 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -170,8 +170,10 @@ config CC_HAS_MNOP_MCOUNT
>  	def_bool $(cc-option,-mnop-mcount)
>  
>  # s390-linux-gnu-gcc did not support -mfentry until gcc-9.
> +# 32-bit x86 gcc does not support -mfentry in combination with -fpic, which will
> +# be enabled by default when gcc is configured with --enable-default-pie.
>  config CC_HAS_MFENTRY
> -	def_bool $(cc-option,-mfentry)
> +	def_bool $(cc-option,-fno-pic -mfentry)
>  
>  config LD_OPT_FORCE_GROUP_ALLOCATION
>  	def_string "$(ld-option-str,--force-group-allocation)"
> 
> ---
> base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
> change-id: 20261020-pie-6774df20b0fa
> 
> Best regards,
> -- 
> Ricardo Ribalda <ribalda@chromium.org>
> 

-- 
Cheers,
Nathan
