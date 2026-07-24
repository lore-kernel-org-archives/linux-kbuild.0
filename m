Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCAD36B93B
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Jul 2026 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784915636; cv=pass; b=dxC403z2sWwdUzOZ/hs4DTAYTa/A2hxoJglDfSrKfMqySAmRotJh4E9ugZoBUmEXix/ZcGyzt83K86rBgnALZLg9uzzY2xk9w06tyx79Z/xEZYUXsQk+4NMVPhYvhtyHD3r0na9JceRoCpJuG7hD+Wm7VBY90y0/44dNt/cdKv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784915636; c=relaxed/simple;
	bh=G9IEem2wxtFtOks28rR+hQx495hCV3xp33uzSclgE58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4k1J6dbhVQ2W52jlSIPWcIpR+s+GEOkfIuaqKvI5LOCPM9XFOgGV9UzlyL9KUieGH4Y6FUQux/fmIeKb7OQ61+/fug6+SHqqFNt/zT/tcPH/65ZGFKywkqPXLBAm04BNPeNqTs46ZJddAwMeAyS5Zrz+Yra4hXkieo8ML1x9bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx1R0E2K; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx1R0E2K"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca6d9c91206so54339a12.2
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Jul 2026 10:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784915625; cv=none;
        d=google.com; s=arc-20260327;
        b=gf0rl2PgMajTin7nyY76dCDybu0h90r0RHgn8luvm4id2/sdbPywbLQSUE5s5cTODi
         jUiNnu/3RbXS1iXC7BC/M+LzYEB5cnCiT76wAZabZiHAH/6X4dk9ei9e8PWius7QKtvo
         o8AZbjM+kVL7hO6H5G5qZENnvaAq/eWksji71DP4Cn+3SSM54ujT6A3tdx1IGoZBllX/
         cbcho0eNXpwyVo+Td1ope5J2GL28jNRtL4R2VfyXVL5Pexqj4S3AKwSLP655beVmkS2F
         0YXlMmDHTLFaWRk/Z0nmmhxS5qH38kHosKbJnKOSbVE5LLFBr5xuViJUI+4jZ53CR1YB
         VdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G9IEem2wxtFtOks28rR+hQx495hCV3xp33uzSclgE58=;
        fh=YBU+LIsSiB2BLhhCDJnYiGDp2clBpBggUZqznR80Gso=;
        b=hlPjNmxDaMGx4ELj1r/fKqv5Su+23U7ctsJVP8Kd3qzjmyzroAeM77HbbZP5Try5m8
         ezlGOAN6opgqSkBS6kIODQeIdEd1FnkOaWbOZ+oL0KjkPQXYhLjtaTf/rclTvMBXt5i6
         wcbsgAH4+O4GT8ifolFluc1sy8vdqLpXLLCKBQJDBjVzGeJKSAv68lK57+SH0FYxabcI
         8bdWDe/DLu1Zdzyasz3lmgOjiiIhbH2C7IWAcovrydAWf+pA3jctB/ap5TSOq1KgCTpS
         qpHnKf8xA1QMoHLZlwX1l1QOQbmhM2L446qsWxKaBoj/wSszAg0wEKOrHGkJEVrNGK7P
         dZvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784915625; x=1785520425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G9IEem2wxtFtOks28rR+hQx495hCV3xp33uzSclgE58=;
        b=Gx1R0E2K38B6qIWYDQRUCiTK+kT0pHMUECMiFKxSY8drcfo4s4juAaGHKLGAxSgKCe
         II2gqjQjYz9VDF5Guu1zTY0X1y3raRVSlkmXyhp5NsBSpgZcWukf0WE3l3RQ4leTzVe8
         xCWNvV0iKCQtGa2vYKsXQKoCdZp6RqLs4YrlAgHkf1eNO51u0EkpG21JvSglm7+nT5tj
         tQEziMMHhns1CpELpsLjz1BD3iJA/kb0P79wkdo8nHZrcl7niSxgN5OZuaAl/ZU2DkKO
         ZgCRvYTmpBqX+xJfEqLEHY6uJslWZDo9riSWJvzHYXTLXPVMUpf2UVNCRKV0lQ9QmclS
         OLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915625; x=1785520425;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9IEem2wxtFtOks28rR+hQx495hCV3xp33uzSclgE58=;
        b=Kt4rWo6jRtPUKc7YGsZh2P4/GmNUpDQO9yKafk8QqH+4eCKIXNm282xQwjOs7R4+ET
         N7KzBU3NBP0lJJ7pGiLxAvaxlX8Jekm6yTu4/aB0oKVxlZgmiAMsuzz1WMPEFM6cA2vm
         JjOWxvNYOxn5QDLm36nhXCOCU/Ygd2ZjDDfn6/zypRzOqcPIwc513ZXJXi1SOCoey+FO
         c3cs7YnSZG1wYnnYyYXNW1HpHZmNI8PkB6FyzI6d5hbjEsd2W0PQ9oQ46PX5E1piWMO+
         GbL4sBijl2A9Npx4YD7FTHlGAPVdpTIJke8J5sq43xnwe+2tOhfkEGNGSPJcdT03axBb
         zMWA==
