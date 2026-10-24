Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829855;
	b=cJqOftKEkn0DQjL7VfYbH9BlkkMMLjiufPQlO8Yvuakgsk6jM2IqFBP5n8BC/P15fTHf
	 LmIMJbjsMVZCQU45Chx7FM+7FQtifM8KYJD6KJk0WiBUz11XZZdWp5t7ylSCCmtlBnGWF
	 pTvAwnIki+y0ljOSSR1E9xOkVB7T3U3lcVTFz46MPx+KXiuL+901gCmClkC2Yf4ifciv7
	 At56UbBXB9iMTwEQB1E77MlFvZF2AR5BRz7M4O8xQTHbP2FR0imOa/qVVkrV8GUoh79tX
	 ndmiNlVbsOWEJPbY2bI5/tVmrnKL2+ItJh/s3lXpZ51UHRiJIM3hXgG+Vjda7D0vxBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
	b=jpEcLvBU/kfI1trsoxHavkMWaMYo8cJ1LJZeYeFzMZ9er1MrbG1KdzxxDnDJSywgg/zS
	 4K61/gaLj+zsgAsVRMWvSrfjciTqdx7C/ZxBTcE6jUn95ITvTmgLED1+Wab3CWpHB1rHm
	 4RFdrxIQC2BIpqZGfeOPWUDooGknK/L9Xap9UcqJwRoWMJ6MVG9xphI8p5fbCzzQPpdyO
	 zN8YCGmeQ+MOTkqZOhsHJos7xsxn7GfHkveXegOlP5ckH0IdvbJE+f04EGQL1PRY8mZbT
	 1R8co+vRLuOgGN3wK+Jz/78C7dfWkRfk1qwGyfCy59bWmILVbE4OM7SCQYN3lu/DL+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE70606A320
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 08:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE70606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ade49a7ebdso473060a91.3
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 01:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829854; cv=none;
        d=google.com; s=arc-20260327;
        b=iagKK9/KnLVoUH5xClbgCqqbDztlGwEq16A4ewpgO8HxDG4dnRQOBLtqHxSG3bV7Ko
         EgIZX1TGrUXSLeTS7i1XqjWvhq8Qf0JZvCrbUNwMVCIlbOIPdlQ8DMk0HAwFgullIytv
         7lJ98F8dLjSGDRi3gYCMVuEAYA1nnFtjIVVIO6Ethtm2viCcRYtg88RVjz0DNJ+5Jtv/
         Dqp/dKwOb+PtFB2T72xb9uXcpBMZVHjm0RfD18xec+5qTZ57dmZYq/NyK+7Pi8nLBuO5
         onjuchgWkAZbLPwidoQPgDvbIf/XyDfHDwbbx8droCSqPEGBJCniR0vLlsQPuZ/KuD8N
         LXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        fh=kfip0GYWjCQAKEDc+oDVeIMSJ4uG9sTWMcttFx2syJk=;
        b=RRCqmDQCs2fk+LwgqvT3RksU4mvrUj11XQ9QupkMcxyXvWae3ze1CFQZWpaD67rctY
         WLU++dn5MjZCs5np9zGhfdQNoIYhWoEWd0dywYI5G4YGrDiogG9sh/8SrvQs4hdTNyIw
         olEg+w4x/6mEZiU8HKqbQ3HFgGQZna5TPLZ24KaNIvvc6FtFcY6iA/KzLCVUvaT5XYiZ
         lXsiGw1eLzaqprEmPikEGItdAGNd//Kva9N495CtOKQQckTTb5tWJMm+/EqQDhHZl/WL
         EXQtR1/hyGUtZjAkxeT1Xs383W15TtEeoPMZ+9tFnczEm++eya0iEchx7P5Aj5bQvUY2
         H0Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829854; x=1793434654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=k059ccS55T1YaNzStugk5ne3uFifaL4k2aSKrT12fShPJOVrNwIpZsTVvJguE9dBVX
         ygElTWkmgtdIXDyK+7PyNXPPrJ9Md9fuHPq/S6rSCxD0nkfAZFvNflsz/tXuQHDdBLHD
         xL65BHj8HVU1+f0FgiCizf5ZuSn5MRY7FWfjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829854; x=1793434654;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=Lai0prJkglLHnZkktrjMeTQpuNThzNKm0nVSnKLRI0GI9LEG8fJVNp4pFnHA9Pozkq
         T+cLZYpxOf254MFA/tU3Dx2DvmGNwCZmw5O86SMFRsJXzObSIzKqR7qPpBv9D/f7vbNF
         DDxMqGIfjjqdMPPdlK+73n2j1hbL4XtqMSnWuaNGzH1isZig9FzGQBpvBJOx4M4cfyEb
         hC4UyENcQcGmrIKilV3Ec2nfzrb18umUN6Vvj6E6g5WSLeJs49SXKGQDurTEoFHpaGkC
         xBGUznBq5oUYwoI8IHq5u9uUlB9oiyl2PGbVSn8I8VgLTMS0W3wmtI8ExVCdAzI4B3M9
         Pt4g==
