Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793988802;
	b=NsqEH9SxVcfgRPaaQZZyuLphOohCYiboF92CqvTSbWNiJZSgyrmcfYy/j8ehzWQM+qP8
	 2KesY8fBCvOdqx4eNDP4tRN4iRQ1GyIQ+O3jGV+rjLIONfhuADiSlN0mr86vJjLQ9UXIb
	 pcn74tsKK8eLaWg4zmU6blmFcU5XKZ3+8JmQj2k9z7uzkM5aOsEdF33sejNzu6LoaP4/9
	 /Q702FrTm7T9i4MpimbgNatcpnEyVdE0YekMnEJlBxi9MKNOxiUZJ2Oj7eq98Nxz1GzIu
	 UJwm3oBifnt+cFVevSqO5meRpubPLWrMvR4jqCbErfFFrznsLil7pBxQ66Ng0QmLvcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
	b=RXOu7cBeI/IUp737sHDf12kUVYYFY46o5TNGF6IzDveMVqYVHxdr8ji0cGnslDJ39Igl
	 pyqIuHl3meUqauDH+x2Ld05mU+26I1MU/Z6w3/l3dv/oNHQ2rbMESgCLGiVlu3xSh67JG
	 U7TIj98bFXw1whp8ztFYz5Mvqn1b0RfaAGamjF/DZsXKlNRzewea0Z2eReVTYrd8Df7N0
	 F7tdmxpnhzUcEmDttjf2lmHCz236eT2PHDeqkNbIvF0kmW5gZpKs4HemqYsptYD9By7Ju
	 FhxUxoUaGfenDB8K/ElfwPUbmZwikSjbFa4UDKo8YbrNbXaJUwZfnMQc7C6AWOfpGvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HK0MPhUQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F3D606A333
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 18:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F3D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HK0MPhUQ
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so932a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 10:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793988800; cv=none;
        d=google.com; s=arc-20260327;
        b=SAbCSPtIoHgUwEB7TiejoS5LT9HX9aAWEDaV+yy6qjf5K9SlD2mlBrKjyDl/r6y7WE
         2lEHZzwYZ6MlfWvC8mEeSm9lqM1/O1s7IWT55EByEr4UH7G1ky5Ez/53hrkZ5uFlLrTh
         BXrDfOO8ZappDeK2RPL5xUja+FTouToxJR2XSueDClg8ogPCEf1ePYLXpl5P9MMaeV5s
         6SfhvzK87Ez9subKWKThE8k5FIN+zcHLQgDQWB2EGpnaXoeBwHqs5QQKAw1rhGAEr/mG
         xjFVsSXOeLplno+5nOiVtTgjovP54zHq4MjLJIFI9/xMyr5Q34inIlDwgJr7oxsRvCYd
         SqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
        fh=+IYv1BJOieW5AYFUO1rpf287WwwGCham8JiK90ut98w=;
        b=DbTntLwYwQkJwXL9uFqDMXFsoczckkIwJ/VjF1Zad/PRZKLxWUHl5lBEx6vdD/u65g
         1eTARWVWsdzFWxrt7ITJ17NUYutdLKNwfWWTQ+Nd9NAyv0ZsL58yK535HKX0ptEbfnk7
         0fPvbgX1rxRDEs6zqdPns7Jl3NXuNVonEgE2yX73rrew12b2aRBix9J7HDbHbw/zet95
         kBqZBfTHiCs3QD9zkcUOy+6VwGGIJuM9hICSwT+3ar/wP7lR/EHjYa4jKXUwZtisVXFy
         pzkSEsPvh0b6dBDRFpNiwbqEFuIoZnzYG+MlzbLp/JJOSk+xca7gzMUAQK9vs7+L/ufS
         QNWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988800; x=1794593600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
        b=HK0MPhUQzHBTjawDG9wj/rGTowNv2I3dyGJsb+J1METmvGduXf48+rJVnSO9OKq+s6
         Ggq7xoI+tRy4YkdyzDTLDFnVhO8BHrYRtqanv96INfwmwgky3tHXlj73v2/UrtdzS4oi
         fvmX769ugnuZrNKQC1yWl/1FVlPcqZT5A/QrCWkMOt8hPMa8nVqqXxC0RV+eqwUKGH29
         I2DpcxlxgA+q8SwxGHbQ/lkyWHs3uJexUH3dVFQHeRyME09v3Y3L4UmNITZdnpz/moew
         1e3BZH9cM92NF71j8BFrR26hxxaSUGSuWfg4M7kA66b5sm/S/+sEWZC2zeDDnkgZyxNP
         LXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988800; x=1794593600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
        b=ELq/5EIFKqLndxStqQUu2A8LId10f7jR8thbo2zt4WBVG/gHDegGgsgbLmN35bazvA
         GfPgux21EFIwd2H3WhMqhyayltkeM4060yeJYRglIY8GXhI0GQGdyXurG/ASOv2Mit4c
         0024N9OydxyMu112gFRs/X9nue9P7pKJT6W2lHjzrDS6ddCRyPyVL9Q4pkOCIrmnqThx
         8eMS2dou4Qwg2ODp7SrQfil9CfPwfz5Hjx3vhllfytbXVn3iCoIYPB+E0B16f0ey3oDV
         LvbjzEq4hR26gCWPxylHiTqtJ4LcrIjk4ax6/xyhTzFOcxHGsNHQp2R4WjjZwDcoHWX+
         9XsA==
