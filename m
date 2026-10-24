Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829829;
	b=J5iJzsd6njJFG0vE5AUF+oD92Nc6d3WOn21FyrA77mqpBaqZCQFHDBvk7sbcaB0m4FpY
	 B/oeew69IY9N9aenUqflddjlq4FzFILvB7aro56coHUzsbjzNY8DsCHQVR1jACmD+av7w
	 1OPtOTLOIjmNhj6lsuqk0gDwL/8kf8DcaGrV7KvQpXl1AZO+8ZLeqR0r12gUAJg4gebwM
	 YWMune0R81bGXHrgwXQ8/4LoLWAnCmoDn+mtQeqoz4K3uFRkHF3J/DRcKnhdi9B0k9L/t
	 n5C5MH5CkIKQIFvJecnuGDSESQQKmO+odt5c+nsV1iCH0lXbXGbk+zx9ZvyUoWl6DXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
	b=geI5+LdS4HslysjozDsZc29GXL+3O2htefbt8sdVa0210AoT05gmtqrJQw++qNR38C2M
	 0IeiTKvgnUHM3JokS58XFMKhpFb92J3Pbd1oFZlpbae6m+jlZDZ+rBp06L3FODZV1rk1I
	 hJG3IQgDuxwfgQpaX97EDc8rMdHuPZsHWnY29bE2NiqmSpBH3CBLytGsV+/X+D1pYlfjA
	 4z+o7P2dj4M6p3vieEkFkX7cNjT99GmX62WV0pQtLoa9E5zawWVcwGKv8NR64TXzf8cDO
	 sg57uGRQUOg/mbfml7PK+0+Hq9kpC2ogBstHv/Az6av3H9FyLWb6A2YtUbZw8xs60jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C8606A33D
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 08:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C57C8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1630923a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 01:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829827; cv=none;
        d=google.com; s=arc-20260327;
        b=Rxf3Sq71hLN5+JMEgqXougkmW8m5bJyzm5hhr3yJlg9y9nXNfSrLfPYh9VTc7a2LL9
         xoOKXZ5B5snPDQOntH+xezMuQsmvBaELeprE9SXd2niMIyhYojBzKrw5B3rK8fjCOFum
         pPQDa4+gyHf5s0KlR4N5lISpIUHTO60ST++xYUWkqxJEFoPmRqFx4J6Io4J7mgUTz2I+
         UavoACMQxfbJzxLHEKWv18JPVxCrCKVC3FH43G63jVIn/WxrgaSiG4CBkfnN4rGGJBY7
         GamvCwUow3UfmwOPV+x3hMfR8Q+LMG5K4Go2EozYjahuBDveXRdN+Ps7Tv5eZUN+NDM3
         OIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        fh=FV7eM23dkyHqNeLphT7amw4i5DmJseBAbu+jz6e88CM=;
        b=BXj5olYSIRSJu0GAXNMLHreyJPu9Gwp/6kf+ihxxYmfIdxOzJDIixZeVu+J9VPhZNg
         Z6U6WhO+xgh6cP1BEKm7ygCtBm/q6HBYRU28s+A0OLfkcahESG3rfWrsp14RjbM/iG4O
         yIjAmqIorGEpSjyJtBJ35biFpgBpcM/9R9bIGr9OwCQhXrUvKXFGuntRzEwtwhzdxzUr
         Gf5tP9Z4HzF3Xph7N+DioCTbcsmKXypVyCeuHUQuK6vVJaVhK2Q4UBnuc3VgJVkYWNKx
         2Sl00pFDXKAK0N0jkxE7BENnUs4v6umxeg4ZEgCl5xXjhstwWUlOeVCvCjxo3XD8ckn9
         X0aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829827; x=1793434627; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=QwTwqqUYzR4KMcjZ6tN3E7hw4q93B9dRCKd+92TnzApqiNKVxy9e3nOyWW54DY3jbg
         Ojsm+hc5971JCcfIrnwHh5AOki5VuhkbJKi2mOzK7wpGE4KFLMdJKywO6CuWLrvqLilv
         4iZB7FUgOsGFsggrv3fVelxSSBSYmX9hCrd+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829827; x=1793434627;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=UV++0WqUu4ptRZksbPg5JJ0i41/lh/76Eqdt+49D++/LPJg4Q00Xc3lLYjKiHj5cg+
         euhMPuxKTzt1hgL4nVyHic7xZZ8bRjchMG1w6tGs4atPzYBrufs9jmyTkqmRz9OqP4pQ
         U5EAK2KHaahkIrU1UQGFFMP4CwxprIgdp9gr0FHN10NiCd4+suSSjgcf1qc25GUgMThH
         RKc02qS6o7x8O/JeLHqe2uO8ETNr2z9EBR1fZQ1bPgMY1kFLMMQUxioDzU3JqNqhl3Gk
         6Ixbfh4x4mZZ6hmyyy39zXS1IleUtBEI06sngcWshF5ZoiKBfhA2coI6d4DX7GOXT1J6
         kV6w==
X-Forwarded-Encrypted: i=1; AKwUvBwRJKDtM9VI9ddG+8aLlZo0QXN/Pc2e1ZvyQucm1xrmh2BIsUGzMJ7NxDEllEZ/TyLRHh63NoD2APetvY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtSTHVPqRdRDqSFnu2GPkE8+8aEZ+MWW9i6xvRjzCI2T5Ophm8
	yLwz+BufooqR/1AspDox9V0ZLkNhIyjqGPumq8sxgjF+KUgPEEg5+2Z7L9R7gJzVMAT9BuD0xAU
	l8RlY6n3JZKtZWkhkSDL2+1bGZ/kq8Mp8irD3A48M
