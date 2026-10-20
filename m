Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792516189;
	b=gRvvBRkHO3//vLBIeZf4+Tz2fa53M+SbwQxsBm7p2vIjcF/00JYA8rBxsnZ+GjJ02MZq
	 awiBj1y1l9QtDSTtaQcblhoNWUX+EKL0xMOHkn3l4QU5LgCwvGcAoUIZNVHJFge6kvQvK
	 PGit0zgSuv+0BLUidSsY/r/EqmB88Z4ZndcXKDGRSTmgu+sW4TlBysnRjIg/MiI4jW+uP
	 iPp4G/bfqqtPiHZbQ0H2wPF+q2i49WgqK3oIZC/NdxMwI/fs4q5nAlhpXJ5KGkju/WQfN
	 nMd8+3Rv2rWpJrPreTHxd2Ym+ZqMS4SpDrTbIAwoDUDqqw7AIpO58ZuqW2ZmAo6GA6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
	b=He3jCeCxPzX74vcjSem+l9K8RTlFZt0yWlcsJuGJUj2BzOxF33DfkGdgzwvmICyK7q24
	 iHWBzoPoWPdpWsZJzPkBKMMZG1h3KYZ1YyLCd3Qoxv6GZtWBvzigs2g5Somo1CcrmZ4ST
	 nOPhr1HvAbtBqzp9KcJSsi5VojmP/Cq8IEZA0I3buedrl4kzNmCTy2XGW2MGin8I7oev8
	 GXMYt/lrd7eAtem8UjLu01VxAy+l86N8mLAIhB2ivOUd2eDSBPr/6erw5Mh0OprAEI3WD
	 /rQfZqFhwAg/CBYwgrfnClVZm1wn/UmfJedg2MrzHXr2Z3cVI9wZFAlZjHgPzBo2UQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0873606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 17:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0873606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-360236b6c3cso318351eec.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 10:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792516183; cv=none;
        d=google.com; s=arc-20260327;
        b=D8WueDQMymk874k2O2TNt+0L6kQu8ECBgblfeDrhQoXti6u3eeALY+mBKDS8T31deV
         5ZjGNQSnoIuoHSoCJjkBHg51bJnhc9yioS5Mw5QnHvc7lzmNn0RzY2lUKkfpqmV6sH1G
         uzCedSbl5nmtBB1gVxSWmDsJShOzHpC3Fuyw/8Y4xa0AboV/wOiBDRixAOvLfU/jo18I
         xc/qJhNgIjKDlwleoG1RVFJBpsavGqzG2AL+w8hn0Eyotk52Fr8r+QF3RnBJ1bv5vQK2
         aksmMZOppfxv8hma4DGLUZyqY4HSgm2msTpc6av2Q1nvTfSkfVbcSCNj5y0eLK4ZTcVk
         F1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        fh=E5yg6DIogCCc0B86IvuDaGo1fP1DG/6i6e2Rw2QhpjA=;
        b=C3ERHobyg9ZpumxgBzXjOIwzQJFdos5AYkMXuDCSFeIMs+5fd0KlSP3sMq3zlkSrx8
         mOxGbm5uLne6rmSqsODKmuRQxU0Fngk/QTluy+G0sbTEkSfo+/1cMBiCq0Iez7zITq6K
         5eeLfTgOLewo8DnmtcuVfurga7CxFpwb6eV7i6gxsL4NYMcxXD4cl8v6HaYlrJa1YOGA
         dNebGlhAI8JZ6fOakpA3SBP/TdeUcE5FIdRnJ3vnzTLJf870Qu2KHy8b+Rrcjg3AhQde
         ZXBHI4ztHDS5emTWCp4xwHCpZPWlWDE5iwCoEfh/uRSc/9YOnNnxjtDSlKOGR3+8ddcN
         4/eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792516183; x=1793120983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=GgmF2JaxWihTIKDQ6w9Iw49mFFy5aK7i+arMpdqj1xFBZLC/BS6rk5OF/MK6uP3C5W
         Jm9AVWMUFJh71vwBZX3czhYiBhPmmlT5Kac9X/v+QcHpJQ8f9DqjtSVviuIYnrEbUEQN
         HrLBLhDBH6fz6JaVN/0P8fjbNrPFw2VkAC4oSASuN5StwnebufW+K5n02y4z1Brz8C2j
         Je7MfkrR4VD6tZWibyrGI9bieSv5thwGC5hCQFe3lz7lL1hplpRFHxXl1e6ZlXE0+nts
         pLDPKbetGl6E42S5j+URmNQBC5/Z5LZ9ilfOpLld+c9Fpb3jJggJWBhJRv1wg7lcyCL5
         xQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516183; x=1793120983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=k7axa6YPn0dW+iYTagAvPEpMaNKS9zddYJxq/87IlRx27N/nDbMSDURFBJiq1E4y/Y
         H7UB+G9OUWpckQuRyL4WuGCpddPd+zMOXGRb9nckTnHE/nmU51EQSA0XD/RBqlg0oqEU
         dIad1qLZFAnXyJjSJKtV2NLStwQRM8flG+V402DNgPfxFttlkxdIC1MrO/yvBGLkele7
         1hz/ZbqYEoql3ybalbeDy1uUEN8Fznm30SAqj9RgRctxRx085pE+khlEJfGsL5+ZuxMr
         mZlB/urBbv6AGbB0+p7kuUv6/iFldIjFx9kVXjYDT3rBzEticr8H1LyviKq0rw9cZMzZ
         mwDA==
