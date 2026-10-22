Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697835;
	b=fiq0prg1M69j0lshmyb64uZpfA/mXtglUFE6WG5xDzZBwvDG3UDuYvleag+9ByBeyIXo
	 ManHVPMz/XQ3EEpWqa8ryaeEgwOTwxws18dMcPY7jVj4R6+DDCczj4sV97iQM3RJksb53
	 MARSicUwLOSAQQ3lMc3TGoupHdWtl94qDmYVCmlwxDmptk3TmvrxjZVrhKCLZvXRjDGPg
	 Y9lk1jezuLzWuM/z7L25BoSVWBG5wU4FkD5YwZG64GS5iaEoKz5i7+yHzTwxz1AQwYVRD
	 9YQz4H5yreStqYRq2PnAiI76kp2qz5SZGSt0JOZi+nSMJPSYJeG1EYe8ZYuuCQKfzjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697835;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ga5QpnRjPXHqhboG/cUYRjEfpbQW5D9Yyb2EyECS0fc=;
	b=jEUcWf58/6HmRV8Yy/IPX55VkzijDwEhgKA0ZTvfW7XII7wRC78MPGF3X9HeYXGvihEn
	 tVZSYYECFpPBC/QPeQvX/TF3MUsfaArSV1vZv6KfKbLKj7ZtazThYVez/zOPHJhs/fzer
	 kQFwbBS1r+XPGdvJo6hKGy9iXJgyHHjsdzkQpc799JP1007/swbj6kgjrOSs5jFmYnhME
	 VuaqEOGi2uOpywfgVvSvDyUcL5kjmkDsl/TO90R2zAwWPjaALqEmcKp1mnZSjd3al/BDK
	 dQEwsnKLWkjzY7JPPQwRvDiVZp9y4bFf9y5kTtkAbnbHXnPfBRG32pTgLvG4OgpfSHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0jibogy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE6606A319;
	Thu, 22 Oct 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0jibogy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042D41F01825;
	Thu, 22 Oct 2026 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792697835;
	bh=Ga5QpnRjPXHqhboG/cUYRjEfpbQW5D9Yyb2EyECS0fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I0jibogyBmj1MkYdf9V+35VbzRBlIdyEsqQDvfqXzm7SaQFym9yLx1QDZVtyACI52
	 uz0DxJgjiL3G5pKvSCPaYd88z4Dw8D+2p3tYdPromaaVjgWx745Tepi3v5RTdxMe4K
	 JIffXqUSZ++HIDwqJg8LwBDGbFdpkXDTO70In3phXY3Jg1Xxj8BCDuld/RelEKMBeR
	 4XJNKbNvb3V7MN8IsQtorgCk/bVFuctehb3g/tiAp4CA84FNtS0jTCBy4fnIKvcU+f
	 9oq6iq+87yY9wrQqSnmZxEfgG2p3K3d+7faTZwJTLHLyzMfBeHoB+jL8C0i8ZjUnLZ
	 mKDkPgEnQ3p9w==
Date: Thu, 22 Oct 2026 12:37:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mathias Krause <minipli@grsecurity.net>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: prevent building single targets twice
Message-ID: <20261022193711.GB3692072@ax162>
References: <20260923123936.2227924-1-minipli@grsecurity.net>
 <5836ab69-cfa6-41cc-a28b-5bd3ecfaea03@grsecurity.net>
 <atjwobCk-mdeIlkd@levanger>
 <20261021190311.GB2611266@ax162>
 <aad229bb-27c2-4c5f-bfce-73d2a0d04996@grsecurity.net>
 <20261021215524.GA627677@ax162>
 <e313803a-47ba-4d27-89d9-47dd1abb5183@grsecurity.net>
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
In-Reply-To: <e313803a-47ba-4d27-89d9-47dd1abb5183@grsecurity.net>

On Thu, Oct 22, 2026 at 12:05:27PM +0200, Mathias Krause wrote:
> Already visible in the diff context is 'libs-y' which has the same issue
> and a real behavioral change, depending on which compiler invocation
> runs last for arch/x86/lib/delay.o, it'll either be compiled with or
> without -pg under KCSAN.

Ah, I had not realized that libs-y suffered from the same problem.

> Others are:
> - arch/x86/platform/pvh/enlighten.o (via arch/x86/Kbuild),
> - drivers/char/ipmi/ipmi_msghandler.o (via drivers/Makefile,
>   intentionally there for init ordering),
> - drivers/input/serio/i8042.o (also via drivers/Makefile)
> 
> But what's worse, your change also affects link order which also defines
> runtime initialization order. I don't want to crawl into that rabbit
> hole and look for all the implicit dependencies that'd be broken by that
> change...
> 
> One obvious, however, would be pci_subsys_init() which would then run
> before acpi_init(), leaving out ACPI-discovered PCI roots from getting
> discovered.
> 
> So no, I don't like your change and prefer the more fundamental kbuild
> fix to get this sorted out once for all.

Totally fair, I had briefly thought about that but did not fully
consider all implications, so thanks for pointing that out.

I'll keep your change in my review queue and study it soon.

-- 
Cheers,
Nathan
