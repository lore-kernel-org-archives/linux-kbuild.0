Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216314;
	b=NOks0hcbICaB4JbXHLsY/V6OwuRM0FitiI6vcU73ELZmjKMDqOC1RFy+2x5DHn9zPCAr
	 OSGa6UUcG9PN+ew2/LvQnCoigmXdvykenYrECBnTJG8nqweLUdFLR1tSMxmMNzEjJJYbN
	 pvz6eeMUMh92+4TThLTMFoE3ZPpT62IKEolZzdtECNoor4ISrZNmy9lPHqkw8gRcFFFqI
	 pwc1elbxI+59pOJNUeu+Tk/pmdP2JBgJAXkB/9oII6xriQrf9QPITFq/bMNH9s2nYsTbI
	 eLLgpnWBkOSHOohuV7HXcpPxPFV6IM1bT/5IbSEVuCF88kk9ABEaKFZGYL8i9BsPaLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Fwdc+YW/XiGo0Denx5Zmu82rn+nvG4NZ73DkXRr2reM=;
	b=Tdru9TiaRyFd/jXt/7ZPXNZJ+oQrTKq/LwEVE9JP2CodPfv/YEsQbKwnfBUbVTkuSQS4
	 2zsCIsMjKKwbMwhfGzwkEJxtRLRNQsuh4kpsrtrSN9TmKXSlSQDhXicYQZxdVyQdnNIZ0
	 ws66PrAjMkSj+heymk5ofvxYpOIicUdx5dUfWVlFZ91AG7ENuVS+DCjyskSRNMswWBXNi
	 qsH/ZhiMo5JgIsgvSiUO2/59blt93/974wddD+LtTRBM9JUbPrGT/x1LsjobLmCkyh11p
	 nRRq9zEANItH70k400RCl45ccZCnkX33tn2luvL3xhJMV3HkE2l0QURbLyoFxddkP3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ULUmbLtj;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710D606A6B5
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 23:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3710D606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ULUmbLtj
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e30c26a4so545459166b.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 15:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795216311; x=1795821111; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fwdc+YW/XiGo0Denx5Zmu82rn+nvG4NZ73DkXRr2reM=;
        b=ULUmbLtjx2oVdvu/C7WyEixb1qrM8dl1ZrpCAxWiilR1mQydYGnNZDAofBDUa3eYyw
         dvKefBkS30VFvqGNpFKG8QAmvJWiffV9Ajgr/DGefKTvHNcUX/2YUcTaLYU/iH4e/UtS
         cWDAzPbDZeIHNCji3J79UvwLSS/NZGQS/Qaio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216311; x=1795821111;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fwdc+YW/XiGo0Denx5Zmu82rn+nvG4NZ73DkXRr2reM=;
        b=MHwaUPdNYJE/0a/nC7UURaRUqYLpxV3mClXAPtBUHjdwGH1vFWb0i8VJeYymhWdc4/
         Ldf+ejPr/d+Xbur+WLW79LadRjduU21hj8JT54eK1NNQqsEZ2LfknTLCWR9OIle4RwgU
         nFibrVvm8g2buK7bYrfJYISRJJZFXQH27vF83EJ7uniKGl2UaCoHAdycMLLg4ibHfhNi
         AwuIaC2/eWPOVQHxLeh1H0oJkR+pXTAMqvScfG3Xt23UyGsx/un6wqBSAImbWjwplLXG
         sgxs68je4z73HT1AKj5Rra+ocqRNA0PzE0hm2uRBuCYVO8rEAqQzW7MPpHCPHF0UNK4O
         IIXw==
X-Forwarded-Encrypted: i=1; AL+hErF5mGaV92Bq9ax/A/b/awZ+OjF8GisT/RsE9U4UY1O4sPZ0GMikCoZK3zuxLpbXSpI+hmmk/UJkOe/1S7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fzG87RJE5H8GRX+Pp4rfDArcq90eGklYP2iNeUlX71nkpusbs
	3iT46D5KV0IxLjd8dPvIj8wbBYxm9vGm9WscVc2iGeafy/Lj5gkrqHS7xttxSpitAVamdtBFqCh
	2y+IdrrJC
