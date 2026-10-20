Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460338;
	b=Ao3FYSJqRC1Zd5Z/gYuMpgAay2dTZAspy8CeGdJb6cyq320OqCzvIGE+eaR0ME1/F4XE
	 7Y7sJ2LjhdtNpJs23R+S5xYlOPq6ZAxE1PXSOCC0yb6n1f7Zmf8gKGpjpQ6oQNwN5tGja
	 wiL+hm8Hv9R0Mi/MMv6BzxY1iqw14673UJ/5vfcLKloa2xLv5lI6YnGM7efOw31IQ6GEV
	 RS4RGvvZj6j+H5+iJsBkojjrsXPzIehjWniAwdvOzFiUpDrexp6YQIbXEdExXs3NpmmaG
	 f1bWrwvGt9tF/RC+66PAKNAXoDr/Km+Kj0JqVGAeNMPK9cOZ8YAZouVgaTlFt2rOjFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460338;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Vo7/8LM05tSK+oz7b3ETqcVOFj0Q1sdDflxAsg75ScY=;
	b=f4+2oEyyFqR61TRPk/tT0keG38JCRkphhK6hRhZamZXFNVhpXjJLetUkqEB02+7AbSQ8
	 EwzyrzvcELmi1/TA1DYyRMeJfQurExCQNWApXzhuNdYeeaWB7KIVZVkLuGqne5XCXmzbd
	 uiEDeVaqcsK3+408fIU3DbbBWmCDAhr8c29CLp9Asqp+zUsEGWoKkWh7a/x+jmA4HBYPq
	 pGWFVEDXHqlOTP/BVLov9qHNAwR9FuMEEf15/GJT7S67Z15HHrRrbMQnwkA4Fk1tyr4Ay
	 phc8aFHhbydFVI5XzxAzC9YwYadWYHY7eDoUihGBi3zosrkTqQzIiKnwLMwJGRUpUaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h4cQpxHk;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C027606A31B
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 01:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C027606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h4cQpxHk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vo7/8LM05tSK+oz7b3ETqcVOFj0Q1sdDflxAsg75ScY=; b=h4cQpxHkelcP2WplI2wWrEi6L+
	wxwv1aEO6jjATmQ0ynQskAuzvbwJ5ff4cUJNpzeXffXIH1pK2Euu9JWuZkz+q4sV46vcG9qjZCWp7
	iJSJ9ilJywVncIN7cFdcTg1WadlQeIkwbjdYap3H16G34vNRbRhxG/ebw9bNVXsIxq76ZgoGIX/Xw
	Zuxx9BBBeezcX9jRHU+k22FrShhF04g4NEjS3FVCc6yD/H5xdq8QPoECBJt9aUIsRw83c4583s+z0
	0Et294EQf8hFeQEH51yZWb1lwu2wT1P51wTDyyOYX97ynoAkfa7MjB+O2y0bskTwvKEbnwSL0jjBD
	kM3iAS0g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyoa-00000008d9S-0YFU;
	Tue, 20 Oct 2026 01:38:56 +0000
Message-ID: <a2209e20-b50f-4642-9a2b-5cee734aeaf6@infradead.org>
Date: Mon, 19 Oct 2026 18:38:55 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: improve sanity check for ARCH variable on x86
To: Cao Jin <pino.cao2022@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org
References: <20261020001738.2607318-1-pino.cao2022@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261020001738.2607318-1-pino.cao2022@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/19/26 5:17 PM, Cao Jin wrote:
> When building for x86, ARCH=i{4,5,6}86 and x86_32 will fail the build.
> Make it catch all name variants.
> ---
>  Makefile | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 7c855e6fe544..cd397027891a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -409,12 +409,10 @@ ARCH		?= $(SUBARCH)
>  UTS_MACHINE 	:= $(ARCH)
>  SRCARCH 	:= $(ARCH)
>  
> -# Additional ARCH settings for x86
> -ifeq ($(ARCH),i386)
> -        SRCARCH := x86
> -endif
> -ifeq ($(ARCH),x86_64)
> -        SRCARCH := x86
> +# Additional sanity check for cmdline ARCH settings for x86. This catch
> +# more name variants than "i386" and "x86_64".
> +ifneq ($(findstring 86,$(ARCH)),)
> +    SRCARCH := x86
>  endif
>  
>  # Additional ARCH settings for sparc

From Documentation/kbuild/kbuild.rst:

ARCH
----
Set ARCH to the architecture to be built.

In most cases the name of the architecture is the same as the
directory name found in the arch/ directory.

But some architectures such as x86 and sparc have aliases.

- x86: i386 for 32 bit, x86_64 for 64 bit
- parisc: parisc64 for 64 bit
- sparc: sparc32 for 32 bit, sparc64 for 64 bit

-- 
~Randy

