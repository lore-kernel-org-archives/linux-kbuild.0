Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795171758;
	b=zDomdTMNcIaNfb/UibmhZhltbFv9DZArRmBvCPYu5asCDObq5Rc0d3yQ2FBjVJul+iwY
	 2VUixci6kv8l6V3ePTp8zoOemo86ZiVzpf7faClNQdQU2Tw5zVoDqNr5gzEAhdJ6X1eky
	 8aMrdd4w12KdkqoOvhka1kKgsV/h2UY4OvB4k9QNs9jZmotMe5sSm0FGgyTmKUgZ8OB5L
	 w32Eaosk80gydxXB9NpbsTmtKeOxXHYZ0oOCK6yQY7COBydW98++E/+95H0mblz9SJsvP
	 qH+GKrkdyxeZN/G9iGBsudTTQelQZ5PDbyDiQccyKg1nm8uhdxL7gbWpzD2MqOo3/2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
	b=XZeSZ41+r6DfGrqILZiozkNcGKFWrnqNtXb7vJRg9BtXtDoEOgxhdaSE7I0SUoS3WcQE
	 /lRuENIexEL0mcBHXKrYW8Awhsu9MEDqc3KG+SgOxw5mYtBqQ0+X0NS5FMsCgeVcFHB0f
	 DluJbDl0XNh6T7HmLo/T5/qGGZtdaQNFUxMlau6BZLNSJnqvBH/r/PCv59BKSiSQVNAh3
	 cePQdK7FxsBixDrn+/qZbFqa0RKCgA03a1wbW35aEE78cvVRZok8PCs8/NaNMS2I/B3Pw
	 7ditFdXMC75XtbMHLUsM7cpmsSfGtjH4BEnFZ6fdyWDghXOokDBe+ZyIhSkPiaXCLGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PEsZh/YA";
	arc=fail smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21004606A331
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 10:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21004606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEsZh/YA
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so68311e87.1
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 02:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795171756; cv=none;
        d=google.com; s=arc-20260327;
        b=dqh6ffn0WY715tezEtjnaURLEitFk3DZjFpvQP2eVEsyhViC6zMh/H3D+9zW29HdZm
         9Kjz7uL4J6oWwBVwS/YCKknLfje/IzJtagQ9dL2IRt/AQ5aI08YVjNnfHamweqpjk2WE
         T1oMGze9TAyLyWk3Hi3TvcdUs1A7k6obxSZd7HujgXPY70bLfX5+SPCQJpIQGQxsLnhD
         eP71WVH8Z7urfnYiu+L477t0OmlsI/WMyLSjSvRCqU1RdrjjUWWYqxlP6nw1WB/CX4xc
         RfCzV/bYasJdjy4yX6750TCVKHPBwMrKKl4KDkGRmr7/QjUlzIsG6dzEmwR/4VrKgjx0
         3OaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
        fh=A9RXYeH9RmAsd0pIXxvUKxbg2WYUmnL86MMf1kwoCNw=;
        b=Zo3tYj3O3j7rMVhpYfpAvKH4MUcyA3tZhjHJBVjS3KOK9V9M4gTRjNzmXvnSp2R556
         l65wqL6gy32ouhDoh1qLxQV85wt7/JCx1CceX3DMIgkdhutWHRGRmmVNHZxfuzZxLeSw
         3asPong9G2pCjVydcYipo+Q9YGdo09yNgqOlBLLwAJoypO4jI4QZMLcuuSfGx6fPf1+C
         lMZmCEvxqojPacBEeBW2j/W3yQ180pFyLDhE4+JPTvnKBuA1UKerrDJ4kyLWq5HWY1F4
         a/MfrCju3oVLVFEK+4ET5rRGlPJg3/JdBysTTTUSkbVdnW5NzQaZgL4d2RdDjKFVJaU5
         mWIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171756; x=1795776556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
        b=PEsZh/YAAYQUmMsoLTE0P4DoaYxjX0K0WOe3frsYoTr8l3r+nSK7sMDRX+LpT5WITu
         p5da11rIxNERXMD5GQ7vP5rHjtNAiDvJJ1IP3EaCgCiy+uIEDqg/M3B2qWZu33gr9z2H
         0Ntd3BKnx5dLbi8bNJnC6C/w2cTuMVdfAufG4YrMW6gJs5fkUtJkyKGZOAOEfSGC3URw
         mPL2nagnait/4H97dChQkWFc9nriIUt48kJnZskAOVjsNDXahY1zXAfCtf4wIzRSv1E2
         cn8ohWhoG0vQTsgDCFFyQQQuVWTfYzneroC/a9LhzXB34Z6ONgKLPfSMXLK8FB3frR1y
         T3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171756; x=1795776556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
        b=AJiHITxSpvqSHaYwRGP+5otnD0xeQDikiEjsoEze7OApOngxlnyo78iHe4F5qkDDc+
         tM8ChC5CXijXuN3DrNxk+A5mSA4UCkxPmdTLEEXDNkZ/NvhKD4AOPR5dNAUeGWWU6AsN
         geYoWfCdEAM0omqdBjBZ49zmSfjsQJGtvTPSK1TUUpl1eco7H8Bq3aiqSgPDltQXaxHg
         T7NIoSRk1Yr6iGGBfHhxaCRVIbTlWOkRNJoyqzVSHy+PBRe0QqM9FLEt1LFeWnrzPxHm
         3ziJVO84Qz4qc422d3OycggSwpL+ZA2aZalLz40Q6zuTHyF8jNoTzzHeSAnf1vd5Kob9
         ri5A==
