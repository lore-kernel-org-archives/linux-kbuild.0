Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483775;
	b=n4gEzTS9tQbn7eCL1D+K99Yw2R0/H0+MXRK0p4LQzlH5CaMqMds0Xqhh5cPqAu5KA2oh
	 OX9Fyw0HTVMJFEmH/fw2DMc9/ejwAPssI2OD55RpkPgOksfAaqxolru/cxM7XJE9Xxr9S
	 ApK1C8CvCg/zw1PlDjgWRvY3TKnxbIyFTJiiZnxLsEDb9AT8fZYTYthqIVuO8rgkjOxdI
	 q/UW8PBukclS4NphBd2qyGLiRWlmS5krCuesWvkGHfpuqJFNBBU42I5vl47P5PIE5etYV
	 PwuGndpzsixNlMHy3X+xfCSqiwqlHkTbhyBRELdSGVvuzdaquNfHL785NyauGtlNSwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483775;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cDOkqX+SLw3QMyylghtf6DmRMvisUn9CYoKbxeXNWQQ=;
	b=s4Z5zrFQ6DAyPL/sfMyLV1kiUIHcowEI7XVmW2goQPNFyUBsAtBsSSZt5bHtpjCD7aFs
	 q8KUFh5CMSF/52Z1xiD+2Q0RqUr1pnHLgAzWN458IGxzrDcImxvVhGEg7/4bw3yZPJ1Sh
	 vwtLRMnWoJhFdFcEVi9xoFlP0AHib8IhKe99C2oNa1stqcMgRS34COOOr5qhbi0pDHtPb
	 B5YOPh9IiPXPrChXsgbnz/nsIkLJ09Nkuajg10F7NuOPVpzzxOdZFj24YIYqRpwP9st9q
	 8tugrDmt7k9+pqLy2N7JVhV6EDYv3ecxAaYEjeK2p7G/x/2+ySJ0S8jg+C0NjZF9Xvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0M81yIe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7BB1B606A884;
	Thu, 12 Nov 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0M81yIe
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A41CD1F00A08;
	Thu, 12 Nov 2026 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483775;
	bh=cDOkqX+SLw3QMyylghtf6DmRMvisUn9CYoKbxeXNWQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J0M81yIeLlJqm7O3nQ/hhbbL1SgPOVSsn0SBZh0xw3iIkvgsKwDXT2qvHyIarc+La
	 NIYgXuYeNFkciNjNO2TuAtHUnOa90zyKyFpv2L7nNUPWu2q+vWKVAqxdpwhMh2a3eo
	 Y8b8yANSgMUsZWkRIT4rWebq5iuCHYcUy2A/KzxAqiwxy/N1WC+0pVdlVEjIF0kTVX
	 c/GmuFMLuol1eip/FLgZVlh/DDPjisUdbXZw+iFU0W1C719V6nliCXH/xs/lbDsONb
	 aiZnzmqpxc4l6XAXFEy+tjMB76O7W7zT0qGEHYUKK8Xnw3zxGR9VZJOZKbjIWQ1AXu
	 Ei4Es5kTEampA==
Date: Thu, 12 Nov 2026 12:42:21 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 6/6] scripts/Kconfig.toolchain: Document minimum
 supported versions for dynamic checks
Message-ID: <avWmHRIMSvfApGu3@levanger>
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
 <20261111-kconfig-toolchain-updates-v2-6-b2d9415c1757@kernel.org>
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
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-6-b2d9415c1757@kernel.org>

On Wed, Nov 11, 2026 at 05:52:08PM -0700, Nathan Chancellor wrote:
> To make it easier to clean up unnecessary dynamic checks when the
> minimum supported version of a toolchain component is updated, add
> comments documenting when features were first supported. Request that
> future additions document this as well.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Kconfig.toolchain | 64 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 

Great, I really appreciate that.  Thanks a million!

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
