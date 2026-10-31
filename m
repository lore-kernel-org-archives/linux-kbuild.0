Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793409024;
	b=Q/Fga9teGE/fNON5I2x3KhX5MbYLgRzfmgx26sK6RzFpfLbx1Y9ixH9950H61rX3+qwe
	 19tSuRDFcBRRSoHDIuWM9StypHuQN7Us7tkGhQJt3aryU05fJvyFtgMLlS/6CeZCCvEtX
	 vq908cDogffCo3x1HP8+uU9+/Qivf9eSIBbe6u+mF6Q0rvBbULRPrgC994l0jQCXP36GP
	 WqCl85B6XX4CBHbDj+NAhUUpaIwdeEyh/Mud3RWaj/1ALcvzwklq82rYGRYDearJQkPHH
	 qydLBDBgwRaEj/LQtQSZfIXCrBuZaLe78CGB4zKRy19p6cZdPv0PHJljc+NlRulJYXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793409024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Nzihp1P/HgfQSWtejVyE9BkuDNhZgLetHLW5DYDxxQs=;
	b=SvW4l4mNUgrB7zYwOZy2nmP6oZ3KHQAM7KuA5MC5WQJFT093t1/T8KN5f1IJCQQohduW
	 /S777LvA1hi54n74/lrBSF7rJlo8pl+n1giHUkwizN186rgbHYGwqKbQDuswoO04DGewH
	 Ym0tSmWw/PMdN+g2UF/YYkey1tiFlT+/Fdm3GcyzD8W/nLUb8iieej1rKiGl0q6aQS3S3
	 lk26DFJEp+m8kbMoWqpk5C5bBF8sxKcu6vQPUWGuahV5SA2umoRpU2rrGjqrEC2DaEQj+
	 YhXibYKwF+MOiKCcqLP9V6Fwj9NhMautk/TAgHwojpeKKTct9f13N8ifitUGzQuPGzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jl1g68c0;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F208606A31A
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 01:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F208606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jl1g68c0
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso1859056a12.2
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 18:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793409023; x=1794013823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nzihp1P/HgfQSWtejVyE9BkuDNhZgLetHLW5DYDxxQs=;
        b=jl1g68c0fL1xveCtDiSPsRP13vieX9zyajF5ept5rB0s/rmZI9rvi7He6zfPc1cb5b
         y8pGJe7qPQdC3v7KbVMrMZxybDs4w6mT9EEz3Nbki1C3X6ohaoRMjrywfwDQpvtowDFl
         kQ9aupzSa2bHk7TME8WZ4h9Na7u52wDkVwdjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409023; x=1794013823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nzihp1P/HgfQSWtejVyE9BkuDNhZgLetHLW5DYDxxQs=;
        b=wYzTpyOFFWJ0JRn9hpfDJxDfHU2eX+7PST+LyAIvkVC/0tvtsp4I0Z1SflCGSuQ8bq
         RX9b1pOMZsa8ndHgESEoM/0S7YGw1fKV/j7UuFUlsCGJhCpFsDohHgcHMJWbZUiJiHpb
         C1eUUJKvHuAZTB7B848ZbWwZh2fxGE2eYqkq+H67V/2Vb/ZXG+8iVp7QQch6/14XuZH7
         sVnmT/LGSNfg0Aqy2/amlnFTlJ0S1kzR+UqRUg+opUYtwfF7apWSZUfBaFnXjGPeW81u
         Trm5HCfE9gSL5AIXY+6ZqPLQBzDk6eSLX5MacpjiNldfokRr62RyTYzj3eQeroB+xq0r
         8HNg==
