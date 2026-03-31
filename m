Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B336EA88;
	Tue, 31 Mar 2026 05:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934825; cv=none; b=skgDXoyfYu1eTRyQLKrjmgi8OpjuP39O+JiqzGZSXzGTMUCeUvEODCdZjuEERJCI4r0LQ4DpX+BywEZRDP4vnpGT7wpnxDxHstO/XY4rfxZ4wwcxNb11dsIUT4lkzhz9qqpRuzEgW+n0Gq4h9AfGifhOnykOZjnqyX1dpVzenVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934825; c=relaxed/simple;
	bh=WxdEmq+Y4gY9usKpaRk/TozcSrE93hEFhH/QjE5PckA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sd5cIsyVxVd012u+eX0FGrnVMQE+V97d8WRx/hIWXZssAUUzzeVUJx/7Ywegc4ujqUyi/ILDJaczK97vwdib2nzmc2N9ANbXt9BI7J6rLooqtgwBbWC7pKm5kdWxV/aKMZavV3JR9DJlYybC/kAU+0cw6k/9JPSVFtvvJMDwseI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ga9sab+T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ga9sab+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E133DC19423;
	Tue, 31 Mar 2026 05:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774934824;
	bh=WxdEmq+Y4gY9usKpaRk/TozcSrE93hEFhH/QjE5PckA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ga9sab+TlxDuIAc87SCQkWiAxjKI3kvpvMnMDd9lQptr7JZ84MGeiCYcP/fjYjpCr
	 fD3fvCbKpulpgcgTmJh7r6N2tHrBkYDFyxYuM2SJOI4ISP6qw9D//CNoNgyw7YRaCS
	 HurjnH9S7hy2p1szIWHDfs704G7zZVQjTnBVwfQZzjxJSxhKeaWK+SOXez/2qvTa/K
	 Hl7PWNCCz6rEC35sHMK5nODzagQkMHc366GMEZFlWCqajBvnaoQks0n+Av1RPsaVY5
	 NbD0eu8Jzy3k4ef8nJJ3Lk3bc2TnQVplnrbom5p8c9TeVuaQ759wdOopa7i+oBztQ3
	 9ptqcHegVNcKQ==
Date: Mon, 30 Mar 2026 22:27:04 -0700
From: Kees Cook <kees@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: expand inlining hints with
 -fdiagnostics-show-inlining-chain
Message-ID: <202603302227.088478F2@keescook>
References: <20260330-kbuild-show-inlining-v2-1-c0c481a4ea7b@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-kbuild-show-inlining-v2-1-c0c481a4ea7b@google.com>

On Mon, Mar 30, 2026 at 05:09:08PM -0700, Justin Stitt wrote:
> Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
> the visibility of inlining chains in diagnostics. This is particularly
> useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
> inlined functions.
> 
> Add this flag to KBUILD_CFLAGS under a cc-option so it is enabled if the
> compiler supports it. Note that GCC does not have an equivalent flag as
> it supports a similar diagnostic structure unconditionally.
> 
> Link: https://github.com/llvm/llvm-project/pull/174892 [1]
> Link: https://github.com/ClangBuiltLinux/linux/issues/1571
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
