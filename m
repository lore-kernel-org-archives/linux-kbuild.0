Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601962;
	b=V+NwLOPnYYh8wZg7u5ArnmKaZufFAeZuDgosLWkP5mwOnTfbemaPND1LV+iWn3P0VoEV
	 2oavBH51T+oghkDLu1x/f8Hgmv+iOQd3+qkeORbS8hSBZlfm5cpbyCcqy470figJ0WXDA
	 naKQg/GEu9TDjUeICl+hJMK+bXwLLOB83i+cVWO5wKVmTxBNfpQh06ooK75Xzcj5pgqgG
	 1/0tiCgxwK7d3j2HM7qMx+5BoW4BTvI2HeQbK/W9Gfi0hcY3qrUUscVwyqg81nyRuVtxZ
	 fZ8+fXD3qZdY37Peo37XrGvBez2J7yQrRM8cZOWpgr16gs0r+/Wtr1/flJp+G57INqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
	b=CDih1mvh5Y7taMQ/T4DVGB+RbhZeQYLirlMawjNhdNruuZBp3/mSkSqzhISSNhMLVwDM
	 5ISvBBhvXvt6VKAarjtzudpqwMMnbGqAJ6m2p+kIuCoUsCPnlWeLU91FZyo3YuMfcg5aR
	 jZdr/7/S/aEkVmZEdgVOdOgfdCAAaiwtJssIAK9urKeCv/9Ufh2jqbCA6gK1ThNthQzVa
	 K7JNulZwPB/qka2xXc1Swhb4MROiebqy9YNmXgv+tR3P90PLRnuACf80ESIWArysI9Bdh
	 zFZNrKrjxpK4EtIt2aZjJbGfIM+DFhYQIkB2lp3jGzzn6joFqVK49MOn2xhyA83c1pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="iurLbt/g";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F34606A330
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 20:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F34606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iurLbt/g
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d58c50743so248451066b.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 12:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794601960; x=1795206760; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=iurLbt/gHHB7FGDPEHN0g2EzqjNBYZcQIYKEs/lxVVuJHAyUX1QNd+EtfOUadQBnqh
         72WhV2EANst/vzql7nDMdyIMKsog26n2aU/SVx1yfyfCqhdf5C4AFIZvJ2mfI8NyHdox
         n5tTQIpdWPRv6T/BSQ5BGo/606d57zAYnTJ+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601960; x=1795206760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=K7+1g3w/fl7KmmJMtN5M6R5McExB7fXs90OagrhKBPWl6qGlbRNzcukTxx3FUUjJPY
         c3rSoLnDDW6eldtlShPfsvUQ3Z/1OC+x2ie+u5gZaGNIZSV/M7lw8QO+eOc3ZXpYrGu1
         eO6ddKD/5HFGSvCX15wvUyh68lddjNlmP94laGfbYxB/QlD1M03uoalznYw4K2Q7UT2R
         JjkzW55Mn5hkhSOZBA92uqw3QPrc/YxVVa8yx7Gzg7tNO/Om3atbVlx8qeIp40xjfJyK
         qR+CcHDuzmJAMhi+jpj03TCilSGM8u3bXcqRYjDuIhl9cNuNy1D8eoa3qx5sIXpoOj3M
         VWYA==
X-Forwarded-Encrypted: i=1; AL+hErEihz6lJ+GmnWue7BMP1767Av0/eqUY/RV94txrG9ww+lIPUSs/iGTkotD03QUhvfUuMtiJpOQ3H14+bYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gaxl03859DsCWG7M4tz2+aFnbUNaSbKA5/l2q0SChaEX9nZy/
	eH0M5ZR95df/9lrGLuUn5CGcggVE9eRtUNOFsXxVNLeookx5Hox3d4XLSO2p5eieYvQzUtqnBld
	uy87kVh/O
X-Gm-Gg: AYBFou05+nsqs1Ze5X5w0eNHECD0DV68kOtx1pZWJkhIYeNr9KgXhYYzNoPu34WUuJl
	jwmB5pLE72cFS5VROINgOGodCCIPRDY8RtD+0nDgRHEl6sHlDmh/3Ct4+AijCtEDSerhEr363JZ
	pVvkuTiRo2CDfRCHj8vNr6mFkDbqAx+g3JKCwcnBxMIyd1Tvf7/blOoyISL5BYPJPkzzxMkuySb
	O3pw9k4XzCyfLwO3Kfwluk69KRacyMOCu5f4Dyy1xzpTvLUQ4S8bLEM44L7Tm+l/QOCK20ih/31
	0jIVEAJZZlAe9EzxOQHKQ/FaRRSyaBWfb+k7TG8R32ZAKY+5ge2E0udINkdNu/fFWEHkkNGucfB
	h/cVD15lyQm8LixVpiuTXmXmHgDeMFKLdOHqzKbfvtbwsrQC2SAURhpjdQRvZ+CwxPJl9sskpM7
	qqSgM4NQUbM5pYUWVQeDZEXuNQZVvjimJ8TDfSgCBEPRwqXlDvPi2HB+iQVM1yv2C5rJdFbTVmL
	Lx+fB1Hs3KdoAb56o8IN9idUKXGzsubCaZ7z9StsE7f5bAkvm9AaBRIwMKAv5jU7BSAle2OAgVB
	fEqAzay97rI/wg6Xgvp/uiwtlIZzAyYcc+crASc8oclOOIPjqSJKpnmxtz4CkodtLK65
X-Received: by 2002:a17:906:9fcd:b0:c50:9149:48e4 with SMTP id a640c23a62f3a-c50963db437mr310484866b.11.1794601960363;
        Fri, 13 Nov 2026 12:32:40 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5ad9esm137775166b.2.2026.11.13.12.32.38
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:32:38 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6057b03fso1819695e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 12:32:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF+YxnvMIIvEjDLs1KPt02kOkx2Wgtohp37EMOAlwGazRr6Pn/yugZsk/it7CdjKklIe1X08FN5ROWf1M8=@vger.kernel.org
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr76502555e9.24.1794601957270; Fri, 13 Nov 2026
 12:32:37 -0800 (PST)
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
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
 <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com> <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
In-Reply-To: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 12:32:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
X-Gm-Features: AclHuK8SHFgoyjCXNJrs3RjG85XKuoNtkqoClolncw8zp41l0jasiLh2oN-rCLw
Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
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

Following up on one piece of my earlier reply:

> The idea is that fdtfactor and the overlay fixes will all land in the
> upstream dtc project. Then as part of this series we will bring both
> in, so we should be all good.

Thinking about this more, we won't actually be able to sync and run
`fdtfactor` itself from `scripts/dtc/`. `fdtfactor` is a Python script
that relies on `pylibfdt` (similar to `scripts/make_fit.py`), and the
upstream kernel maintainers have pushed back against building `pylibfdt`
from the kernel tree's copy of `dtc`. Since `fdtfactor` needs a matching
`pylibfdt` installed on the host anyway, `fdtfactor` will simply remain
an optional external host dependency when `FIT_FACTOR_DTBS=1` is used.

By contrast, `fdtoverlay` is a C host tool already built in
`scripts/dtc/`, so we _will_ still sync the `libfdt` overlay
`/__local_fixups__` updates into `scripts/dtc/libfdt/` once they land
upstream, meaning composite DTBs built by kbuild are still covered.

In v2 I've documented the optional `fdtfactor` external dependency in
`Documentation/process/changes.rst` and
`Documentation/kbuild/kbuild.rst` (as well as in the commit message).

-Doug
