Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69D3C3F5D
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884208; cv=pass; b=ZeqLFdN2RDBZ1XCVqg2MwTMq7JfC/G1vHOYPuXCdyuPemHHVJtsGPGE+J7W7gnXZ0OfpjoPad0iE/RzgiTe1WIwZNHS5tfN4qLJZlj3IEam19bPoDkq3UFheh3LBUaW4yf0z4lRxyabzuc3Am9F1HBgYLkGQ5kX1rmilnbRAiX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884208; c=relaxed/simple;
	bh=I2RdC5E/xdt6kf39B4bXuZ6oTCgSZu3FzLdqV73aXEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIz1hinuw1njcLE65D71sydD3j0CD/rBJFSlbsHEmgvSDa+y8zCTmzFs7slAo0QGGlggFhWffMHxULXsS5d/5fSssAHWGTV1UZPb2pxIJuDwN1N05VzkBtSrPnhbyunykBEedn8T6M9tiYj+yZ1liPUkiNqGlKXe1uFNlf9WDkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jkmEkFH+; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jkmEkFH+"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15168a20b47so1762492c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 02:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791884206; cv=none;
        d=google.com; s=arc-20260327;
        b=bSkBDRl/lBkbxP6iapLhgeJVvwKr1j+fsy1f3qVgcxEjmfKzJcLWFSiMv5ieObAeux
         RM7unqEsXlkP45WfIrjeSfkHEspJhNT4rOhh/VODD5AX69/zkclwP9ucjxMMFP0oh2uE
         hmfnhxM4Zz0xENIrGpeH0/JIkR9OXVrWeaBmVXluuOovNI5Re9y7BcWRcfeANDkSg/bV
         LdmOHLc/mqS0QkAFOGs2KTCe2Q3wGeeMeBc55fDdlUv3j1tzbsEHDnMNEg2dhLr9ec1p
         nfuAI8cq/BCRbpdkIdpCYf7qF38giVcD5aFW0NR0/SDbQcuA5j9Nt1AjyaI47Pevz3XY
         eqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        fh=54QmdoBgGj3CWxBBpdnYgsPHsUna3wDOicJzWG2VfDc=;
        b=a1RRap0pKJ4gYaEIYF/wr4qSJLu5WMG8V8qWdEcBKH+DCOFmbPRGj6Do0VgsYadFS3
         LcznLBDeaXeUydqvxYe1Dzy7XbuqgIra8dBpR8GkZitzPhWv/Ff6OaADvbxNYQ7JzZf9
         Yd5dmjngCE5lCXEehXUDM27d3pRuPX2Ss7ljog6mOhig/DnJtXeiSP7tqXaN9mh3hXsl
         URbCRl8IWwWmZa2NUaR9838BgknnKrM/Qiv+so6RThpfF64kcP3TjBkSGMV319rITSjS
         JB8FM71QRdi+nh9yaPg2vE3RYCZ3Zo7iruyoyyZgi87FhYYmOod3Qw6dRR+JEeejzlGl
         lbLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791884206; x=1792489006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        b=jkmEkFH+T3MyeQjhmros28hqe0uiimDW20NShlJw9F/0Tlf/TWlx8270B9ZUpH+S4Y
         fdviQ4G9wAntYM0lOgf3UxP/AXBy31A8ktqu/2Nva+3mMtKUONhwzthwXfZptuaoP7oc
         Reo3vqOs6hGfaL3/qnHWDXL3/lj2hlEQ6s8oHgExR7tE2moOSR5rgy2ZdTvCrjJZ5OEL
         qcYvIm5svJ6VmU7G1LQ8hC6vzkoGYwi5hjF6H2H579WDijm9QqQuTpV9wKXkJBY1lbPv
         pKrq6zvIfgGajbsCLnbmKB/zINRFK84+fqjGUGVdVu36KV64qYGysfKSS0+fDbbQKCEh
         TxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884206; x=1792489006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        b=clFioNVSPSFpvFlwNg3ELXGvX9on+6UVcLxCWzwUQAuUoDXTjL5RFi8wjy9MoHzolh
         mQ3fMJSlrUIAf2OldJdgNTH+K43Ts1AMQSV/xj9W1xNgrJOHZzapSnUsNnHm3eSWTE3l
         Yj9bl9h+8rnuGeu3GtOumAyrva6QvFWHI/psqfLA73vHzpEAUhjRJ9KdpgfBfpDMKE4j
         wiHVwHUu7neYPQ8PmMp47nHg6/tN+8gxNasa2TTbGxruDd/5TDjHCxcM8P2pg8ziWHcD
         4UyTRXvC5Cx839IwFBoMB7mF0YwmB+8mA7mBybCPfyv0Mk2NTyxE4VgN1Plq7W/gthKm
         pWyg==