X-Forwarded-Encrypted: i=1; AKwUvBwINHQGfQC6k7LOFlUsfgQvjtpUF1zOr/BxAxqllX3L9zXJ3OwA7pZeXNoqiK79jHRHZW7RFx4BW8GoORQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlp9THJxwge5e3yOJ5JWstdF+mKF1s85MEkUrBq46iJ9pNPsVM
	Im7J+7qlXVVCNvv9AITeX3/pyPXb6jp4SkrxLfCJoxrnru5P6CwWGnEbnNA2///ExctMcplkMzn
	cOID4a0z3MWldjYasOGQrNozvO6AJpVo=
X-Gm-Gg: AYBFou3Xve2tm7khGBO5ahiVjSLsenmykyJ7Re7qX+xSokxoIbP+9wBfIT3/mvw0G5d
	4Y9zMYjNnJ0zwcVPjSkdywOr54/pyUkAtGQcWnCKz+m2/AAxwWm98cC2Myt5r50gplJeZdyqnXf
	19I2xAbngTLZLhICOi6RXFW0WouZUAN3C+1ZuOQSzNdB4vM4jsWmbT2tqLlIQ5zzfcw/lSzelFD
	wiul8acHxzC5E+84ivWI12oSztBnSN/vZCNoU4CD/Pvo6CoTejT8RNLM3FxOepxMdONryS+I4PX
	lDZIp0thMhmE+HLLUesNcPVbe7gTxw0s29FYOtzhIkcTKPD4FVnpeZXgv1zDgpRbEJI4rLGzXnN
	cV+WvC4p3cyHZZKSGVBUHM7KUmBjUAoGSWRH/rCsWxkn4+hLq7Zbdfe/MktGzWJ+LkE0Bc7FqTL
	YP3YyobE4RPG5oGFWk0GNnJ4h22jhTOhg4LCHHei888E2fYYTr2HE=
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3619b212ef3mr24985185eec.0.1792516182799; Tue, 20 Oct 2026
 10:09:42 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com> <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
In-Reply-To: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 19:09:28 +0200
X-Gm-Features: AclHuK9D4Eg255wKZ2sPBwolmAnynFBIgoIfmMAgFcQGyxFl5TrsNoPPIa_966w
Message-ID: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Happy to take it - but in the interest of avoiding conflicts, thought
> it might be better suited for the Rust (or Kbuild trees).

Same -- happy to take it too next cycle, whatever you prefer.

> Needs some -next time, too.
>
> If I don't hear otherwise, I'll pick it up later this week / next week.

Do you mean for this cycle? Linus may not like that, but up to you of cours=
e.

Cheers,
Miguel
