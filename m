Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4D748BD4B;
	Tue,  5 May 2026 16:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997152; cv=none; b=dxUEg856Dp/sUtmNux/miSDCCjOvopNwAgPfrLv8SaeifmoR4Sa2OPDQ4/2zUCw1XU83dRi6nMGcf+b+XIjQ/+Wf4EDHGLnxZ8OA/psVKlBG7cducpAF6WVTxfa4rHwEc3ZuIv7A6LgLQ18vCecl5tVazVt6WMpLaZabmeMwtfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997152; c=relaxed/simple;
	bh=KZMpIPf+ZN/e65GMkCBmInso7quCVD0R8V71ioXhf/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSa6yMaqjZq6XAeBAGMwXCu4Olj0CUjHD1JFCWAseiPmoGZwnGsk2cRqdCk5ZcveUUgw6iNEwrur85llyb58R5RlhFeZ6tWEQYQ5O1JlWxnjWCGN8JI8Ww0tJUDts1AmUgadATeGkf9R0NkU6TT5AxVmsE5t2RjipZhMW53qkoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxHtno6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxHtno6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3898FC2BCC7;
	Tue,  5 May 2026 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997152;
	bh=KZMpIPf+ZN/e65GMkCBmInso7quCVD0R8V71ioXhf/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxHtno6O4heaGuDWA0SLz5fdK3brSyoHePCT0G2fCd6sHFK+1JZDlOaNoInPjTAsm
	 hdfP/4jT9CN4M3wSFvK+XgEmnGqcyfa1aCt6GWRaUoWi4+xTxA77biTZ01cHLjh3Cl
	 xYcXyWpwgaWw/FXdUk1uk85JALE5T6LAMtOFdBbBUSdQWgnVFZ4NVuJkZgrqZ8rQ+1
	 nLDOfguZHp8+/QkUFtYjOq1Qv3hdd8Eg+KY43vyO6vpBWNb2l7CQEO8I5E7tzZnBQx
	 YAGbw56kIAaxKijL2kLz9X8RnKnAoHMW0A8PMvFio5N4iGxdX7/JHa0DA77htWfJF5
	 l/Fc77kWbUxjA==
Date: Tue, 5 May 2026 17:32:59 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 14/14] kbuild: Remove check for broken scoping with clang
 < 17 in CC_HAS_ASM_GOTO_OUTPUT
Message-ID: <afoNq1TIHuQmISJI@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-14-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-14-81d9b2e8ee75@kernel.org>

On Tue, Apr 28, 2026 at 10:59:20PM -0400, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the check added to CC_HAS_ASM_GOTO_OUTPUT by
> commit e2ffa15b9baa ("kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang <
> 17") can be removed, as the issue it detects is guaranteed to be fixed.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> ---
>  init/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Nicolas Schier <nsc@kernel.org>
