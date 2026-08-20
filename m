Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DC3400961
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2026 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220964; cv=none; b=lOqpjqS/Pg66K+MTSuc4mcsC+LkyG6yhj0ZJ4Gj0MwiysT8Tn47+1Uv3uBTYfXaBE5aLZdXW2ek4X11/bGb9UrscPe+e7DNLn/9J9WhJGgpu8DX7ad+viA6QmZjBP6YcL4mvr6TyhiLA1JhXMvfrKUMXVCMDLu51zVxsWscTGC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220964; c=relaxed/simple;
	bh=7f2co051PmLuwxtETwPSxom72qfoz1MUOtiujyQ2QOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtXs/QNZMPGaS5/dRXDC24UYh8GpCOCStfbmbYEoK0nWhs9Yt2wp6fZO8QH+l719h9hnWwaT9E5hT4amqy3UZ5ymf2Mpc5zsu4NDjoo1xiQyyCQh7B4Mf2OpN9CuOKAFeEaqi4OO9aEUXIV0EjzUXiYNAP34InkJQaL0U79MNyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf9466412fso1844264e0c.1
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2026 03:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220946; x=1787825746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y+o9iLBsNyZevlXTHABv43DjobImxTsPK2gLQOnstcQ=;
        b=XvAhMAzS3Q01J5yXuo97eenHzpJpHqQ32RAHANzk6qvHdyFhtiuhjMFJ4EBazmtzKJ
         51p8KHPvJmV9dggMEYmg47PDSFBppqwBV6wL9M2+UMlLFQ0XYoVm7jickiFFHfHTTkcS
         N1kt4gRKHDweit9n+IEwPaBcMPCOdk06hZPyzpkJPT0gJSTQu20CrtmSsLrjc3K5jXDQ
         HJjfEztTbxJOIyQonlWeDQVa7SRtz891TopANRio1GDewPzvXaG/fRNeLPurB9v+3gH3
         5tQdTZEZRritFmgI1cFV+sQ3wI6ivsOpAT6HpCngRTlIT9v45QHz860rpw+bdPnTNPrR
         k2vA==
X-Forwarded-Encrypted: i=1; AHgh+RqIJKiHgfSwxBJhTzdVWGkxf8zJzkR0nSe5FIoEozoDgaQLWl77FeKg9t9ZIkN5Dv0yvSXmNrEOQRYY+fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmi/9iCUdtKFhuHnbjVo7hffXa+EMrXJBzWPGh/Zu/1vAEpdD
	dqPDMCC7zi0u34oZJqavUnoPlw4YEZnXeOLn6naufKZNazmXOtDwm0eEmRdyxVG8
X-Gm-Gg: AR+sD12DTJoQ8p1zP4gPj+ywLicXqi+zgpjxwx3rv37oX6t6yzDhSMsHipy+X05aaV3
	gLHGAhEQjipDdR5wW5SehJlwLXMm/pFo/2z9vdy1tvsLn48rCZN8WHZbyL9FpG/Zo02UzM6KYxq
	tFkX7RJU+DyEdWDkRfG4/eJwPk92d9HL/BfLmzizRnPTqfUgVMjmAHtftuM25w3kb8CtZKTqEGw
	FaGg630b9K+6cn1/jg0yGr3V7gJnlw0ZzNSBT7HAvgkiSGvtPhh+42Xqg+oolylqwgPYEN5VpcA
	PC16gdrdbJuWdvjZ1uubZISWpvzi9NnRbcCd7A9MzA9kDYfynRXRWt8CQazi44JXHULke93l/Ll
	BXEKh/dIMxgndNc/tWIgLxXGAy1Omt+nHFzOEHOh5yjVsW5ycteG8rrHiPrNEFvjMaETmhcRfjG
	4g6VxZIJ72eq0JTXKtD2cr2I75yFmyA62yPk8cmPzF2j0ujr8CY/Il4qK+HSBkqtzQ3klv2ccWx
	LM4jUu/nIJgwvejv/AW6cbVxg==
X-Received: by 2002:a05:6122:e463:b0:5c2:cffc:2c55 with SMTP id 71dfb90a1353d-5c5e3b6c852mr4875226e0c.0.1787220945848;
        Thu, 20 Aug 2026 03:15:45 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e2639be2sm5114768e0c.8.2026.08.20.03.15.44
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:15:44 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97c637bf788so217824241.1
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2026 03:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rod5h/mVjf3LCoscziBq43/mraHPr3eXluOUKdTPBcBqrrlNp6S/BLxsRDJLHOhDrPwPL2gLSB+oQrTAC8=@vger.kernel.org
X-Received: by 2002:a05:6102:2b9c:b0:779:2dc9:1f40 with SMTP id
 ada2fe7eead31-7792dc9231dmr1821162137.3.1787220944749; Thu, 20 Aug 2026
 03:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
In-Reply-To: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 12:15:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com>
X-Gm-Features: AcwNN1UWhRa382Q8SMeXb2Oyrd1gOh-npcOHUcLlPC7nVo2RmYwaP-iNW8vv0Bw
Message-ID: <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com>
Subject: Re: [PATCH] erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <hongbohbli@tencent.com>, Chunhai Guo <guochunhai@vivo.com>, 
	Michael Bommarito <michael.bommarito@gmail.com>, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC kbuild

On Thu, 20 Aug 2026 at 12:01, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> When NR_CPUS is less than 16, or when SMP is disabled, the default value
> of 16 is invalid.
>
> While actual configuration picks up a sensible and valid default
> (NR_CPUS or 1), "make savedefconfig" will still write a line like
>
>     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=1
>
> to the defconfig file, even if that matches the sensible default.

Is this a bug in kconfig?

> Avoid needlessly enlarging the defconfig files, and reduce churn for
> updating them, by specifying valid defaults depending on SMP and
> NR_CPUS.
>
> While at it, make the prompt depend on SMP, as there is no point in
> asking the user about the maximum number of decompression streams if
> there is only one valid answer.
>
> Fixes: c9b47e6b23114e93 ("erofs: cap LZMA stream pool size")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  fs/erofs/Kconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
> index 2dfc313588d283a0..37495e95a78d9bf6 100644
> --- a/fs/erofs/Kconfig
> +++ b/fs/erofs/Kconfig
> @@ -132,11 +132,13 @@ config EROFS_FS_ZIP_LZMA
>           Say N if you want to disable LZMA compression support.
>
>  config EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
> -       int "EROFS LZMA default maximum decompression streams"
> +       int "EROFS LZMA default maximum decompression streams" if SMP
>         depends on EROFS_FS_ZIP_LZMA
>         range 1 NR_CPUS if SMP
>         range 1 1 if !SMP
> -       default 16
> +       default 16 if SMP && NR_CPUS >= 16
> +       default NR_CPUS if SMP
> +       default 1
>         help
>           By default EROFS allocates one LZMA decompression stream per CPU.
>           Each stream can hold a dictionary of up to 8 MiB taken from the
> @@ -144,7 +146,7 @@ config EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
>           of memory.  This caps the default; the lzma_streams module parameter
>           still overrides it.
>
> -         If unsure, keep the default of 16.
> +         If unsure, keep the suggested default (16 or lower).
>
>  config EROFS_FS_ZIP_DEFLATE
>         bool "EROFS DEFLATE compressed data support"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
