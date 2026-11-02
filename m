Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627078;
	b=Fni0UqY4zkK+sN4+cbbMqjDa6N0+NUCL3l+AYyZIghGIjh+KdHkzWM1wbCTBWeT7kZFS
	 t5mPg2ZRYDxsikZ76a8gSv4nYoJp5Yc9fQrmHKXGGocOyOqXzXaiRr/CRqqx4x2L4buhz
	 qfSjQZQfTAmndtcejXq8gZ3jeLDcMBHJc5BdpoA+wHuITpgMuR6AKH8FMga0OnlQ2Aswp
	 L4+Kux45epD+JmWoMHhV90l1qMaZfZgDkpLPLzhzSBnLzD6f0ttLa9opCaZWU89Bjmm1D
	 aFegdnSA5FxCdrxKdO2BHV/qJg8ROPXKlvSQwv+gC4MfD+HtNyVo+ngFJfnXGKHlzDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627078;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pV/q3rygvTNJft805Q/xRn3FBFLgVH8J4358p+LafxI=;
	b=FyM2Iqe2pDd4T90g0uHERRzG9kNZcRy4zBjaprwc/mZhdotGhCXSlCqgM0e7XUayIvqM
	 RiS0aDRLLDpVQQCm+0cVqEvMObTnzWCdVT0c5PDttOLJ/aQZfYvniOTI9v4PakfGfVcJ5
	 W3nN2pWzQ3HAz0yppplwRVHE7PrzzOA8Gtfac/NG1j88bp/d6Lg7SoFjOIvIodZbUkEUy
	 LQA03v1DEXLByUVb16dhGIUXoU7aiDQWxMofKI0PAHjNQwbKSE88fm0qpGIG3hxLePVOR
	 eKT9QpB1a6uRjdw02BDB6yqcPNw5F5IsQ6i+PWQrQvRQsn7JE+QhrjaxbYBIctxMF+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMUMv8fT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5CF606A324;
	Mon,  2 Nov 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMUMv8fT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28D11F00A16;
	Mon,  2 Nov 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627077;
	bh=pV/q3rygvTNJft805Q/xRn3FBFLgVH8J4358p+LafxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UMUMv8fTM622JP11N27VHsmGA4Nj4vDdyjYV67GhAxg8p2nxtzVQyXUYzQ8bClEAr
	 9W7AHA99LIuBg0G1yLe6FreHoo1+JbMNKYt5EGy+5YpUGHXHsm7Q1I4eBs9iLs0uj1
	 SdUOZOrkP/neVsNweE3vgMPT8SaDi7Fec0xNZKTDn3rbTXM4qP2Efl4mhy/NHOtdj0
	 b8nOaK6dwlQYbfM525aamrziakYW8ZP3rcAPPBctt+IWqQLNFv/8HcT2+4VxX6cSPg
	 5d9+jxPH+NnY1F7srNpfMxLXC2/TBNBMtQ5B3PvssoAqNKhNa68jhNVF0aaBolj5ko
	 IRXS94Vi0AOSg==
Date: Mon, 2 Nov 2026 13:50:17 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Speed up KConfig - fix hashtable confusion
Message-ID: <auiHCdQEeuo2rys-@derry.ads.avm.de>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
 <20261102102627.526313-1-sashal@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102102627.526313-1-sashal@kernel.org>

On Mon, Nov 02, 2026 at 05:26:27AM -0500, Sasha Levin wrote:
> On Sun, Nov 01, 2026 at 12:08:15PM -0800, Linus Torvalds wrote:
> > The reason is that it's called just a lot, but it *really* doesn't
> > help that the scripting versions of the hashtable functions has not
> > understood the subtler issues of the hashing code that it took from
> > the kernel side, and in the process got things very very wrong.
> 
> I'm not sure why we have a copy of include/linux/hashtable.h in
> scripts/, but it's silly that it has diverged slightly from what we do
> in-kernel, and now we're chasing bugs caused by that divergence.
> 
> Can we instead align both back to be the same, or even use
> include/linux/hashtable.h directly from scripts/?

I think that matches Julian's proposal.  For include/linux/hashtable.h,
it may be a good idea to use it directly from include/linux/, but in
general we should be careful when re-using kernel internal header files
for host tooling.  I am afraid we may put a burden on changes on these
if we (mis)use them in a non-kernel context.  But yes, we should
consider at least regular syncing in some way to prevent repeating
mistakes.

-- 
Nicolas