X-Forwarded-Encrypted: i=1; AKwUvByKALchbEVPS2Sz5Z3NqYFST5nkzy4a0NvD149OfZPfU4g3GJasO5GomWYbqVeUoKVNL6ZvGOxkheW4Flw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5t4/AntdVW3Nu1wXoNNuGvrKMxyJnk2v1wPlxOo5hszE0E9IU
	c4SAhTwyw6cBs9vV0f9aMYFiXBgu8diLkNymYWSXI+mmwY6yUrRQ3rtHQOK7YtKZd46v0JZlpC6
	2VDV1Wd8KQlUcF0Uu00nXmBHMe62EN7MZGdvu51H4
X-Gm-Gg: AYBFou3N2tDjKuoI7A7q58G0B5yQt1WTWQttee3SbGl9tXIVhmlx4XOn2Mflanw8NaN
	7asmmPT7boI5tzzi2cnpddROFmyYUQlnV0fuLP11ATIjBhdLrgcdS8NEf/aUpqG4sv+st3wyuOr
	yU6g7N2dLbWAJgUJMgCZ00YPyNA2TMR2qrCItY0WSRzlNui4GuJMtjiy2BK2tyZ60Q1J5SJLVJa
	N8Sjrhp1eZ9fikHwETK+cYHRbmuO5RLSLnM6bXN0IX/d6psdPMFuRSH7Rkp2fGqAy+kaZoz3pjN
	1gwji43UdmmsjHXFUaUPpXdVmDFgX2V3OQI+/W1/dAMDw0N/KTAcDt/tSgv5aKwxyxk4/xFjY7j
	16rtt+fC7gQ==
X-Received: by 2002:a05:701b:260c:b0:14e:8d1:1012 with SMTP id
 a92af1059eb24-16a5eb5248bmr15061808c88.19.1791884204773; Tue, 13 Oct 2026
 02:36:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 13 Oct 2026 11:36:07 +0200
X-Gm-Features: AclHuK_Q4zmkgXJ_aRet6tsAebmNwBt0xYiVjRfJ2laZogHRXSQmQgE1FE155EE
Message-ID: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
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
Content-Transfer-Encoding: quoted-printable

> +ifdef CONFIG_HAVE_KCSAN_RUSTC
> +# The minimum supported rustc's LLVM supports all of these options.
> +rustc-param =3D -Cllvm-args=3D-$(1)
> +kcsan-rustflags :=3D -Zsanitizer=3Dthread \
> +       $(call rustc-param,tsan-compound-read-before-write=3D1) \
> +       $(call rustc-param,tsan-distinguish-volatile=3D1)

Do we also need -fno-optimize-sibling-calls here?


> +ifndef CONFIG_KCSAN_WEAK_MEMORY
> +kcsan-rustflags +=3D $(call rustc-param,tsan-instrument-func-entry-exit=
=3D0)
> +endif
> +endif
> +
> +export RUSTFLAGS_KCSAN :=3D $(kcsan-rustflags)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0a4fdd8bd975..78f1c23e54be 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -98,6 +98,9 @@ ifeq ($(CONFIG_KCSAN),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>         $(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-ob=
ject)), \
>         $(CFLAGS_KCSAN))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +       $(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-ob=
ject)), \
> +       $(RUSTFLAGS_KCSAN))
>  # Some uninstrumented files provide implied barriers required to avoid f=
alse
>  # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation o=
nly.
>  _c_flags +=3D $(if $(patsubst n%,, \
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index 7687b0dd5474..4b02bffa6b46 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -231,7 +231,7 @@ fn main() {
>          }
>          ts.push("features", features);
>          ts.push("llvm-target", "x86_64-linux-gnu");
> -        ts.push("supported-sanitizers", ["kcfi", "kernel-address"]);
> +        ts.push("supported-sanitizers", ["kcfi", "kernel-address", "thre=
ad"]);
>          if cfg.rustc_version_atleast(1, 91, 0) {
>              ts.push("target-pointer-width", 64);
>          } else {
> --
> 2.56.0.385.gd3acb90ef8-goog
>


--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
