Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215808;
	b=NU/kvxMYZV/2t/24jHUHUpwDwE/tdUH+1AhSTXsaKy29UbOfvoPo/MdJXf9ldAVpEj0W
	 ALZGtb/4Gaen5Tv4nQdOR+8l2TCHXEJyst9YTLXXYqlKD3xqW1yEO4iIWnQhlOhNXyohg
	 rzZcS2pZr6ErPHD2h1dVn6FnYEJvixaADgjqEuVTqYTsk0F3ObnhYyieKSFeZzsYkey1v
	 m6nJRl/Tjqw3XkuJ8gPcnT2ENDgqdFkRIP41F4P1vEaOLfqfmj1vbW/DwrCGzuX0Kic+7
	 fJjSCLPHd0OTyRIakO4OdZvh57lsHCLujWIU81Dzn2FzduupbC+aUKNtfoByHbRrikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5GqNarA8yhniPQn8im3r/1O/fx/VgqmvibkYDqdOfy0=;
	b=C2dt9hz+Hpj6gkiDZATK7WNskjBQNn5GOpVQ69/+oxKA2pVy3G8o+5qUkB7RCo0PfSE/
	 tLC7uHXxdNt0Yh4XV/AIVsWTL0rgt1rA4xOGOlaEKWyZ99EUTYZw6sdR7Uglc6fd8dRMi
	 lAfVpizHdIFxqwZaJGnbBuApru8CDcVyw78cCeQdt7bgeb6OxFExVTZWAnTojks9omk9u
	 sEE5hPE4m2RlsHA0RPpYjKx3lU8ZTO76f/AM9fV4p6cyl/Yadb9YngntR2lsIDpORpNXM
	 6RnH+Ib+8tYTJdxaKZvUCcZ4QkVY/9qpXflhYrkcZJw+qHtNvQPRQAdAqPPOEN/sDhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fxNmALEs;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C281606A68B
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 23:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C281606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fxNmALEs
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso1714979a12.2
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 15:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795215806; x=1795820606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GqNarA8yhniPQn8im3r/1O/fx/VgqmvibkYDqdOfy0=;
        b=fxNmALEs7giTEZ/uC2VoLWNHbrXDh/y49zw0XXfkx7c/tRl8Ca7795+3FYcde9jr3h
         UcHDRtr9Bg3wLRStLNAws0oeCq/o+f2OiFtk/qUTK0XDkk+ewDiv+M1so/eheAIe21Jy
         4KTn5W9zN01S2wIpkjJ56qvi9kOd2+FOAQ4sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215806; x=1795820606;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5GqNarA8yhniPQn8im3r/1O/fx/VgqmvibkYDqdOfy0=;
        b=cbs/8Ttas7FCp9A3pfXJIhdWTViYoqHUAPFlwurkIka6mYe8yNWtnKOBidz3k5E7lf
         qTBwExTvG0futomaYM/5JZ341XZyGMOH7r5PIlFWVFzu6Bros5wPP6TKC64qlyYwcRjn
         GyBsSnMlfYl5lIR+5gJQ5x1ASYnWLkSm9mAzLLWruU/uwvBp0rRUMzr2/HcSrH7Su0VH
         NE2HQAxgRCSn/WgyaLz+yVmpKmqJyDvfMWNkwPzuNnSrxPpUf7yiaWvtP8y7sg4rimK9
         5S2n7bqDOQD+b8rTkenlKwjKj2jFtH97h8KeeoXsK3EZW7iupOy3K/8U4wTenfv+zWsd
         f4Ug==
X-Forwarded-Encrypted: i=1; AL+hErEIoavqSiA/kOTeW2liE3e44IaIOp9GWGlb5gnvadEmbVM/foEE/Swh546aachtOXWKPOCAcE/cU+p6mrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QUOY7HEYo8DsEwnOx5A3pJQiKD5zKhZu8idL7W75J2jMeZPod
	UvX3eyxa5InwPgdb6DW5a4GQUpvCajJsmwaCbGc7LhE1VWHfMUVaF1b9lIF4b1j/FtUNN73wLZE
	4XRoNeSEf
