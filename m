Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1270367F2F;
	Wed, 22 Apr 2026 20:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888330; cv=none; b=KrXH6SzKFKEhueTW1wreUY952AIzOEGAgvgkuUgVOuC2PEPnJSiSXkZ4OeFhXH6ZMdo1mWXYQyVcLd6Y10fdpffRbRGjN82Unn5xATBV/aNWW8lQHZe/Wvd8cwBW1w7jd3fsSMfLZ/nGJ8GAYeCmdvaQ+uxnJn2/uB5t+LaUreo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888330; c=relaxed/simple;
	bh=hfRWP/pM9/Dhb7cq9eGorLzOjWJy4KbF7w3c2roLQZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxa4a4IWIlOM8xHUbhiZ+LtJw74vYbEgSTA0YaIPaybiJmsPWTYKS4Xax2+lMc+6c2u0zZD95CHO4PFgSNqpGJst5Lub2rotsY4nfEQABBuAgiy5j+d1YyOuxxd79nZ3OQtE5GM+bmcuaNQTxIE8YpSm53+QtsoHS1Ux9Tr4YbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdP0AT8p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdP0AT8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180C5C19425;
	Wed, 22 Apr 2026 20:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776888330;
	bh=hfRWP/pM9/Dhb7cq9eGorLzOjWJy4KbF7w3c2roLQZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XdP0AT8pMXKcL8WkY/jr8ZzwORKQ7jhMPA1xrlHgdahevjcDQLvX9eWI9KEtJtdHd
	 va8pS6zLyr9mX61x/gulDsljwyJOWu1TlN6LGHlV1RBgKSzbps0cedWuQkkJeWVO7a
	 zc3pRoZaXlqhUN3W6DG4ZGIAipq1TRJMHb3PnTLIz1UQZhqc3cEnlx967F1IRR/Jkz
	 t5xi/p+GhKbWFLc/wHH8JniDhk3JsuVTS7Bu7K6VG7jxi6nw95X5WcQXDl40lXciWW
	 4DPgpLhPUNkgh1TxrByxopDV8CMs7e5+FFrOUlpykWiezH2XETysiinHKQzN1QEzU/
	 KXv+9Pj/s5Zmg==
Date: Wed, 22 Apr 2026 13:05:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Never respect CONFIG_WERROR / W=e to fixdep
Message-ID: <20260422200526.GA310618@ax162>
References: <20260422-kbuild-scripts-basic-werror-v1-1-8c6912ff22e0@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422-kbuild-scripts-basic-werror-v1-1-8c6912ff22e0@weissschuh.net>

On Wed, Apr 22, 2026 at 05:10:27PM +0200, Thomas Weiﬂschuh wrote:
> The fixdep hostprog may be built multiple times during a single build.
> Once during the configuration phase and later during the regular phase.
> As only the regular build phase respects CONFIG_WERROR / W=e, the
> compiler flags might change between the phases, leading to rebuilds.
> 
> Example, the rebuilds will happen twice on each invocation of the build:
> 
>   $ make allyesconfig prepare
>   make[1]: Entering directory '/tmp/deleteme'
>     HOSTCC  scripts/basic/fixdep
>   #
>   # No change to .config
>   #
>     HOSTCC  scripts/basic/fixdep
>     DESCEND objtool
>     INSTALL libsubcmd_headers
>   make[1]: Leaving directory '/tmp/deleteme'
> 
> Fix the compilation flags used for scripts/basic/ before
> scripts/Makefile.warn is evaluated to stop CONFIG_WERROR / W=e
> influencing the fixdep build to avoid the spurious rebuilds.
> 
> Fixes: 7ded7d37e5f5 ("scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=e for hostprogs")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 54e1ae602000..6c8a1b2e7c8a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -657,6 +657,8 @@ export RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o    \
>  
>  # Basic helpers built in scripts/basic/
>  PHONY += scripts_basic
> +scripts_basic: KBUILD_HOSTCFLAGS := $(KBUILD_HOSTCFLAGS)
> +scripts_basic: KBUILD_HOSTLDFLAGS := $(KBUILD_HOSTLDFLAGS)
>  scripts_basic:
>  	$(Q)$(MAKE) $(build)=scripts/basic
>  
> 
> ---
> base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
> change-id: 20260422-kbuild-scripts-basic-werror-f8f7bfc39cfc
> 
> Best regards,
> --  
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 
