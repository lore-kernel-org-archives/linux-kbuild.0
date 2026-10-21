Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792608448;
	b=alFrQKTV7BNNOHYTGaz5XoY6HlXHibfKYBqwJ/w0rPCoRdD3AY/nY2/8KoztKBWLuhfI
	 y2nyDfkGIjwyfIMmeGbndyOaSOQxPxYqbpaETv4vAboj3aWlkdMyO8aTCxcXmNWk+5KSd
	 pqgckYQv+feI0wXUqokGv2HMa1G3TnWtc8gb79RLKUK8nbLCt9u8UgMD3AMb+MEOQZo+o
	 HLUT4SuBkgmggs4EtGe+O9M7hV7t4TZS2JaR+1IZvpWO/dEp4PtOodzAUeNoScYXH1oJs
	 Zy5W1gEhgKxMdxtIrXZctuHt+KAjwhljSlfuPvsgEX7OF30UgjgZS8bzKPlmoVQAiMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792608448;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4YAaJe+XzC8CWDcCHpDaqkcz58Q9pyU3v8THABhTGxA=;
	b=ynm3pXda6ZY5QL8VQlwox8NDbqbo1hdHriunmPUkoEHAO/1XHpZ216aceKfPSXefpYAl
	 VqiI1JBL597DbtfIxM4G81gbSvOKTlXYBnjsgurYmDIvyfbk2qSdU5mFWbU/nCC6LgSl1
	 V5RJvSdEtxe4hAL6jXQL8zE6MJvmWk0qjc/I1o9GSIutrcqYX45jupilzIykRMp2Fgqpf
	 Kuv6jD5OPkS/N8J8mj7oOrDl5Bu//LK4SpYuGcOYBkHFJDfNSx/qsUy/1twjzUv9r2S2J
	 7dmHBaxuUZJxgFUfT6389FkYLyRq8U/kxaSg5SQ7Lz//hjWshrmEX3xKBlNgAEPABAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xjx+9Kpj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED8606A31F;
	Wed, 21 Oct 2026 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xjx+9Kpj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42761F000C2;
	Wed, 21 Oct 2026 18:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792608447;
	bh=4YAaJe+XzC8CWDcCHpDaqkcz58Q9pyU3v8THABhTGxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xjx+9KpjxipI/As+uxGwwR980Zy7sDt66yjYphNouFayT5pBjxy6H6jiK3ZmkgohC
	 mmo2cv3gXYk2t5VMxi8PSkE4g/Dw/Ahl1+Ry4w/AiBqhjrToR5++6edMIhhf3ql1q1
	 8i0PsrzBzt6wuqq1AYJ6D9E2A9cAxf4iqsagfjaaX3A2EV0UjQOZd03eNyHFh6Tdvu
	 YpP/dr1sI/K5cUep+7t3nZ+Q4891ut9FQK1at/rw0KGGw+4IIVrxNE3VqCDhPy8k4o
	 KLHtgLHsZzsQfUxsjy9YoEKhym+bGlLgMBbWsjFJwGSznbiAjlnMtZ/NJEuesUjO3D
	 tVTNMWEGJAgPA==
Date: Wed, 21 Oct 2026 11:47:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [GIT PULL] Kbuild / Kconfig updates for 7.4
Message-ID: <20261021184723.GA2608581@ax162>
References: <20261018035817.GA2365306@ax162>
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
In-Reply-To: <20261018035817.GA2365306@ax162>

On Sat, Oct 17, 2026 at 08:58:17PM -0700, Nathan Chancellor wrote:
> Hi Linus,
> 
> Please pull the following Kbuild and Kconfig updates for 7.4, with
> full details available in the signed tag.
...
>       kbuild: Mark the gzip recipes as recursive

Another conflict was reported in -next between this change and
commit c437950dceb8 ("alpha: add self-extracting compressed kernel boot
stub") in your current tree.

  https://lore.kernel.org/atibhAMcgKle37-g@sirena.co.uk/

Mark's resolution is not correct though. Discard the conflicting change
in arch/alpha/boot/Makefile (i.e., the first hunk) then apply the fix
from the kbuild commit to arch/alpha/boot/compressed/Makefile. See my
current merge for -next for the expected result.

  https://git.kernel.org/kbuild/c/83deedcf85af511dc120b3cd8ee597d211cdf2fb

Also, there will be another conflict with the rust tree in init/Kconfig
similar to the random one, Mark's resolution looks correct to me.

  https://lore.kernel.org/atit3cSBFwe9cDY7@sirena.co.uk/

-- 
Cheers,
Nathan
