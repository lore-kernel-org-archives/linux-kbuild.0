Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829846;
	b=BlsXjt1Be8Y2U1Vne/Dwm0vQ1gOgv5Jo+K85zoDeDFKsQnzI6ToXPtEdot9mBLt3mfr7
	 s0fh66sg6evAHCc5VTT5DbGmVTSEduuRts6HS6X4EArheP0PRl0NV7FPQuG0h2e7wXQyQ
	 bDVgbUK7yG0sZtpXki1V4NfpfH3X/KgcBKcZjH4ABSOUGck3zG46is0INUC/VWAHFcjK/
	 QoE0VmWnY3rspIQgapBWHMRUNzPCJm0C3Mvd+UZFy8p3gsSv9+4GWb0x5CnAeWNlgEoJe
	 S7BMb4M3RfzEp/2ZDwvcL6Fqf9lPv3IKv1ti2DHcl+l6PFWlefD5CiYG14dr8DOEqhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
	b=ctxdF8Xs+VlfhxE6tfBxaD467sEeTospBHIRMDSfO17uL0BHoh2L5qRJUjITNtfDbCZ1
	 ic7KEZO8Y75Ig0q+UxOjN/Y9iTTcOji12uPxAMYI4oZrEeRo3331BW6qkykhCIh9hB6KQ
	 e1S8IVnN6iEbEdADgWphAz0eGQsJq/2699dzDOisUnyZ0mMBn4WQI7uggE2fQayZXVIsN
	 zI9GoFTnNxp+uYVH0NaFt6jiL+LfmSe52jCvjIikR1ZMJW0mcad/fBeU78xNXxMRkFR1U
	 5gkmrWjgJCIAiz2zrNgR+LYvncsQ6lQiDw/aajJhdwauZo8fmRbhL4ZOabwMn7JP9hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E53606A31A
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 08:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E53606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1937461a91.2
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 01:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829845; cv=none;
        d=google.com; s=arc-20260327;
        b=MKaTkteaTp5s9JxkwxZDKYtGUs37l3PyhGukakvvQ1KqL79xpAy31XZqjmPHSn/6th
         klX4FJJjCl/zP12399w38SPqmR6p705/ufUm/NlzU6qWEXrDBsu8okEluoKK9/Ln4Yvj
         wE8JJhSk7Tj4SCR/oYZqGYhMafAUF7kvcu6Hdk13kU6GbcNbgioGrBClPr/rxttKOHiy
         sTkZO9WiiVwNGHb7BcPFEhVKwtPiTPDPfIWlRX41I1I5On8uQp+2SVofBNmPtbe+o1Fa
         Xe6BHwD0Q2BgUW9I5mQa5gwmGVffOF3OFQEeX/hmbqoXNXBHcnsKsag1JldI/ivQiM0j
         3KTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        fh=FkvCNfdLtrYHmq6NusQlkhf5L77r5J/TukvqbBaGRkM=;
        b=DJ/BuRUIBi6bEW+Tq+0jDXGmamyBuOOEkWSzcBELDXlq/MNHwPE2vyGhljT2KU6T1C
         v4L23AQYg/3p5w3tcdz4phMcjMvper4v6OAeBoDl+49uHDapF70P8xARiiR5Ssb4RmXr
         9Tn3ibrwnHBC/V4s9LVvc5O0E6tKNeGkhwuxcOVM4qC6f+PYWZOLIGOdrcwpUmzHnRxj
         1q+l7CkrpVMzdn55EVaegGMdUc+Zsy/rDjzNVrb9S9meWfw0Sr8XSVPWvfoBcGrKhaMc
         GpiaDq6U7P+T0PyIAU3FAkllzEffmMiduVtyo0z6mWx/h4FKAvPrl6QfoixzXHhCl1Ms
         9mIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829845; x=1793434645; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=W+scGDokeW8IVUlPw1qaHOR19xQPyTOtn+x7HYHtCqXqHaqa9rlnDqjOM+2Ceue7fL
         Aju4fOv9xr3yNjCoA1fmjYX1vQStbRNTO4lyjJ+X0ScdnOQnU3gmpoLqAC4vffWd2TMB
         smWVx5HbLNJaVGD3+OBLLSqtnKQQ46IxDRMvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829845; x=1793434645;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=STPPBaizuEvcU6KeK7Hf41lSQCxYyee2ZI5yrmunSeV+DcqjVKZz1HdxtP2BN9n24r
         3dEsgyXB0zJAkFBWdxhu6+XzuAQSIBR7Jm7tsQBnMq51f0+5JIYeJlEOSyYHFzrGyYf3
         4fq+2/BDK/01CwqsM8GCX4/UGhcn4uWVxaZdCqLsQc8NeuNiJPb/HmnK0T1y98l97TGP
         HlDvT3TEC4f1ONdzbVy71Iu8JbHwLvQUIi3sMtNdbu5intw8lt9Nhp7eZQwh7yiWRhcI
         7JvLvP6lLLAPHPqVYRw/4oYnZvDYU/wXq+2yxL5clyddbohnh5cy5urW+NIqcZ6itbf7
         ajlw==
