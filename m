Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495213F5BEC
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2026 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001939; cv=pass; b=s8PbBCBkEk8Ur3CXCl4l5jt6ZZTnK1AVlwfpJKzkXwBFZpKq85RvDeQ6T86sZf+nyjqC2wHe/MffWheEcsBMf7c33FxJu0hu7Mpko7f+PplhnatqF1qpXw+I3Qfc6poogBc0mjAqMDUBhBoqUHtxJkCGmXuvHuKmT4y9gA3YaHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001939; c=relaxed/simple;
	bh=a3zDpFgvXajJqqXpFhAtv/m74IZYHazhSvjeRZX45Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nd4cGmujSMHBYl9Lnr5AJCufH1ct/fWB5DhvP5zjxcLGXmFxngrrvCYbu0CeLDLis/juTQc4N6SEra/Li+OiHKNrxHlnUsR7tRjVRfqaGlw0wZuAINcSQqkcDpHtLRvjwBBLvirBKDEiSBaaV40vlmltl41z7Vu9XfUoLQ/x52I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzVZOcr3; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzVZOcr3"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137dd497007so351145c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2026 03:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781001937; cv=none;
        d=google.com; s=arc-20240605;
        b=Ul743ylJy+d/gtOv1A0kRLjlYiR62g2mps5LZTa5D2tDviIaiFM6PI4mDuM58QMbUW
         hmzqwDbV9pDu3JPiJJwHBU1Cpn/VnYUTCYWy9wvPCjwV2VmL4c2jSB44oTWijBFOWSja
         uI61ktSUuZHi9nA5r73XERkMrvhwPt9OvIFFSuywzEbsskxV44HhdRAfCaBfAUhUNgk7
         W9VbCXBWa5WgMtFT8psnVHrF94yKKD1LZ2pe2E7+X1WZ6dGPNqzKEmdyKjY92jJ2CUGB
         GGnWlUORBQIjsAmbtIDm015SNdi4G1z8+d4zQP+wnV31qoJH6Axep0X8rC+eK4E4BO/m
         BUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1SXv7lPoN61DMk6ddXG/ferZXdZBghtq+uNeTs6Evc=;
        fh=4evlczL5/oeNC7gE4GRnl0Mrzsv2ze4ZTYtH1FUKBpc=;
        b=N5lOTgSpxoSMWls0GPfVdjoKJynll+L6jIfD2GydPHgL4v/lhC6JwEKN5bW3DSzCR/
         Kyyzg/gQJLsjlZBA1/bkeAnucxt00mMrLK0JBcf2V+pV8/8mTWdMf/9/x9ogvMzbSe1t
         hGt3J+yLQm8gt1fDxxGnYU9Ym4AFMc9pryb/dx60u/2jCiizcv/A2asWTG3PVpflt2B2
         b+LBuYKY+7tj96zoXmwxuvabHXPpx2IMrp4CGhlhVVSzjDGl3j1+pgkGEMEzyKtRd5uz
         1Ve5QdRvkRoNTeNpb+BA0QKRo/tPqlsYo3G5l6hi/SqM+Sc14XBNjwYyB+JUl+j4gwf6
         pz9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781001937; x=1781606737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1SXv7lPoN61DMk6ddXG/ferZXdZBghtq+uNeTs6Evc=;
        b=nzVZOcr3eUZF/jBHAKOQJueMwlEzuc//jdtqKNi6L91swBYj3s806NAIdpPSuWihPE
         bYU7sD9opRSt6QbZIYeu2qmiLfRLjfNEP4cjz7xHdKaqwBT2y43KwngCLBG6Kpg7+jHb
         41B1hLZvOPtvFtzEFbhoXlBWmRx1YPoDGTuLa/AiYpbULtR/rnXETLx6vZygtsYLh111
         5s0EeERoHupbPXEyWTgkOG44ed7KYMsv25AuF+oZpwr2Kc3Thl3BpuGLwAb+VQv8c68u
         ZENJUrHO8VSPhNJImqKB5O4dZJvzp1N7Izo3nrz/5y1pZVS0dInWdoYeXn9d4gQ5hSNO
         n8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001937; x=1781606737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1SXv7lPoN61DMk6ddXG/ferZXdZBghtq+uNeTs6Evc=;
        b=idhKB8hDv9yhzPTuQ8emMpRnU1TAi/03O4xAgHFzVt0HWAKIzJfSDSTBuEBYf0pjBe
         GWf2sWI8kkfc5ioWFZHrTT6GrDhteokzV6Ppf2bHvIbAazCh+f8pz/kGQYabRoADtvKJ
         Kvlb0kqfa9TU6vf7ZVoRbr7ic4F+84I4qsgMJkH1DNlZeJjF92cYCJoDStsfOTV44OQ3
         eXbIGInbKpHvd8JWvuZKIcyq/H7j+UGb96BroqEE2WZeZeJOr0tEinyeU63O4NG23dEE
         jGtBfSLTQMXBwaM6AU5Llye/RRZhC+VyNWEgK91/51Xj0U3X2cHIfiZ7eKK3C9KM9lf9
         vzkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/r9pkIyHTyzsyk2gaiM/9+RnfYRbBtILLEj9UsvOpSOapG7JtowJ5bEuW+4bkhTsi82B0fMZSgUlWCPW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ32DHRLaLBOoCoK2U55Xjd7stZ5PaBeusWOUOdwau2vtCRPJJ
	9TTga6seSTgjm4X5yxbKfvo7wP/oMlXl2hpKBJIH9abejhiw9YfFJw27fX4K3GebEYMCb442nwC
	WpI4cj8H3qDXQoCKQwAF9zdWLDyzbehI=