X-Gm-Gg: AZFdTZepC4VQzfI5U9JNQ0fktt3PuA5dMs4Fad1e1k63TORUTbYBUJRNY4DoMjhEBt7
	se+VZ8cXoijO97ryz0WpkduO74OSZ9MFRjcCu90begg9qcTkdhR9hDpQHXbJzVUaeh5gBiO/75R
	tHiXXbVfolE/UBhe8qnuyp+o0dktdZpL5ZqRjSId7Goj/PSq/iatWuBv0UP6hdn/r8wZZrE3N2P
	O62bBlDAkLSGuakaWzrnkeFL4CVxa5dqVSpUZszdKxOwZoTAZVnCIt8SUoFP+1GS7Yue+hZYUh3
	jbmlbilnP2fb12onXr4o2QnHqpvUzMiXL7EQzCgBsugasHk35NabPRriMbv4HZMUKydH1oQzVR/
	DDyv2dBsH812jDophoPb3dlxNC/LPdo6bucgxoL7Mk2W+/ipQlzC0n7jpkAOHLtbwc919IeOOBm
	zAWZGzwpkwTUGmCZuUlSky+Oa9qju2cjAwgMubs5cKihd6cDFu3InV7DXhL+CE8UWH57J+VlkPM
	G6474/6A18Nm6dRrkbr/r2aiNbyXacC5yiIjJpcpb/UAlPfPNEnrfiPpQHIpfmPTECdGh3+TybG
	rDds2J8nMxbqq11bXhU/HNbDtfbiKZgu5LBmCtXpzEaUtCxHBpjlKVUXGsIlhcOLw8Sd
X-Received: by 2002:a17:907:8745:b0:c2e:7fe7:2898 with SMTP id a640c23a62f3a-c513a82fa27mr406932366b.12.1795216311618;
        Fri, 20 Nov 2026 15:11:51 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm138050066b.29.2026.11.20.15.11.51
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:11:51 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso5125374a12.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 15:11:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFdMzVCTp0RYomrAQg6BUmV8BGAUlZkbSogEeJPP72qLahK8Ybk/apiVJkEf5mg98mKOROC82fKexJ5wQE=@vger.kernel.org
X-Received: by 2002:a05:6000:2c05:b0:48e:6651:5956 with SMTP id
 ffacd0b85a97d-4aa488c85eamr14307450f8f.0.1795215881201; Fri, 20 Nov 2026
 15:04:41 -0800 (PST)
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
 <20261113130858.RFC.v2.3.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid> <sashiko-outbox-215034@kernel.org>
In-Reply-To: <sashiko-outbox-215034@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 15:04:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VqHE5PjK1vFbv73G1UaN_BwxvRJjUJbHVB=9wL_h9PDg@mail.gmail.com>
X-Gm-Features: Aa3M54qr05eSVV9PwOwJNdqAzu1uH37TTf3Dyh-iO_tgJlOvdvevguI12yuhb0E
Message-ID: <CAD=FV=VqHE5PjK1vFbv73G1UaN_BwxvRJjUJbHVB=9wL_h9PDg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] kbuild: fit: Add opt-in FIT_FACTOR_DTBS
 support using fdtfactor
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
> [Severity: Medium]
> As reported by Simon Glass on RFC [1], can composite DTBs built via
> cmd_fdtoverlay reach fdtfactor with incomplete /__local_fixups__ when
> FIT_FACTOR_DTBS=1 is used without FIT_DECOMPOSE_DTBS=1?
>
> Although DTC_FLAGS passes -@ -L to dtc for the base .dtb and .dtbo inputs,
> fdt_overlay_apply() in the in-tree scripts/dtc/libfdt/fdt_overlay.c merges
> __overlay__ and __symbols__ into the target DTB without merging the
> overlay's /__local_fixups__.  When FIT_DECOMPOSE_DTBS is not set,
> make_fit.py packs those composite .dtb blobs into image.fit, leaving
> fdtfactor without local fixup entries for phandle properties originating
> from the overlays.
>
> Until in-tree libfdt preserves overlay /__local_fixups__, should
> FIT_FACTOR_DTBS imply --decompose-dtbs (or reject composite DTBs when
> FIT_DECOMPOSE_DTBS is not enabled)?
>
> [1] https://lore.kernel.org/r/CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com

Rather than trying to handle older in-tree `libfdt`/`fdtoverlay` (and we
wouldn't want `FIT_FACTOR_DTBS` to imply `--decompose-dtbs`, both
because single-base composite DTB families would leave fewer than two
non-overlay `flat_dt` nodes for `fdtfactor` to factor and because
bootloaders like Pixel 10's expect a single base `.dtb` plus a single
per-board `.dtbo`), this series will remain RFC until the `fdtfactor` /
`fdtoverlay` `/__local_fixups__` changes land in upstream `dtc`. Once
they land, the first patch in the non-RFC series will update
`scripts/dtc/` so in-tree `fdtoverlay` preserves `/__local_fixups__`
directly.

I had only mentioned that in the notes below `---` on patch 3/5 rather
than in the cover letter; I've updated the cover letter as well so that
plan is explicit if another RFC goes out before the `dtc` changes land.

-Doug
