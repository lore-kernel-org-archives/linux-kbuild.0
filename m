Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421434;
	b=SOKVzF8geaFudyS3VXrrsisfHMASkGjoW+XRw9F1Q0s9duK+ckmuxAK1HKWcxTmZB2qJ
	 nuAcSUIH12Q6GUNA/c21J7ZWJNxSQJyVT4XLXatDCmUzKfKXUmG38o2MorOqdN3VUt9Le
	 SYyTdcSZSB6VU37pXtcexrMoszBphK31r69/WrxeEfoACMIfhyGOfbBIx1XSMOdIjfyuS
	 eq83LBV7k5wa2lHnnddnXIvBgWM5uvpnI6H1/n3yJw3CTcdaF2YPjqDjkImEJ6Lp4sPtQ
	 rUBS+s1XIZez+xeuiir2DDWNGmLL7ONmWGDem/AFPwF9T5zI1qLaFPYobzQIwlzFqNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421434;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+5r94kBhSyoTj9wXK6JW6+FDLjCWm0/KAzeGsgyJNkY=;
	b=0KbjjDiJRoeHL4JBcpaNTCr4F4lcC+97XpVQ/Le+9yhHG4ErjbbazqyZrbwPAepBN+7e
	 LcfLKyLO3A7mFjCY1hmjA95pNZQrTbfNO0vY4WiwyvLVkHT6BFFcTaKmtl9Xy0c5URBIw
	 tvwEH/SRIOk+AfP1m2gzU/FrHpeyAV2v7qSRF4V47EtTx+SjQhFHyL5pxhETEmN5LW70D
	 DQYZIZgbvBILi2ywnk4FXiXWen0bcr5GwsvBFEB3uIjZGStRAFc3kRSWS3tVQBKouY2hl
	 ua9eZCmgtXM+N3mGRWXobWIqy4PDuymCe3M7KqEnCapjFCv6fdGPBYhlYxAJA9vtqQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RfUUMbfu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823E0606A31C;
	Wed, 11 Nov 2026 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RfUUMbfu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965B81F00A05;
	Wed, 11 Nov 2026 18:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794421434;
	bh=+5r94kBhSyoTj9wXK6JW6+FDLjCWm0/KAzeGsgyJNkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RfUUMbfuQZDxcZFcfbwfYFolkkaKNSd4HnAqoWAsIYj6oUvs/G2J2KjHGMb6iUL5U
	 2vz053gUP6fb4LF1BpZYHLfuQvTF2h+nngsLyiLW6X52uFDBNB4gtCfYibaid7z2HV
	 /yAVGU0tWqlIVGQZAljs/H+KRY3p9PEA+ox+zwem8nr2pjSm5likGhvul7DfmswYaf
	 thXXbMtIneTcA6CipoqlEHeAOB7LJr6IYVbSr/ofl6VuvyyEh3aHdJTbk+sSSZa/fO
	 4El92gzNz7doMInBJSK2y5+oRjMqTaOKGo14UQMg5zbykAVqjKzmRU/hjICgXamLPz
	 3Iy+/BWmH+scQ==
Date: Wed, 11 Nov 2026 11:23:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Schier <nsc@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] ARM: kprobes: Rename test-kprobes.ko to
 test-kprobes-arm.ko
Message-ID: <20261111182349.GA1452558@ax162>
References: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
 <09d5963c-4255-4da0-8c36-5624696ab633@app.fastmail.com>
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
In-Reply-To: <09d5963c-4255-4da0-8c36-5624696ab633@app.fastmail.com>

On Wed, Nov 11, 2026 at 08:24:44AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 9, 2026, at 07:46, Nathan Chancellor wrote:
> > When scripts/modules-check.sh is fixed to normalize the module's name
> > like name-fix-token does in scripts/Makefile.lib before checking that it
> > is unique [1], there is an error due to lib/tests/test_kprobes.ko and
> > arch/arm/probes/kprobes/test-kprobes.ko having the same module name.
> >
> >   error: the following would cause module name conflict:
> >     arch/arm/probes/kprobes/test-kprobes.ko
> >     lib/tests/test_kprobes.ko
> >
> >   $ modinfo arch/arm/probes/kprobes/test-kprobes.ko 
> > lib/tests/test_kprobes.ko | grep name:
> >   filename:       arch/arm/probes/kprobes/test-kprobes.ko
> >   name:           test_kprobes
> >   filename:       lib/tests/test_kprobes.ko
> >   name:           test_kprobes
> >
> > Rename arch/arm/probes/kprobes/test-kprobes.ko to test-kprobes-arm.ko to
> > make its module name unique and clear up the error.
> >
> > Reported-by: Sasha Levin <sashal@kernel.org>
> > Closes: https://lore.kernel.org/20261108225808.1809266-1-sashal@kernel.org/
> > Link: https://lore.kernel.org/20261103110411.11698-1-info@daylightlinux.ch/ [1]
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks a lot! Nicolas, can you pick this up?

-- 
Cheers,
Nathan