X-Forwarded-Encrypted: i=1; AL+hErGlb4p2lEOcPhkgeil2Gl+ALP6bAakeMG7O45xXKv9O3nAMcs2bNz/rseRTjYGoEXhfE1MqM4owiRO54DA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L26Ck3ZJLTnOr3AjWztmKzQ9Fs77xI9vy27N4OiTQil8WXWZ/
	cGC7JZ9LDNc7slMyZngZBl3AMXwHVLnNlRhEaYNnUSGINIEyTEHMbYHyPEV0ifOwZsM38jrj0sx
	0FVYJF0w4Yk6OwM0LCvnxzpoX17gWknehtNOS7YLl
X-Gm-Gg: AYBFou0m5JpBcaFJCxjag2y5hWfzCW/ZU+yQZOXtOEiwrz0gc+fKHJZXAVGQK4NzrRu
	zbPi2VUNG0d5S7Gkqzzz4/N5RkWHcGk3XPdUQavmpfEs2u3XGckrrbaluro5VM4JbfsoDQyj+xJ
	zHprVx1V3ebVVvQqt9ASdO8Kf9PqDDA1izQPEc7dIFAWdfMbs+5K4PcnmcsEipwbGG051kG7YDJ
	5XU0t9GTcTDagQTveb7gLigJEraEYlVVe85c4uWp+a26BC8FFPd1jasoHzpOSK187T74+LzajHC
	3xeHm6hPg2zeBUULpDsn6iO8ZCy4IIPCL0ZB1ZQ8VQgdtc35VsVxHBXTz1MDbzv0Zz50hmJMGbT
	Ftmai7Jzk7OEhhUJC84t1QscG2X3O8X0Wc53jNdpaSAd+QylJbZ3auHaPC3dvMdVfTVkS7V1vfg
	VrAqxkY4Aw+Hf/
X-Received: by 2002:a05:6402:4025:b0:6b5:70a4:c77c with SMTP id
 4fb4d7f45d1cf-6b6f8405023mr6118a12.11.1793988799653; Fri, 06 Nov 2026
 10:13:19 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
 <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com> <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
In-Reply-To: <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 10:13:07 -0800
X-Gm-Features: AclHuK8M7aEN7HUd8VzCV7EfdL7Os2jiojoMycd1W00kFFu83GOEk2kpHYqCCkk
Message-ID: <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Doug Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As far as I know, Profi is enabled in the Clang front-end initially. I
remember reviewing a patch that enabled Profi for the Rust front-end,
though it's possible that has already been merged.

It seems strange that these flags diverge between C and Rust. Could we
add a comment to indicate that Profi is currently not enabled in Rust?

Rong

On Fri, Nov 6, 2026 at 10:06=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > Just one thing: I think we should also have this flag for Rust so Rust
> > and c are consistent.
>
> Please see the commit message, which says:
>
> > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> > SampleProfileUseProfi remains false by default in the LLVM backend and
> > is only enabled by the Clang driver.
>
> Is that incorrect?
>
> -Doug
