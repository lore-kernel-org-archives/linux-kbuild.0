Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C249B1EA
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818166; cv=pass; b=fi8bEL3kwzJOclDnp3wM3u3qer3UbUk43xp1iOyNSZ2HWCbLXiFA9r7WPczKNwUVIrOjHNpfPgctGWk1tH4Lsikjb5qXJ6wPS76hF1nFktkrKj7AWgzhWPt0UaXaTqlcuNRqfre7JkyWG09muO4DaYL0HWrZjVgZ8blEMS5QQ30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818166; c=relaxed/simple;
	bh=Qh8/jPpdQb1uoYLtiV+P2F0fMSrInIfSg+J+6byfOcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtRrmp0eHWMlVavxrdDJQHo7LAulLLhXF8ioIc6dGaETyNllSzG9WLjJX2lMRI8Mt13FKvoXc+JQ4s0AFRKvDb6RbXEEPR9Dg0hzTXy6RDYXDjFI6t7eKMhPqpt751L1mdcUponVi+D2jxU/ITZPSdfmBJwK/lxcGkp3UV/90pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0BgTGEn; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0BgTGEn"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ab432273c5so14971327b3.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 08:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818164; cv=none;
        d=google.com; s=arc-20260327;
        b=FJdMScNE/Re7i2RJebiEdwJcL+LkZZ4/+1X+DVxFjw40SbWUAm7N2saWMyErsPBUap
         d/l++h8ZY7w2McUjn9zNPIw623zRQ49/+6gtPcH6J535rB6s8JIn5KHLQOvAkO2ckwBj
         zHcgcaCKZaanqZhn6ED4xLqmPVSujPSERhBzX6jO4/Hqcu9v1hCjndLfoRyg9pXZoK/d
         e3vYjCUmelCwk21lbrLFNs1dldovHyH9Hue6HK2gPpJ3bWaRt0jH836es8PzqzpP0/Ie
         sLa6+g1a4LozOuMpfkfA5ML2z0y8WVfSFNUntchRILAYHObzJ0qtjCy8sBQERsG0FuUT
         oLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        fh=XXsgGYFkvdbIRcnpPOHbwEXoAJxnmWXIXRgT21Pimco=;
        b=VrkNqNd+4xPAttv1Rngbpx0I93lzoRf1P7SfQIN2LN+lHDK8UmlvG0bdOEgBfk9xDD
         UIE3BDHeMQqVYBVpTWGQrT2T2gpej5CcW/XLMUb6LSK3sZqYlAA4YZKl+Tk8Fa0MD1Ff
         X4LMJ1VM1VYLsP5OAyFlmblii9JTw3MhFk48CpfVugSlVXrQNCCpM9CgXL6sdSiczENb
         KujwjZkCgMb+DqasBhCMmTcOZ7QN8f+KfxQaAKRrjHIsX8sQMJZ1P5wRGfo1SLzttvbs
         TRwvb76HxvVrxAr7M974YSeDlyvw30Xcv2iiZ/TjyPYWER1BBYT7L/cn4xKB87IC12Ig
         BtxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791818164; x=1792422964; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=H0BgTGEnjHPsOpry8zM372M3cPbee1W5JIY+k1KGqv8WNzGyYlMWruUcNGXNpqKqHv
         qAht/Fg1XEZo8JjFRoEHFhUiRD8Q5cYqy8MKiZYc5LQtEbtjmhvyhG/D2J4elSaSnKUV
         ZM8MXqxhRXUvbFnlIr9rEEaR8zAMYY5wS09xL9mUt1dlIaceViENwfpBgQUtW3eVOGlU
         pDKwvkrYloE/6nhq3HRdIEjN85hfMhGmgpxKiemxr8Ipgmoo4uHaSrLyQls+oGGVrOtN
         wPBentZQM0axYBEPhSU6pemvJTTbrMwGD/WXXj/XHgW/LcIPOfUMxG79B8fdKd97k9XK
         U3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818164; x=1792422964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=g11POkoKLYfdUmRHhUpGyFRyj1SS5/HIyba4mHv8glpEvnOx6On0TsawKlDjaSWnwW
         3ZtVcRCoAVRLj6a8+IZP5ph/x06EZa2tGimm0Qsb0A+/XqvTXhlAlg7VdMGUAPuK2l95
         hIHGB3lHRiCawTkO24Y0cx4Y92lQvAKGpq5Zw0f6x7u0TJzDCwwniBUVbz+W3svpwhvP
         e0VBSmk7k7QQkZnRjBWtnC70LLlF3O0TXM9ulTNDxuk5jNH7nL8EMMl6s26QhqjmAzAS
         tJej6e/q+O/bBPbPvkxJZ+g45Q1wT1xva0EOeRK7mFkBwNqv0dVOe9GElnV9UL5WNYUv
         YYnw==
X-Forwarded-Encrypted: i=1; AKwUvByi3TQjpMjYlPyB++vAGzqok+qZ7WUYd8sIiIKlO9xOGi+dG1EoJKfLpFZr5mNgNDcWRAEfFfElBhlgKYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJdNhoBplAGgkrjtLB5jpHBJu1pDbxHjCGwbsZi0oN9cdt/Oy+
	aEqMWUnIWhR0bwYQ8vDWdUTxMWqSxYe6zqfJN5RLKLcAAYBsHz/QBAqk4JiErVXe/p0B2bzVnEi
	GdMqp5MLoObU1f76hPP13vLMgjWUrPvpefl/7oA1C
X-Gm-Gg: AYBFou31ARQj9lm9Mp4WPo9LF+AaPym9NQ+tl4RiH86MZ9vaT9D97Rnz33Cj0a2EGla
	xRf4HVl5Oq5o8jNM7y39R30CcZOw2OLr7bRezKDlcwI5GNCsKUKhrQQDWzdag9PMqSQo0lh/p1e
	QAbhJZ2fzKQ747iK9xNkNoT26swvR887JZUERUwJfXX3dPM5RT8ElCwthA5NSFKayCpDWuHQlDL
	blBEWvtmofZwMFwiwFiPe7CMs/au1kvXVGeogncsk09JTnI+Mzv01RMqN0oa6OccXEnl7n34lhv
	JJ9a9aFN1kDBEvCMRDDUYKWeDbgPeYE5LCcD9GfZphZqGHHiYNDowvFX3Ap5hoBV201bNY1urPW
	mzUskuC9tskPt1miyDdOf
X-Received: by 2002:a05:690c:f04:b0:8ae:b617:713d with SMTP id
 00721157ae682-8b07edfaf6amr35969547b3.19.1791818163556; Mon, 12 Oct 2026
 08:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
In-Reply-To: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 17:15:25 +0200
X-Gm-Features: AclHuK-ngdayfpaG9DdBIWGDrVoRKwhiuwWtMtaRRkzMdsYW60BnSKb-GUjELAE
Message-ID: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 at 17:04, Alexander Potapenko <glider@google.com> wrote:
>
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/kernel/Kconfig.test        |  11 +++
> >  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |   2 +
> >  5 files changed, 135 insertions(+)
> >  create mode 100644 rust/kernel/kcsan_test.rs
>
> FWIW `make rustfmtcheck` fails for me on kcsan_test.rs

Oops. I guess we'll make a v2.
