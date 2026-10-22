Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663531;
	b=buf/d+Xcn9hMW7rLvJpe6D/B8ZwRtxHP53jtJaP3f38gV7k7GCYRPf4mHBoKVAP1i1wz
	 eKUCdcvfCyPy49j1ICjM39qHbNS8Y5K1wqiJ8PW6hy1ifWTHrsxT1ARRaaU5m9qqBtU4r
	 Bm7uuN+ZZQUP0osRCKZXJsuhU5ryOsjyjkjUbJ/B8/hkeCTw86BG2XxydjeGDO1oq4hTR
	 fmGxksV8+ZYiWN2rhPCBj5/V/S4JN+t0hS5IcVeZAz7/446s1F+jJ7J/oh3kipSR2GtYp
	 1NM0Hh5DNH1hEBGRLiSoYMIHpuoo4Cz2L+S4TI2Uu11T14+bQvxetxJlWu/3rM4ujXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QbgiR1/GwtHwlpzlTkLd58KzVem/7L0NcwdC+dKmgtw=;
	b=0gDb0FyF1eEyZWPog7EUev3UZJyildh8j6/neBM5Fp22pnFkImkNlLHyWr/O1FEMEyqL
	 gZ+CtDZ7yRNpktXd4SB5noRU+urn7M5F6ktf1wqdMqPy8YCl2KIbRwFHmH53HuEULQfcu
	 7NpyP1JBKACj28asZL3dcMZG5LgLv7zSAtZ+58PcAGq7v8+PFBOW8EZGxf9d4pBcEeEHn
	 l3sKvQwbJyWNpTVcxXUa+UIIAW2Lhq3mI6AmKci7govWwWuOqkQJ2APbsdYs3AvEVNuxu
	 wI1fxT91Ktz3U5w+ItqrFWyD8MYT4oYIwMiNr7Q29pvjGNaAoWhGOgI+zouBjyNjmrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grsecurity.net;
	spf=pass smtp.mailfrom=opensrcsec.com;
	dkim=pass header.d=grsecurity.net header.i=@grsecurity.net header.a=rsa-sha256 header.s=grsec header.b=bXFvYfFi;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B807F606A319
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Oct 2026 10:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B807F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grsecurity.net header.i=@grsecurity.net header.a=rsa-sha256 header.s=grsec header.b=bXFvYfFi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso19029225e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Oct 2026 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1792663529; x=1793268329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbgiR1/GwtHwlpzlTkLd58KzVem/7L0NcwdC+dKmgtw=;
        b=bXFvYfFi6PvXf1EbOF3ex2H+pBN9m9qZclZ83KB/svbNC80XZURgnFO2T4EIggMcXB
         000ydNV+jwUnYbODpNlBUdK3y0OMqTkXbbfpM1TXsYNYVTxHfXpqAR2aNEByKG4aCRod
         iIZotL7cq5JcrpvqZNsWxZN/W5/Ao+nB6cx5NXnyZcKq6fPWDuFdXBXl3XGQqAVQYOFB
         5yUIO1QUhZuVFxesIhTsD3P4lB+bBBYgRFVGxdCg9/09g232dBBLCls6XyKfUqWJGXpY
         r6MFx8IuFnEP7byuunNF6R7leYSrrIZ9VxdznxQa84TmNgUYOF4tk0frd/hquRVc22di
         zfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663529; x=1793268329;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbgiR1/GwtHwlpzlTkLd58KzVem/7L0NcwdC+dKmgtw=;
        b=jmwgbjmjkppCeYRMfAgBSfnzOaqUiAqevVFABbtDgppI3d3FoS7ub6BzFdCnbpFR/1
         rpUdYIFSp/HARqoCgR8EbuWIRJ3ShIxvHOzxqgmcHzYrXEQXXfPVwIHRZSeoSuwoZWIS
         HQvxGCca9gcy+o8XLsobcczb4m5cKEQiza+Iafxy7ROIC29A6H9iz0hibfPEJWOnKrnV
         Q0dYldGusXW4fuLCH8j9CtQ5PVnIWdN57ohqw6jP/cgAvhkwIFLBnMcRwIdpEedR1FtI
         9BqJXe6e47gZdbZvsLRZQ59kYCaOqRSEKlmMdGSMUVdSA34ei5/UpJcGD12mTe+gxrXo
         ZSkg==
X-Forwarded-Encrypted: i=1; AKwUvByi/BSRbuzO3f1AduvzucGgbCTvRJ3uc9XXN1Bt2KKkXBGbXCzzph4xSW29ZDUoyDakUA8MVCwANJ7hA2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAPpvFtcWw5cEy+K3jj7phP/wnMQEyrfbGr4o7GPDkMGvYwCEJ
	Epdh8jxVVP0tkXFYnyhDxXt6I479hyIDcIvbYU4RlFW4ZZTOQib18KLIA9nNacW5R2s=
