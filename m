Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793561696;
	b=AHkNYf7bL8alt74+ABNYwkUSFsVt8DtjhJHW+TJJF18qNH10JYXmK+GVEZnrGzQlb0C3
	 MfbauxK83fvc+2IMuaIS9FKPFQN3HqFCifoSqft4bYxTlGYQKYh3+ccyE00/h7MwOSvZ5
	 ge1quIqytcuGY1OqW3SkbAMzKlt6TtEY5hrccGQjYJClkAQ7V0Gv3GqMgSYayHBdn3QR9
	 4Sxlg7kzBWqPncs0YD9UtKXOqtfLcEXeI1cLu7urRZF35pdPEr/WrHRiHyF2XQCPflDwp
	 KVQjbG9Byle26sXgMhRjTZBmW4cNYJKUlfUE6Aswj60ZBpjIFhFjvl/ZTb5VDffVTQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:from:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
	b=BiRDVHNIf6eqlAKsaPIpRU1aut3Nj+mxXQ5bQfuw9ZpXxgOo4aEcUp+mJrM8htDCtqtb
	 nO7LwNOAmnE/1a2G//sQkZJCSdduKnfv+iHmFVkw0HwQ4iyBs0tCqn/ltPpUDMVltycxg
	 bk4g7pfepjybM/waVrRD+FmNscTeO7/6EdeuqPeZF61STHhthivKsl8I4b/Bp+kdzbtt0
	 gyV1LDLpU3tFc+JQIuD5YkjmHjNhc4WUONcz4NVY+xrynisL+dNKcOSmim3wpstBVGjk0
	 rhan8MNn9gKTaEPNW5L+31yXb2rfLZ3rK7f6s9NfdTzuJI99HyPurSq22sScqv/9nUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG;
	arc=fail smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571C606A325
	for <linux-kbuild@vger.kernel.org>; Sun,  1 Nov 2026 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B571C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so3192933a12.0
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2026 11:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793561694; cv=none;
        d=google.com; s=arc-20260327;
        b=JqaITzXYbiWHjIPAmEd9+BDnzRIbna/UekJZfIzzDpB0h0CJTZ/hGJXTBNcYZV9Uxu
         xOQVOwr6Ctw5eTZxCTFlTmutYv8RxV/5DU6vmH9Nra4kLjJD91YGTtpIASfkSMYudw/8
         QAaThkL6H1wShIXKXQFQEDPOeB61RV0h/lDalm2cOjQAX/SCdra+hUqBOP9FQ2FLmz3J
         eRU+/QywqfK44NZavEONFJVMJ7/Yp5M4+M9HtFEPp7cnnM/LiioCUEOsWSLE99MQlrKC
         HfjNo7LEMEAZhJPvRBqL5EPfAlE2uajfV4b1/LPVMeq2wPot2kch+swEZ35pgG70HNUf
         KcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        fh=aK+hoC0YW6MLrRjaYcyn2v5vMZJOtdBOH1WUSuge9eg=;
        b=c9vQwUUhJL2rSPyy//v3iA/vTMSsiVhqraWn1Ohh+a0TP6AtsCmx54gUCXvXL2BgAS
         5i+1md4FkDc/sMF405QVx1OiMtamwV2EIpnr5d7BkLO4OcAX8y8xTwiapRTz+M6OHsWp
         9uptaLr94A9wQ8dSYfPjaB2sYP4beCwgd4YeBkowOzwv/3fr5tDZ22Y57eVhApNfDxPP
         8x6ZYs4KaIQyUwXOb7Yd1PX/1BldlNy2hHJQFmuR0iQZzSrETYpVD7EWRgfrPmvrQaBu
         eF1AlveACX9pPZ2Qc6rUls1Tew+IUDiDcaF7K83E60MqUrJHKdrYaQnw6YBolgyoKeb3
         Uayw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793561694; x=1794166494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=Lfqcc5GG/SwjR7rhF6i9wN+51zewpGS58ukrmB9LGRdbbpKdip3M+YroJNl6U5AaZ4
         rF//L/DV6VSxmy/1UQsFeJhmoDWwkPFReDLBiC+oRpU55av1FrMnZVBw20fY7l4UynL3
         HVfRKiNvpd9FUkbDQyR76hW+g1Owj32N3MUEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561694; x=1794166494;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=iRxJjGYgrSQXRARQdzOD86N0SD2lYY/HrhUjWIUIOwaATfEaBLKJV9AnJfKXaA07if
         IoFGyutXCd7yhYn7x6yP/eS3vkMTxw/JU97aovmvHCb64ZQ6LxYIWo5VXFfMos9P0lqw
         egKJo3ts1k4xzDxmkt+B2kBg7hjHoPjpeiWxi73D7idoA1ytHdhiAibZXSz3AUWJRucN
         rB2kgiufov5kxC/WTbZgbjz0d+aNTMVT5herW9IE1VFZSMTSJh45Qval2SNretlhnTHV
         8sjXjfXlJy/2XifxnuXhKYgCpocEC2kqY4QhDp22cHKr/dGk2084ed6xHqt05tqAsXuL
         mXvw==
