Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793409321;
	b=sScEOnKbn3D5SSjCptvCgFuMYcG93W1iIWJxs8eTYnIWLtliXXTWKpwnV2p3E/Evc+kQ
	 gW71Ism2UkT2HxedJUbqTfmasUmslRdHeQveFlaIAEcygIYox0fwS/tOdox1AJVqHOKUa
	 0LmHcpv0rvOyhDIIJfB42cCAWjxzMggTj/5UTpecuHTMWJlwONgjQ6CNbkqO5kBMh1bJV
	 IRpJGxeg1zNjb2+OCQZUf3sn0Cl+7veHaoDItcglclPFhTYyFTGr0Vfx0F9Kknt9FUwr+
	 Y9SkaLcp04kxkT5sfX+1vX0VtLWGk8i18RYYBKmh9JJlRNncVtVA8ZeUEEyktawU3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793409321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
	b=Ql2VDspswH1RuBAjaOHqMzNl2l6PcdmZnGD6N/9QEy5iRWvvzSZezm0VnaYMzOkWts4M
	 QKzQqXVMpKNaSSRvrikqBNxUYvYoCnB66yONDzXYm0x7gU5ucfjptX314TxGLbKCSA/d6
	 obR6dpFTHR41IzgGvBe0IZhF3aejHGcWA5lpf7hOSSfey8jBbOBYlnU4JuB6lPh2mE7L1
	 yU0EyaCuBV6VDZct1TSSeO/Z6uEFLwCJFEOEVjCZLsB+8Ukqsv1Yfc6Jress5qzx70mpb
	 YKXLwAlnbvUSuIDxSU7lcsqrWvYAJXYi8MGhtDMHfrLafK5MsG2M0bO4ZMgpxrW9kGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R+yRfGla;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE515606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 01:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE515606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R+yRfGla
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1239879e87.2
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 18:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793409319; x=1794014119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=R+yRfGlai1uK1xxFVMyHifA7JG8lOQLEV5YhXf4AWs5cFl3f4HTKjpj93TubTZYBVG
         zRM8dWkoWWS90mD1eo5uvwiZEQmQJ6nBLBpTMDhGdmWH4H1noAGnfOfgopfKK2+T3wY3
         hBnkTVZeANHTLOgAhZY17ixCjelhguUe/SoZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409319; x=1794014119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=ftZaCDHn96HAcQSJYnRk2Zeh62ir7qvvV9ynu4HhBSryy55ffjxTN3gr2X+/us8vpt
         9zqU0CCXBTOXYVgfB+8VMjhLD6TlJyxSPirwH2n+dEdJXFmq88B7lzXoiElqi1yGeE8l
         rz6obHjXSGG3mes4NxyAD0jHoRGwjy9S4AXSRwQgouIl3ptmrhkJxekxUEYQPdKYUsE0
         1xWUk3ew0fJWun5CvNC7d2c/vCgn8C7N6iRuWwVt5H5ge0kaUfLjsxVoyNkkQBu56iS7
         5k/hmGcAVrRedvKDF6V5vdCxeQ9/fh2SyHW6Z/ncPQ3WVituufSpufwoelNMUHtcZN6w
         g/pQ==
X-Forwarded-Encrypted: i=1; AKwUvByMvIsZMAk6TCv7jYGj8azuelsdiK8KDn8qAGi7bDApHMh+WK5vod80M+M2a840NX4zQ7t6F/Rq5JCMs18=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0BtweLPM2p8ek9fFLD6TwxFuzynoiXLlvsfK5pHG9eogj0hpa
	3Bh6dxW8e0vbC0bQ03bjl+4XFDZiNP1d2q67Kop0WDDQLj+YkSJzMNL9L9XZPW/ematMKetfZuk
	NGNPYJ2mQ
X-Gm-Gg: AYBFou3HHSABeQLRHGWOlziaEXCBDphXuTT9bwWG+vF7p5c0MpoWN51jnnNPGHFYa1z
	aHlUQkZ1wU8T0ad+rZ+RkRU/xYAPS0J5XWvE157kf4QYQm5xHRuzXKyTE50uChp6jGXFxoMDZH9
	zylGUVpVr2eCC3rSA7KM9+jRmff5W3Eh2StNwIhtLpaePxS7QWHeBOfuhsX7UFQ7M5RnwwcMej9
	NDtS590Y9VeWWWhiQZ7AvcHVa35BjyUmM0AfmA1GpBJDMCiW4Qck1bWE9N1Pr5+4UMb52uMXIST
	vBF/AgpQpYJS55nX428bgVQxDiJyhT0SwHFrExp98HcUTH77mc9tJrmnL/dOxIt+GvB9VmN6izJ
	oRg4sNvE1bPxZnnfxvKF5CC+iGYSa7bQOK3Ogg0mo2vQuJXhr+k/zm0TewEnddFnRnB9k0tBqr/
	36dF1WLzA6VBl970czPdYlNFwP+4oDaDVZHdhx+wp+A7fRdHTnIJKVuItUgQA4Kl5Gb66Sa6cpO
	RD9SjddttpvvoIoxF0OzTH5+Ui1HUZOmap6A6O7R002l80aIPm+ebn5dY88J8ffMsGvQ9CpCyt6
	DNG4U3nHJJKuh1pZ8pMV2bn+aCrMeKi9FjWuR6yDv4+NjV1eXv0jdvp4lA2vzKwd8h+Z4x9f
