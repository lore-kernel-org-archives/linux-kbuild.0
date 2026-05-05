Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5CB48BD3F;
	Tue,  5 May 2026 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997150; cv=none; b=CWahjQ3o7TQFLvUir3IgFaCLwfupdcR0HJiYLpKRUTcn9VisuCyw2ttw9A7nWkXG3P3ab/XJuaPkmPg21GL2n3vBjoQzdcpVbpBEFRv5Hhfjs01rbZYpzR2OVuxxpo6GQa9wxpyc+tk8W15wHHL1kp3H6ieYxaNoQFkonwJxT0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997150; c=relaxed/simple;
	bh=Fh4RljvUQdB+px0eJM2Apj0mQ0Ns6lFP72vAArR0Fzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeHPqFyFauSGseSVlkAfsdsC+WXXaMh0JBrpPcHSu1BuKZ2LshdPBh79jcoEguIDj5y8148ZqvyB7h/raDQ6vmLrqCQfYeYcbItpb4sGJziZ71zwKhRPbcnSy4E3XIKnVywzYnvE3eSq3qNWvbNiXhkqlqHzB0xPnflsOQb1YUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbNnjsip; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbNnjsip"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C79C2BCF5;
	Tue,  5 May 2026 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997150;
	bh=Fh4RljvUQdB+px0eJM2Apj0mQ0Ns6lFP72vAArR0Fzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbNnjsipmKSmPls/GMJubF9SOidZeXY9ILdS96X79c8hITM7PH87EiTnFrKKF2jms
	 eoW4M+Don7JXm7tXJwaRdk2aKfmsGbbUmSQSORAtM9LdH12b/58R+xqfDKYYrLtKqv
	 oAVNU2q/djiixct+IDlftjhJIKQ7M4ZHJH8KzBUiMaNEjaMh3M9lHVwDQXJ6jymwwY
	 ymbXnGdR5LQDb5cguU1flxVAD2GrOA1fYocgdznCMuFurAgsX9yuLQJZJh9lPYG2Um
	 rLy+AcQlCv/k15OD2vgv+NKNKq539sn0k4giQs5f/9cAzoQpsQQ5iJ5FM5tiL0mTj4
	 9vd5rAoG/xISw==
Date: Tue, 5 May 2026 17:31:37 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 10/14] scripts/Makefile.warn: Drop -Wformat handling for
 clang < 16
Message-ID: <afoNWcrF7Z1xoTwt@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-10-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-10-81d9b2e8ee75@kernel.org>

On Tue, Apr 28, 2026 at 10:59:16PM -0400, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the block dealing with -Wformat with clang
> prior to 16 can be removed since the condition for its inclusion is
> always false.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Makefile.warn | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>