X-Forwarded-Encrypted: i=1; AKwUvBxBLUL6LaCVIUg7WjSr/g6q3mEvIe36vaV/Z5Rs03pHllSTJZGXNymJsc2ZwmPUdZCb6ZS5XkVgRCMXc0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z88LDUrucraorYTzXmrC39Rgjxo2HfF7Co/ANsMr2FslBOcLA8J
	OQVOPRKBLZD1oX4xVnZcj/0En1MXKvwaLdJkhqbKuuT4BwPpa0FvSyu8T9wIoDpVYiAW55lr3m7
	d3osCzCnwIsVPwAr+20mxqVbFrUc+6lFvKdJfnv4a
X-Gm-Gg: AYBFou1u01td6BpYSkSAMFBY3GvA6sTJ07IdYZcjcQoYfd2O0NAJdC8q7nLvh4ihWxQ
	mgGi2BMXr722aE9ZkTWAb0KDXT2Oq/9ggUD1UkdH4+HP0hIJADtHaiVGo4WJLDhI/NBPjFg7M35
	3xS3mp+VcuJNBWpf+CDrnKZFPWvORBxRKBvQBPEStC2vzRNsTTBWw2+rjP4mF3agiuLSbRIgy4N
	1beVSdWyFuoJqHAqf/bBLizY7fZYTdMUgi9eDMS83XOBhjQdj61iMevgzH5NOE4QZt0/4lyzkRC
	ovOAO6ieKSgct0kN9Fomd/ksPC3aKOyAvqauBA+2HvIBOGGv8CZek6fJqNRd8ffHzVtxnC3jGv0
	GurTMtMm93EAaEXwc8NZRa0Qe4293w9lnmXAmyVaZXZLYWkS16a7v+ZpU6RKhgcwqqFrxyAbn
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id
 4fb4d7f45d1cf-6b4d4d6d938mr4052419a12.9.1793561694122; Sun, 01 Nov 2026
 11:34:54 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:51 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:38 -0800
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Date: Sun, 1 Nov 2026 11:34:51 -0800
X-Gm-Features: AclHuK-OENc2MfogrHTK6nr_VXdYPKQaHTgRVjZY6Us3vAfjaHxM1Qejmm0CbCs
Message-ID: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Doug Anderson <dianders@chromium.org>
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
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:

> Putting the metadata in the configuration's `description` property came
> out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> already uses configuration descriptions for similar board matching).

Thanks for the background. The Xilinx case is a bit different, though:
the same project writes the string (the binman .dts) and parses it
(board.c), so it can change both sides together. Here the kernel would
write the string and the Pixel bootloader and outside packaging tools
would parse it. That makes it a cross-project ABI, and I'd rather that
ABI were typed properties than an unwritten string format.

> The proposal I've tried to push a few times is that it's OK that
> different loaders have different types of information available
> to them, but people don't like that. They want a universal standard,
> which nobody can come up with.

I agree with you here. We don't need a universal set. I've sent a
proposed spec change [1] which lets a configuration node hold one or
more match sub-nodes. Each one names its scheme with a vendor-prefixed
compatible string and carries the properties that scheme defines, for
example:

    conf-1 {
        compatible = "google,lga-...";
        ...
        match-1 {
            compatible = "google,board-id";
            board-id = <...>;
            board-rev = <...>;
            soc-id = <...>;
            soc-rev = <...>;
        };
    };

Trogdor would use its own scheme (board name as a string, rev and SKU
as u32), and Michal's loader could do the same. Each loader still gets
what it needs, the types are explicit, and nobody has to parse
'description'. Please can you take a look and comment there? If it
works for you, you can point to it in v2.

> Should I give it a shot for v2?

Yes please. The DTB list already reaches make_fit.py from the Makefile
through the @file argument, so the new file only has to say which DTBs
to include and what metadata each one gets. We'll need a simple
per-platform file next to the .dts files, passed with a new option
through FIT_EXTRA_ARGS

Running fdtfactor can then be another make_fit.py option, like --decompose-dtbs

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Regards,
Simon
