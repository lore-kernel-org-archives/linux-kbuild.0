Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993979;
	b=wNihKPRYlRZUm0NHMdM6WFTlMuiU2Zlvv+Zu8ZLVoLKp9T04OwSMU7GDYrDPYKZtUYY3
	 YsSEcL/+0elcRyqJtY1KYnobXpNrl7ueTEV3jReogX5xeVG11d2tujBzRBD7jaWDCbnmd
	 3bz4XihwKuWOUJlzk8/ZZmY2IBcMqYLrPW+jcCdsM/vYrLbokIKEV1CRoLE68JpbGTRQY
	 ewLt/tBaI4bNeiTd7fvtpRjfJEsXE8eAPAIn6N5yairAg2vxIxyeuXux9MW3NCFNC7g1W
	 gmbjZLEyHCep82riHwMFVdVTmPuuWeYZPzsBEyNlDRaBvNp0lgsPApHbWyRIFG6gisg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FJWXDTr7Z5MpSyOdE1LeYV/bbbLocx7Wgu/XQXU9+kw=;
	b=VSyrZOzaEb2mjZhHYZZbBUSZMhYc2zUfgGNS+TkvBpTTL/t0M+FZT9Qck+NBxc9LwgFs
	 64lyn/ScFRFLkmVOBus5SrhRgX1LPHN9HgCCBBEL1BnoaV4U5nG3Z9mNnzP4ivb6BR4K8
	 M7PP/eM/HjrSA2joj7aCJxAuSQKcuGKoFLm/28S4NK+PvAMdTAl0I6h8ThF7suMIickd9
	 Cq9qn/8r9WuI0W9B63IfnexMMjr6t0k3PLyFrCJKV4JSdjRBz6rYFhVcI8uDTRJ9MBNQ0
	 GzsxlLyHRmVRGs4E4QEm/C6Nb6pt8pddbZvBWmS9RRBIUwCsJZr1rir4+M+xZ3y28GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y43U01z6;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D3D606A338
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 19:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D3D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y43U01z6
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so1234958a12.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 11:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793993977; x=1794598777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJWXDTr7Z5MpSyOdE1LeYV/bbbLocx7Wgu/XQXU9+kw=;
        b=Y43U01z6Si/iZBMBl+lqSzuq/ILFRhvNWJWSAlIH4aXcxNNEAQmmJs6Mj3FCX7Xe22
         appVHnGh/AYhPWArCIcOwav8xCPb9xSDhldufy99GWlYe5LHoO8/6X7b5Q5/vBGPYGV1
         ncpFYuvNTE8WdYFEAWzZX3zV4cuQ8b4IGrWVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993977; x=1794598777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJWXDTr7Z5MpSyOdE1LeYV/bbbLocx7Wgu/XQXU9+kw=;
        b=Pr0h0wyv7sbseyBClxXn52nWHPYyPho06LsDsBgwGhk9Pn355DC3xY1sWm48T/k5DT
         JCYF5lqv5nalzfLo5XnkTK3zJ8XJV3hy9IWtNq26zKkpTokLY+2Mxov8U6aHIvKiszcB
         71qml0bZHW2IgQI5jTC8KFGawgF0aThQ4jdcQIL9kXo1F88QhmSLjXEiAlD5oyZEg4T/
         Ry6ZX8AmXCVn1zfdCfFBsGLJb76teV9q9XWKey9rILxoa9LhibyehcSbXbMc7SHCFpQe
         zVoN6F1SW2liSNgqxoylMLEnIfEEs5qHrsUUzh+mOkMqUdDKrPYBSWTQdRGU+XtbHFVi
         i5Ww==
X-Forwarded-Encrypted: i=1; AKwUvBzpRPvbQV70DwkLBa9uHOBOB9c95wnHF5nhvRN02xv8GKl0uPyoViOzlCxDkc9dhPmv74JzgREbqe7oJtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/is0N3exDxSLXrWDq5QLPZaV/2EVHZy3opGQZuDJf/EO9xIIlO
	6BuV6RL+mi8xbRkpI3rTabe7DUUrPi4WC4rNBDQodnIJXNP8dLniUfKJJDtlbJR+1zoYZ0ht2tK
	Qo7PIiQZb
