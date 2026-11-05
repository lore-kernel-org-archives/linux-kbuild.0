Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852277;
	b=ROTJ8Ry9TOO1cB43AmP1ZeEPY80J8Iu8EjoUW01Ljiac1RretGgaL7PqsCcqn8mydnRC
	 1fRr/b41bTLP6xsuPUuzIkCu4oPhai9K6To+4wbX7rJDT7YvsB8bbq4SsdNor/x48PSqb
	 nyI1DVom+eB99BD+GTUqhmMDtgY0f3z9lVhYTb13zFS/o+cgt+Xu0OVr8EbvvFc+oM11N
	 Xjfv/T+fQjFyMW34wDGlfxJCrAw2tsaHlmOSxdBRqKCK2HJUQfFDfO6xhb757O11C9/kw
	 YuuI/qCMZpBOjDVHbRIYB0DP2mI7iZsjAsqCLhdv3vn1cjsPM84xnwgUwDuNSTyAxTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852277;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QD8SvwAiAWZYGMrbe19s5nege6XPq+uxgEB7/uwXP48=;
	b=ve6d6n8fjuF9zVX5BCiuZOFGPMB/SNv52neW2v9Z4alfYEJyEyO7jUd8VB/pbWx5XCdj
	 Vhx9mrA//9teZVNU41VRWy8d1Yzr9TyjANLHsJDC9NGAeNnUNO1DLL9DoWddao2Piwq9b
	 tK9hMLT9o7lTNS03oKYwiaTQc3qCCXtKYc7nH8GnytCCNAsHdRPrCPVl/dMaWpMAN8vkC
	 cgNzm/gchBzfnCCIFd5opGWwAE07fJ2rit8naWFFxs81o4jg6+LhGFAVD6zvZnwVCJAtG
	 NAcBQv9JscX8WQbqzHcVUJBikueOhSENi3bPuzJpQ72ANIo0XHrtMuo2P1mgaFeu3cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XFok9zJ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D6E606A326;
	Thu,  5 Nov 2026 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFok9zJ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4EE1F000C1;
	Thu,  5 Nov 2026 04:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793852276;
	bh=QD8SvwAiAWZYGMrbe19s5nege6XPq+uxgEB7/uwXP48=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XFok9zJ/VA1ubAhuonF7BFS1SpnebW0rylH6fKkHrIaXFXpr3ehCTxwvNvk8px2qb
	 UJ0REX2PW2q81R8/QU4XBqARzWUVIxUN1fEULmXP6YweDOyzMLPXrQ0s7Jhh/UhB40
	 4RAXG4Dn7uLcNSSRUgGiSaEd3Be/n4SOWdi56nDM8TbSOezbnWyjGOO62UsCdRlK7R
	 zygbU3yJ9Lr1WhhicAfITi1QyZ63c2OoH42Llm+MV7HVFiBZrx01xKx5UQaJyDiPMW
	 fgMhRiCoUr+qL2c2Gn8v3lgwNGIjiMR227CQlEHOfluyfC6E/AClvvIztUWlnU1DTz
	 gdS1Tv53ARlRw==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, 
 a.hindborg@kernel.org, nico@fluxnic.net, rdunlap@infradead.org, 
 grahamr@qti.qualcomm.com, jakub.git@horky.net, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
In-Reply-To: <20261010095001.265759-1-julianbraha@gmail.com>
References: <20261010095001.265759-1-julianbraha@gmail.com>
Date: Wed, 04 Nov 2026 21:17:44 -0700
Message-Id: <179385226473.826739.16877681288448258281.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bCakXyIAHrC/AjpezCW5AHd8O2Lr9QbGlS75FU5t3kg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlvmPP/WP+co8F6mXUrJ5987af2MI3lJv8EmVxOHGjpY
 Ph/+P29jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARVXdGhmNyoq8OLv+g/vRd
 aNbUDIm5F870xxUeeSrk9mfOzTt7tmxiZDjNss80fMXkN0XL3dYH6wntjU9Sutayfk7H8fd2bfH
 FU9kA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> In an offline conversation, Miguel Ojeda reported that scrolling
> horizontally in menuconfig's search to read RUST's dependencies has been
> slowing down debugging.
> 
> Let's wrap expressions (like in the 'Depends on', 'Selected by', or
> 'Range' sections) between tokens at the end of the window, such that each
> line begins with the same indentation. Ensure the '!' negation stays
> attached to the left side of the option symbol, and keep the value
> annotation attached to the right side when wrapping.
> 
> Note that the 'help' textbox uses the same expression printer as search,
> so this has the side effect of improving the formatting in 'help', too.
> 
> In the future, we should consider a larger revamp that would wrap all text
> in the search window, allowing us to safely disable horizontal scrolling.
> 
> Assisted-by: LLM
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

I spend some time searching for random symbols to see if all long
depends or selects lines looked seriously broken and I did not find
anything.

Tested-by: Nathan Chancellor <nathan@kernel.org>

Like you said down thread, this seems much better than what we currently
have, which is nothing. The Sashiko comments [1] seem rather contrived
(if valid at all, I did not check closely) but it seems reasonable not
to get things wrong off rip so with those fixed (if necessary), we can
probably get this into -next to see if there is anyting we immediately
need to tweak.

If you need to respin, you can drop the Assisted-by, it is not longer
used per

  1e035297ffda ("docs: remove Assisted-by references")

[1]: https://sashiko.dev/#/patchset/20261010095001.265759-1-julianbraha@gmail.com

-- 
Cheers,
Nathan