X-Gm-Gg: AZFdTZe6KjAXiHstYQvnOzjVMT/4CvpGvK0O8+Pr1vt/9aJzXUmNhx4dfj/VnPziWNO
	5cVCQFgfiWumtObYUaNkp2Ja+KwwZ8v/VlNNK5eWoyjTvX4CZ447a4Wx8sY8dEXgYAaak/qCdrj
	U0HgjIUTxg7n/QgnxVFW4uGLQN2nTd87amjrg0j95uJ6+ErIR+lY17uo727KwnIvgwdOcgdFhO3
	EDCl1oPfnqrM6T2aVHlDrNdC58YLseOgxE/0UgNo5koy6ta0Hc0QFlZF4B7iZlDhh9BSg563XOx
	0HIluS1Yfx+beTeXRxLVYasVogWOWqdfQWxOHbo9E5giPT+9+SX1JNM2hjNsLrZTIWWqyrQCS5q
	uMWpX0C1r+Vlff8GLer5eLdgdV8Yd/C4GL9F2pT3sPDety6bWtjxCyvvtWQzz7onxTjz1Z+aChj
	QHjKB/70TqfHXoS6ApfD3RXvpilBzFC6UyUGkXZTGFW+ApdPfeILWPmDklljlOrxjNKc2l++GSR
	ole7d2y8lCsxfL2i+BQr+0EHact4UXcbFaSHJ5XFHFZX+Iw7PHkHOWM7gyK58g1MJCeEtAlboRy
	MK9mpGNRv2VMreFGPXVH/0qbUjKkTyR0tGc7cQbfILePtXgEDqmdjiR46FDGjznlEK6s
X-Received: by 2002:a05:6402:5005:b0:6b8:791e:5d4d with SMTP id 4fb4d7f45d1cf-6ba638a6273mr814568a12.27.1795215805781;
        Fri, 20 Nov 2026 15:03:25 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cd368sm1640739a12.8.2026.11.20.15.03.23
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:03:24 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492690dd5daso1071491f8f.1
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 15:03:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHG7Lk8phubozHPmi5PvdVdMQngTnR0qLska9LQf8HQei7IF1Ddi+p/5/hzBoMXmtEZLRL323VSogDgtQs=@vger.kernel.org
X-Received: by 2002:a05:6000:2c13:b0:4a6:dfe3:fd93 with SMTP id
 ffacd0b85a97d-4abb41f4dc6mr9300663f8f.40.1795215802107; Fri, 20 Nov 2026
 15:03:22 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.2.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid> <sashiko-outbox-215033@kernel.org>
In-Reply-To: <sashiko-outbox-215033@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 15:03:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U=wMCvb2UXgvSpZxoBNJnMw8fy-JzfYFOtQGs1-=w-MQ@mail.gmail.com>
X-Gm-Features: Aa3M54pRDnkxai3VLH8umlmccjAtNqBNTUBcGhqs9gRyZZN92t4mYXIwkfZVL_Q
Message-ID: <CAD=FV=U=wMCvb2UXgvSpZxoBNJnMw8fy-JzfYFOtQGs1-=w-MQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] kbuild: fit: Support selecting DTBs and config
 properties from a file
