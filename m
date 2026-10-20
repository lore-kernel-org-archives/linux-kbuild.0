Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458012;
	b=N/x8CPh4YYwkjy0RIQ+d8y8svwk+3C2OdDaF/vkBOYCB8krRNMvnU5Cbl5qnIoQN8pZ1
	 sBqbO/zJAoejT7sGo/xs5ZXgrK/lYBLAg2DfIJARnwwAP9uMnJGredjx7P8cw5A3r/OR5
	 Ra/mRVNCK9u+aki5/mleIiy4HeRj6s0ooMFO2HUI8vmrHcfA/MHDf6zG46UnbEnVz2Ihz
	 rdQg8mlaSemdp7XVnaeLEmg8Q+J8WulHNV0rVZr+La4EQEmKPu/sV/U98mq2XKoIW8FTQ
	 JgcYmaiYhkURPIrsMbY2aaTLSZd6AEkoB9Mts0nbz9rnx67SoHlFZXLPqOJfj6y2yGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458012;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wpfelmvTfPvtCcOi3m8ekZyAxlAMKVmaTTaJ7JsaK1M=;
	b=xCeh9KvHI3KGJbFHwpeFpc2p6WvXN08IEm/6NLr6ITDFaKBLV6jRMOphy4Bx3JSKWRen
	 LljNbfFWfK64PmCTyEiU0eiB1Nrq3Hv82z3lcA4JGpw/5iIJnyEaoKFTTHlNHkPiLxGf1
	 uYFwOYblnZ4vlpY7LZiLQRuZM5QJ/McFjGyoTxmSDUOK96bb7aCyQYkEqn4RfrbVvHNpP
	 5IvwKJoTvPriHnu+5JzZ/sytW9F1jJg2px8AiEQAetahPfOzJmufTfMKqvsxmn/JfkKbH
	 z9uIztit0xEf+Sd6tw1Q8TZCLkut+qmG05CNOGO0i2R1adeJyCkRJk+3c4+yBnJOFeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=a8xX94Da;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4DE606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 01:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E4DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=a8xX94Da
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D6CE640E02A0;
	Tue, 20 Oct 2026 01:00:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Igqvotj-0hx8; Tue, 20 Oct 2026 01:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792458005; bh=wpfelmvTfPvtCcOi3m8ekZyAxlAMKVmaTTaJ7JsaK1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8xX94DatTelIHnzGi4WfLd/rnDzjEaFQjd+r/oPA7a/UTHZ6UfDGS8c9dAgzTuRJ
	 E8cH1Ce2w23XgA1QwHMdOPRLu2oc3B9dAkcW+2SEPxhmk3OfDsCIBG2JODRYhU2Hys
	 bGSKD2je2wmbf5Ypl2G2Jr+Lg4iZHuT6LT5ArtjSDAuwwLWGRPgNzCIIyMK9YyaErt
	 mhyrSTE4LXRyVqjc2LDe9sCen/Uo74o+nTSHlRA3Vq0eruHqtr9QRce0RhZFOT6PQE
	 gSK+bUM3uUuj2w+lhYG4j/MdMw7EG8wSDh3z+qmqzUYcnOKiLZ4plJ6VuD4REb7seJ
	 SaY1HFJXw3gNZ3K5vRql8AcErSNMySWKh5B8ZfsB9RV43xqr7KQ5Y19Lrxy8iNPt/G
	 00uWZGAuEnaW1jmflQXMUQ/Ej7DKgRw0H6i7dsvo8JDqcU3NkSbvRARP5sGI+GsjhN
	 W9KGN8ffGCPl2trEWT5NADgg3xRiiHaFC9StA2i5gRjLN26PLuJeym2FtZbk4Sv9tT
	 f4gTD1RgKgYvy9It3aJiUtk1Q4GOuQS8+zlW2lt3hhzbthCBKcM3OZKtcyTkaBUlIH
	 tYcJ2RMdJtjXnpz/D0AzP2GfD64IyfCYEPEwqw42jUvYrkY9R6VYOjUSJPpexnpOla
	 BjJbiKno9lduCg45oGIJFa0E=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4A10240E00E8;
	Tue, 20 Oct 2026 01:00:00 +0000 (UTC)
Date: Mon, 19 Oct 2026 17:59:56 -0700
From: Borislav Petkov <bp@alien8.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Cao Jin <pino.cao2022@gmail.com>, nsc@kernel.org,
	linux-kbuild@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] kbuild: improve sanity check for ARCH variable on x86
Message-ID: <20261020005956.GAata9DF4VOpqO71es@fat_crate.local>
References: <20261020001738.2607318-1-pino.cao2022@gmail.com>
 <20261020003625.GA787785@ax162>
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
In-Reply-To: <20261020003625.GA787785@ax162>

On Mon, Oct 19, 2026 at 05:36:25PM -0700, Nathan Chancellor wrote:
> On Mon, Oct 19, 2026 at 05:17:38PM -0700, Cao Jin wrote:
> > When building for x86, ARCH=i{4,5,6}86 and x86_32 will fail the build.
> 
> Thanks for the patch. Where is it documented that these other options
> are valid? It seems like this is just expected behavior because these
> are not valid values for setting ARCH for x86. At the very least, I
> think something like this needs to be acked by the x86 folks.

I hardly doubt that it'll ever be without a proper explanation why.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