X-Forwarded-Encrypted: i=1; AL+hErGmgbUdB3vS4IEYBBcGerGgJE6/DRjKlNttu5jZzBHKPJmKryahZ0DNKmLSjUca0uJeKsZdUMWdw4pvp+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/R0T+A+M1B5mdBuJui2ddsyz0r/uXK8dAz2Fk4ElUBkahj0c5
	f6iqiSOnEriRMByTUWu3PDaoIIXLrk6MlcsBxCEOwX+pPUM4wAM1mbppe3r8JXDx0VqH6YqJyVH
	6j0WikR/2foXExPuxca0evHYO1LHCZN4=
X-Gm-Gg: AZFdTZcuD2I/2/4ey6pysQvSfGiZaMSHL7cJF+PnWSAsfCqRXwjwy0IaqVKQXfFJ7YC
	ALvJ+/C7TxdQKBV1LBqFiXR5Xml8K9F3YyD/yvkFfpWImlw5nal9N8VYt5mmhY/WVNEezYW0rBS
	uwLrAEcsHL4mk/PMEgW+CLm0OI1kJr5HN6n5WlGBr71suWSE5uAvHkm2Tz73J8wmuW4Bbl37uPe
	C/XXtL/dKWeQ2onIFQM5Sc2lu5ARJ+zwwJ+nyy8se0FN3xOpvzRL/15/Hn6tB4f85RHdJ7pFLPP
	Ycumo0IJ6Zt4Y4Hm0VY5p0qaOpH5YiyoJT3N5eZAWkMGsD7UQFDChzJB5kPMLBkEdBjsI/7BMjX
	usCy4AdX4zefiMlQ20C9s1OKp+UKhsy3eKNa0JDnrNnjDCt6A7+60A523vpC409/I0Nkd16rtMr
	z4T5hq+JrxJnCCy3bOXLyAigpm7KnsEpMLTY8evREGi6BTmBWBp3XOv3xIXozNYsePlZ+HOCcz/
	WSHsrxH9tlZKNOQoyZcVaN6HGeBw7XRO7Ze+o2wKKnWNS6IzyoSbJTNgIPMnRz1QFVCaO7+
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr1167983e87.2.1795171756051; Fri, 20 Nov 2026
 02:49:16 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
In-Reply-To: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 11:49:04 +0100
X-Gm-Features: Aa3M54qW6il0gb-hxlX-Nj8ioiKgQABk89cMHbmkyFDNFAXmsl_FtiHnKL79t1w
Message-ID: <CANiq72=vz2D7XYNEHmAnbh5iTJ6T_qtSV3bosQrB8HOYsBXtzA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: generate a symbol version for rust_build_error
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 11:19=E2=80=AFAM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> - Omit Sami's v1 Reviewed-by because v2 changes incremental rebuild behav=
ior.

I guess Sami is still OK with it, given it is a subset of the previous
patch and the core part of it.

But I will wait for his confirmation -- this one is not urgent.

Thanks for the patch!

Cheers,
Miguel
