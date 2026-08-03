Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE5B29B200
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785745155; cv=pass; b=cNz7Hk5KynpEu6I8igZhJjZqgBJP8Rf5Lct7YtCvZtVwDNJXT6r3xfZ1P7AVOLyhj6IrACl/vkshfdWptU1P/B+JTvxZfK3higw5fUskKXFr+ezRPKe8+ViufTdxYn8BFXF/CrCEDIZZjMz3IjNHkF074ml7z9hzZ1zwhHRGkMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785745155; c=relaxed/simple;
	bh=vsRL3Yexg6P3G1Lx2Gv+y/iBXXcmViqLpXcltvWgv6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bz+FWI0kTElybYogaAqa00C+SHu7C9amqnA5gAhbJcN3ujUbNl7kqb4Lz8pvZGaxBHa6xHQaAJtaaZZb2buU73ZF8xwEKXJDE8YgRwk9BVuFklkk2P2O01Kwm+wapd5H2v82LabmRSmy+W92ogHR+y3TqPDWLoHHt37GBBCJQX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acPvY6ay; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acPvY6ay"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2864464a91.3
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Aug 2026 01:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785745154; cv=none;
        d=google.com; s=arc-20260327;
        b=FRt7coRnsdtucSYez87lu76O0s5AF1PVSzsR+MGtMv+YZm1J6ACHurTE3mEwdmWE9k
         B332PjC4p/Nx8KI8KhtIemPFdzSvG4SiFpbr0RUAxv69/mMo0CS2c/VZWDBh+gojldI+
         C/I43yRgrPudY54pAZ+oRgsxvyeDpx+0/tkz2Cz5AftyexsPRZf5ejpjoZa5RpxLLEtH
         SdhRIdd7/FQ/gr34GrNvUDaJUp9PljSWPOhT7eoT0Cyx8kpgrzW52a0bLp5caucXaCFT
         DnvyM/AaajshbqnE1W0Wj2Nk66fwjJtCQlhYDm0f3P4QXeJeAE+STybpx53Db+OcnU0z
         GvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vsRL3Yexg6P3G1Lx2Gv+y/iBXXcmViqLpXcltvWgv6I=;
        fh=giWtkxbOcdYf5XCYGZhltaZDJUsEsbzLWNY56pZAGEM=;
        b=L0sfxJs/U6jmEAU+eAJt9qXOuZTeQ6QoVQfF0dKFKSpCaIZfJKlHSXQLKfopRN8Cjd
         wFuMGBMz2Xas4sK8e+lbqYD6M670Bq3S9BzPO393pHAkSqMbuqRh7fs3stt31HxiX1Ci
         uFkpIbmuitMAwyIspEU80be5Qwq2MbLN8/gFXYnGU2wFlUfQFSA/vt8Z3ic+M/WZc0wK
         2LAOGnEuS+Zb0UiO53mXq03sfSEfYzWjxnIPaynGuKeRGIj8WerGY/dTS4q3PGXofgDU
         vWhdGHoUNbFTPHOu6kc5XSiC6oO9sVZROwGgsxzPj4U530yoJ8ljrQRa9sy9OYpQSfAm
         bNvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785745154; x=1786349954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vsRL3Yexg6P3G1Lx2Gv+y/iBXXcmViqLpXcltvWgv6I=;
        b=acPvY6ayaTUyH0D7bpraEQl9teUeTDiPvtPIgqgtX1CeAyHOE5Aw/3SNE+18PiO8Ul
         nrOXKKtI+6jgxjLpYoSFx8XJf/uXQOy9K58D/H6y3cL4lSbFExIQBy//6YtjXWed6QCb
         bOPJTp+9xfHFajwsYgdCW/s0NiFziixCI34hSBs5UXrun4W9Le/CbSOTabZeLCgBLTSH
         a6fFNJ2nRy0W+U2+EVswB7VYi1Uy6kk5hNfeBePoEWG/s7L5+gtDRY/4rD4hCyyRyAaF
         dzRyBi2L9O9wZSnIHIIUSafU1ukkZg3yzZLy3Ej4n2MKPRyozMZ5SFSfGy+DGCOZSYE7
         w/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785745154; x=1786349954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsRL3Yexg6P3G1Lx2Gv+y/iBXXcmViqLpXcltvWgv6I=;
        b=H/wIF0yhdIGiKNrHPSWxE5vgLhU5BDY4WSWj9NPyajJmThiew1TosGvaZCT/y5NYu/
         WMGhboP7q54XZF83PfRwxD3BdQBXlromWls5sF33U3K6SUeklYeaSSRsKnYgF+Kzeo/i
         n/IdvG+FOQOTXZD8RWn1/3a+MoBuABORBQl0PhUT21VadzAI7usgrqEPRMwSo4bBDuaY
         /v50ekVAOhJG6k8IljMk+e9hQHan8sLbhGhv2BFXXLTEhLlegVqgDpBKnizMBXrtxTWH
         yyAiJeCRjJ6kb8pfWl/0aF728tBONBCRaC+96EW3KcR/TPs2znPWMfjL9hFa3hUp7RWR
         bA+A==
