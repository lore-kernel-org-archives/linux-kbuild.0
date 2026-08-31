Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D964D3DB326
	for <linux-kbuild@vger.kernel.org>; Mon, 31 Aug 2026 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180486; cv=none; b=OtHJbmczST4ehSRwZpLDVYmyR9SaJZ+hUqLLcXMHw6TXBk9k2He4Scx6ibMos2Fj2F9m61deVYJ4bHnZ+TqkURj2bcX7iviJVNCeRVycvEua1wkRy7fJpLqmwDn4M9Mj+WgPN4A/9XI62nmRK25iagycCQdToW4kjca/AK9YovU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180486; c=relaxed/simple;
	bh=KkkehfMd9n3LK2UIAbLrDl0c9I3JEeWBic8VihxWB28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSNaJs/bgGRaq2kBqsJ7CESKIFS0F/WGiIrw4r18GgHl2Ok99+e6RuMqM2O/Tr/5KssLUzCu2grEpjNF8nPPauHtlFxuhOz93WB4vxVHivBi85AWSJxd6+x5rF4flNgquU6QmRlkU0/vQinyjnRaITmKRq4m4StJhjO6NEioZjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4b1ba286f6bso3493860b6e.1
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Aug 2026 05:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180480; x=1788785280;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDjQEmaO8nMillvg6lw6y5CLfKSX+705cRaL+2tb0Tk=;
        b=OqbXhFt8Y58A1QLX5RwsgWLZjiA0/oPXjwLpSpshF8TvaByWC/HtB6THvqQhAz7Q/B
         FX3Nqx+A7KnHmQNV4UgKIbDVhNpLWW1Sv2GTAaflM26pRJjcZFCP6mi6BXuPe1sdpIRK
         4IqhTzXe33tYlXUG1zAOE23JXI9I8G6JzNp+K19cKG7AUkgUT/ARpPS1f5qcRo4GHFO+
         5uqCuv1EgS3fjmub56l1d26LGHT59I2WLbeYunMn3PfvJemUpoK+CftK/ABsya1oc3gE
         U6ak1fMpAunbVENoYPonGYd7mN3ZeMGOotG66hoQxsCHS2t3E0kWBJnVo+MvR0AhxBsI
         s3SA==
X-Forwarded-Encrypted: i=1; AHgh+RodeBkvYbESRUAOhcrIqDwk0lKwm0F2ybZkXyyv2cIa7e7WKs8Uh05Vtd1F6i8FgiX3VOUuPKovmx/pEl0=@vger.kernel.org
X-Gm-Message-State: AFuF++ks/4G3R0pdX35l9nzUVZ+vpMMD+e0TNDdVlZu86IvjFyoRke0a
	NwlJkXOKnlUVBGPGmOYPnnJX1qK6cxY8kx0U1deAWf8ZCuKsDlbH3/4fMqMfy0BJ
X-Gm-Gg: AR+sD11S2z1Sg3MeVKtjs99MLKdkPdvA5thCqLo4UA9j+9qkWNQ+92X3hkwCn5jDBWR
	H9YJA6ekSdOhBW3k/3MM6XaxKO4IVkQTC10t4JWrhiLKnoYdgAk5jIFtmkZVBIdpwzsQFSAdIvE
	g2OLltL427z0HRFLZTDdTRP5ZcU33k0dXa2XT7/KgdKuWV7gLLKTBCj/cigW79qOyxiH6ZuNux4
	uvEjaja+Ii3/C6wB5NjE/Scqj619ccD+GQwcgpKyxQw7ZEPZVlUO8/z975DrNm4nHyWQfJsyVsE
	KTOl4JYxMGAx2mIBlP71IE0lljTxyScjIzHZ6sajCpAtRaRsDFluVfmSnnRG+0kqtEZ20L13+X/
	XYYGysbej/E7H6188i6AGigBxFnfu2ToeuGhtjhO9IVcGHLfN5jy6RM5A7WAx1xVdYHdUxvx9ga
	f1Bbikm3Jf2XGG9CddhT8B6EDp0Vm5s3xZVsak5BU0BOcXLUqgsA7p1qWSRUl8hsS2Tl1VGlSbt
	sA9JdLg/yfPi3MJr1NyJRIyAA==
X-Received: by 2002:a05:6808:3514:b0:4a4:64b0:bf5e with SMTP id 5614622812f47-4b59e6f973bmr6057389b6e.2.1788180480339;
        Mon, 31 Aug 2026 05:48:00 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b3a1a3621bsm8248846b6e.18.2026.08.31.05.47.59
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:48:00 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4678d3e490bso3716907fac.1
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Aug 2026 05:47:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqERcrsXwkfgj8gc/KMyuNvpa2NoagLnGCVjBfrjzILqdxCfmR0cYN39s6OxrZO+1qlZFAbfLgE3h6741Q=@vger.kernel.org
X-Received: by 2002:a05:6102:2c85:b0:744:d517:b0b0 with SMTP id
 ada2fe7eead31-789dc7e86f7mr1577779137.10.1788180020647; Mon, 31 Aug 2026
 05:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
 <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com>
 <apGqg5a5I9g1CoF_@levanger> <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>
 <apHfhILRL0-lFOEh@levanger> <9de2f5e7-079b-472f-9d98-91d878dcefd3@gmail.com>
In-Reply-To: <9de2f5e7-079b-472f-9d98-91d878dcefd3@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 14:40:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbdO_aY+_CZ6KV23Y-XGfhb1+F8yLQVBY6Tw31PTKzvw@mail.gmail.com>
X-Gm-Features: AcwNN1VSJrr9aEDo0FVQh3lxnRuPny3ZCLnXQftv09uT0Kmgcq1-H6pLZpi5V5U
Message-ID: <CAMuHMdVbdO_aY+_CZ6KV23Y-XGfhb1+F8yLQVBY6Tw31PTKzvw@mail.gmail.com>
Subject: Re: [PATCH] erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic
To: Julian Braha <julianbraha@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Sandeep Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, 
	Chunhai Guo <guochunhai@vivo.com>, Michael Bommarito <michael.bommarito@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Julian,

On Sat, 29 Aug 2026 at 01:19, Julian Braha <julianbraha@gmail.com> wrote:
> On 8/28/26 20:20, Nicolas Schier wrote:
> > Cc: Julian
>
> Thanks for looping me in.
>
> So it's not great usage of the Kconfig language to have the 'range 1 1'
> and the 'default 16' here contradicting each other. But, it's currently
> legal.
>
> I would prefer to disallow this, but a proper check would actually
> require SAT solving (or similar) in the general case, so it's unlikely
> to become an error in the near future.
>
> Anyway, as long as we're continuing to allow it, savedefconfig should be
> considered bugged for not handling it accordingly.
>
> Let me see if I can send something out this weekend.

Thank you, my patch can be reverted again once your "PATCH] kconfig:
fix extra output from savedefconfig on out-of-range defaults"[1]
has been accepted upstream.

[1] https://lore.kernel.org/20260830221129.2668354-1-julianbraha@gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
