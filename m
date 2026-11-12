Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483768;
	b=ovav++dtpObxIdsARHKb4bA3Zwbic79hb+8+DRZX4Fvq9uTlKr0HnkBeltNC0wyfj6BA
	 JVQMTLOtH4TYDe+FHaoQKXdknkccFXO7yMW/lD/IaY+1OuZtDoQjGX2eKtV6sgfs1r77v
	 fUbYQv8YfLnQvy6/SNWjbm1v9jO65YBTmCq6+szEoQ1SRgcdlfxqqoR94lMAW/RkyQkA4
	 NLWAkmrR5E5T7cPmFyH2yARvKQaISmZAtlDMqM1Kwgs/lqkORzQmC1Hakj6baMt/bYagO
	 4sE1FcvUX5ft9aTldYvhYeci1KDGNXQIsgn6K0f5lMkJH8ge4gzQogxawUxOka3UUXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483768;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VZM7iKQomnGJinHzQGrExAsIYMOOt90EtNU3fUMFxpE=;
	b=lGtngFwoDInEZL7tqFXWnWBvvZNUn2GD1LrZALzbwM2A598eLIChMyTjKP4/kxPIijLr
	 auwuH4BSuqRB55ns2JADcrvbOqH9w+OpiDqtmlgQ2PMT5oj/ip919dWHRNwkVjK2BVM18
	 CVqDYTxColbyWlWZ85l5D8R2Zd3PU9Ztf9q+5oN9Mbs0W0cs7qmdIXBb0zbOSyxmBkBiW
	 6JA90+5qKaDeGRHBitKqhm+EFx3l9NJxSlXDdoOZPPy73snjgx1veWMAP3F4nP9Vps7dz
	 of1VjdPj2hGQ+jqDu3FZMlAKRtSNMGBjzDBsGDvvhozCUJruIeefwwj55+m4wzI7x2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OcthVQuz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4D7B9606A32A;
	Thu, 12 Nov 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OcthVQuz
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 67D521F00A05;
	Thu, 12 Nov 2026 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483767;
	bh=VZM7iKQomnGJinHzQGrExAsIYMOOt90EtNU3fUMFxpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OcthVQuzviKIR2aIi4q3I6rpcPmTwh5OW4eq6/APlx04tIXmPUN6qWyg1RlKDYNAD
	 sWuZdyObDOgl2cpWJ9wPs25nWekqjvjIZv+Rs60koLyDzl5KyMQddXAF1A266bGpZh
	 jCWPMwu5my8+vT38DjMc7qiSVbop3W/AV917kO2Hlt2vTg2R2eiDkvKziEFcDzBmec
	 GOTBSIlojuPhCp6n66ht6Y6oLvmo6Qb1FFbcVptD9ILngRD9F2JHVAJuJDWEcYlzqu
	 XYIByA4ubQ1VIad7G3/SJEcv4qy3Spc+bqWydNo5i29wV5nqzRK9jB83ViNvBccFNV
	 47Cl0qxRKFPwA==
Date: Thu, 12 Nov 2026 12:25:03 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 3/6] scripts/Kconfig.toolchain: Clean up
 '-fno-allow-store-data-races' handling
Message-ID: <avWiD7lPCpGoVJ42@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
 <20261111-kconfig-toolchain-updates-v2-3-b2d9415c1757@kernel.org>
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
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-3-b2d9415c1757@kernel.org>

On Wed, Nov 11, 2026 at 05:52:05PM -0700, Nathan Chancellor wrote:
> Commit 454e00cf8ee5 ("kbuild: avoid re-running compiler and linker
> probes") added two separate symbols for the "no allow store data races"
> GCC flags. These flags serve the same purpose, so combine them using the
> second argument of cc-option-str to handle the old value. To avoid
> setting the second value of cc-option-str for clang, add a GCC
> dependency to the symbol. This will eventually allow the cc-option-str
> call to be eliminated when GCC 10 is the minimum version for the kernel.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Makefile                  | 5 -----
>  scripts/Kconfig.toolchain | 7 ++-----
>  2 files changed, 2 insertions(+), 10 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