X-Forwarded-Encrypted: i=1; AKwUvBxry8+eU1mjnwhl85qzUBxtrAevKEgoBj1M9fq+jVgPBdR7kb6yxJPtQ27Dh/t4w1Rtm8VPwxiViOnwF5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4gZRUAMoWCk7T5Ht73ls0gij71Rw5rj334KwpRaVOAMfLT6WI
	EPe47OaqYH3I030DB5O8KGYAgY/FbXC5hW/GMmP0ojW0B2Dv8lHmv7nufBrNX8bnewlqVBjtNUQ
	f/OOsfK1CRtcuGJ43jt+YlCsyZ0DKhlWrNW+QtG2e
X-Gm-Gg: AYBFou13836q0selhaX1P+m2RVT0mmys7npNjHXSBCjcb9mZwwXTA+Jkyz4odgVITKa
	AAVZ2ibySAV3ksp2r4DuvrBGMRaHg72XIsdOgk4GffxmxocwFv9T7uYQXxVBRcLzXFzsn76ENng
	Dhbgk02xSIPFvu4slz1Y/I0Ozdl4CoYsjvGCrmcPYbZ3eDhFpiLS5X0gA5GOqAG0J4zOPJD6XNm
	ZnEjO/dwdDJEufysLAOg9f3sBzv4XOJcI3ClI6K1mUATeJcrWCEDjCGlGxPGIlmlu0zj35Ka6HT
	PcAUBdU/AyXwzLUf/r3/tMRB0eUzN4jCRrT4tFK0ABGoS9N4hU2WvHzTwJIerFksRzsihqJ3Kkj
	7D6jwwSKhADV/cLLdfEVOFJKADqhddGN/4Dk=
X-Received: by 2002:a17:90b:4d09:b0:3ab:31e6:12fc with SMTP id
 98e67ed59e1d1-3ade9475f03mr1281929a91.0.1792829845190; Sat, 24 Oct 2026
 01:17:25 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:19 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:14:33 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:19 -0700
X-Gm-Features: AclHuK9OzNbsUxoUq8dndEPiTUrFf9OR8thbHVNZoTYdjjGKeFC-1VE0qwrhJ4E
Message-ID: <CAFLszThr=rPCTxQxst2_Br6MWwaRFe_rHamzLXY=ua4Qr8mAeA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
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
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: google: lga: Add lga.its FIT image script
>
> Add an Image Tree Source (`lga.its`) describing the FIT image for Google
> Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
> `lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
> metadata in the configuration descriptions, allowing the LGA FIT image
> to be built with:
>
>   make \
>     FIT_ITS=google/lga.its \
>     FIT_FACTOR_DTBS=1 \
>     FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
>     image.fit
>
> NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
> image. However, packaging scripts will be able to take an image as
> built above and convert it into a format that the bootloader can
> handle.
>
> It should also be noted that the "description" of the various
> [...]
>
>  arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		fdt-1 {
> +			description = "lga-blazer.dtb";
> +			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
> +			type = "flat_dt";
> +			arch = "arm64";
> +			compression = "none";
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};

Just to check, does fdtfactor recalculate hash-1 when it rewrites the
fdt-N data? With FIT_FACTOR_DTBS=1 (as used in the commit message),
mkimage computes the sha1 over the full lga-blazer.dtb and then the
data is replaced by the base or overlay. If the hash is not updated,
anything that verifies it will reject the image. I'm also not sure why
the FDTs get a hash but kernel-1 does not. If the hashes are only
there because the trogdor script has them, it might be simpler to drop
them here, since the packaging scripts repack everything anyway.

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		conf-1 {
> +			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";

Since tools are expected to parse this string, please can you add a
comment at the top of the file describing the format? For example: are
the keys required or optional, can they come in any order, are the
numbers always hex, and does the width matter (6 digits for board_id
but 4 for soc_id)? Otherwise the format is whatever the first
packaging script happens to accept, and anyone adding a board or
revision has to copy the existing lines and hope. But I think we
should get this into the FIT spec - will mention that on the cover
letter.

Regards,
Simon