X-Forwarded-Encrypted: i=1; AKwUvBwlZ7Owil93OygFzPkBpLMzTWpejX/y/mogltwQ0lEqJh1+kI658Ur7PKSdjRyj8JhYtBi6/ob3wG0L28c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVSMAhmMCPeZcRnH4yC6YXEUOcxLRyZjqD/zhGtAdAb9EsN4D+
	oKx/HYwQesKcJEWGmhKgC/lgjoMaZOiEMlUhpL/PUvu1n/wABeyPsnkZSC+NPoKfe3/PPb9k1yv
	KJVCfRg==
X-Gm-Gg: AYBFou02H/gP529yBDX3K0u3HRuscZg4x5HGmDh6yafFP2hAi0ME0v1cJ+9JjQcKrH2
	ueEyMEcpJh4eAmIPTOyUwafp/LVsiFN2p3sTlbEjP9Wval7UQ4S/xsodpHl3hRMyufEtMG+uRHb
	27h2aTVyTY+9lS3yYbWXk/TeFNOgAYdqu3DLPDDDBPtlwgk9tkOPDbzn5+UL5UOrArc5T4xpxRw
	p7HzWkW2Yd7Br3HlapwlThuotDfrwxO1EIUpO3h4AAvsaTQI6IBWmDXeyI6OAwI03UVnOUMDree
	4jZTK2lS/V871MBklrA5mg4L+eaWTryWq3Xn1LJ0N5QTNvum03+lfeXtutfG/g+9oNM97z3J540
	x75I1AnsRlp8R+YAlw6EE1QwqrsvlkfaT1YkGzvnYOC+anTLeLE1Rcus/0Z9jHD8MoFd1RISEvE
	oNCjTpM0iMKe0I3ABfQEiJIbAmRQPpZ54rcIRGUzzD/EDypTKdXIRcHz+b1OqevjWrgH24meR4E
	sBPpImufUvhrI0E1ZYifP4ngpQbk4xENqMH37aERvzfm3fcIQg9qpaD2BK3ysmJlBeocFQkq2VR
	U14FUMnpTiXJ4Lvdw+gXhX9twcru8TpK+gHLCL0GqRpuYAutNYpQwZff6Wsogmsog579SEK0nKk
	Yr7UVhfci+PbwKQ==
X-Received: by 2002:a17:907:a785:b0:c41:30be:4f84 with SMTP id a640c23a62f3a-c4ca7aee94cmr360044266b.9.1793409022700;
        Fri, 30 Oct 2026 18:10:22 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4caf3183fbsm101558766b.41.2026.10.30.18.10.22
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:10:22 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so12683985e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 18:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzsRbEK/n4s/AHD3/XkdW6AeTvdujg8997FlsgRLt8ALesYpZauRITbmusap0ShPsrl8saizyCSOqWskI=@vger.kernel.org
X-Received: by 2002:a05:600c:a41:b0:4a1:ac66:6ac6 with SMTP id
 5b1f17b1804b1-4ac18c73d85mr83192945e9.26.1793409021466; Fri, 30 Oct 2026
 18:10:21 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid> <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
In-Reply-To: <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 18:10:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
X-Gm-Features: AclHuK8jubqKMZtp2zZmgL9M6Iv-P5KmHBzgb2f1Y0xcGERjxzkWO1A9oKK2NzE
Message-ID: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 24, 2026 at 1:17=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> > kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
> >
> > Add opt-in support for factoring the DTBs inside a compiled FIT image
> > into shared base DTBs and per-board overlays using `fdtfactor` when
> > `FIT_FACTOR_DTBS=3D1` is passed to make:
>
> Please can you add a short paragraph at the start saying why this is
> wanted (the bootloader needs a base DTB plus a per-board DTBO) and
> where fdtfactor comes from? It is not in scripts/dtc, so someone
> reading the git log won't know where the tool lives or which version
> is needed. A link to the dtc series would help.

I think that was in the the "after the cut" part, where I said:

You can see the fdtfactor post at:
 http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

This patch obviously could only land if some form of that series
lands. Presumably we'd also want to import fdtfactor into the local
kernel copy of the devicetree compiler before this patch.

