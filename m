Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829840;
	b=0IxwMlT0hvd7EwbbCLDwLBY5D5mpP5cuaAAUWMYNF1PdVZ+LJELb8PPqBiAsejGXyjAI
	 zfsZJ2l5m3ws58QE9TCBVU2hFn2gTK1/u9GMoi0T4faODZvuA1ttTZPt8XF7K7G2HEvEb
	 tx0xiPM89VUmyUpn5pqyp1ehlNG5uFMnMfSjbkkF/h68exSnSxAFC96AL+/COqa4ZpVMY
	 jJHSU0IEfoZWzkwUAH92m63G1tsx3VFpyTA/wjFrqd4lLr0r9SFGjAaKiajTXgYKuiiIE
	 Cznxpw5YbN7/y8Kg0Td8u9anoFiPxGBTVybDvI6CLwtsLCJbCruptIA5zOhDTcFK1vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
	b=1WdHp0RMvngVZasKBqVy2KVjHNuHpkCyf8DIto3JsX5KAbfOeco5pOtsG6X6jV/B23CI
	 XD/qizWY9nsKICh7jwa3PoA60RZ4RaincjwRwiwSsSohVjH6gfyd28Ucpn6xSZfAspsOn
	 6RLovqtfBlCZ56hDxLfJj3GtTOsQNQN249MRpi9MkGMO77/npWsjR60PFXuB0OyOWa7rt
	 obxazgjPOCOZinYqM4FwtWtEM51/04VIlc9X7tv2dzo4gYru7CqCE18MzWZ2ua1HHqPnA
	 5VanKzRtNiNaBSRDAyj3NlmwNIgZ6k+yVusfp8crRnFz3LyPk+3pX70c8VdVQMbD/rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A2E606A31A
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 08:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A2E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1937393a91.2
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 01:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829839; cv=none;
        d=google.com; s=arc-20260327;
        b=hIZuYTkQK+z/aQmCfw/Bp/vOhxhFDRth8bo53mRgQQX9Nx9N9MHyEPnz2RYpsoyQjY
         TVWFax05Mv2//6KlFDQZonBIbTkvqO9PAqXnnelSekQ84hmNtcL6qchbIZURPFDG9gkb
         rArP25V38xf+fJpqrlObxg2dJNzX7uX6xf+sAOuqsvvcvfK+Frivhf720mko1WfIo27e
         zHf2kuM0cCugaZNMaYzSoIoFUYH0JxetAeDnV/4EPN8l8gOS19TEwxjHOI++mTixiavd
         3QRRGjWQaRn/pwv6d+FriwyyHEGdgZv5asFIKkK1P/F6E/VVFbzQ1Ev2DHGiFGm0alP5
         rNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        fh=16h7VGyKNhRZtc93le6Uw/e67jStsxr9ZcSkJidLuow=;
        b=LCQxViY8/gSNKWw7XQ4Mga44mTSeZkjpHMRpNIwEu2lWI0cVScHXuUUmzbB3KYuoyn
         iW6/X4og04FdE2qINnM9xG2h8XTplOJHX5bJs18tEKs2o/GoZsk1awY34aIASlKmqG/I
         JDG3o+UhsZ6JPkQHiJ5BQhaUKDeVu5fSBPZNKIeKYR4FztO1YcroUdtnZBgfCU+Xfd5n
         Hr+lOMuJBRdoEehgwvYSbkZ8/0/IqniaxsWrXwDntRPL/DAJtArFinarQ6SBUHXw9YRs
         2r4UFuaNsjiyLOze1iDTWgPSa1yZmUmAmlLmlW86bYN4fkrCWeOY/LbejsPXb+cNSLqh
         Ktag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829839; x=1793434639; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=ErxrGqoPZ/nb9CghxeboTYWi19dHZA+oLth5nqNwXEPLgCivWeROkUq1jgI00pLPis
         mnvEJZESOATfA4bwGakbWHbrbZfTg6q/+BsXRBGx/nCeAqO9mecP3eklEPue7ZRetFgl
         WAQbY6p0/CHxOoA6764p2Z33kLx+HvfLIdMSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829839; x=1793434639;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=XmHX/8IlRjnx1BLXvC0gDJWotQwy/pGnACidUedybuQ5b3W2wdFXPNcDfEsakEt9tS
         iZvyF3lLQv0R8qMY6O3F/Q+mOL9uQRSDVJBnXzClM904DAGow17eQ3zWPui+N/RgWGHE
         H/sYVhg4EuRMhr5GbQ++oo4xUJgWmuyJZl35ptKRcAUqUygyY2PVllBURGbb6LY1ECGd
         t3EatYqahrPk1ZlhRZLJdjNVEKaLZ34k420+HOgvy7EULU2R5Vc7luT/21kaRggae3fv
         dJpNI+ScBE83K8w+4TAl84DCirHllk9DWZQXM0CfHZJgxZGccKGlXH2zCEwOlWca+66I
         QGWw==