X-Forwarded-Encrypted: i=1; AKwUvByni/WBmB8wVw1H301tfvASjdnXga7TN/2FS5nbeM525XooppGK929yNZp9xwYx1QEigC4txnrVhtzsRh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYn4sCmW/kvdZAxvy2avXoHJij1O6su1CAbNawz73koVik0Qid
	/2UrPAVtFR3gR895/AyCfEk7rZGLVt2Lri/51jIoOUPaMxvAXCmU0bB4Jnb6joT94myNbPkifb2
	eq5gb6TV1nvoofTAI1GDZuB6HKbQjiGz3Pe/39PXY
X-Gm-Gg: AYBFou0Rm06qaUhYpMG8Aw2sc6e8tGeTVqRJW58h8x/PTd4y5+ktrc47tuMpXnzlT+l
	YofYxwdWUewitCx4K+B3qXfBJ2zRYxIdKFvnEDEPd/r+iHnu8aNFdMaLU7mh6Q4bbXGWRRX5abR
	iW2On2Z/W/Xjft08py+pciIt2Xnfav1wz9yLFlPZR+vYI/MRVkZFpql8BKnpm4y3cyaTYPSOWib
	HXX9u+22ZDjdfEeJ9RFcn2wKPdtD8ZgtE9OIwmngIU2X6u5Vj916zMdir1OGV+3jQlBV/FbgCjP
	i+/uErByaRdvHh33qH7KmwN1WATH2nsNEcZrz8Cno2mNoFOLBTQVtvMNVGOaWiiICeennSYo980
	hZZuQlOfZ664pWrCj+a7IsN6SCHzXk/Sj+T0d
X-Received: by 2002:a17:90b:1fc8:b0:3ad:c14:35ce with SMTP id
 98e67ed59e1d1-3adeb0f4b03mr1215366a91.64.1792829854594; Sat, 24 Oct 2026
 01:17:34 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:32 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:15:41 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:31 -0700
X-Gm-Features: AclHuK_RH6hRiswn7VkHcSfsxk2rWaTJ0grpI4PKmWKFGktw6V3bTGvWs-_Kz3M
Message-ID: <CAFLszTgz66uz4gU6deR_go028R6MhwYuB=Jb5RJ8hqtzb5j80Q@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
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
	Bjorn Andersson <andersson@kernel.org>, cros-qcom-dts-watchers@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script
>
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:

This says what the file is but not why it is wanted. Please can you
move a short version of your notes below the --- into the commit
message (matching what the ChromeOS scripts produce, a model for
future Chromebooks, helping people who run upstream kernels on
trogdor)?

>
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++++++++++
>  1 file changed, 728 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.its b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
> @@ -0,0 +1,728 @@
> +	configurations {
> +		conf-1 {
> +			description = "sc7180-trogdor-coachz-r1-lte";
> +			kernel = "kernel-1";
> +			fdt = "fdt-1";
> +		};

One thing I'd like to check. Patch 4 says the main reason for a
checked-in .its is to have a hand-written description per
configuration, but here each description is just the DTB filename, the
compatible is filled in automatically, and patch 5 adds fdtfactor to
cmd_fit too. So as far as I can tell, the only thing this file gives
over 'make FIT_COMPRESSION=lz4 image.fit' is limiting the FIT to the
trogdor DTBs. In exchange there are 47 entries which must be updated
by hand whenever a trogdor board is added to or removed from
qcom/Makefile, and nothing checks this. The list matches the Makefile
today, but the two are likely to drift apart. Would a way to filter
the dtbs-list passed to make_fit.py (e.g. by a pattern such as
sc7180-trogdor-*) get you the same result without the duplication?
What do you think?

Regards,
Simon
