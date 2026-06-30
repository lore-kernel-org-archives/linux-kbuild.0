Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD869191;
	Tue, 30 Jun 2026 02:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782785047; cv=none; b=jGy6ljVQnwGb4OxwgFbB5IM3HUoUJ5/p02M7yQ08rxfMXe6KSTX3e1KgJDErj02thLvVEvxQzd6hpfxP50LwlC92vHDNvpf2RJW4yMb1sMb5SkQXHOQDSh9wSBihqlEZoV4AFzP+56DxX8yaRPL3PhxRTLM2n8z9NZr1qmIQQsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782785047; c=relaxed/simple;
	bh=Fesctc61SRR4ThpBPahmuLjBixtyjJG2bvEcWEjM5fw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KdSn/mYHEzREg2wSRi8uya5l8k4x82coVuAErrf7BG9KDVI4e8quLCfW9LuVx/rmGu6gAvrfWj0CQNWln3ZJvcLPe+Nv25o7rK8JXigoctfJklgeBsDTWFkYfGnK+9y+Nk5XDsFS1p9GqSF7KxHuFQko6leA2ooFMUnIRRscjrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnasWku7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnasWku7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420251F000E9;
	Tue, 30 Jun 2026 02:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782785046;
	bh=Ur6+5jvW7yqb8z2JauyK6OwPY3Amvh8JH0f2YGep+kE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nnasWku7jqag2iaAYVhj1Yt1kzK72XuD/d30JG0yo08yf/FQ2RKt7DsOYkuemPyql
	 um52aVpd5fOmV5N2oZWDntpfVSemWOVisodJRplyc30Z4ShzLK3P9Xzxtd12z1quSK
	 B2Ulp2UyDJtjZgZ3wbzBpTh6AIb+LRFG3CH82Ekx/sC/Ew4mXxphKkpQ/ZfnrDgqsU
	 NAPGkjDHWYc/6+bfE4v9jHLykj41MJtirQoiHVMYgGagCaM2STTiLH0R63+K9h/I/e
	 H+Mlix8fm/JfjvTYWHP3LAGOg/V4y7kVr9UYzUeyI1EsxnMIOhKleAKnOtE1GxdYEo
	 gN/zAz0eVN6qQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] scripts: fix spelling mistakes
From: Nathan Chancellor <nathan@kernel.org>
To: Martin Weiss <martin.githubacc@gmail.com>
Cc: linux-kernel@vger.kernel.org, Martin Weiss <Martin.weiss2410@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, linux-kbuild@vger.kernel.org
In-Reply-To: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
References: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
Date: Mon, 29 Jun 2026 19:03:52 -0700
Message-Id: <178278503295.3414597.965604791088936644.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Fesctc61SRR4ThpBPahmuLjBixtyjJG2bvEcWEjM5fw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnOKsIbqpefDv6UrKL6sVHKhW8uH8+fuHDOdRqqVT/Cw
 rf6RG3tKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABPhy2JkWHZ3Q4OuxE+bVZuD
 OhWFP/WHnLmas+R968bvvuvZf9fNZ2L4n3JX+urnnx9yD3z7Zu53uSl9z9kfOufdpVm2RK6eMLl
 pLy8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Mon, 29 Jun 2026 15:28:06 +0700, Martin Weiss <martin.githubacc@gmail.com> wrote:

Hi Martin,

>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index f99e196abeea..c8f27e4175f9 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -38,7 +38,7 @@ is_enabled() {
>  }
>  
>  # Nice output in kbuild format
> -# Will be supressed by "make -s"
> +# Will be suppressed by "make -s"
>  info()
>  {
>  	printf "  %-7s %s\n" "${1}" "${2}"

Please always include a commit message, even if it is something as
simple as "there are two minor typographical issues in a couple of
scripts under scripts/, fix them", as some maintainers will require it.
I don't think it that big of a deal in this case but just something to
keep in mind.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

