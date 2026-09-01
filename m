Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ECB37B40E
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Sep 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257857; cv=none; b=gZGPyGwUxEcA+eWLCXNExe6awphjuZcv95zhVQihc+c/T40Z1uA6t6D43kgmyJu7zJKyPmjTuLHhRanuEKOOmHt1BZqkzfsPykGR+/FI3sQubnv4ZT/V+BB+DdTYaeMwAGmj5IWPrmrnOSaRF+IBkVEMIzfYFtS4LIjXBI9AAGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257857; c=relaxed/simple;
	bh=f3IaTrQW3PdwJG2CI8iddb29hq+NAzAZPlqiyZ/dPEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elxCcBuF3b0pfSh5i+oulK/G+9ZXa1OTzNOvVfcVe1tLOUzqJ9hbnAj/5MJ9vCpQPsZK+Jkh0jkdYmpUiDtE/qyR6gaTBAAgqKKcsf7lIUWVkHZ1LyuYlY3OTK0Osk1+lkJx39uxwrBhXpnyrHCyqUsiOhBNF3fY3i9G93PrgEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c6670fd413so730245e0c.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Sep 2026 03:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257854; x=1788862654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jjjR751nJX1Dlxj+MGQJnqs6zskSNN1F11sy8NVh7g0=;
        b=PNrRlC85+R8zRNc7+jXbMgxKHGEF6WDrW0t5j4spbJ5x1z3Ly//tMsMo0CYH4rA/Dk
         8gUns+Vo9b5uaTpLkbDs3t6WB8lJvHwuX3Ku4mo1o87iXxu33/njPeBBQrLxD24u9jNo
         FWDq02PA5w/dGuK1ech+DHlpqc4DtTH8G0x1tvj0E5dbpqrC5BbUmRXXN8Ks7e/t3hLz
         /1Sljmzdd5PQQsdJz+i64Rt/3sj0ngn52UGr+vm4AIqke5+GIfb+7pHt5OfrW65XUC8Q
         fgo9pAns+L5Zb3fnNjdgfpLUo7qbOUFHigpVYj0d2DRySvjnfWFOp1PP2ygEPARsxc9N
         uO6g==
X-Forwarded-Encrypted: i=1; AHgh+RrIVJzd7W5DKvxGejYp0wWPAa35ZDHdhImThX7DE2fhaQkhFB212xx6V9degeuXf3n/zpeGiLlJ1T/mLlk=@vger.kernel.org
X-Gm-Message-State: AFuF++m/Yaq6PgdrOzKNy+5JLt/Vde7immEKmN8pHt8jYiF6kOqnTxKI
	rF+v2mw6EjslwyRhmW8Qn4fViHNF0p2pdriqaMjVpIFM5amSwGcTXlSQfQJx9O89
X-Gm-Gg: AYBFou2dkh/CpaAaFhanfmThfVb7bCGunfcKGnKaurphX6YxrBbcr4P6k2m3OdFdyJJ
	Fggj2pftwoTm0X5uI8XggA9uc786QvjLk0vWccIjxruJ6akGbJrQ0D/FVwVWYPgezycH/92cl76
	rl9U8ddbK215TjG6lXk0SAhm14uebUAPWdbqyZNfDAZfMRhrFcMDTITcA6tKOyfisrPbiT/wHuz
	onYzlOVbnMO+3/vzS/5hdTlU5Axuob8ncxNa4rUAShv2WzeUIBK5fLDrImWXf4r+8Bnd9TtyH+u
	/NW+ibvrcFhf3m/W+3FFFPsZ/f9RnVNcc4yvAfyRLjTj6E1sMwCsXAxdHEp2jbZPnlcQCw1GQYk
	oSbDKYWmB15PwmwwDLywa95n7w8z1rb4I//fqFmZKXg2MyFMricwsxZDimJ9til86h5qhV4ftjv
	wergN+rcY019D0F08ND/A2vEcPJk8XGKLaAUnlvf6/HHEbNV/H0wkOn3lAN8DiIN71NSuvX6TX7
	E2sIiGX25ZHQEOSJQqbe/zD+Q==