X-Gm-Gg: Acq92OGOAWBmzHf0xSG3AT+pm7c7JyVR5VIoklcfTCgUwL5oOQzyJY4WWl3/s9og/3o
	TL6sHlIKmQ20qnkmyhJdqpupyMQ2Wox8/WwPVnbxJcfYy8MQfzCsErjIVfpCjD9YqpSYXp0UTCx
	fqJy/d5wi6eITIsLkcaCP2Xg6is2eXOIjm+FvyDmrAvOeyTxT107iyKHHgv7SZRKckIscsODojC
	LDy2CPjFnlDI4EEkCC5Z87hZKnpUEemRhWspnXq9e7Ud7UWi1+5S2v3E2jluuvXMBFskLCNzgNi
	io0TZhDSAE9t2BIoWHfyW5mB51g2lk+KLAnMnTFxBpY6el24dW0KAJH8s4pQJm4R82cjFNI4Od3
	RUQKWyGcX/EqZ0BobmE7kg3BM6IPv4713cg==
X-Received: by 2002:a05:7300:cc0c:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-3077b77c96emr5522563eec.6.1781001937281; Tue, 09 Jun 2026
 03:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608141439.182634-1-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 12:45:24 +0200
X-Gm-Features: AVVi8Cdf6Rep7A1cl6GVzljSQ-uXdt9n78YA4CT0b7Ru0pdjqDIJb7s3it93kKY
Message-ID: <CANiq72=2SXygiqrvnS-puR7YOfW-VX_TF4dujcpArHNej3yOKA@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 4:15=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> This patch series introduces support for `zerocopy`:
>
>     Fast, safe, compile error. Pick two.
>
>     Zerocopy makes zero-cost memory manipulation effortless. We write
>     `unsafe` so you don't have to.
>
> It essentially provides derivable traits (e.g. `FromBytes`) and macros
> (e.g. `transmute!`) for safely converting between byte sequences and
> other types. Having such support allows us to remove some `unsafe` code.
>
> It is among the most downloaded Rust crates (top #50 recent, top #100
> all-time downloads; according to crates.io), and it is also used by the
> Rust compiler itself.
>
> The series starts with a few preparation commits, then the `zerocopy`
> and `zerocopy-derive` crates are added. Finally, an example patch using
> it is on top, removing one `unsafe impl`.
>
> I had to adapt the crates slightly (just +2/-3 lines), but both patches
> could potentially be provided upstream eventually. Please see the
> commits for details.
>
> In total, it is about ~39k lines added, ~32k without counting `benches/`
> which are just for documentation purposes.
>
> See the cover letter for `syn` for some more details about depending on
> third-party crates in commit 54e3eae85562 ("Merge patch series "`syn`
> support"").
>
> The codegen of an isolated example function similar to the patch on top
> is essentially identical. It also turns out that (for that particular
> case) `zerocopy`'s version, even under `debug-assertions` enabled, has
> no remaining panics, unlike a few in the current code (because the
> compiler can prove the remaining `ub_checks` statically).
>
> So their "fast, safe" does indeed check out -- at least in that case.
>
> P.S. This version of `zerocopy` has already the unstable `Ptr{,Inner}`
> types -- to play with them, please use:
>
>     make ... KRUSTFLAGS=3D--cfg=3Dzerocopy_unstable_ptr
>
> ---
> I will apply v2 for tomorrow's linux-next.

Applied to `rust-next` (yesterday) -- thanks everyone!

Cheers,
Miguel
