Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108804052D1
	for <linux-kbuild@vger.kernel.org>; Mon, 31 Aug 2026 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179811; cv=none; b=AypvUsANXDunkB/kvLKzbKieimmKu1OFH95X55Z1Zm24y3pZlf9xVLKUHxOibM2QBaHu8otqA+i5i5TqeihMeLCPkLMZkrMc07bzDibGjXzyus6pPUjNNtdCaRUJFd9WsK94pvx2OkSRBq+34bJ6X1M7LXZ/7aX6ZvIGPbF6bK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179811; c=relaxed/simple;
	bh=ULsHKhCz4adYfvJRj3d1HoVHkpYlk6MSD5mrDpZawIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JyH5n99OCRBEuaYn0boF3SeAnN9/JnwxbNxyza/B6ekJ66S+KMUuSJx8f9upRPVY0sMZE0TdetecAyef1Q/z4B3EOTtnqb/hsjqiJd9UsfFODXGnQhRRNg6GWCMKWYrGRvhy++RHnFqEt6LMRJNM2TKOV0R+fGDzq+mpHEjkVfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so3231237e0c.2
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Aug 2026 05:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179808; x=1788784608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/YghA+m78NUSl4KQ8Qd7cAgk9snstUg+hq8uHFPKsKw=;
        b=XyNz8GpyHh9gvVlfe30Wsu6OymP0pQHTU20yI6isqd0JB5KFtQW83w7Uf7JgGXupqW
         t+Gw3NzjXdrqcVTfM75Kp2iwI9TrUKngjH0da//eKxQmrSYSrA+7SRijMcvEDfcsl/Th
         EyFHXSEHfkS6S5ZfhvZgX0yzRohqhOK+0S2cuX89XE7lrVdAg9atRrc6oHZaKSp7mlql
         YzoqMZEum4fnkPy3s4bZOLEwMFLUW7n+rUqlS0L2vUXnP/ihEAz65EDNZY7PLzzPUXOT
         +md0yM/S5Va7mupAb3mDndMgRczaAWOgyGbP8O0J68gPnp/BSGv4LW/YWD2AgOS8euJt
         pFNA==
X-Forwarded-Encrypted: i=1; AHgh+RqD+DK8YCPuG3tOhMc8TkIcKH+IzcCDGq7ilB0zFRrj4ozWQX/L8/mymbht6v6TxcZhpBGEEz1QmzJ+U1k=@vger.kernel.org
X-Gm-Message-State: AFuF++lCIaj5zQKLvbFBQ0Cf3ssdF1kqy2JF+uEOiyohUdekuB/oRFi1
	q1Vh+/f+emwDbjhop2EqDWj5YCHOYR23a9Hhhr7JAh3RWNLM9jzzMJokVEDLkzTP
X-Gm-Gg: AR+sD119i/tq2ic6CzHq3vqkXuSLAhrueLaal6JyiL5L7/KrlS4XHxyz1ji+MHt/kfR
	UXut/poGK4tMUqIortwDq7Tj4efcFpi48x0JgKEXNPvn4iBrqgzoGzRn7hCnF+sK1Vw9Qusu4pg
	G3JqJzK8+xBZdqKX2SYlt6nimEZvKToHjMkjZQDXUHZU0IvP1xzyVpjtrMxf8z2sVYOIIyQ7k1+
	SXhjK0ATpZujp5WYGOZXFG5Frr/9H1PpHONG//Btbn3ekJm6wpxm6U+Z4VTqwaPYJb9FaEML6jH
	SxeRNBZIa3YYjMJRAhUKUfhnGlQo2hfZ9CF4gmrW5pL6bjC7FgYLeIGTBGJNSLNDDy0DdGYZEmN
	6fItvP5e0QdtM9iorM2zQ3RBZhWOwABD+JMq76++/m8SZ4YgpA/vdWu1eP/s8qnOvOEmFd5WAlI
	Cf5MK22o9t44bKsADRDG6Ie20uA0rMVmHW/IkwcxksGAff3BL+bnCrjxoxsv48UYunmIDomG5pJ
	VtRsAfk3QgUakpGIsYMJw34dQ==
X-Received: by 2002:a05:6122:4885:b0:5bd:a5e1:c7c7 with SMTP id 71dfb90a1353d-5c680fff4f1mr13003840e0c.1.1788179807729;
        Mon, 31 Aug 2026 05:36:47 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7241da340sm7948290e0c.9.2026.08.31.05.36.46
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:36:46 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-783fffcfb96so1786497137.0
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Aug 2026 05:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rodpre6yoPyu7DYWl1LuNkla311vAULZZy3sBvg490rnBpgmAc99uZq7zkcAyja5YoMWl6bxk/PPcu3MyA=@vger.kernel.org
X-Received: by 2002:a05:6102:3a0c:b0:786:e7a0:603e with SMTP id
 ada2fe7eead31-786e7a069ddmr6332884137.7.1788179806637; Mon, 31 Aug 2026
 05:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830221129.2668354-1-julianbraha@gmail.com>
In-Reply-To: <20260830221129.2668354-1-julianbraha@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 14:36:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkPtJinDa10S_r7Pj2DTgcKpwgxt7U3tqm7fnSwGxm-Q@mail.gmail.com>
X-Gm-Features: AcwNN1XxY8dUAVI2sFOPMPIRRG7NYFIhq8sQwv_cJj_9FFT8vqF_RRaivlE8Gco
Message-ID: <CAMuHMdWkPtJinDa10S_r7Pj2DTgcKpwgxt7U3tqm7fnSwGxm-Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix extra output from savedefconfig on
 out-of-range defaults
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, xiang@kernel.org, chao@kernel.org, 
	zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com, 
	hongbohbli@tencent.com, guochunhai@vivo.com, michael.bommarito@gmail.com, 
	kees@kernel.org, vegard.nossum@oracle.com, sam@ravnborg.org, 
	u.kleine-koenig@pengutronix.de, mmarek@suse.cz, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Julian,

Thanks for your patch!

On Mon, 31 Aug 2026 at 00:12, Julian Braha <julianbraha@gmail.com> wrote:
> The Kconfig interpreter currently allows defaults that are outside of the
> range bounds.
>
> In these cases, the 'sym_validate_range' function will adjust the default
> value to the nearest range bound. For example, see this example:
>
>   config A
>     int
>     range 1 2
>     default 16
>
> Here, since the default value of 16 is greater than the bounds, the
> effective default value gets adjusted down to the upper bound, 2.
>
> However, 'savedefconfig' writes non-default values, and without being

s/non-default/non-adjusted/?

> aware of the automatic adjustment to the range bound, it would write: A=2
>
> This limitation is also documented in a comment: "The following fails to
> handle the situation where a default value is further limited by the valid
> range."
>
> To resolve this, let's factor out the default-range adjustment logic from
> the existing 'sym_validate_range' function into its own
> 'sym_get_near_range_bound' function for 'savedefconfig' to use too, so
> that it compares against the effective value.
>
> Adds tests, accordingly.
>
> Fixes: 7cf3d73b4360 ("kconfig: add savedefconfig")
> Assisted-by: Codex:gpt-5.6-sol
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/lkml/CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com/
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Thanks, this fixes the issue, and would let us revert commit
ab74edaeb1ae7c71 ("erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
default logic") in v7.3-rc1.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
