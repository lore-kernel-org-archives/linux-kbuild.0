Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84C38E119
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567948; cv=pass; b=CByrPIjopSJ5MbNDKEj5SK2Pihxq5+1Jx73aM5o+x6nDhWH5Ik1OMEScd+NcYJiIF+McNQrA28sjWp5FHwGgGTKp+lcRSgJMg7VLAr51IZ/5cRGjkL7lUvs+TL+wGxrGuwce0ReF+za/fY9y6P6xQPrwiWXFLrlPmrz54f3yDOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567948; c=relaxed/simple;
	bh=BgbFX67wDVJkTsdj/9SCJ2EKpleloJIPnPNPMGXZuv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lx+bAPGIvW0Q1+caaes03Aop01Tn9QvgQPJxOLaJBzfGWVh+kcjaxE+emV7bgBxKPCUa8RmZv9Bbx7ntqoRJNT98r0/RbZOtUCTuIEnzutvPrX9NDQPGsTyxM+DSk9u+FCfUQ1HVbrz/sQfnVa22wwyuqXwOu5Rbcdo+IewYXWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyie4fO6; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyie4fO6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d5862bc921so6876335ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 03:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787567946; cv=none;
        d=google.com; s=arc-20260327;
        b=Zy+DYZrN0eIOUQCprShi1mVqQpEShxGVjtfh8Ax36wkpOjjh0XBAXtHX7XFJ1czfUk
         uM2R2AplXSRDWApZHHBRspuB4QtNIie/sDuurTDKAxfZH7fEZYP5m/eYNclIkbnkb32Z
         jBwZJfeQ2+X44XTbUqeOHXKV+r1qrZU7+1LYNkuj/D5khXl972l2coGxYWmJYkAyVlt3
         FkTtP0XusomfjCj08Rb5otkpUhQfQgz7RmoxqgJzjxoL8JKW48K09laNOVp34wcsXbGV
         mIyJjyv8g++sz6r63jQm0sZlwfhCduXp9bgNt44V/RgybwbirZHeU51Yunaqdo9VAAn+
         aPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1d4kH4nic3HhhxSGmm8stA+Ap9zvMH7EPicZmp7UdXI=;
        fh=6r/P7A4OHKzRRinH9d5FRVVA1vKJ94AkZEbwMGuCGZ4=;
        b=nIGpVyinN4dt6I/ODQoY1sI80ArLOz4hrXoIowqHxdlzdU2rKxIVd6O9AOVZ5GK1cu
         szRO5t6uhchjepiNAuOOzj0xMkWMoc2KwvXkG6b5i5HuDWnvcP/lpFNcopmwE3w7LADl
         c/DEb89W96UQ9I7U9yuhibjxEsCtpAQ9BvzGVKaXXaPXEBkpA85zE4k+V7j793z3TAvS
         twV80PdWvZKfSCD74952dlGb5k2je3zDQtEQ4CxBuYxm+H9tKcE4VktFxsRRVNM5+qr5
         L7Jad2frxIKiK+/CWGxA43JyV/C+jjBQ4ZrCXmcJr8KFKbKbVxiKdyL5Jnx65hqpGG/U
         JKpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567946; x=1788172746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1d4kH4nic3HhhxSGmm8stA+Ap9zvMH7EPicZmp7UdXI=;
        b=cyie4fO652/D0oNZUMAUomGdhRC0ZsVoj75Y7G9VvDgjBacdzG9kr77NG4KgvRuSfU
         Vv00JMNyT1iuLLIq14+zfQzF914ZgI5xomLOxoafaqC+gpxtqOTMNyFPQrvTwDhJfCjF
         6SCu1W580c5qtB9B2FFs0aXa6JQZvkU7w006OtJtfJAbyaxlwz76VQ8+LjE9HRgozZ6H
         qfhuqpT4Onysn9EkHXUSaMW8eoLtglsWUDYk3V5IC9mPP6xhKv497YCziqU6FMocnpM5
         wj2LTW1T9LfdYFOMajBukMZ9ozTPyh50DRksaXG331amXiLE/bLnBtavWWZiaTF5s33S
         21Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567946; x=1788172746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1d4kH4nic3HhhxSGmm8stA+Ap9zvMH7EPicZmp7UdXI=;
        b=m/bzqX0hvLKmRmMMASV07noH8vKszieAia5fP++F6J422CivDiHpZKS+Sy6ZVYckEp
         n6SdkkIP4M/ewzRXA/Ay9oMAtxWwXEnMBl1nRu7Jx38HRxg7wWrQji70OZTn8U6Dl6/w
         8fMw4evbt4sTAE9FTdsYewpsZPdQqW9B9O1bDTvTGxaaeHw7WrcA+6ahthsNcvDpnRJr
         FQAPV1YaAyiio61ibJZLgJs2g/WTC0rCHfAcYm7rrA1hwtayucXfKdZM76XJimHa5Wg3
         B+5g5XH+Ku0U5qi4m9H0Sb65T+AcRjFQG0ju/HK4UCMMF7b+NJPMQnYtKUaa83D7GIHD
         XeHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rok141PG7/wS57oC4yFPZT/qXgmqtA4AD2sfpklkfPHlFsqX5ML1DjQIqwlVls0MZM/Bsc7yeGo/Yp11q0=@vger.kernel.org
