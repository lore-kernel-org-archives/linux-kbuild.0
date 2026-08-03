Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16298385519
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739708; cv=pass; b=AvHxE8vmyApWDhHUVGZ2iBPG7rr6HQa4NCaIunwnjozBIonR3YWkMrRpE7dPBvpOrw+0EvZVmMTHADb8qo6tlr8ThuZUFJ1ksrXY0RkP7xJhwGE29xXjHwsmD9grHVga28NhkEJZ9El12fsx+CcSXTxT0u8oT7osHP9cJhscJwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739708; c=relaxed/simple;
	bh=ggw+muFFAaFfC2b4AAgdDK63S2vV+ASj+i8ZzmEkKRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s67U0slwnQyqQQdSK+9uOaElCLtK7ah7wvJMnJse8HmdzYU8wEF/8/J01TcDzwp5rEqoj+eIfCAKfFC2HYAcJIZarfVh5lt644PBUBvrdoyDOCh8QDXIcQZbpuR5gb20dmCSL6oYJQK1l3Zo/mMuXuCXcE2/aRxX5h4vMDN3vKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTc+ANJY; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTc+ANJY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso395289a91.1
        for <linux-kbuild@vger.kernel.org>; Sun, 02 Aug 2026 23:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785739706; cv=none;
        d=google.com; s=arc-20260327;
        b=lFAKWXs74jykyKRsmIwoPPtT81JH8mBf9hmlybnogKx+oufsnKUQqwecOULLzf5vnJ
         CKxE9g9AyVRvvkD9g/fW65GekbVMQPPmS9aJC11zA/sxnB6ULXgpYwxnox6kFPNzq02/
         KKxyISeF3CVkBpcd3R749wF4faqX20/VaYVDWd2JbSHA3FNR+k9BZ+YRFOaaC/mGnl3S
         Wqd/ZEF7KsF1tLYT6DVmw3HrRBdYEAe20ifKdD1P/uCaWEnpuh7UEaZobGPbanPuGcce
         e9UrCH85E3CFp5qn/rCTRvv7n/iaUJbP+TvJ9IyHVflEQg+i2S+jXbUVRaOoNG3pB1BM
         tfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcuQshpEc3oEbrwYaDSyL2PkFa3C8K+8uk8C2LXbIHE=;
        fh=PFb/wa4UuuKqrkRcfBCMiLRFxCpnQRHMI09vs36KBh8=;
        b=hwbKNRwCMnWPzaS4G2GtO+2beDT8TKH74/qjmR7S0uytRLGc988G33mTHTgj0vLH5u
         3HOaSmnqzlN1R5gyD3tzfbL9Mu3JZP/sFncjeMPy9zvxk/Mz1qV5ZJXgl60rjdKSTYCz
         YhGlKXUazjOkH8h+fb6c8It2EY8v/Z9qw1ot8m950xgNnduB3rVuFImdSfHh+9sPaxd0
         8twYUeI7k5Fo+B3sXUkfbQ61xHuAXB9DmtlV5s63C3A2aACEEtpWGxgrgbdcHaRXvSPi
         umfRXN3r0am+1wzJfhe3rV2hu1AEhNRwA8HlsbQYj0pxwH0ce3WYx5bbkRx3gj0F3jrv
         sMCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785739706; x=1786344506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcuQshpEc3oEbrwYaDSyL2PkFa3C8K+8uk8C2LXbIHE=;
        b=iTc+ANJY0T37GaKSYt5vwmRVrEs0rBBhRr4a8v+VN18cZvEzav/HOtStmDGs4Fh41/
         +VEwtAcHJAsvRqQk07nqKsIxoo3QE2OnvPFKJ0LeVHMY2Is3cG3FV+u9xH7lqm5QWzAe
         IAUp03MS0MLO+cH9IjTrhrn88X6nkR9dhsO51PFnE84YnXgZBhHADESKdg02erDTFs1Z
         8AXnD7dNa72zIyCmod8zEx2uSb6gF8losEM3Rr5FgR1yKyxmCXX1e8M+jdNtVeGBZ2SX
         tcGJZNEfrr6kRtNT1i6+bL6gJHwFq92hOcy2D6Q1yN/we+tf4Mf3T5rr8MuuYtSAmtg9
         JPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785739706; x=1786344506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcuQshpEc3oEbrwYaDSyL2PkFa3C8K+8uk8C2LXbIHE=;
        b=nW9mYYFcy83SY69vg2HhXgyxT9JHwIt5F/5ZSdNjZ4EQMmnGIBGnDHNH1WdCcQa0QB
         RH1qLak6LZmoIqHUWAyFTjYo1eY6kWROJwdPUSCvJAsTkdrLGmGYgkNjcMm9s4yps48S
         TDvxwb6WosSCSk4pxyYpbjlcEhJ4+FU8tQwi/49pgiMHvFWVfwofGj/BFMVyy9oz+Ics
         jLXP3FJojRle2mqKDT2XU6Qhko4PhSxe44crPjCocxIokL5KQaz1iFqfTY+YxVSiztJR
         /b6Cq1aOIqR37gxKx0fkoa/eI6yyL/Xwtm9tT5nwJZaM7QwF9u1nK39vCtLMxV1X5k+e
         aVtg==
