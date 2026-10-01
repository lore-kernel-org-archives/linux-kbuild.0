Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA02F305680;
	Thu,  1 Oct 2026 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869507; cv=none; b=gFhiWhoLoI4EH9YFB5xST/5aImczSrzuqCPyQfxuvzXXjvsFaEmqyyLDfEGSXw9bpIlJohzOMZXSlEDPXVVKy6+SCBiXc3BOTecd1wRGej1QwlLVCnxlfijHGAIbE4jV5CYoj+zXoMOZybpBDLTXeubmeyZmCfHigGQVGIfYI+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869507; c=relaxed/simple;
	bh=yxczuRXGOCIab9yjDY9UT6u0QF1Q5bjvTcK50vTHfSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJP1mEqN/5bLQTbh4eSOjSvRve8o43iUnyPY8oTZ1q/Uf0LSaGSQmi+5g05y1Poozds64Iw2EDpxHsUuhcqzWPCjAp3LkXbp7aNgTGBuS7pZvubvXPHwJDXT1Ri1LBZRQ1Grq9OpRARg4m2/UvnqR/o6X1ftfuRxwt/32I2JH0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDG2o3Vd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDG2o3Vd"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 84DED1F000FF;
	Thu,  1 Oct 2026 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790869505;
	bh=+iJ6akA63JdA+cNcdUuSbDgrZxNywwhgVR6SGGK/91o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZDG2o3Vd7bTwUiKblRMqslfRmNFj4Zv884nSSE+bO8MT7aRRNMAddBRNroPDqgFCy
	 y/ITMMvG8KoE/rVYfHnbUvG1ZiKtg2a2f/wqJEvs318/l+qIW391JYF/8S469GJNRG
	 ZVq8fSkm5/Js6QvgEyB4lv9JLKxlWYua7fA1NUi+FKP8MHDzwxccD2Hl/qvHAH7P0F
	 ekAZzXIle83YrzfMEa7KLVreVFCk8oZeElT5Y3te5uWLOVfez43tGxsEX7eaQVJj7d
	 12+lo1jdLSTfRkKARnDDsUvH9LF6p/w3PLLG1tUbR1butBttmzQ/OdXFfJNqhtlJdM
	 hGfs+ljwdFY8Q==
Date: Thu, 1 Oct 2026 17:44:43 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Yuntao Wang <yuntao.wang@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init: simplify initramfs.o build rule
Message-ID: <ar5_63dzd7czEuAk@levanger>
Mail-Followup-To: Yuntao Wang <yuntao.wang@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930015748.311366-1-yuntao.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930015748.311366-1-yuntao.wang@linux.dev>

On Wed, Sep 30, 2026 at 09:57:48AM +0800, Yuntao Wang wrote:
> CONFIG_BLK_DEV_INITRD is known to be enabled in the else branch,
> so there is no need to use obj-$(CONFIG_BLK_DEV_INITRD). Use obj-y
> directly to make the build rule clearer.
> 
> Also, reorder the condition to make the code easier to follow.
> 
> No functional change.
> 
> Signed-off-by: Yuntao Wang <yuntao.wang@linux.dev>
> ---
>  init/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
