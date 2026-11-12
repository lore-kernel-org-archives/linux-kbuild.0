Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483766;
	b=p0FE80FxOeqKcaSfqCu++9VWP6yCA5TlJkzHnfADPbqlPuF5ya/bWrwa0N/5jslkZPse
	 P2mN3nRuv8zACWHabpcj+6d3TQuwN7ArmuRhQa5jASLQ6X5aThgU91T5hm2PJkgtoU9Uj
	 LaYDpXMZulJD9YLpGY2ZzXSDLhXeuedRNp22VaBsHDGLi0RflgkK93QUAoE/7rEti2zXt
	 u0KqiIliuk9dTf+B1JHyE8+1UvF0buBCzMtu1Vs3peU9VlSYtkVyUSbz3l/PpOjRWOHXJ
	 Cia9TP13FuH7U6kXdF6cuYxUTrcz2MkbXAiAqGk1s8lsd3TjpV5uGcH4GuJ4i5Ajkwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483766;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JH6EiO6Eoi8ZQDrhOg4RT3IxVlU+D7DIFQNL0DSbLaA=;
	b=WQxjD8HzAl/eJCpNjI05QOJ83MojfMq6CSf32NKgxddYZ2WLTcE+6b0YqRw3wc3nvPTM
	 a+B5UrDLRizLtSqCmj+LHldfN8zUffm38q2F8zmEBEik2THNYJLA9J3qea1m2oTmJvaOe
	 NV2gQPSOjJr8LkUFcxq8ZLsR1+ShhEK7DIH7ZBGIMV1/6IBoQgO+KZB4vX7yO15rBUqW2
	 7c3A8WTylemIZz1OXTuO76uJq5uSCm7DpM4zNYNn+lEBZ3sTHQJtJKkqZb7KHx/gx8ERw
	 01vedMdAYjRn5WxfJs99Gl001B2kRZ+NYvurA+bQ01QV/W7Ca0c2Aq4t1DhKD0ThJeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agUxmVQd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 059E4606A32E;
	Thu, 12 Nov 2026 11:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agUxmVQd
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 066BD1F00A05;
	Thu, 12 Nov 2026 11:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483765;
	bh=JH6EiO6Eoi8ZQDrhOg4RT3IxVlU+D7DIFQNL0DSbLaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=agUxmVQdSFOr7w6dOr0x3Oiz9lppUQ7/iVBDwrkRyV5F4gU2srIZ5bE18QPbKKUX3
	 LyqHlgL1prOgxASP3NiZy7BiomQGdHvgR5fQo7PtNGqjDVGwhkoMXRk7IVRIW+8tdm
	 zrBs3vfm5hZPQPCNqJfLKHHtUo4fK9zRI577k/nhccRHHvkpvy0lKBkPkPCmmwwG4p
	 Nu9Qe4yKyDyxgHzgxn2dp8ApQGX/FDXSb0e+ey7gTZ27ydYQ4DSsqRTCuKurzyJ3Pd
	 t/r3PEUMMOvLMgMFpsPCFaoQUxhKSXmtuT9nut+qg0s7+VSMX/lhxZDT3wsj2hCYHw
	 QDtby50WQyYYA==
Date: Thu, 12 Nov 2026 12:21:19 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/6] scripts/Kconfig.toolchain: Do not dynamically
 probe '-fno-addrsig'
Message-ID: <avWhL8_rELTD5CAl@levanger>
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
 <20261111-kconfig-toolchain-updates-v2-2-b2d9415c1757@kernel.org>
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
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-2-b2d9415c1757@kernel.org>

On Wed, Nov 11, 2026 at 05:52:04PM -0700, Nathan Chancellor wrote:
> '-fno-addrsig' avoids generating the LLVM specific .llvm_addrsig
> section. This flag is supported by all supported versions of clang, so
> convert CONFIG_CC_OPT_NO_ADDRSIG into a simple string symbol that
> depends on CC_IS_CLANG to clean up a dynamic probe that is unnecessary.
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Kconfig.toolchain | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