X-Forwarded-Encrypted: i=1; AHgh+RojGkIdkzo7poVc4jO+ESAgpL18gzn5ww8OzFIhPYH4KshcFQCnorHtofjyg9w4jHQhq58f6ZOHG/Q+zLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy15QPokf7+0D0CnIgu+aVVTxKSBZUMgXOmVaPT8KNQjTzIhEq9
	FybDXuYQ69fP2ddMmpBxWoPOz5btfFZ7XgK5txmKSvTBtjv1ey9e9mGnfeTeW2/B1NlPOlTw5LO
	inKlVnq3Vg0IPGya4Yh0oTtfRA4Qw7uo=
X-Gm-Gg: AR+sD12RyaPKJ4HT1cuS7WA5+fKFxzvMeU9SoQzckTAQUT2ynsN7rwgInoukpm3lkb6
	YqQZhfhwp/ToKE9kU+Y1jjPZ2nTZ04dk8XFhrSH7/lEgfzylIM4LDm3quLC1TGoW0x9MMhvZw1L
	UgNd9F2tuUrwsocYxMSxDQ4YpZAAaoXxmlCbIO014MUd+bVOlD2oN5OTHAOvXfzWoKvR4W+Eg5Z
	6hqETpk8RD0+TbjnQJ/PCklfcU44YEor87qvg/+joHmOZyHyE/X/svPsP1T0Y4cWq0W89cOM3lq
	0wPuNJFnYoalkPi2SJKLD1QWiGOzMeSXWtpL+0lgQZvXkaaebtzPWlsyx+BTIB+7ogwjjly6xJZ
	6bcqrQhGjF9Lq3cv2hwIofLfb8VuirjFZbQu2lMWxA3oNu3fq8EFKZRnO+Bru
X-Received: by 2002:a17:902:f78b:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d05206277emr118828115ad.0.1785739706173; Sun, 02 Aug 2026
 23:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729173803.13459-1-ojeda@kernel.org>
In-Reply-To: <20260729173803.13459-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 08:48:13 +0200
X-Gm-Features: AUfX_mwuzwdP6nxeRWpgmu6tvIOqTJdDLP6cx79YtVLMLU9QsM8nZQfv9wD7MiU
Message-ID: <CANiq72mH9EkHr-0XNqbX1NpQLu+UTO00tieYrG_oXiNTuqaihA@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: disambiguate `zerocopy` for `rusttest`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Antoni Boucher <bouanto@zoho.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 7:38=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> From: Antoni Boucher <bouanto@zoho.com>
>
> Starting with Rust 1.76.0, `zerocopy` was added as an (indirect)
> compiler dependency [1]. In turn, this meant that the `rustc-dev`
> component started including a precompiled `zerocopy` crate in the sysroot=
.
>
> This makes `rusttest` fail because the compiler finds several candidates:
>
>     error[E0464]: multiple candidates for `rmeta` dependency `zerocopy` f=
ound
>       --> rust/kernel/prelude.rs:64:9
>        |
>     64 | pub use zerocopy::{
>        |         ^^^^^^^^
>        |
>        =3D note: candidate #1: .../lib/rustlib/x86_64-unknown-linux-gnu/l=
ib/libzerocopy-dfef4cb07ca752aa.rmeta
>        =3D note: candidate #2: ./rust/test/libzerocopy.rlib
>
> We cannot use `--sysroot=3D/dev/null` for these, thus point to the depend=
ency
> explicitly.
>
> Assisted-by: LLM
> Not-yet-Signed-off-by: Antoni Boucher <bouanto@zoho.com>
> Link: https://github.com/rust-lang/rust/pull/118546 [1]
> Cc: stable@vger.kernel.org
> Fixes: 567621523ab7 ("rust: zerocopy: enable support in kbuild")
> [ Investigated when it started happening, reworded to add that and to
>   follow our usual style and sent on behalf of Antoni, who found this
>   during his work to support Rust for Linux with the GCC backend, i.e.
>   with `rustc_codegen_gcc`. - Miguel ]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks!

I changed the Assisted-by tag with the details that Antoni gave me.

Cheers,
Miguel
