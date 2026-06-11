Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2208373C1D
	for <linux-kbuild@vger.kernel.org>; Thu, 11 Jun 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165846; cv=pass; b=kIFA13jNlU2KZsOeqqA7kwoG+Axgp5UdGGAlzLCpWZpo4+MYtCNZSbK0xvOSR4QDSmGu47f8OEcsugw/NTFuxGxbWBO42Vn0jhlpKDlZnOAaDHxlX6i5/Rcqa6+IXqld7hDYm6n5iQLNbojB+twpTAzX/Q3yiRTbS/mxsAOJ5yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165846; c=relaxed/simple;
	bh=Cvv6T+PSDsw3FsAVYfk+LB2CVlJHZuJy35oM2Ume5jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMmETuE9KlgeLjjfFF1pE5lE9QwB13fkML5bTTG6YHLbATHF+DOyUpvthh0SzzkHcqKl5sd7XBPlWI1HloSiX0lqm3xPh99TSkvldMWw36RwnE2etugNpxM1Rd49kOp+bPAG88TFwdLAQHGMEsp9sMwlXp3dDEUHNAwuvznVtWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqEW4Wbv; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqEW4Wbv"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-307b668e1f5so383933eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jun 2026 01:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781165844; cv=none;
        d=google.com; s=arc-20240605;
        b=TSNCrKc4VlMNP8cS+5zqiQGaPhWj4Y3YHgS/266M59o+QepI5gVk4vWAJa+hGlCseY
         KK+YQciCMqAbIsTLp5UlNvTAGa4S9bjXn1W68iFhxNzi98NW0BE9l9he/hU5LbLGq7Du
         pswGpbE0RLoHLuprBogkqo6CyHm8lvhHdSvB7oNU9A3zeAhiZWj6CbwR0qy/Qm+GtLEC
         Jb4EiH8gF26Pk/BKy3znTTAzERAmdhiMHKMg6YY2pOQ//aza8/8iysF8Wg0GK6mGF8Qp
         tlVO+HnxDhsR6XSRgQupi+vIRnsNzOhwMRkmPDupHUjSQ5cz/u/Qr9kyIjirrxlNDxXm
         2mKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cvv6T+PSDsw3FsAVYfk+LB2CVlJHZuJy35oM2Ume5jg=;
        fh=3pTfXAdNN2DfuFxWbPymyMM5JlHnUVtbm1JQAtKg9hA=;
        b=Gc6tbvDeTdm8k1P9vtUz8pJnt6jo6WXaH+ZK4HWBIQuR3LStXf5KSqicEINkenINdt
         5OXXOHIS50HohC95aSxOW//hJXmEhX/jbT1+pnBf2db3Omte08oxpWp9dvSVpI7ljZ1b
         VH/FXAJqzhqAAbfrnEq9p5k880/OkCevQNFeQnmYaUTzE0BKc0htydBdhjIGbqBDUhfr
         6N6137SFa9zKsd5HkqnKT74/TmFFmHQ+OqjTSzNauBMsAhx1GzYN8in9dtAf7W9+Fi9O
         Qfl4YlTdXbQYNivqy3SQvOFB7FMEGUK4+FqMcmLa1fKNwkvn+aLBZ53PETmGKu2VTa8N
         3rUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781165844; x=1781770644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvv6T+PSDsw3FsAVYfk+LB2CVlJHZuJy35oM2Ume5jg=;
        b=pqEW4WbvfSQTHQHEORK1RkVOAWlEHppgH2Eyol6RaJctXRz71HTIidBbdtPTtHzsk5
         U6og4cG8xJoygm2aQ0dwN6W2D1T74aaT2kgP76uNJWX3ST+g8Bub8uQfzOL26ipRx5I2
         /BkIXCtPkbfCKzI8oGLh1U7MeKyTSMZnWm9x5Ke4NRjL0oVTaKr9UaZHFWGImETeVBB6
         t7Zv2IpVshB5O7HGs2nAVAr2oysVjkihQpxnlsd3p6OMbMjL+/0jsb1+x85rPq+vlK8e
         87UpUaL4jaqdhO0lWgK1qODBmwlGZGfY9IWYRcxDnlyjaTi30m0gBOFB1mQ9J6eZZb1f
         nRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165844; x=1781770644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cvv6T+PSDsw3FsAVYfk+LB2CVlJHZuJy35oM2Ume5jg=;
        b=Kt6CTIt7FKG2FvQuIHN0Tu3cbaT85t5CzVeUWH2ISlbi7f6DDqVDEiQedQOVhNZM3F
         PdTSAVoy2af9lWskXXsKbPPD5hXT1PGOA+mlw6IxVARo6kV4kSZTO+H8Motqvvjp+qCY
         iogBflF+ubaubqL9Hhq0xX3/CviMTIsybY0sNesvt4bHZbmAmUirAkghnjRZyNK/Rsj3
         IcJPVivUMLcW4D4ZftbAxn34A3KALjGVdS47PDuYhT5tUal3EnClFBKeqhgKYMUaUtHB
         9MOAbxLpVFd8dz4TGtlpB0yqVZWapn8CDiGz8CgQODJJRLLcrGvxpKk/XQjp7uK1bV7r
         dN7A==
