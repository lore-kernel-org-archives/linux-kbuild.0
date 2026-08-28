Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE143002CF;
	Fri, 28 Aug 2026 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939835; cv=none; b=Q4yH0/XSrr84U8ynYwyx8pZ7ns3qLvQQEj5yjE36xTJYMs5+GXW4XYnpHyleLoksV7XtF+gIxtZMVHvreyxFnzZM5UywPylHka/X6Pw7Z0TCcLqGQSHLhsWDfRrkuLMWT5KwYZIeNEVpE9g03wIyqmKvp/mIVv8Wlcj8yORguuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939835; c=relaxed/simple;
	bh=U4BLoNLNrDCuYZeJsR1BMfEKEyBFmo9k8PxA4sQUEh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qi98kNlUIdLUJ4ADk3dZFWNjHl2ha86jUc0BXqcjzu9TRzyo/55a90yAexFpkz3Ig+9lbvqKjnl7sGD31p40+a6+bRW4sNpI4pnku5y1JEt3yezBUNXaw/L7SlKkSvWi/zOGk8KRIXiP6r/F6IXIE1lDDgzQTagL/wNtpeA77Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvXe2A+1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvXe2A+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C271F000E9;
	Fri, 28 Aug 2026 17:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787939833;
	bh=H6P6AHS6/x6pMjgCMUJBE0PeoGYUl/jCtlCd437ETFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PvXe2A+1CB3AL77fGDhjAfLEvJsjzOJUciryulKFvfCc0p8XwJqTeHWlpMV0Waodu
	 fInbzo97bM5kRFSRTNO4h0VubqnekROnbPMXWzyoy9oSJ07DfQFk2Z2MfGISirrJqI
	 HXRgGQuHDmlGmbwH855WM9B4WC4DuQ7i56IqZGkIKiissmSoo61pMx96rU00Qo3+4A
	 NnNFHTGgpRF9sKHR2YGjuC6/ewL95NRABUN9+j7/OGXFtlLmFkJUjw5tFPpG2/MoN3
	 yPuaANw4qyiZeIaDi9eW+oO8QSv7MTnEfAK3lg284E1OGHGS1CrbRTKamcIay5OZz0
	 50rPuxIA87b9Q==
Date: Fri, 28 Aug 2026 10:57:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH 12/27] kbuild: Defer running objtool to link time for all
 CFG features
Message-ID: <20260828175708.GA3403925@ax162>
References: <cover.1787890035.git.jpoimboe@kernel.org>
 <1447f9f8dc6e7e02e4a8a33ce7ae92ba49d70eb3.1787890035.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447f9f8dc6e7e02e4a8a33ce7ae92ba49d70eb3.1787890035.git.jpoimboe@kernel.org>

Hi Josh,

On Thu, Aug 27, 2026 at 09:51:41PM -0700, Josh Poimboeuf wrote:
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 9bac917e8b819..df1e3584883e6 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -30,20 +30,12 @@ endif
>  # objtool for vmlinux.o
>  # ---------------------------------------------------------------------------
>  #
> -# For CONFIG_OBJTOOL_DEFERRED (IBT or LTO), objtool doesn't run on individual
> -# translation units.  Instead it runs on vmlinux.o.
> -#
> -# For !CONFIG_OBJTOOL_DEFERRED + CONFIG_NOINSTR_VALIDATION, it runs on both
> -# translation units and vmlinux.o, with the latter only used for noinstr/unret
> -# validation.
> +# For CONFIG_OBJTOOL_DEFERRED, objtool doesn't run on individual translation
> +# units.  Instead it runs on vmlinux.o.
>  
> -objtool-enabled := $(or $(CONFIG_OBJTOOL_DEFERRED),$(CONFIG_NOINSTR_VALIDATION))
> +objtool-enabled := $(CONFIG_OBJTOOL_DEFERRED)
>  
> -ifeq ($(CONFIG_OBJTOOL_DEFERRED),y)
>  vmlinux-objtool-args-y					+= $(objtool-args-y)
> -else
> -vmlinux-objtool-args-$(CONFIG_OBJTOOL_WERROR)		+= --werror

Did you mean to drop this line or did it accidentally get culled in
cleaning up the conditional statements?

> -endif
>  
>  vmlinux-objtool-args-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
>  							   $(if $(or $(CONFIG_MITIGATION_UNRET_ENTRY),$(CONFIG_MITIGATION_SRSO)), --unret)

-- 
Cheers,
Nathan
