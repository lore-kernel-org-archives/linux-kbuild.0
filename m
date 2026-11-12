Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504233;
	b=gyzMywVri2wifkopEj1nmSOyrLwJ5ssAKggArEzU49UlBYH4q+Wt1PFMWBAQgiBUeQHa
	 AmWirYcjFnmkewAzIQtQEnDVCpZDKMmzlycWxJlrRPz/jQkrpJ1ZkgrGqYCXHbm56drMD
	 8Ih/sRURbgoHuXBE01evu19rwuQ5qmr7bOHPkFTkU5LdU7bppSNFSKLDzjPAgRuktSpza
	 yDHNjkVTnlc0i42iSfB5t6UN0prhor7rgyqbQbkKlpxIVEQE+biVf/hpMb/v45EvaJz66
	 LLK1E/Et+b4pb75YYqzGetD5i4oGpWOSw1SBN1WZP3BVPTcd0Esgu8Pxe13vRjqoaxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504233;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3ep9CV6sxuplDNbp22mb70cl9bsGXw6tP5do2vjSGbg=;
	b=tFaT0UlTfSmj1xwi43HxdYSWgKznK0073ma3W+21bBtzQurs02FMbd+6fnPX2j5zEAYR
	 4fa9kh7ndjipyh+WbrIyo4JVePP7sC4iGKRbY0u4ZiTobmVdBOgJx9Rozky669taytCyw
	 XemNNcxG431qx9gSdTgoARnSbxrSrRFjuewfiC3vJMME7gIuqObQqTEHjymzQnoAh94BO
	 o0S1O6CNAowMhTmomW6ZzZy+ritBpOTjib1SboF088XOcEubPjLSDYhod1dOZi9G9KwH+
	 O6dpxgQ2UcdEI6Zbk3pwqbsHdCzq8jqMgUe1IHEHExhYEkV5UFfX3U30HLfdYirnhmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccCZq2ML;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C7606A31C;
	Thu, 12 Nov 2026 17:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccCZq2ML
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CB81F000C4;
	Thu, 12 Nov 2026 17:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504233;
	bh=3ep9CV6sxuplDNbp22mb70cl9bsGXw6tP5do2vjSGbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ccCZq2MLOwO0/d5CRDRGnEPZ8QCA/S1UnquuKlPrf6UajuZ68OSkqgLGNTdfZTYJ5
	 bkEDFhpNBXVb0+6kxN1DME8WUhlScqqh2vxXfeTiGUvhsJdAQKTeN2wGkO+eGXXPnG
	 WQus41ET9Mi2QaIe5btEFL6BFoJwJSpCDWs2sBiZTVS8eDzdQYZxxPgjrC1N/ghVFW
	 x7HPN02Qor5m3s6RkwJVaiTempIcpifVqgXdhb2GMuIUR+ROCRIzl3K8JH66i+lqLu
	 3WvCn5SZqUlAA5DyKT0AI6UnexiyFW8r+5CPKIv2ay0P09pwL3zJI2CPvw5vxzSz/6
	 LBZFSZuub977A==
Date: Thu, 12 Nov 2026 09:23:53 -0800
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/4] scripts/Kconfig.toolchain: Document minimum
 supported versions for dynamic checks
Message-ID: <202611120923.B31A56F1@keescook>
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
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
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>

On Tue, Nov 10, 2026 at 11:42:39PM -0600, Nathan Chancellor wrote:
> Nathan Chancellor (4):
>       scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
>       scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
>       scripts/Kconfig.toolchain: Clean up '-fno-allow-store-data-races' handling
>       scripts/Kconfig.toolchain: Document minimum supported versions for dynamic checks

Looks great! With the fixes you're already doing:

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
