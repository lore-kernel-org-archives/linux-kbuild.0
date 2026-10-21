Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609395;
	b=VAOyCGlnZsR2yWm13EcU6OEBbcbMKuZK5iho2PD0jTqiugrWNj9gkHLz9XWFzvu4brA4
	 JI8IyPYW0Wl2m4D+CqXe9tQL/G2pLyMXXYrBcodZ6bQgp14p5zo0zxgSZIM50bGbK4Plx
	 m1aVYEHzcL0l4H05Pb602RpBr9d9e7ayKCeQw+AbAjyrkcWUJdL6HWW4gFUDhGcMZ0b9U
	 EhjDr+Cf6LPufa6j1F6ErGY5Zc58Fm7h8wgrZ2w52eQIX/82tfj3posC3BxfHcdq1FoE5
	 TjxnvQScixIkLsEqh/LUyF6G9SKiZvXJmAVNPV49zg35k7UGzl130qy6HZYDl9U+P+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609395;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=orXTBbf0coPXSg7bdmSFg7fWGZXhMKNKnBJ97rjbUEM=;
	b=APzG6Cifx2fckTjcyj3QxyDkU8MKrlKDJZH3Y7BbTq8Lq7e/8lqOHNHPctyQmYo2/5aW
	 j0OIwLaCQ+Th3UCWXhiWdN7LsThmYTCT1DyoZ+UNXlYdPLX0w/I8zAHPWHvKASZRZUeCs
	 IVI6RBdW+P7bI8hOosDGjwQ5Sr7RkFnmscJVfWX2/oLX+Q2Veisuj12uSak83u9UrA4RI
	 LjUcgAxrYYqmohIiHziauTg/jj79659nq/E8A1qxD8AX1ksyzot1+H5CEfMjftAY/yxMT
	 h6wjjrtiBPeVeZoSvRKnm+hwrwVyioMnTofbfJVKvkDhluwACdQ68RrlrY6JBhVjHOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iw9k01OE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCDF606A319;
	Wed, 21 Oct 2026 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iw9k01OE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258DA1F000C1;
	Wed, 21 Oct 2026 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792609395;
	bh=orXTBbf0coPXSg7bdmSFg7fWGZXhMKNKnBJ97rjbUEM=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=Iw9k01OEowX+OoHwE0puHeqR7PpORtBCgZ2+SFQHfz13rpx3ZYQOmyI1Ajkgz66tV
	 CE6caahijYs6uUFIRbMhu1DhMgQntli1WV1BZQXADPOqppNMrXj56mPZLRVrdhT6J/
	 q5ct/ldn3OVf99ibpGUe8V3X8M63OrCtiCXcJLULxeV49RklboMkLJVkmauV6acaQC
	 bFK6qmfvz6ApYfFLYVxZOYOx1TdCnFx4mwWx60MINWgo3OWfvbC7MInqspL9TlzoKx
	 YN6RjDPEfPuIm4BI4jkOQmfbA59m/T62gwxlhfhMrhIVns+7CRErKP30FVWpa05BF2
	 Pe1CA9CJL25Hw==
Date: Wed, 21 Oct 2026 12:03:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>,
	Mathias Krause <minipli@grsecurity.net>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: prevent building single targets twice
Message-ID: <20261021190311.GB2611266@ax162>
References: <20260923123936.2227924-1-minipli@grsecurity.net>
 <5836ab69-cfa6-41cc-a28b-5bd3ecfaea03@grsecurity.net>
 <atjwobCk-mdeIlkd@levanger>
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
In-Reply-To: <atjwobCk-mdeIlkd@levanger>

On Wed, Oct 21, 2026 at 07:04:33PM +0200, Nicolas Schier wrote:
> On Wed, Oct 21, 2026 at 08:53:56AM +0200, Mathias Krause wrote:
> > Ping! I know, it's the merge window but this patch may have fallen
> > through the cracks as there was no response so far. Just trying to take
> > care it doesn't get lost.
> 
> thanks for the ping.  The patch is in my review queue for the upcoming
> cycle.

Same, I will try to review it this week or next once I clear my tip of
tree clang regressions backlog and Kbuild merge window madness.

-- 
Cheers,
Nathan
