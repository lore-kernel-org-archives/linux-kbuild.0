Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E22386425;
	Thu, 16 Jul 2026 04:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784175570; cv=none; b=arGkEI2TQVH24uo3NL6nJUgU7D4jBlLOcX457DQKZQFpefc/4TW5JpmMceO/zp7xsHyf8WLmMqMdzSIm3xnR1yEfiR6GSCfisgUqcG2B+8ujpWt/oh7U9NNkQooVG8aZ/Zl0sTOEfkyoB2+uj8HvhITbWxqUQeiQPWXwdgj5gcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784175570; c=relaxed/simple;
	bh=v547NkQIKoR4PNE33Q2d8lwdefFVp3wASvEuTnuYxik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikEWzf42uScnrXaFn4LvRCqgDHYRPKT3+Mb2hIm+i5w60TPBBCMnJWVMWRYKEjyVj4zpG7rsZPcR9cQbkdAgAuJbn66kN1Wz2Qxfi7cwBwWtnGv8ltrhphCj5ybPSmUQN6lk+0vtuT+Dwk1SvOUFNnMvqRwksyREOhenGQxNgfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORaHzs/G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORaHzs/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECEF1F000E9;
	Thu, 16 Jul 2026 04:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784175569;
	bh=hx32ZU0542f7UpDU3jQYq/eWju/hG27F1b24YSbqnwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ORaHzs/GWZ4bLcKG4lMlNKlf4zVArjC2IJdMkkHxusyOTk8otOk/3eW3JghTZkHOp
	 6HIMgyFg//n7F1Q7GdEaR/2IDQTsuxw9QU+iFZviEp0cYU4URTYZTk88wssqrlKSVn
	 M+X8/ld7vQ7gRoISb2K9Fso7Mn3Q9fYLzKycnG7iI0FhR9CiFKmSRRZ5LpLYJH4BgH
	 cR/OPQXSWNcDjI1Vd11XqhT7BHlAaq2PgTFwvq+CIE+pSKKwOmkjol8QX80aV1Lf27
	 3TeU9WB6DoViwk6i3YeOR8QjJprzs6uqTMrq0znfIQpAYYq21IxmcWvF9xHZAqyNWz
	 YiNXz5aiTfRmA==
Date: Wed, 15 Jul 2026 21:19:28 -0700
From: Kees Cook <kees@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, arnd@arndb.de, stefan.hengelein@fau.de,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nico@fluxnic.net,
	officialnaumansabir@gmail.com, rdunlap@infradead.org,
	vegard.nossum@oracle.com, tj@kernel.org
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
Message-ID: <202607152119.BF8E377B@keescook>
References: <20260715220149.48700-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715220149.48700-1-julianbraha@gmail.com>

On Wed, Jul 15, 2026 at 11:01:49PM +0100, Julian Braha wrote:
> Hengelein's master thesis about Kconfig from 2015 wrote that 'select'
> does not work on member options inside of a 'choice'.
> 
> So I've re-implemented his check as part of kconfirm:
> https://github.com/julianbraha/kconfirm
> 
> and discovered several instances of these dead selects in use, and
> fixing them is not always trivial. For example, see:
> https://lore.kernel.org/all/a3b7a752-8cc4-492a-bb62-43121b852c41@app.fastmail.com/
> 
> Let's add a warning to the documentation (a place where developers
> are more likely to see it than a master's thesis...)
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Yeah, it'd be good to add a checkpatch or even build-time check too.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
