Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609142;
	b=njhMKKdLe7o2EP9gQqT47HiCcunZTtfe1J7KvLHKBDhkpq8ZGMwQ+Tb8CIn4tL8XMgUJ
	 Z52w7w6fYFsGx0AsoClwaiYiZHF4NG/Bf+trrsnjMsrhWwlGLWne7UFCIyY5PmSk/sHk5
	 yFmeum9s3DAIrWvVxc0UfHfNv1Og7UjRpFUVN8wDKJ5KlF/Eas9oYbq/H/yy3HIuDqfUR
	 FPjDxT1zNnUgFgnBL/BBIuLMHKi+8coA0ajlHQ2nAfT9B+fjSHgc1LdERZ1BTf8GLqA3P
	 IHY/N9ZltbY8e3C+eQ4vD2mIpdBE7LSFS/flYKWJnN42R5zJ1PICNDjlsX0CjpStFdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609142;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=IE46uUimPZ2OrMix9QdgrETw93S8Yz4lO5oDBNbPDxM=;
	b=V3wfFI9IuvpwTreblg3/c70Rkfxv6PqgeH7H4GL5kxnmt0H4DLDzvLyWajnFzvhdw+tR
	 I66DtHw4lHB0V9pM/U8kjXJZB6V6CVTqWuchrqpJdyygqsto7elPGj0TkUo/z3NXB82Kw
	 pYYlpW1v37ydMZ7wcKaS/q0WHqElIlnyNXJtRQXkL5kFcOXoxFGpSZTMTNGZxRd86rPq7
	 jk51hkkIlQKeja+5GnP8jQp5NQITrzA7Rd8PderzwNzyTTsAliruZ4sh7npYiL6KmoSpy
	 UCESxxWCJJsQq/TBtmJj80ER0GsCF/lJ4IVTFsCQYEieHY+gbGidkdkCpPBoVd/X08g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B2SzQHwM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC26606A319;
	Wed, 21 Oct 2026 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B2SzQHwM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8991F000C1;
	Wed, 21 Oct 2026 18:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792609142;
	bh=IE46uUimPZ2OrMix9QdgrETw93S8Yz4lO5oDBNbPDxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B2SzQHwMFu/kHIndlhBoY4fqkhEQ82z/N/IvKA74NRjlF5OEClO79qeUgsOOtGzWn
	 jFdOlJ8fEMULZny7pDtgJloVpJfJmzvB/c+sS4Pgc9OQ3Q/k5qEww6H2uG6pCCxPLg
	 2czxJADB8Yju5JWOHIdv8QT0UYqmgTfCbGPYQ7BqhqhQ9YE9JiPPsk/UJ3+Ya0RpCa
	 q2nD1FdlbforpMLEIbkktkaQQIpV83pkiodsVuhnu3sL5ppAiFGS+eoWFptcoRl4PE
	 u8mDzq2WIZTfF60IqTyXEaVhsSr+rOoZhLFa86GJWxt0G96z29qK6zQXNV5Ydsa8ZP
	 pzqzRK1sV4OfQ==
Date: Wed, 21 Oct 2026 11:58:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Turner <mattst88@gmail.com>
Subject: Re: linux-next: manual merge of the kbuild-current tree with the
 origin tree
Message-ID: <20261021185857.GB2608581@ax162>
References: <atibhAMcgKle37-g@sirena.co.uk>
 <CA+=Fv5SUHkGtBPgzg9C1qGf6aiiFTVpStPd6Os3mTrz_+_5dKA@mail.gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+=Fv5SUHkGtBPgzg9C1qGf6aiiFTVpStPd6Os3mTrz_+_5dKA@mail.gmail.com>

On Wed, Oct 21, 2026 at 04:40:22PM +0200, Magnus Lindholm wrote:
> On Wed, Oct 21, 2026 at 1:01 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the kbuild-current tree got a conflict in:
> >
> >   arch/alpha/boot/Makefile
> >
> > between commit:
> >
> >   c437950dceb88 ("alpha: add self-extracting compressed kernel boot stub")
> >
> > from the origin tree and commit:
> >
> >   0d4d70da348b0 ("kbuild: Mark the gzip recipes as recursive")
> >
> > from the kbuild-current tree.

Thank you for the heads up, I have let Linus know about this one since
it is a little tricky.

  https://lore.kernel.org/20261021184723.GA2608581@ax162/

> Thanks for resolving this.
> 
> This recipe now only copies the completed image, so I think it
> should stay without '+'. Matt's series moved compression into
> arch/alpha/boot/compressed/Makefile, where the change should be:
> 
>  $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
> - $(call if_changed,gzip)
> + +$(call if_changed,gzip)
> 
> The existing vmlinux.nh.gz gzip recipe in arch/alpha/boot/Makefile
> still needs the '+' from the kbuild patch.

Correct, thank you for catching this.

> Maybe adjust the resolution accordingly?

Since the conflict came from Linus's tree, I have resolved this in
kbuild-fixes-for-next so that Mark does not have to worry about this:

  https://git.kernel.org/kbuild/c/83deedcf85af511dc120b3cd8ee597d211cdf2fb

On a related note, is your tree flowing into -next? The recent
pull requests for alpha have come from your lindholm/alpha tree but
Next/Trees shows Matt's mattst88/alpha. Should that be changed? It would
not have saved much here since I send my pull request to Linus before
c437950dceb88 was applied in your tree as far as I can tell but it is
always good to catch these things early.

-- 
Cheers,
Nathan
