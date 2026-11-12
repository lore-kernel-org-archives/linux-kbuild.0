Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483763;
	b=k/OVy2AB8ndRL4+FMdzTxMYVbHnc35aMG0XbdK2DGnTorqR+VhIktA0M6rX/e1nHmLcY
	 ZgrLJKvITDwDu8zSAZwZoJJt/ZJK69x25fD8AFifpcr5oIwSURopVCb01GzJDWdC14Thn
	 jQ/lAeSye8JZqSHMtrxKRYYOl5oUE7r7pWDTkPybnueSjbFZqRxvP152Tnszg1nUs3ILc
	 Al+RBWasW4ISZA+9B0gTimCa1tU4KGPMx85cndJIo6fpJ8YiyPA9FFmp7zLIh7/jkmGIP
	 OH5xQGkhY4BVDHb8IWq5q5BBN9scdCVT7v9ZBpT0J9led31KkmvjVl4uKDHwRBtsLAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483763;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PWV6GMjyOFfxig5s7hPWAwahLMtzm8DLLOlJIlgpfwM=;
	b=1vytxMbaKhuDOcaZJHcuGJwJN6LumVVDINxlxqwzIlic6zwqiBj1ML8pfNL9BbZ2+ccm
	 b+ym5tsMA/mOZJTZ2IyOJ55mRCu5XRg7r1g0Xz20W+98NQLtOUzMQCjFQKTXYiP34XgC1
	 qESnVyIOS8szupqPEfiZ7su/cOAcnJzYgtFWE1Oaa53fENJNVe/JxDS4GpyPN3dS2qmcG
	 M64D/qOk+2QHN/0oxm59iY+cyG4v64iDsrvJpH434FVobWhVre8HYxRWkuY8qLwS6kvYI
	 jfI46dZr00VbZSWz2hu9BbqcYl1FrUHlvoKS/f7VFsNJ0XDfwCxwrcvWNCsnpvdXuYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NIm61CmM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 76840606A31C;
	Thu, 12 Nov 2026 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NIm61CmM
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 81CF51F00A05;
	Thu, 12 Nov 2026 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483763;
	bh=PWV6GMjyOFfxig5s7hPWAwahLMtzm8DLLOlJIlgpfwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NIm61CmMlxR7xxZjmzqBzWuDcSNUxoF3NNT1wbXRpC4t7q6yOxypS8iAEm+bcI0TW
	 fZ8qou6AhJEiS2Bzrc59kU5WYKjIt/I0Zz45Id7ilnjr+pTwrDGbdNoSINFokLAoEP
	 EBQjFpdn0VCWsKrseaXAUSX4XNHu+jHalXPRMzuP4Ld7z+01gtQtzJwftXia7WBDxH
	 emqXfAxJE++0xs7vN8Md5su/YdjXHqxI1P10/ygGRp/torXXS+4bFbuzIvt0/jXW3l
	 yYWiCrwsI7zaiQdA/gcGb76pinDKrRGg0kEhMqtt39gXV9zU3p/ybAWM+tumI4XKfx
	 y9xyDDNnBTMNg==
Date: Thu, 12 Nov 2026 12:15:01 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/6] scripts/Kconfig.toolchain: Remove
 CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
Message-ID: <avWftakNg6Yqfxs2@levanger>
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
 <20261111-kconfig-toolchain-updates-v2-1-b2d9415c1757@kernel.org>
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
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-1-b2d9415c1757@kernel.org>

On Wed, Nov 11, 2026 at 05:52:03PM -0700, Nathan Chancellor wrote:
> __attribute__((no_profile_instrument_function)) was first supported in
> GCC 7 and clang-13, which is higher than both the minimum supported
> versions of both compilers. This configuration is always 'y', thus it
> can be removed.
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  kernel/gcov/Kconfig       | 1 -
>  scripts/Kconfig.toolchain | 3 ---
>  2 files changed, 4 deletions(-)

Thanks.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
