Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB003B38AD;
	Fri,  9 Oct 2026 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528872; cv=none; b=sHbTxzC65XDKHqp0rLpEurUonX46nhN5Gk3Rv+A8y9ixtL58uhTGcQnOcRr4q+78722V9ZCOlZHsbt6TmIl+7bAQaS/NPxgL9ZY91NYVPAbYQieDVfJe7LRTNgWdBNj43/WqR069OW7JX2WoQmY5Mz3ZSbydJgxnW4rPRqibQWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528872; c=relaxed/simple;
	bh=1qBKBvAyq69a2NsTAr7TWy7HIvzx3oMOZYqp01UypP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecP08QZJhUVvWEG2uv5v0yB0e2n1u28d4oYeKbav8/KTqoIPzsfIMYy44yWu9Ve+9d/1+dyBzbkz0VvnGhC/qfbnCh70iZIzHGmTu3LWk/39dfQkaLqIwrGqYgaWxlrbDHru7eg9Sv1bBcTFdjG8EbGLC9neBX321xJMNSFXEQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nalcjoDg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nalcjoDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3879F1F000FF;
	Fri,  9 Oct 2026 06:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791528871;
	bh=3XKqvOCKFp6nggtrJKLbtc5pe/3HWvFtgGlyR8hfKfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nalcjoDgynGbQDlcBgCOreN/vLcbrIASVEtm8Ne4vUSLHqaiuMJBaySuLvwUM3oVY
	 Q0cB2abs+rLNkTDLzcsZeKcRLzOYl97ouh6JYIMKy8gvFvHeGYPM4uYHJD+O50EZlR
	 e3m5hZLA9e+gCLdnfzUkknlEyGrkFoGR188g7IN5IXqZorBtucTwQ61EfkVhdTF77A
	 Z0vyendpoy8iadv7jMYBrEj7AO3TOO9lAiseqSY5j/UF2JBKqU/ptWqn57eBWeSp08
	 5xIiljfwd4PbtyIWh1JGkBfs6vkB/KbLxON9OTYGm5s5L8OztFfa803/BXanzKyEhl
	 RyuY38QqzqFjA==
Date: Thu, 8 Oct 2026 23:54:30 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] scripts/Kconfig.toolchain: Drop compiler symbols
 from dependencies
Message-ID: <202610082352.C92AC57@keescook>
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
 <20261007-scripts-kconfig-toolchain-improvements-v1-1-1e524178da11@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-scripts-kconfig-toolchain-improvements-v1-1-1e524178da11@kernel.org>

On Wed, Oct 07, 2026 at 05:22:21PM +0200, Nathan Chancellor wrote:
> Commit 454e00cf8ee5 ("kbuild: avoid re-running compiler and linker
> probes") moved many cc-option calls from the main Makefile into Kconfig.
> In the process, code such as
> 
>   ifdef CONFIG_CC_IS_GCC
>   KBUILD_CFLAGS += $(call cc-option,-foo)
>   endif
> 
> was converted into Kconfig as
> 
>   config CC_OPT_FOO
>       def_string "$(cc-option-str,-foo)" if CC_IS_GCC
> 
> The 'if CC_IS_GCC' is generally unnecessary because it does not prevent
> the cc-option-str call from running (which is the primary reason the
> ifdef guards exists in the Makefile), as cc-option-str and the like are
> run before Kconfig even parses the dependency. It only impacts the
> symbol's visibility, which does not really matter in the general case,
> so remove these dependencies.

Hm, does this mean we're running more probes at start-up now compared to
before (since the Makefile idef would have suppressed them)?

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Regardless:

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
