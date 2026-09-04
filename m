Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF0637BE6E;
	Fri,  4 Sep 2026 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491177; cv=none; b=Ems62q9wFjYJo0D8qZHgkjSrM1AfmIGhoAlWiOp1EFRH3vLzEPiPK2ARf8ETJihtfUC8QLtZ6rxwFHN1Nxfeba3GaNoca+z25ju0AJPLoNrmxbIO4/3FfK/Vxob5Q0l0egOqRCSuazjnqS2aYr4u4xQHfuAGOabLx0cAPCrYGZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491177; c=relaxed/simple;
	bh=iZow5P9lmwren6v7CQCs/Zhxz1piJIBO+09gISWSDYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXoeFE1GxJXkJ0QP+LtfbmbLIfA4MVSIAfAsJM8e3bk98i038E8DO33QVzKl5hXA4W2cphChppAhc14ZNyXdsGLWcVvH2ub2AYcvkdDUo+b2EeahKxkmYIuEJ7MeIq4AP1NFHsLWfPNMdN07XmVBP+DI95LKkL4Mb05Urv1FeIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6B+F4W4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6B+F4W4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A361F00A3D;
	Fri,  4 Sep 2026 03:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788491175;
	bh=fn0OCQLwyYDBiPvBGyOULhZOp59Svzz7miiqMjK1hsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a6B+F4W4M6OQ7vxORyNs5GxRDKg2bZuHydyDpMnSfpB41gASVPevBVKjmz1hXfopX
	 tEIkybkBfeEjbuEOpJx9LqzbkOeDgsmaa9r9lCXHa2iCQegwGyVg8+fLMii+8+o+2G
	 2YPSc7UEnWbprPNoA7GMWk9g9X1IntAl30gN+B4C1U46TDk/xnyIgVry5eF1p0x5y8
	 7L+/ybGnHSPz8BSN7kO+XqhRWVvLmvxBq+M+AbOFwuMHtmjsc+SfXXTsSQ+jucoLUI
	 tM+SwKvj66fbW3/rlZbmXIwlJTFkHnX3+zO0+1fTuU4Tdgd42r3cknBXw9aysUGrOb
	 NobfUHZTIa0qw==
Date: Thu, 3 Sep 2026 20:06:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nsc@kernel.org, geert@linux-m68k.org, xiang@kernel.org, chao@kernel.org,
	zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
	hongbohbli@tencent.com, guochunhai@vivo.com,
	michael.bommarito@gmail.com, kees@kernel.org,
	vegard.nossum@oracle.com, sam@ravnborg.org,
	u.kleine-koenig@pengutronix.de, mmarek@suse.cz,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] kconfig: fix extra output from savedefconfig on
 out-of-range defaults
Message-ID: <20260904030609.GA1119573@ax162>
References: <20260830221129.2668354-1-julianbraha@gmail.com>
 <178847452255.440755.3609720780671235760.b4-review@b4>
 <07f208ad-824a-4cf5-a360-f93546b92d6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07f208ad-824a-4cf5-a360-f93546b92d6d@gmail.com>

On Fri, Sep 04, 2026 at 12:19:40AM +0100, Julian Braha wrote:
> No typo, this example is adapted from the original report where it
> needlessly writes the adjusted default. In the original it was 1, here
> it's 2. [1]

Oh, right, this is about savedefconfig, I am not sure what I was
thinking when I wrote that.

-- 
Cheers,
Nathan