X-Forwarded-Encrypted: i=1; AKwUvBxytF3jlncCVpKEF7kpNue0EK4oRazW3JWGdTXFab7OeX7a+jj1xKZgkFtw0GDFblAYotUYWNbRVUNBSaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVaStzf1CTK/Id1aC5nO5MjwvAf13jPXLIcD1BvpeWEy9mNObt
	5x5K2S7YDxBvM5nZbAiy7C1aXyQfS1ftoTY+1LgQvSe5A34XAuf914KAhcCw9XT3CuFRHNiQi0P
	Ihv1ceczjlPB47vBULmm3Wb4/E9B68SnfNeiQR+Kx
X-Gm-Gg: AYBFou2oarncv9mIXtzD4lfGseP3SzPIloKWqD01t2kleVa1GK7J49wEWOLQrr4qVQH
	RR22xcG7i3WpctzCRMMaSK4A6+LCqYOYIPrspOhCyjV3aJ5ablRD1RwXhgGe5SpdmdIUbw6j784
	/TxWzJiqRTOGZ2paH6hflrFqLyR3rlfSY9Sxnp43Cc28C23DqKHh59e9Rc84McSqjcoFkhRdRkk
	qGNO9aArg7KeNls+MIJpM0sUCWfsGg9eCCyu03ohVW++8jcO/WYhatdbU29DkJCFWM5wLD2iCDt
	ZQZI9/cZDgdxigFvOGgtaW6QBLrWWiiPPTb0MhvSAiysAVsaSR2zGa50tAtP1GwvWIuhV61in2J
	ZX/DnShHcQrdPL1YzpLfIEvBDfaFuEksDRHwq
X-Received: by 2002:a17:90b:2891:b0:3ad:4a8b:c6e1 with SMTP id
 98e67ed59e1d1-3adea9dca56mr1447422a91.19.1792829839011; Sat, 24 Oct 2026
 01:17:19 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:14 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:13:02 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:14 -0700
X-Gm-Features: AclHuK-tg0PdtuvuCVecn4H2MwI1d9lfukkzfH1KNqgDlJ_Y2JdAvjK8N50Iivk
Message-ID: <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
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
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
>
> Add opt-in support for factoring the DTBs inside a compiled FIT image
> into shared base DTBs and per-board overlays using `fdtfactor` when
> `FIT_FACTOR_DTBS=1` is passed to make:

Please can you add a short paragraph at the start saying why this is
wanted (the bootloader needs a base DTB plus a per-board DTBO) and
where fdtfactor comes from? It is not in scripts/dtc, so someone
reading the git log won't know where the tool lives or which version
is needed. A link to the dtc series would help.

>
> - When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
>   included in the FIT image so they retain `/__symbols__` and
>   `/__local_fixups__` metadata needed for factoring.
> - Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
>   defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
>   `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/Makefile.dtbs |  8 ++++++++
>  scripts/Makefile.lib  | 18 ++++++++++++------
>  2 files changed, 20 insertions(+), 6 deletions(-)

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -425,6 +425,8 @@ quiet_cmd_uimage = UIMAGE  $@
>  MAKE_FIT := $(srctree)/scripts/make_fit.py
> +FDTFACTOR ?= fdtfactor
> +FDTFACTOR_ARGS ?= --strip-local-fixups

Patches 1-3 go to some trouble to build fdtget and fdtput in-tree, and
cmd_fit_its puts scripts/dtc on the PATH, but fdtfactor comes from the
host. So FIT_FACTOR_DTBS=1 uses whatever fdtfactor happens to be on
the PATH, and the build does not depend on it. Is the plan to sync
fdtfactor.c into scripts/dtc once it lands upstream? If so, it would
be worth saying so under the --- line.

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -137,6 +137,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
> +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
> +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> +ifneq ($(FIT_FACTOR_DTBS),)
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +DTC_FLAGS += -@ -L
> +endif
> +endif

One thing I'd like to check is composite DTBs (the foo-dtbs :=
base.dtb bar.dtbo entries built by cmd_fdtoverlay). My understanding
is that fdt_overlay_apply() merges the overlay's __symbols__ into the
base but drops its __local_fixups__ after using them to renumber
phandles inside the overlay. So the __local_fixups__ in a composite
DTB only cover the base part, even though both inputs were built with
-L

This doesn't affect lga or trogdor, but the make_fit.py path packs
every DTB in dtbs-list, and qcom has lots of composite entries
(lemans-evk-camera.dtb, etc). If fdtfactor relies on __local_fixups__
to find phandle properties, it may silently produce a bad overlay for
these. Please can you check this? It might be enough to detect such
DTBs and skip or refuse them.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -486,7 +490,9 @@ quiet_cmd_fit_its = FIT     $@
> -		done
> +		done \
> +		$(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) \
> +			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)

Just to check, does fdtfactor handle compressed DTBs in the FIT, i.e.
nodes with compression = 'lz4' as in sc7180-trogdor.its from patch 7?
If not, FIT_FACTOR_DTBS=1 with that .its will either fail or silently
skip the DTBs. Either way, it would be worth mentioning in the commit
message.

Regards,
Simon