X-Gm-Gg: AYBFou0AGj6ejVjt1wV/qUNuDuM/WP8a0QvZEWZZ+Ytg6ybjo+Pv5tSsAtRAgCwDVKe
	F4AbhaO9/7dZNey8asQZejIS3FNWMz0hZc2V66mrboob6amZOsx+qnkANSSCG1dDJvpwwB+nvHJ
	qTnqD7MFPfy1I4CXqMEWheioHsMkvFQJrTNZfGr/DnRUmh3+DjLX9Rfa/rfMJ4ojOqhhiFEU+KW
	Ws4A7QM2c0Pqdl0Fld57DrTCS4i8ERG9WeZWhW/vMBeH7aHMiLl2IuU5EOi3Q6EpkjbZ39zpfu8
	qkEOxPNog2vv7JgrSxzpmo0prBlrxgp9G0pv0yWDTZlAKqyQxv7WVL3KBunMbVOgOfdUVjQgsfR
	rscvnfR0kkGso8236rhH1+X6bBGzpnO/Bi9LxiFd/VwlePRtnOInkidpUG4zE3DGBlHCeHtxsev
	x0rsmC91VFJKyV59pKFzJnfXb+GGIC1KT1AAqQCO73WHuZhjx9bBFceWGDwaCW4k0YMxKLHbMJd
	JpIVGGmYLq1oJVY+jSYBOGBOuUuwxYcD+FYLUBuklZu39wg2uwsL8QZGO+RacPM3p8oeElp/MoL
	cEApTbnTXnMuE64sUZsVRpi25czCltMTp9M2UwXVKDHlU2ugou7VdHLk1rdbuXYAvZ4=
X-Received: by 2002:a17:907:c0a:b0:c45:b99:f282 with SMTP id a640c23a62f3a-c4d351f0e61mr302809366b.7.1793993977476;
        Fri, 06 Nov 2026 11:39:37 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569e638sm103299366b.48.2026.11.06.11.39.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 11:39:36 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so12281225e9.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 11:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx93512TUhv/wCArBkZQooxykVjI4cRkOB5c0coy2ROr5r9feiKIFWwC2wQ2I3nmfxm5mJcwkO/N+9h6Vc=@vger.kernel.org
X-Received: by 2002:a05:600c:8b01:b0:4a3:5a7b:6002 with SMTP id
 5b1f17b1804b1-4b6dff841afmr64687555e9.28.1793993975424; Fri, 06 Nov 2026
 11:39:35 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
 <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
 <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
 <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com> <CAKwvOdmTaMQf4Wyk_sygaushmMd9dRR3xPZ6K9rbKYB25uz7jg@mail.gmail.com>
In-Reply-To: <CAKwvOdmTaMQf4Wyk_sygaushmMd9dRR3xPZ6K9rbKYB25uz7jg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 11:39:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WHjRTmAd9XO4HaenLWH+H+CEPzQzT=LBrtczeLQjKbZA@mail.gmail.com>
X-Gm-Features: AclHuK9tP02VsIUFVmusvGUU0-cT9m0zdYlZ-nWofELLkEPHJWUUFL-DsndX4ZI
Message-ID: <CAD=FV=WHjRTmAd9XO4HaenLWH+H+CEPzQzT=LBrtczeLQjKbZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Rong Xu <xur@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Han Wang <nesthanwang@google.com>, Snehasish Kumar <snehasishk@google.com>, 
	Nilanjana Basu <nilanjana.basu87@gmail.com>, Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 10:17=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Nov 6, 2026 at 10:13=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > As far as I know, Profi is enabled in the Clang front-end initially. I
> > remember reviewing a patch that enabled Profi for the Rust front-end,
> > though it's possible that has already been merged.
> >
> > It seems strange that these flags diverge between C and Rust. Could we
> > add a comment to indicate that Profi is currently not enabled in Rust?
> >
> > Rong
> >
> > On Fri, Nov 6, 2026 at 10:06=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote=
:
> > > >
> > > > Just one thing: I think we should also have this flag for Rust so R=
ust
> > > > and c are consistent.
> > >
> > > Please see the commit message, which says:
> > >
> > > > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes beca=
use
> > > > SampleProfileUseProfi remains false by default in the LLVM backend =
and
> > > > is only enabled by the Clang driver.
> > >
> > > Is that incorrect?
>
> Probably better to be explicit, rather than rely on the implicit
> default value, which sounds like it may be changing over time.

Sure. v2 posted here:

https://lore.kernel.org/r/20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea=
2e1bafce6370@changeid
