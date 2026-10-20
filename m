Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487431;
	b=hByWCW5ja6JmK3qpjV+Gu08g4lruaa9ZHAtZbBWzbGV0g22Y4WoMngweBN50M+okfZ7A
	 0iggN7iDZcerpdgrxu0WE9NNI0FSN0zoAOTKEZUioq59xeE62QkqWhJLx5OeVOqSzpP0u
	 WJxx107+ooDnqrlfUvF+jQZVB9FHGpikboBRVIzZHz1Z/eXLX141tAObjmV+7oBUsLEr/
	 5RLzKCCqldgGiCloEGCfAbsqbolc7iAdbXcZMZqIHm3VoVQHsMwCkptxYUuYWyNFT13s8
	 g/XBWXRzEeQZeYK3/6sf9UM56D8bHNxhMLOwRTTSTG4gVKLXeC8EeRoKK3TsPSVhtLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487431;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Rw1GbtwByZXxzLCSeP+8NcVEZSmlSZm+cwOSW01XRPA=;
	b=LR4wCmbiA+UW8fGKJSMIyuBTjF7WLW9W+eXkvjTJAs+hVuVO0NpSNrbj2+hAXvBbGtEP
	 9SETSjsU2fBTPQ/KbW8PQzemPGk90bGACB7+csXpy7i/qqLwAskf4tguSRaXs6+EisuRV
	 XchJ/7iA23nDUbJJSN4BpuntIpNBu4aPEoYGdvtqQSJGEdpQAfi8kY8hGnsYr9VCr+Fqt
	 zxsiHtznO3atOieT7Je/UAEvnmSJoBJwoOzcnAs8pMEW3Kp2+gTFJxoWXTLfwRVhVpZQX
	 B/M6zu8tZFZpfdKCh26oHoynRVKFq8TUg9cQ3fMwI0GUaH6prz0SweD6oqsZRGLbzxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PEUGyCKz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A8A606A31B;
	Tue, 20 Oct 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PEUGyCKz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB34B1F000C6;
	Tue, 20 Oct 2026 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792487430;
	bh=Rw1GbtwByZXxzLCSeP+8NcVEZSmlSZm+cwOSW01XRPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PEUGyCKz3k+i0RxmNjzmJqSunWV4gKvEKGBX9rY8yII33Efdg4veOJUEhcn+zjs4i
	 VF7LKsOIe2B+tJ8Sfrz4Aoy1H0egKGj+kOmSYRShCdVihqpf/I8ZqPCeYD1Kr1tgt9
	 lvri6SPlK6v3bgzYIHmWr3gs/vISi6YtfsrP11OgR2iOCInr2F6EpDobTX9Cd8DsZs
	 dh5N7TRKtBGvXZ+F/TJrn97qvW/4fLaeoP5RcGCpNAdV3pi0m961GOqJy+2SFoJcqg
	 sNdXM8GM/Cbxr60ntdkblCH6UqBTzirHfBTi8EZFjGK2wB7dPyZ7BVIQreAJnYJwhf
	 aXwdojKG4n36Q==
Date: Tue, 20 Oct 2026 10:10:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Julian Braha <julianbraha@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: pass -fno-pic when probing for -mfentry
Message-ID: <atcvqoE2jjdIZKZe@gremlin>
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

Thanks! Makes sense to me, so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> I found this while testing next with media-ci.
>
> Full logs:
> https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/113299249#L4729
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
Cheers, Lorenzo
