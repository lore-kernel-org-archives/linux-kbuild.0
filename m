Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A948AE15;
	Tue,  5 May 2026 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997147; cv=none; b=HJA+nRetxmF1w3XxbVl58yw4fsfe5OkwyzGd1LajJvipFTwIFgaNI2IrlzO7y23Pp89mt+bJ9TGXaD7EeAGvdh4nYPMehabrXr0xwtGNc14UeEGRYuVOKJIcm4sIgTcfXX/G5X/J1IceWxGVzmWqeW1sTN6d3nsCJb05Wiv+dZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997147; c=relaxed/simple;
	bh=b60nPe4Aau5jZGuvAZmUi5bzjsasSzLWfaifsawlwGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFbYnP88eqmJDSmajfpG1YOZw/x0+6z/5rOy2GQqXhKpFLYcfTN7gBu6Je/ykYayizqldj31SvLaMRgK++9T8RLURUPu18BAtnyPzMF/86Wwao8DWf2dG34GIzEXu938AjX9aEvjTWWuR3v89YwlqAqixLDaC2BWoxjOj4nHxi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nb4UfXk4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nb4UfXk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF009C2BCC7;
	Tue,  5 May 2026 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997147;
	bh=b60nPe4Aau5jZGuvAZmUi5bzjsasSzLWfaifsawlwGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nb4UfXk4HQoCPbYaZq2GthL030eQUCRcCGUtZDxlQLK+zoykerXVjwx9nnwB1aIvf
	 OXKpvb6Tg/JipmvtwuSL5ROZfzvMEkNeG1pxqsPM9VE2B/zAbLaFA4RoMKwpKZ5A3q
	 A+uj6xjRSgSW8mmA2fxD/TjCAyWdSysmfaaX5IkK8KxJzDc2XsEyExsypCggxevzun
	 T4b3iOwg2tn9X6shIZlHSA7z+FJIyJUI9syrrMZ15B6M1o0KkdYTK5Fo6+CafOri+i
	 g+cfjv0QGhhytBwNPreZMfe03LJXCit+5w3Y8UENcEJOM5UxPAxwLOA4lQJQpH19Hi
	 Ut6DVCii1u2fA==
Date: Tue, 5 May 2026 17:30:22 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 05/14] arch/Kconfig: Remove tautological conditions from
 HAS_LTO_CLANG
Message-ID: <afoNDmv80i3fbw2A@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-5-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-5-81d9b2e8ee75@kernel.org>

On Tue, Apr 28, 2026 at 10:59:11PM -0400, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, two dependency lines in CONFIG_HAS_LTO_CLANG
> are always true because Clang will always be newer than 17.0.0, so they
> can be removed.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>