X-Received: by 2002:a05:6512:1106:b0:5bf:d127:b83c with SMTP id 2adb3069b0e04-5bfd95620f4mr1245494e87.10.1793409318935;
        Fri, 30 Oct 2026 18:15:18 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe075206dsm293816e87.77.2026.10.30.18.15.18
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:15:18 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a75f960be3so11662111fa.2
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 18:15:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgawd6Ek2cizFyXAd/WgrmaS159ZU5dJztJqVUS7NfsquJUxQ5XslnkQOWh0M0G1xD69RAuuPau33n2ZY=@vger.kernel.org
X-Received: by 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4ac1709aa77mr83103245e9.16.1793408992269; Fri, 30 Oct 2026
 18:09:52 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org> <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
In-Reply-To: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 18:09:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
X-Gm-Features: AclHuK9Km6WTJvvTvOnJ9g5USO9Th2gdTGYh9-cjnPaFh3hhpAF88g-93yWA4Zk
Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
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
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 23, 2026 at 5:26=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > 1. It uses a checked-in .its script to associate metadata with each
> >    board's devicetree. Other tools can parse this metadata in order to
> >    craft a package that the Pixel bootloader can understand.
>
> One thing I'd like to check before this goes further. In lga.its the
> metadata is a string packed into the configuration description
> (board_id=3D...,board_rev=3D...,soc_id=3D...,soc_rev=3D...). The FIT spec
> treats 'description' as human-readable text, so this turns a
> free-form, undocumented string into an ABI that bootloaders and
> packaging tools must parse. I'd much prefer proper properties in the
> configuration node, defined in the FIT spec [1], so that every tool
> can rely on the same names and types. I'm happy to help get that into
> the spec. What do you think?

Putting the metadata in the configuration's `description` property came
out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
already uses configuration descriptions for similar board matching).

You can actually find one of Michal's files here in U-Boot:
* arch/arm/dts/zynqmp-binman-som.dts

Then parsing happens in:
* board/xilinx/common/board.c

I honestly still think this information would be better to live
directly in a board's devicetree itself and then extracted to put
in the FIT, but I've decided that fight is lost. Honestly, the
allure of using `description` for me was that, since it as
free-form / non-standardized, my hope was that nobody would really
care what I put there.

If you want to help get something more structured into the spec
then I'd be happy to use that instead. It's my opinion, though,
that the metadata that we need will be different depending on
the loader. For instance, on Pixel phones the loader has this
information to help pick devicetrees:
* board ID (number)
* board rev (number)
* SoC ID (number)
* SoC rev (number)

On trogdor Chromebooks, the bootloader instead had this information
to help pick a device tree:
* Board name (string)
* Board revision (numbrer)
* SKU ID (number, though actually made up of a number of bitfields)

Michal's loader obviously has a whole different set of information
that it uses to figure out which configuration to pick.

The proposal I've tried to push a few times is that it's OK that
different loaders have different types of information available
to them, but people don't like that. They want a universal standard,
which nobody can come up with. Thus we end up with no solution and
everyone does something different / downstream...

In any case, assuming we keep this as 'description', I'll document
the exact format in v2.


> > How does this series help us?
>
> The FIT_ITS path is a second way to build image.fit alongside
> make_fit.py, and much of it repeats what make_fit.py already does: it
> puts the root compatible from each DTB into the configuration and
> compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> hand-written .its file, and the .its files repeat the DTB lists from
> the Makefiles.
>
> Have you thought about extending make_fit.py to take the per-board
> metadata (e.g. from a small file next to the DTs, or via
> FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> logic, and trogdor would come almost for free.

I certainly can do that if that's what people want. ...and, yes, I
think it would simplify some stuff in this patch series. The
question is: what does it look like? Is it a file that is a list
of devicetrees along with descriptions? The list of devicetrees
would be to limit which devicetrees are built into the FIT
and then each would have a description. ...and yes, that would mean
it would need to be updated in parallel with the Makefile, but I
don't see a significantly better way to do it. Yeah, I guess that
could work OK.

If so, I think a bunch of the patches in this series will be
dropped or look very different. I probably won't directly reply
to your comments on patch 2, 4, 6, and 7 if we go this way.

Should I give it a shot for v2?


> The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
> documented anywhere, including the image.fit entry in the arm64 'make
> help' output. Please can you add something, perhaps alongside wherever
> FIT_DECOMPOSE_DTBS ends up being described.

Sure, I will make sure that any newly-introduced variables are
documented in v2.