X-Forwarded-Encrypted: i=1; AFNElJ/1aHxHSmMUnxP7wZhJB1lZWrJ3rxy3s/MZgdU5WdOMJ8tbcHkvHxCw2S0tTMMd520VRdJFbw9oG/jnGug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsLffasp9+pnhU6pLiING26daShx7p2X0r/dsdFMK0qqfBEd0i
	RgGHMLAkDWAZODnW3nuKCc15mwYUQA/udDi4tzibkmPDZ1SDazNUS33VdQeAw2nceCK/OCBhWJW
	H0mebUgy8aefoFin7d3Ihb2kw0sEFLrI=
X-Gm-Gg: Acq92OF6vJV/Pf/acd+cRy+wOiOZDfQ0Yd0n5sWg6piPIQoNbiLVYHmFVIJQFcsYHJM
	AUIYhug9ZKwzSYi+0WLYNqFIrUph9fobOwkfwWymSQuuBkrROQ+NCP7JKwTYx7sGIsgurWI0Arm
	kiozfYbauFrfnhUg5sVr69KefuSG5BXXg2/a3+8zqv8sxJLyY3GCvx5X1GArTdHcVceNoTMfnm/
	6v6shQP9AHhtL4XAVo8jqP5et/6RBaTYRoht4Tlm8kEGieIwzHX9nea1il2B8TdeFbzztOtvLDf
	BoMFezaM6iD7D06r/gDq61RSfDDaKofXlU9lRaZDCbfN4SnofVn7jwaIQ6UN1JIPqJQ5TlRB/aS
	GIEO9PoV0EYWnfIHdXFsd8YEuVqryf0KzCQ==
X-Received: by 2002:a05:7301:6007:b0:2d4:62f0:b2e1 with SMTP id
 5a478bee46e88-308041354b8mr709668eec.0.1781165843909; Thu, 11 Jun 2026
 01:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610143025.368801-1-ojeda@kernel.org>
In-Reply-To: <20260610143025.368801-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 10:17:09 +0200
X-Gm-Features: AVVi8CckU7oKsjkrQUwzhrbYa5b-hlcYlSkc2w89eUYI7Wr-Vc594KP0gJP1avQ
Message-ID: <CANiq72kTt5jrbpWUiUFu5oUJ9dzmOOCZUy4Eo0Jg0y=7toi-Gw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: clean `zerocopy-derive` in `mrproper`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 4:30=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Just like for the other two Rust proc macros, remove the artifacts in
> `mrproper`.
>
> This should have been part of commit 506054980429 ("rust: zerocopy-derive=
:
> enable support in kbuild").
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied early to `rust-next` -- thanks!

Cheers,
Miguel