X-Gm-Message-State: AFuF++lHIvI9ssc5wEby6XsgBy5UFgTJIyHhNzC1gpsbKefG8x88FXsA
	ao3wzdMRDXy1GNn1oTJtyYLyEoE1h0F/Fu8yWjMVRSURALR/Jpf/8qjn5jrw87fjINPYwC0iMYP
	NHA5M+xRYueuSdyIP7gIAA50vZJ8Lwk4=
X-Gm-Gg: AR+sD11zyikxiGtvP/ZVEVrt3WZakCTfYO8FawytcqKKTUCUzKffv91+2bDt1qkfA9J
	m0eUt+wHQ+uZs4WOPF74zAoHVPE4+Ug0WgMMXMegUmfo0hmSb6n29Hl6Q9ngtHll5L/ih03n/Sp
	pAyXUDjWiqyvCjqlnvEg4n5xzR8ZaRvvr3EeBeK6eRVR239OLTQYf8QgRtcMonPyWPpiYhSa0fq
	34IUhm/By6Xr7SJom5XP6ZgzvM5P0+DRF7zkuch3zRWdXSwh/cp/yIg5+VkbHf0cE8AcmBMDnRc
	S00xw4ZcUavgG5kL9yj6f4DgI5HSh3ku5J2f96NpU7OOaWZPXbSpt29CdcV5QSLd1qpRkNzstoA
	XKf2PsUGkSHqmJ6EcFdeOiuQdmCV2t75RpoIxIlMy3au225RIpRV9LGXxJDcj
X-Received: by 2002:a17:902:ce8e:b0:2d3:a50c:5e19 with SMTP id
 d9443c01a7336-2d64ad815bdmr230932495ad.1.1787567946515; Mon, 24 Aug 2026
 03:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816133233.197500-1-ojeda@kernel.org> <aoPOqlGAlLOJ3wgx@jpoimboe>
In-Reply-To: <aoPOqlGAlLOJ3wgx@jpoimboe>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 12:38:52 +0200
X-Gm-Features: AcwNN1WICBTdtFPqyjjwqdJ37MyeqFlctpOt_QKR5j4W0Iv0235s8zfeWZyWNvk
Message-ID: <CANiq72=tKp2LBq8ThjRRZ=q+VPb9F3Sg=v1yrVZ2dpWPC2SE8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: preserve unreachable traps with inline helpers
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Matthew Maurer <mmaurer@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kbuild@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:18=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> FWIW, I've been working on some patches that should hopefully let us get
> rid of all the objtool hard-coded noreturn lists altogether.  I'll try to=
 post
> those soon.

Echoing Gary's +1: a good solution for this would be very welcome. I
have added a link to your message in:

  https://github.com/Rust-for-Linux/linux/issues/355

since it is one more possible alternative, which means we wouldn't
need upstream Rust to provide that `noreturn`-symbol list in such a
case.

Thanks!

Cheers,
Miguel