My plan was for this series to be RFC until `fdtfactor` lands, after
which it would include an import of `fdtfactor` as one of the earlier
patches. ;-)


> > - When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
> >   included in the FIT image so they retain `/__symbols__` and
> >   `/__local_fixups__` metadata needed for factoring.
> > - Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
> >   defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
> >   `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.
> >
> > Assisted-by: Gemini:gemini-pro-prerelease
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> >  scripts/Makefile.dtbs |  8 ++++++++
> >  scripts/Makefile.lib  | 18 ++++++++++++------
> >  2 files changed, 20 insertions(+), 6 deletions(-)
>
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > @@ -425,6 +425,8 @@ quiet_cmd_uimage =3D UIMAGE  $@
> >  MAKE_FIT :=3D $(srctree)/scripts/make_fit.py
> > +FDTFACTOR ?=3D fdtfactor
> > +FDTFACTOR_ARGS ?=3D --strip-local-fixups
>
> Patches 1-3 go to some trouble to build fdtget and fdtput in-tree, and
> cmd_fit_its puts scripts/dtc on the PATH, but fdtfactor comes from the
> host. So FIT_FACTOR_DTBS=3D1 uses whatever fdtfactor happens to be on
> the PATH, and the build does not depend on it. Is the plan to sync
> fdtfactor.c into scripts/dtc once it lands upstream? If so, it would
> be worth saying so under the --- line.

Yup, that's the plan.


> > diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> > @@ -137,6 +137,14 @@ DTC_FLAGS +=3D -Wnode_name_chars_strict \
> > +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs ret=
ain the
> > +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> > +ifneq ($(FIT_FACTOR_DTBS),)
> > +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> > +DTC_FLAGS +=3D -@ -L
> > +endif
> > +endif
>
> One thing I'd like to check is composite DTBs (the foo-dtbs :=3D
> base.dtb bar.dtbo entries built by cmd_fdtoverlay). My understanding
> is that fdt_overlay_apply() merges the overlay's __symbols__ into the
> base but drops its __local_fixups__ after using them to renumber
> phandles inside the overlay. So the __local_fixups__ in a composite
> DTB only cover the base part, even though both inputs were built with
> -L
>
> This doesn't affect lga or trogdor, but the make_fit.py path packs
> every DTB in dtbs-list, and qcom has lots of composite entries
> (lemans-evk-camera.dtb, etc). If fdtfactor relies on __local_fixups__
> to find phandle properties, it may silently produce a bad overlay for
> these. Please can you check this? It might be enough to detect such
> DTBs and skip or refuse them.

I'm not sure I 100% understand, but let me try to respond and you can
tell me if I got it right.

The goal was to make sure that we could fully reconstruct
__local_fixups__ after applying the overlay to the base. v2 of the
fdtfactor series handled this more properly, and I'm planning to see
this through and land it unless there are major objections.

By default here, I'm running fdtfactor with "-S" to strip the
__local_fixups__ out with the assumption that today people don't
really need them. However, someone could easily override that locally.

I'm a little unclear how things would silently produce a bad overlay, thoug=
h.


> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > @@ -486,7 +490,9 @@ quiet_cmd_fit_its =3D FIT     $@
> > -             done
> > +             done \
> > +             $(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) =
\
> > +                     $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)
>
> Just to check, does fdtfactor handle compressed DTBs in the FIT, i.e.
> nodes with compression =3D 'lz4' as in sc7180-trogdor.its from patch 7?
> If not, FIT_FACTOR_DTBS=3D1 with that .its will either fail or silently
> skip the DTBs. Either way, it would be worth mentioning in the commit
> message.

Yes, `fdtfactor` transparently decompresses compressed FDT image nodes
inside the FIT (including `lz4` in `sc7180-trogdor.its`), factors them,
and re-compresses the resulting base DTB and overlays. I'l update the
commit message to mention this explicitly.
