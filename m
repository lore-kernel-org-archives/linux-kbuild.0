Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B64377563
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2026 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937682; cv=none; b=Bt+/vXfM8TImaAbxndnAXA72bETPRYOh4SQaGbt+eZLKgR+cjs19SwCRQQSM6MzmQ8O0HAyu2/UTlog//lCmdqjMEcCe9W2a5JTbb+8mLan25+l8jmswWQw0OSd1yfFESf8t5cmlmLAxcbu02JnZubWii/V4DxBrJc1rTJtXKRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937682; c=relaxed/simple;
	bh=Xpsj3sNHf7YCaX2X/Mev6u16m0BiuWjf6tcRKQeCJ9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sA81bUPBkn2uwzGan3tzjCkiZ6oAZaXmZa0C+ovkIfWs37lKXiDmUcwkx02UiN6hF3R3b9t7CpOpKAxM1+KoO/AZ4F3xdxf4yvUCHBKVzjeU09tzeVzqMAHHlqDPS5eYX1sMsEuRCxMpazJv+0OfkR72yH82C1XY9HY1ln+z4oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so759448241.3
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2026 10:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787937680; x=1788542480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=evpTKVZReIwvDgHYHGAoajVc7f3qpbEUisvP+F0+k+M=;
        b=rrv00pvbBRbf5soSbqwmzOInCJIT2udigmHLilRYWUi4FffxTVSGTrux/MZMKOHX3k
         9o1sYNi5Y3GkBmlg9jkrMiALmlrEhb/UVg3HPKw7s6DsdmoDc3HfKouy2dZ79+Y9/J+4
         f2HN8EjR9PNSjsEizz2rvMyc9xnURfSmFAc55id1PnwryMvoZ749VJq0o0DsYGmMWcfx
         PhVCtdQHX9HKBhi6pLSRU8mc6lGyCwAFEMseCNXceYgZKy5jssTjZgUN9fsxTPZXaKvM
         lIeHO8rKArgwTGh1QvyAe+Z5atlPxN+G9wjnY8GdvfXq23UxXk5acUNwpjjNV4b6judQ
         2Pvg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6tBUhtxa1UkxQpOpZdNJwTSnjy2bt8MMvgenbtz3Ao2PxQCM9HVzTndvA03qFljy3brvcMO+o7bwSlB0=@vger.kernel.org
X-Gm-Message-State: AFuF++nvcrwpVaQeuFtoN/4Y6Luu52L5hjZSYkZiud2Us9fXPcydkULn
	VWZ2f8zdsYCVhAxBf/rzLOejVawrTp5euDc7O3qvXDdM7JbqMoqLs/02wuGBZrFN
X-Gm-Gg: AR+sD12p3y4I4ta3B5UusM6axXBPQ3fdeyJ+DXueV1iGR0qPW+3N4g6rRQiK04oBkWk
	YcAqpZdq4F3SSJPealF/f4rH9qnNppFfWQ48evMi0i1SNOuygckyfbYA9EMZtsHt2s/3/86VATX
	ULJ9ToQAcpdLxVr4aT2zHpJNNmXS/Wbq+hcP0b7MuhI/9q8jILNkfYn/WUCO7Vk3u3ACLYr353X
	43efggX2APB3jQXryLu41U1ODLuLGYZWkJm6LW4LQhigM2kkVmUqujm6IabkljpZvG0LAa/kOGi
	1IXutwom8dBJyNGQsnu+WC+rHoIjul1MgfZgYqONnOYL9pFuSQL/2d84IrGLbIb0Bz2WDn0mDoO
	bmNpHHSr9BI2LTk4K4vUOBJfnNDNDaMuvgLK/h/YEc0xeJe8jziSDe0wZav2MlecypGpD1Qe1Uz
	G2LeOAjO/ec02fOG4l11MC7b4piWxBL+DkfQPPt+f9kbMUvH/WLtV0noTAorKYr08VXruUOjz6L
	bxlI9l0DrFr6MPYjvdGJR2JBO0hxqBiNxlj
X-Received: by 2002:a05:6102:290f:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78597f1d6e9mr2925975137.7.1787937680167;
        Fri, 28 Aug 2026 10:21:20 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f5a2ce07sm1566330137.6.2026.08.28.10.21.18
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:21:19 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so689784241.2
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2026 10:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqQFvRtW9edmwKfcozX5ust3zleV0Vjsx8mjtGukfe+l+D4E3+c0FhVf4QmRfWoFbsOIubSq9NnD/cRcUg=@vger.kernel.org
X-Received: by 2002:a05:6102:54ab:b0:778:5bbb:b2d2 with SMTP id
 ada2fe7eead31-78599269b6amr3135505137.11.1787937678652; Fri, 28 Aug 2026
 10:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
 <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com> <apGqg5a5I9g1CoF_@levanger>
In-Reply-To: <apGqg5a5I9g1CoF_@levanger>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Aug 2026 19:21:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>
X-Gm-Features: AcwNN1XXn2qAoRTtHkxt_2I4cw2b47n5hgFTcYzlKhY5Mo5gPaW3qE-98baSbzY
Message-ID: <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>
Subject: Re: [PATCH] erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Sandeep Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, 
	Chunhai Guo <guochunhai@vivo.com>, Michael Bommarito <michael.bommarito@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

On Fri, 28 Aug 2026 at 17:47, Nicolas Schier <nsc@kernel.org> wrote:
> On Thu, Aug 20, 2026 at 12:15:33PM +0200, Geert Uytterhoeven wrote:
> > On Thu, 20 Aug 2026 at 12:01, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > When NR_CPUS is less than 16, or when SMP is disabled, the default value
> > > of 16 is invalid.
> > >
> > > While actual configuration picks up a sensible and valid default
> > > (NR_CPUS or 1), "make savedefconfig" will still write a line like
> > >
> > >     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=1
> > >
> > > to the defconfig file, even if that matches the sensible default.
> >
> > Is this a bug in kconfig?
>
> I am not able to reproduce that; this is what I see with ARCH=arm64
> (arm64 always has SMP=y):

[...]

> Thus, to me it looks as expected.  Do you still see the behaviour you
> described above?

Perhaps you cannot reproduce this because this fix is already
upstream as commit ab74edaeb1ae7c71 ("erofs: Fix
EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic")?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
