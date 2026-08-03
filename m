Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387763921DD
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 06:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737087; cv=pass; b=IKVm+c4J6/H+zJf41I+OOacBXyLO0Tnca8pgzO+o6KJcbygvaRMppAhBysQXieJKyem01BrKryOxNzBHlTzPRvzRaDodZWkFILDH0a2lHFlcI97wm1ELXmeIKKCylKUedCyxFCKMAWDyyDTvsDKAjsqqbtbyC6it5ytl4SK93CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737087; c=relaxed/simple;
	bh=9vMbfMGekR6L5LEMy6L9Ow5VA2S82pVj+na1pJDz8R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LA871uZbtVMhHP2PEHFcqA2itp0uEhXIJS3MF+/ptIdovLEARNL8bkfafWrP/pWG9Vx2NU/oFPrIB+ZewpL9exeE0WUgQyezX5KSVsGYOfGZwVz+78nfsVMqq9iLLfkbveZe0vfiM8JC8noxYXuGJ/keGdxIvH5POSAuL8D8qKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a29FPTti; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a29FPTti"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf49dc28ccso3729915ad.0
        for <linux-kbuild@vger.kernel.org>; Sun, 02 Aug 2026 23:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785737085; cv=none;
        d=google.com; s=arc-20260327;
        b=QLWtHOzVHPQgKp9OMpJFoJ4lrujApMcEEUUVRjAca51BzSjO2F04VaGgfqBN2NGBQf
         oUVVtOhdSTWRwb/smdoOfH3DwlVHn99FRR/d/JG3QdKzQSdL54m5SZ6Sj1Y1ljSLZwCM
         O7hr8IYdEDFFTZ9ppmICuvY5yirFDl2DdCOOeTj+oeTPM+sE5LM3T2S5tVg+rNhTWR16
         MUPzE7ivBb1chps7Udcj9wFOgRCOrsvXE1XkA528rWepsj2xq9B7oipejXqSw4ItZ+8G
         p9LqgGPWuvKQ9SOKUfgt8jxmkW14BDg3ZZD0MpvJPf5b4JEutAAqJh1FvOzbnhUu7DgD
         6+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qA4isvNouelXiQWM1erQEPSc3lHghlduG5dGLUbCZnM=;
        fh=vMJx+jLURRvfSWpZ9dQpVZEUPOhKdrb7ovS+IKiLskQ=;
        b=dC0bL8gRsEpivjOfIIaHGtOuG+WWkwrmVLwonqgNnkSjuwQuJvsDvooPyizyALgRaO
         iheEffK6tvL8rseEA/qKmIg29BNsqikCPYkxa9LgqLsC3VW6nMflL97hh+w09vXHlP/v
         j6Cvtj1OCKEIiDoQUDGLILiBqSqi8kX9tzD8v6TNxniTaUiclkcyIIZEQyB6zUMkEthQ
         PeecvMkuOxQ8f5gGZu7ksPZNc7wqX8lvXTo7jsVR6NarIH4KIjgZ73zOWMaQ1s1cbHBl
         5Xu+8iCAcxpy3iSwIYT7xylpi+jwIXFZ6pD2YFDgGgMD0fYO1p92LreV+QSFTnSm8T9h
         tsUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785737085; x=1786341885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qA4isvNouelXiQWM1erQEPSc3lHghlduG5dGLUbCZnM=;
        b=a29FPTticia/dR32cnGgiI5h/J89CwLSYc1V2k7SEFeU7XiVqwqUDKUOxoVpUTJATW
         qc8PKyaHzxAGrlCT3Q/h0YUqqAUMSZhgj8c+wDc/4j/1Hz1ZZ+lK3hx/JMaEojlOR5Ei
         FvbWJsmEr7O38PeCyNEs9rxIrU+WG4gwToJpxwfJJ4QP0C1ZQA92JjlAvzjGnTEsWDzO
         NfL8L0zQhauRPwfqeJ8anZjaqfwxh9HF1JBVdVhcVRc4VCy/3GjelY9XJEzU7OKa33+A
         0m01bBZA3qMxBNgNcQCUAOIekebYMW9rE4SSxKHz7HESrNQBEd2UJQxpWFPppVpfHtKE
         IrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737085; x=1786341885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qA4isvNouelXiQWM1erQEPSc3lHghlduG5dGLUbCZnM=;
        b=B9FR7jn+UjOC2sGh6AGZvUtjeadayfGeMpZBD2cZGOOJmEmOszNS9ZGDTAwkgpueuQ
         VOKA+C6IcW58Nm3pSJ2f6QUaO85u7XIz/1fJVzyKCyF3MY5NGPRUebVtU2sYmekfEw/7
         d2aqOVLWY9MoXMOatcJMDRDq+pQLVrCJxM/SDj+glf2+a3GFUkeZfGV0U1RtLW9oRuJy
         WdWCEb8WwHbkUyjRvaMCTTdEA7WD9orPNQS62XoeJVESmKv/JkjS8avopARDWbiZsm7C
         +eDXHmsFdqTruU1E7R9PlUyqph4VWTHRmvN1z1WFbC5RBWR7paYhcVc0MHXIArwYHXV/
         2wdw==