X-Gm-Gg: AYBFou0yUifOb5dDIHSQpqeICbnG/ANW7Hy4HoJVy4SdlJT5l8ExsytuxaZ1LZKlJ7k
	NzfegN36OK2CwFpEGkja7P/J5zngnlubpFC74fvNHOzbfOdQBAdryhFPFztLHuSeV7o4ca4C9tt
	rMJmBkAItGXiiZAYurA4x9LVD+kp3Ie415jjiW4ZomgQ78sGKhqB1iRmb1QZKULVgwE118QP7xv
	NFE+Ybql6ucLoIXrzqDlJzeFrx+rzMNwx3lbZVCd5sc90G8vh0x0eQXIfoHkwWs1C/PsHk8QDcD
	W79htnoPXrrdx8YF/Y1mhXT0k2KwCNvSccRSIe7poA/WdXtiqoe3vx7BqWsI3aapM4DmXSoglBt
	HY90sJBVt26IVeehsnT9kWSjmENQpTVgovkIlb/rUFzczMbP4KbkRsvvS
X-Received: by 2002:a05:6402:e0d:b0:6b4:20bc:f94 with SMTP id
 4fb4d7f45d1cf-6b442fd5c0emr1861005a12.19.1792829827097; Sat, 24 Oct 2026
 01:17:07 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:03 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:35 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:03 -0700
X-Gm-Features: AclHuK9YCJ7Mk4mSQDTbJDAZNMre28fNrdZjyMOx5ekb1ShhYgH8OFHnaV7iO1Y
Message-ID: <CAFLszTg6B2p30-RcmO6fk+2mdHwSdghU6PXotz0m=gqdk5dRNg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] arm64: boot: Support building image.fit from a
 specified FIT_ITS script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: boot: Support building image.fit from a specified FIT_ITS script

Most of this patch is generic kbuild rather than arm64: the top-level
Makefile clean pattern, cmd_lz4_frame, the compressed .dtb rules, the
dtb-y filtering in Makefile.dtbs and the FIT_ITS handling in
Makefile.lib. Please can you split the lz4-frame and compressed-DTB
rules into their own 'kbuild:' patch, with the kbuild maintainers on
Cc?

>
> Allow passing `FIT_ITS=<path>` on the make command line (relative to
> either `$(srctree)` or `arch/arm64/boot/dts/`) when building `image.fit`
> to assemble the FIT image from a checked-in `.its` script via `mkimage`
> instead of auto-generating a FIT image with `scripts/make_fit.py`. When
> `FIT_ITS` is not specified, `image.fit` continues to be built using
> `scripts/make_fit.py` as before.
>
> Supporting a checked-in `.its` script includes:
> - Adding `cmd_lz4_frame` (`Image-framed.lz4` and `%.dtb.lz4`) for
>   standard LZ4 frame compression (magic `0x184d2204`) expected by FIT
>   bootloaders such as U-Boot and depthcharge, plus generic compressed
>   DTB rules (`bz2`, `gz`, `lz4`, `lzma`, `lzo`, `zst`, `xz`) in
>   `scripts/Makefile.dtbs`.
> - Restricting `$(dtb-y)` to the DTBs referenced via `/incbin/(...)` in
>   `$(FIT_ITS)` and automatically building the referenced kernel image
>   target (e.g. `Image-framed.lz4`) and any compressed `.dtb.<ext>`
>   blobs.
> - Populating any omitted `compatible` property on
> [...]
>
>  Makefile                 |  2 +-
>  arch/arm64/Makefile      |  3 +++
>  arch/arm64/boot/Makefile |  9 +++++---
>  scripts/Makefile.dtbs    | 43 ++++++++++++++++++++++++++++++++++-
>  scripts/Makefile.lib     | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 111 insertions(+), 5 deletions(-)

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -5,6 +5,26 @@ all-dtb := $(dtb-y) $(dtb-)
> +ifdef FIT_ITS_FILE
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +its-dtb-files := $(notdir $(shell $(call fit_its_incbin,\.dtb)))

Just to check, is it intended that this also restricts 'make dtbs' and
'make dtbs_install' whenever FIT_ITS is set, not just image.fit? If
so, please say so in the commit message. Also, matching on notdir
means a DTB with the same name in another vendor directory would be
built too. There are no such duplicates today, but comparing the
directory with $(obj) would be more robust.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -429,6 +436,58 @@ quiet_cmd_fit = FIT     $@
> +			fdt=$$(fdtget $@ $$conf fdt); \
> +			inc=$$($(call fit_its_incbin,\.dtb,$$fdt)); \
> +			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
> +			compat=$$(fdtget -ts "$$dtb" / compatible); \

A FIT configuration can list more than one fdt (a base followed by
overlays, e.g. fdt = 'fdt-1', 'fdt-2'). Then $$fdt is 'fdt-1 fdt-2',
the sed range never matches, $$inc is empty and fdtget fails on
'$(objtree)/.dtb', breaking the build. Please can you use only the
first word here, since the base DTB carries the root compatible?

> +		configs=$$(fdtget -l $@ /configurations); \
> +		for c in $$configs; do \

BTW, adding 'compatible' to the configuration nodes after mkimage runs
would break any configuration signature, since the properties of a
signed config node are hashed. mkimage isn't given -k here, so signing
isn't supported anyway, but a comment would stop someone adding
signing later without noticing.

Regards,
Simon