X-Received: by 2002:a05:6102:cd1:b0:781:1ac:8242 with SMTP id ada2fe7eead31-78a0293d570mr1220681137.7.1788257854225;
        Tue, 01 Sep 2026 03:17:34 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aa2fsm8754277137.2.2026.09.01.03.17.33
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:17:33 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7564b7a9490so662475137.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Sep 2026 03:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro8jSOV39IDJ1cqe0S65gaVKMhy6Pw9VloeCaS+8Y20Hhb4DnoBYKdqhqfONUzCMTuUM0SyrpcWWkrkVUc=@vger.kernel.org
X-Received: by 2002:a05:6102:1a06:10b0:787:ebf8:77ad with SMTP id
 ada2fe7eead31-78a02a6eb7fmr955834137.18.1788257853731; Tue, 01 Sep 2026
 03:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830221129.2668354-1-julianbraha@gmail.com> <CAMuHMdWkPtJinDa10S_r7Pj2DTgcKpwgxt7U3tqm7fnSwGxm-Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWkPtJinDa10S_r7Pj2DTgcKpwgxt7U3tqm7fnSwGxm-Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 12:17:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUywobKkt5Zozh3GdOW57nF_XhydJh7PaqTBoGB-2XvTQ@mail.gmail.com>
X-Gm-Features: AcwNN1XlRAlFl-Ap4ZBsvizrQPe_wtXEO1vr6JdvvpwQv8gi-7uGjhpumvEIf0U
Message-ID: <CAMuHMdUywobKkt5Zozh3GdOW57nF_XhydJh7PaqTBoGB-2XvTQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix extra output from savedefconfig on
 out-of-range defaults
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, xiang@kernel.org, chao@kernel.org, 
	zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com, 
	hongbohbli@tencent.com, guochunhai@vivo.com, michael.bommarito@gmail.com, 
	kees@kernel.org, vegard.nossum@oracle.com, sam@ravnborg.org, 
	u.kleine-koenig@pengutronix.de, mmarek@suse.cz, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 14:36, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 31 Aug 2026 at 00:12, Julian Braha <julianbraha@gmail.com> wrote:
> > The Kconfig interpreter currently allows defaults that are outside of the
> > range bounds.
> >
> > In these cases, the 'sym_validate_range' function will adjust the default
> > value to the nearest range bound. For example, see this example:
> >
> >   config A
> >     int
> >     range 1 2
> >     default 16
> >
> > Here, since the default value of 16 is greater than the bounds, the
> > effective default value gets adjusted down to the upper bound, 2.
> >
> > However, 'savedefconfig' writes non-default values, and without being
>
> s/non-default/non-adjusted/?
>
> > aware of the automatic adjustment to the range bound, it would write: A=2
> >
> > This limitation is also documented in a comment: "The following fails to
> > handle the situation where a default value is further limited by the valid
> > range."
> >
> > To resolve this, let's factor out the default-range adjustment logic from
> > the existing 'sym_validate_range' function into its own
> > 'sym_get_near_range_bound' function for 'savedefconfig' to use too, so
> > that it compares against the effective value.
> >
> > Adds tests, accordingly.
> >
> > Fixes: 7cf3d73b4360 ("kconfig: add savedefconfig")
> > Assisted-by: Codex:gpt-5.6-sol
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Closes: https://lore.kernel.org/lkml/CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com/
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
>
> Thanks, this fixes the issue, and would let us revert commit
> ab74edaeb1ae7c71 ("erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
> default logic") in v7.3-rc1.
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

FTR, this will impact all defconfigs that restrict SERIAL_8250_NR_UARTS
to a value lower than 4:

    config SERIAL_8250_NR_UARTS
            int "Maximum number of 8250/16550 serial ports"
            depends on SERIAL_8250
            default "4"

    config SERIAL_8250_RUNTIME_UARTS
            int "Number of 8250/16550 serial ports to register at runtime"
            depends on SERIAL_8250
            range 0 SERIAL_8250_NR_UARTS
            default "4"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
