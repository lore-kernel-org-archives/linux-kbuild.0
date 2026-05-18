Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33709395D87;
	Mon, 18 May 2026 21:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140222; cv=none; b=aD/rqOqiCO7GjgvG4BjH19UVa2noDn9Z9Rr8MCtoggyG7RNgFhMyBTwh0nGxkLRcd9LZbfcmNqZvTO6vMrn0Vml7DaiDm1QvtwfAqAPsg3L+C0930DoPkSbQHhA4AMux6225FuyeB0H0O+fWDy3fWljA+tDuBogByNO8m7kf9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140222; c=relaxed/simple;
	bh=4nv5rnSbZUVjuOBpqPxTJjSgHYNHe6C8ctMOzyMdjsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shJvKUYM+lpjvNgnPdSMV0b+EJ8/pqdyxW+5o/5wXG2dpjo7HzDrmi0Avem7eP58pJF/zzF1x/9LSje5CgInEPh6ZykIAqlc9oP6pDkEf6zIIhW811V0KKD3VdloDCTVIdc7M+z+BVLeWy09FlBiwmvm2eJhW1Iukf8UxQcxcNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eM/WmYoZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eM/WmYoZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF8AC2BCB7;
	Mon, 18 May 2026 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779140221;
	bh=4nv5rnSbZUVjuOBpqPxTJjSgHYNHe6C8ctMOzyMdjsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eM/WmYoZu1QRLdNR7w6WeqHdf88CTXBOKN6Nb39pWXRSmJVdx51PUijJLsiO+DOtn
	 1OfbktZgELk10ZHUbNb0YB/4OUu45pavsoD6rc5hYUEqLASlN7mEZ/Rc5wRi1RukG1
	 M9F6osA2+3A14uba/Blx2pXzCkskeWOneBKhbkG/qbWCnYjWAnFBHhlB4ONMZMmpEh
	 c0LMvvRUUfs5b3MWdW259YBm5S7fM54thQQ20+ciNLNo4opAktdbo5R2OHI3X1HtTN
	 Ec7lNCUkH4Pq91xwvXhHxvili+906oHzi5J9Fl+I6Lo5KKpEx0CloQUJMlR7gVSGkp
	 GjBLPPqi2c0oQ==
Date: Mon, 18 May 2026 14:36:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 05/16] arch/Kconfig: Remove tautological conditions
 from HAS_LTO_CLANG
Message-ID: <20260518213657.GC3979157@ax162>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-5-b3b8cda46bdd@kernel.org>
 <6e555229-ae10-4304-ac1c-3cb02278f77f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e555229-ae10-4304-ac1c-3cb02278f77f@app.fastmail.com>

On Mon, May 18, 2026 at 09:56:20AM +0200, Arnd Bergmann wrote:
> Semi-related to this: we discussed a few years ago that we may one
> day no longer need both full-lto and thin-lto.
> 
> Is there still a need to keep supporting full-lto with clang-17+,
> or can we expect everyone to use the thin version thee days?

I believe there are still folks using full LTO, as I think that there is
still some performance to be gained from using full LTO over thin LTO,
but I am not sure.

-- 
Cheers,
Nathan