X-Forwarded-Encrypted: i=1; AHgh+RqAx9hrSQqEaf5K6nGHDLE/oQnz2zb7CUTDMys7AMA/xHB/4B4X0tVTCr+sXjDV/f+4BAJBdyP4NJfrJjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9E9XWWFVyPC6ctrJmjW7z/WRAWI44H/UFj9OjsW9Nqtuj/Qmc
	xRTZUjJVIrQ4E9U17gAegGnj5XLUqlxDfYovFHLvhs8cbvC0T+FA+LKy/oMOt/YoCYF7Nqf8w7L
	VJZfb5MqE7l5m7QhlYOw5/V8qqbUTdsI=
X-Gm-Gg: AR+sD13czHFbP9NPu0OtDd4goXGQzn9kKiwPzLdDeAUhHe9zhp1i+KCtu6ZpwW81B2w
	OvUDsj2tRcLvXUcZoTl5UAmrrbQkVTI6a/RBp4AddJWpzDpuEeb3hloWOc4cqG97cSVJlBom9pH
	E1mO2N5qjN0BslTxBEqUztFTEWv2iJPUvMtzo3FyjQ9XD+4VIAkXag0pQyy2FCQIT2J4r0CO6pS
	+LHl3xvtcgd6/xjIeHntidVki9lR1Wbqkxk1ipPtJcK373O+gspBbubK2dfpkPFqSlGnJBrMkmv
	DV7YqHsL1GryHZJOjwseo7lhYN+cjACrF4ANpac6ZAEMZDP2X66Dux3XFWHQZtcpCoMy8UDaUrT
	kSdoX4MCyFmoz
X-Received: by 2002:a17:903:1b4c:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2cfbc788d05mr37452185ad.0.1784915625220; Fri, 24 Jul 2026
 10:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724170132.3783816-1-murp@redhat.com>
In-Reply-To: <20260724170132.3783816-1-murp@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Jul 2026 19:53:31 +0200
X-Gm-Features: AUfX_mzaCumB9W4HW7SO9s1gtK9AU_H0NQ_9WX625vcKJ-FzUoht0fuLpYqgUGs
Message-ID: <CANiq72mEs3qJQGxGqye1MPt3Akxz=Em-Sjf=Cd4ZjfiMCM7nwg@mail.gmail.com>
Subject: Re: [PATCH] rust: enable fentry support
To: Paul Murphy <murp@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 7:01=E2=80=AFPM Paul Murphy <murp@redhat.com> wrote=
:
>
> Rust support was added in 1.98.0 with support for x86 and s390x targets.

"will be added"? i.e. it is not released, but I guess you mean it is
unusual to drop from beta.

Link: https://github.com/rust-lang/rust/pull/152122
Link: https://github.com/rust-lang/rust/pull/158036

Cheers,
Miguel