X-Forwarded-Encrypted: i=1; AHgh+RqszPK56Tlqqb6il5zA5y/6fv/ogN4j9yNwfUxdg/lGMcQQSe/cnT7Iu4rxiWLyHnFWMflThq9N08BnD6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLNN1Y7m/s8ndXGS+/oMLyfeGIivY3Aw/qv82t4xCL72+fL7C3
	HeeeEUNx8D1nQDvTRca4uHgtliv+1yPZTWWzwTXft7SImrHuOm+jU2LIxTf3jEfpvyJiNpIlfWr
	UE/sWO5PJG3Y20xe7t+9q22j0EFSbid0=
X-Gm-Gg: AR+sD11tURjGNeyo7kDxayeok1jpeXrvETooXJRWiCRG/trnyaVBCkoax2WhiFFXjr8
	Z9Ll20IDnUdRmFqJV8AkJ0ORrxUOtwwiJU5RCbY5eDFXvbeRgjYs7fD4DciEC5oF5U6pgSiMDkO
	Yd7b/5dlyA/rF1Mf0PaLHbPQXi+vBiRv80R4MrUUqayxQ8oKIJwbrq2IrZ4sJg5IL43wyRYorGx
	An2f5g1h2YsRW0pFTi0hSrbMUGBYMvbBtnx19RE7YTJghXO6y9mmQCCEHFU2s2f1/t7XjO4ID/D
	cWIlEqug+gDfQvgij2ucCJKMRFDp3gY7iJ7MYAtiDaaz5M4yofmVLFTcurcgpgu4KapJYLdr8Sk
	g
X-Received: by 2002:a17:90b:590b:b0:38e:8896:4024 with SMTP id
 98e67ed59e1d1-38fbc56c5d8mr8636911a91.40.1785745153913; Mon, 03 Aug 2026
 01:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719120514.159914-1-ojeda@kernel.org>
In-Reply-To: <20260719120514.159914-1-ojeda@kernel.org>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 3 Aug 2026 10:19:01 +0200
X-Gm-Features: AUfX_mz5GbOLeUAnN0MXV9nrJx1dw4VDksfRqeoBzmYwN_UpfZ5WZxnd7WCsBcY
Message-ID: <CABwQupMVPDXcUCugu2GmVM8JgoFr=NA5ex0=GYF9p1_tt0moqw@mail.gmail.com>
Subject: Re: [PATCH] rust: rust_is_available: warn for `bindgen` < 0.72.1 &&
 libclang >= 22
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 2:05=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
[...]
> Would you mind confirming you get the warning?

Tested-by: Burak Emir <burak.emir@gmail.com>

I checked that this produces the warning, as intended.
Thanks again for adding this!

- Burak
