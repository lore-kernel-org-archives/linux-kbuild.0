Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F83859CE
	for <linux-kbuild@vger.kernel.org>; Mon,  8 Jun 2026 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902336; cv=pass; b=O/2wttg5M0r046sUONqP7g4/u8azZ5EyQg+vCy6d/CssAmpghFg7k9He9eX6pHtR0ZxtPy+3ol/ljIdlEBN7WB0fFdoPby+2AoQiAw36AkPgRn+lMsGBX2uRBABsbQiqUB0zVtc91laa9mPX7tWeOXU03w+nG3EgQJsVKBYgBVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902336; c=relaxed/simple;
	bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtkXXo0Fhgyzx48YCaCAuO8+hW2P4cl9mUC63+fcA3dPmbIHbc0LZO3rQyuiGtl43UpvaUbwmABNnFCWAC1z+YRcc2b4gRpfkW7XMY4A6smupV5LGKLvgQCdyTMC/QYcuwQUds9obqCHzbS8rsW/jE4hOAzq32rCZESQBINVhsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoPfLaQN; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoPfLaQN"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304dc707c7eso341463eec.1
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jun 2026 00:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902334; cv=none;
        d=google.com; s=arc-20240605;
        b=UZwYCZ6U2/2lH87xddpZWdASDsCgQKrAvpjBTKfTeWeOAlZ16+svNUXZGYCgYhe9bF
         zJgBxhxu8eRmvtVs1WAZKRsfRo7Qa7L02lRJWlDB8zUglVDuA6diNfy7vwLnsJp2eL1B
         gfuLbnjJKboXfNlCNysxpmJSPiP0o3iP6JSiUapqnltSvCSnOMiwlZ4haa7ZMUH4533c
         B/o8xi5Nn4kaTlGikblraGemzISSzmTM2BTyx+8MupsRTwzYsuFqA8rvNz9BBWfBilJh
         Ud3JtHRTKod/isemMRjrpXXrbLu6N302SuIIiiwLl0S90BpmtfKufDp7yMZgqqYfzeUh
         +Q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        fh=G9MSrwH9DtDGsmzgLdT5nbFXlILPrIY4tADehz9V1B0=;
        b=j2XAcXSpnic3KWHVlmf8B+qR0kGU1dme+GEZ9uYMoV2xPZ9Vw9cK4ylbAnU6z4BuLw
         idaibM1LfWItw6kaDEgIRVnxRwY/2gsc4NvZqBpbIdqFc8KFnVPFxbF0wqQjcuMmp8P2
         pzEBHc46aykk6B7ZksQtQfLpJkLiUb9XRXc2WMdsZTLlpnBpIrbFACURLWLat1LXkVht
         sGULoCt4HQYRCXE45OFsLISZOB8WLfKPxpdmxhgvf+vkZN2eUj/Leo2rNr/Nikd7Zi4M
         /Gf9pBmLUaIr/loc0h2DvcRMUJg+0zKSPXgULOwkmXQr0HXXRXqUPxZfixJ5SxmDD72T
         SWHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902334; x=1781507134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        b=GoPfLaQN6cRrkfeQW9ATXrOyQ+KQr1NqYzBgYP1pEpkvLeZVBcC1+SCyHdCfA2NcTn
         CU5H6EB6E8BSA3HvmtDdCdWlLGXXFS4IFZBLu6cE/BjqaQCT6wGNBjAmw1S3UaxagKka
         Fy6TzTO0oreImyB+KZeCULHwosywZaVcIzZa5jmk0ctbpWY26/16xsinRp5zWtVOZoeV
         /9R3EzUb4xUBQz29rlrpjjdlg/SFCslEQNr9/xPF4ZPQh3khYmlc+/FqfIMn/hbOCzXJ
         qEyKb4h1EzZYoKjv/al4pFqy+3+xcADW0MqmnItGde2HGtW6ZzWC/uM04CUqN5nGj4gI
         wCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902334; x=1781507134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        b=XKst4WF4+hFhLKFCFREAhuavXIA83TBgbTByLYIAtvL4bAfgX3BjA4r5B3+/65wu8Z
         VrcM3rHvASgE54OWCr7rg+ooqVAdCDrHNph0C3vL1k8HT+voJuj85ZI9PTOWw1ikcA7S
         3zxPfbsEiML0NNopswvxWG/bXiMEkVypNALIcfQ2mIRhDo+VyEF4+nuqvPIwHghveKIa
         F0mepN73oHRZD3CZGCSmdr0SEICIYl5yRCDfaSFhn9mv4ALimqkLIobAyxpERDlLglCp
         E4RsHw/h5jM0yp9ZGKB8S22LBioJ1TSzsw/BqdIBv2vG969OkxXmILwA3Z+BNP+o6Afd
         3W6A==
X-Forwarded-Encrypted: i=1; AFNElJ+5D7rMpRBBk6z4bzVllLaXVbbyPLbTv5nAlvYvtAJUgHbA5N7ZlJ5YwfsUJS5SVwWiUFbriLECQaPLNGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44lXRqdZpIr/1uu1KP7hp5vNCxPlZi605ooCwQs4RzP6EKlsp
	e/AXZqtMKJgO0AA3sZdgYtktwKbwc43va7d6DlsMZYtY0huCn/G6LS/HTnFum3dWwZ3JGhXHCVW
	L4Hq2X4fIy5kkEIJYXYyyuDXnKzkVczo=
X-Gm-Gg: Acq92OGuBe/H9zkMmBCjCaCwuPZWsa8dLwE2Olg7EDQj2fX22TmjEaF4fo1xvQne8V/
	xAteUgenRmswmmuJ44EkAgOczic0K7iLKHx6n5MB68NlEqLf79v6J5LyU2FMdEn4l9w5UPd1D9Z
	9ikNyQRuATnTkIISnlcruibewoAmqhC4k0xqHJ9O62er7mvmY0Qec88pXsUAGVa1R78WC6C/v3b
	hEgZkSsVL9Kn4BQtdcdRdVvRAD7OyZZKreuhMkOMk48mFgO3oE9ipm5qmz3eO4lxCBJ2x4cxA1B
	ANfY8XYoo2kIhI0F9fNqK01K/v2kOPJnsr3R5CbIkyaHBpC0xDvI5xIPSVHVuP9A5ldKRfEO+BM
	tMtDvlkctA6GwyKosLZErnqIPEP43tpaPnVY34XE/oEFs
X-Received: by 2002:a05:693c:3945:b0:2da:a813:a629 with SMTP id
 5a478bee46e88-3077b223afdmr3473571eec.2.1780902334313; Mon, 08 Jun 2026
 00:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com> <20260605-nova-exports-v4-1-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-1-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:19 +0200
X-Gm-Features: AVVi8CeF1bmJ1otTtbNunaCFacq0cljAH1ygtuYHCVlQ1ktOIpRSg0gpBxWAiuo
Message-ID: <CANiq72=ceH60sCPs7UWDXQiV8GLznjDWsCKFa6k8O4exFEkW1g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] rust: inline some init methods
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> These methods should be inlined for optimization reasons. Failure to do
> so can also produce symbol names larger than what `modpost` or `objtool`
> can handle.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` (just this one) -- thanks everyone!

Cheers,
Miguel