X-Forwarded-Encrypted: i=1; AHgh+RqQbMI3We9HfluRjP+pzM1ILGvLjQpi7wwbYYkE5jw0MtAqqOKnB7I+UJ6Jcmhu0raeNKTvpmi68Wr53Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyem2MLfBrTmnjK45cxz2vGrUzssx78p14+kxZT4Us8EM2kRo2x
	cn6PALwIx9UcCkkbyIzrRHVw1hCx5qG+5R9BTqkAErAbGiQZQA2CfhS0sA5U4hgRSlFoTs1ML3H
	H95UsxfEhn6Vtc0YY6xQcN81PIrS4ihc=
X-Gm-Gg: AR+sD13DDhrEKg6IgVQEus/dctl8a+INg0Awt9rFBtYs5r9iNf8VhMbvpi2l/L204In
	a/NtxVy5Xnj3Qy4YFdw85uDl9JmWp75JFrYuGv4W0V9/HFTV7MYMpDXXjdwtU3It/C407uClrrr
	oXw/B56pFtGDY1s0UucreLBlPeAR3q2WSChJU7iF+l/5aN5DEntqll/yrrFYzfXizAVz7Bkp6mA
	VhXSN2h/9n0t3hWQaNzohDqTnSE8k9fRhVO108rBtVN1M+ESkguoDXdiyXEI+oseczfd8hNDE/U
	ZE4DeCANXvJLJWeNaSsFaBdjHGroq3q1WjJf4NtdigDoVMu9ewaZqIpO1zwXWkM8MWCojos2vD/
	iIhPxjf9KPYC1cxWK3wQHD77dBUbdJp22cpdIg8SbiDVkEWWEouJLPKj32Cbb
X-Received: by 2002:a17:903:234c:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d05291e7f6mr106471735ad.3.1785737085398; Sun, 02 Aug 2026
 23:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719130723.162899-1-ojeda@kernel.org>
In-Reply-To: <20260719130723.162899-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 08:04:31 +0200
X-Gm-Features: AUfX_mx-rpdHacm21bSkc3uU5DWNngLdmwUdEU-PNwOi8pLd7KAzIYJfcPvxWqk
Message-ID: <CANiq72nE8_7sUWOtDZMqqCTcvw4bdCX90WtY6dWTXGu9r1AKvA@mail.gmail.com>
Subject: Re: [PATCH] rust: rust_is_available: support testing with `bash` as `/bin/sh`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 3:07=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `command -v` behaves differently on `dash` vs. `bash` when faced with
> a file without the execute bit.
>
> Thus, for the non-executable `rustc` and `bindgen` tests, support both
> possible outputs that the script currently gives.
>
> This makes the test script clean on distributions like Fedora.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Added custom assertion message as suggested. - Miguel ]

Cheers,
Miguel