To: sashiko-reviews@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Julius Werner <jwerner@chromium.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kbuild@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Nicolas Schier <nsc@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Marco Elver <elver@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rong Xu <xur@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2026 at 1:09 PM <sashiko-bot@kernel.org> wrote:
>
> > +# If FIT_CONFIG is specified on the command line (either relative to $(srctree)
> > +# or relative to arch/$(SRCARCH)/boot/dts/), locate that file and extract the
> > +# list of .dtb files to build.
> > +ifdef FIT_CONFIG
> > +FIT_CONFIG_REL := $(firstword $(patsubst $(abs_srctree)/%,%,\
> > +     $(patsubst $(srctree)/%,%,$(patsubst ./%,%,$(wildcard \
> > +     $(FIT_CONFIG) \
> > +     $(srctree)/$(FIT_CONFIG) \
> > +     $(srctree)/arch/$(SRCARCH)/boot/dts/$(FIT_CONFIG))))))
> > +ifeq ($(FIT_CONFIG_REL),)
> > +$(error FIT_CONFIG '$(FIT_CONFIG)' not found)
> > +endif
> > +FIT_CONFIG_FILE := $(srctree)/$(FIT_CONFIG_REL)
> > +ifndef FIT_CONFIG_DTBS
> > +export FIT_CONFIG_DTBS := $(addprefix $(dir $(FIT_CONFIG_REL)), \
> > +     $(shell $(MAKE_FIT) -C $(FIT_CONFIG_FILE) --list-dtbs))
> > +$(if $(FIT_CONFIG_DTBS),,$(error Failed to parse DTB list from $(FIT_CONFIG_FILE)))
> > +endif
>
> [Severity: Medium]
> Does $(dir $(FIT_CONFIG_REL)) prepend a leading ./ to every entry in
> FIT_CONFIG_DTBS when FIT_CONFIG points to a file in the root of $(srctree)?
>
> When FIT_CONFIG_REL has no slash (or when FIT_CONFIG is passed with a
> leading ./ in an out-of-tree build so $(patsubst ./%,%,...) runs before
> $(srctree)/ is stripped), $(dir $(FIT_CONFIG_REL)) evaluates to ./.  In
> scripts/Makefile.dtbs, $(filter $(obj)/%, $(FIT_CONFIG_DTBS)) compares
> against $(obj) without a leading ./, so nothing matches, dtb-y is cleared
> across all DTS directories, and no DTBs are built.  Stripping ./ from
> $(dir $(FIT_CONFIG_REL)) and running $(patsubst ./%,%,...) after stripping
> $(srctree)/ and $(abs_srctree)/ would avoid this.
>
> [ ... ]
>
> > +    if args.config:
> > +        config = parse_config(args.config)
> > +        by_name = {os.path.basename(fn): fn for fn in args.dtbs}
> > +        config_dir = os.path.dirname(args.config)
> > +        dtb_configs = [
> > +            (by_name.get(dtb, os.path.join(config_dir, dtb)), props)
> > +            for dtb, props in config.items()
> > +        ]
> > +    else:
> > +        dtb_configs = [(fname, {}) for fname in args.dtbs]
>
> [Severity: Medium]
> Will by_name.get(dtb, ...) always miss in out-of-tree (O=) builds when a
> .fitconfig section header includes a subdirectory path such as
> [google/lga-blazer.dtb]?
>
> by_name is keyed by os.path.basename(fn), so any dtb key containing a
> slash never matches and falls back to os.path.join(config_dir, dtb).
> Because scripts/Makefile.lib sets FIT_CONFIG_FILE in $(srctree),
> config_dir points into the source tree rather than $(objtree) where the
> compiled .dtb and .dtb.cmd files live, causing process_dtb() to fail with
> FileNotFoundError.  Looking up os.path.basename(dtb) (or matching the
> suffix against args.dtbs) would find the built DTB in $(objtree).

Addressed both for v3 by simplifying how `.fitconfig` specifies DTB
paths: rather than inferring the DTB directory from the `.fitconfig`
file's location on disk, `.fitconfig` now supports an optional
`[fitconfig]` section with `dtb-dir = arch/.../boot/dts/...` relative to
the kernel tree root, and `parse_config()` returns normalized
tree-relative DTB paths (`os.path.normpath(os.path.join(dtb_dir, sec))`)
directly.

With that:
- `scripts/Makefile.lib` simply looks up `FIT_CONFIG` via `$(wildcard
  $(FIT_CONFIG) $(srctree)/$(FIT_CONFIG))` (supporting external
  `.fitconfig` paths too) and takes `FIT_CONFIG_DTBS` straight from
  `make_fit.py --list-dtbs` with no `$(dir ...)` / `./` manipulation.
- `_process_dtbs()` in `scripts/make_fit.py` uses those normalized
  `$(objtree)`-relative paths directly (since Kbuild runs `make_fit.py`
  from `$(objtree)`), so `O=` builds, subdirectory entries, and external
  `.fitconfig` files all work without basename lookup.

-Doug