X-Gm-Gg: AYBFou0gk9CFz+pbosHSzOM0Ufj6Kp6wt7SwxkYuUZh7Xd1EaXUmJP0V8VB+DWG1gbI
	B3FOUz+TztppUE21lblQ2oUgVf0co9U49tWn1o9q3HmTMMHiPG5yUg13/5x+NkVcI2Zn62hK856
	bYRJmTkizL3XyP4DgT3CGi65zYQb0gnJi4L2BkCwNVgHPvaZcl1yCUkiooEjXHq4Z85RAC7GPf8
	DHb4RAcQtBHVwCQH7iCML2FQBqFd0T4rMMozzH0ZHM5EL0+yQfTpEmlTavjk8c3di5NiqyqXhTW
	hcLeZc4QpCc2dxvIXlBMG+z26/7iYhsxv/bCjAQsYlkUG2dqlimnQemuEgXyvx8KDFZvO63Wd1b
	KwFY6mVV+S0JHjv95yRReesZtrx1PURqiimPT68Zp03MNaKD67rH/mBT4NV0xJZQcFgcbyP1VIk
	YDH2okTfhGTpCCJkCg86b8/gQAVkVWHBwqCStgeT3YBUEsd1BnWv8BOFZzhWPnxhR2uJLIU6YQy
	dc5VadJiiVCHMxHpYVWdhbafYm/yXDJaUO9SIjSj4T1WdShS69ajqBoI4EW7Hijhh7piEOEj431
	m1LLVH2HxQ3o4kGhuvlNZ/L1dk9ErrS6WCs9ovvdN/urNonST3rzvvQJcPRFUspgAoNIkpBKrj1
	YKpeNsfnYmeP6
X-Received: by 2002:a05:600c:a0d:b0:4a1:e7ce:10a4 with SMTP id 5b1f17b1804b1-4a1fdd171f6mr105552275e9.29.1792663528838;
        Thu, 22 Oct 2026 03:05:28 -0700 (PDT)
Received: from ?IPV6:2003:fa:af11:b900:8855:f04:e797:81cf? (p200300faaf11b90088550f04e79781cf.dip0.t-ipconnect.de. [2003:fa:af11:b900:8855:f04:e797:81cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25b04883sm11977150f8f.0.2026.10.22.03.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:05:28 -0700 (PDT)
Message-ID: <e313803a-47ba-4d27-89d9-47dd1abb5183@grsecurity.net>
Date: Thu, 22 Oct 2026 12:05:27 +0200
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
Subject: Re: [PATCH] kbuild: prevent building single targets twice
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260923123936.2227924-1-minipli@grsecurity.net>
 <5836ab69-cfa6-41cc-a28b-5bd3ecfaea03@grsecurity.net>
 <atjwobCk-mdeIlkd@levanger> <20261021190311.GB2611266@ax162>
 <aad229bb-27c2-4c5f-bfce-73d2a0d04996@grsecurity.net>
 <20261021215524.GA627677@ax162>
Content-Language: en-US, de-DE
From: Mathias Krause <minipli@grsecurity.net>
Autocrypt: addr=minipli@grsecurity.net; keydata=
 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
 RzDVkdgPJkL/NFTKZHo5foFXNi89kA==
In-Reply-To: <20261021215524.GA627677@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.10.26 23:55, Nathan Chancellor wrote:
> [...]
> I forgot to mention, it looks like this is a known corner case in Kbuild
> that has come up before:
> 
>   https://lore.kernel.org/7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org/
>   https://lore.kernel.org/CAK7LNAQhORSPEuB=XFa_i5EcQfsJ6uXy0MM5YWo_84eLGcoxNQ@mail.gmail.com/

Yeah, I saw these too when looking for related issues and fixes.
However, even Masahiro admitted, that this is just working around the
issue instead of solving the more fundamental kbuild bug.

> 
> This patch might be the fix that Masahiro could not figure out but it
> might be better to just forsake drivers-y here and use obj-y properly,
> especially since it looks like core-y is not even used for x86 anymore
> (but maybe these objects still need to linked towards the end of the
> kernel?). This diff appears to resolve the reported issue but I did not
> try running the result.
> 
> diff --git a/arch/x86/Kbuild b/arch/x86/Kbuild
> index 36b985d0e7bf..bd0621207c0c 100644
> --- a/arch/x86/Kbuild
> +++ b/arch/x86/Kbuild
> @@ -36,5 +36,12 @@ obj-$(CONFIG_KEXEC_FILE) += purgatory/
>  
>  obj-y += virt/
>  
> +obj-$(CONFIG_PCI) += pci/
> +
> +# suspend and hibernation support
> +obj-$(CONFIG_PM) += power/
> +
> +obj-$(CONFIG_VIDEO) += video/
> +
>  # for cleaning
>  subdir- += boot tools
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index b7e08519b8c1..9a872bd9520e 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -279,14 +279,6 @@ archprepare: $(cpufeaturemasks.hdr)
>  
>  libs-y  += arch/x86/lib/
>  
> -# drivers-y are linked after core-y
> -drivers-$(CONFIG_PCI)            += arch/x86/pci/
> -
> -# suspend and hibernation support
> -drivers-$(CONFIG_PM) += arch/x86/power/
> -
> -drivers-$(CONFIG_VIDEO) += arch/x86/video/
> -
>  ####
>  # boot loader support. Several targets are kept for legacy purposes
>  

This only "fixes" (read on why in quotes) this one instance but leaves
others unsolved.

Already visible in the diff context is 'libs-y' which has the same issue
and a real behavioral change, depending on which compiler invocation
runs last for arch/x86/lib/delay.o, it'll either be compiled with or
without -pg under KCSAN.

Others are:
- arch/x86/platform/pvh/enlighten.o (via arch/x86/Kbuild),
- drivers/char/ipmi/ipmi_msghandler.o (via drivers/Makefile,
  intentionally there for init ordering),
- drivers/input/serio/i8042.o (also via drivers/Makefile)

But what's worse, your change also affects link order which also defines
runtime initialization order. I don't want to crawl into that rabbit
hole and look for all the implicit dependencies that'd be broken by that
change...

One obvious, however, would be pci_subsys_init() which would then run
before acpi_init(), leaving out ACPI-discovered PCI roots from getting
discovered.

So no, I don't like your change and prefer the more fundamental kbuild
fix to get this sorted out once for all.

Thanks,
Mathias
