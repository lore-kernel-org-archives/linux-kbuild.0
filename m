Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792520558;
	b=zKOliaXbzSsQMsy3vNC9Z5EUAyEzT0ku/vBSAUa9XNth39OTjZCraa+0aWZmJ7JFUogp
	 CFf9Filp7N6ZbYokj9ofD46/odbi/2+Dej3U65LPc9/26mbrUe+k93R0Py+cNWetPW9bT
	 bP/AiFPqz+u7VrSh9UqC6DTMXlLeNgoa1X9lTucPjyD9JgaD6EXKMW/cdtNIoLveywdk0
	 EnXRvJ2/OVDBg0LXiJ45x8cwRi0ELcupPz6Et6S3pcPA6DixKgm5Vr24UXM5oqTnqdjeJ
	 msEB2b6jhP25rkLsllYNBJME11Q095uIAIVg/5dG9VX0drWFWgqjoBFstaYA7cS6O+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
	b=z0WwIgcGDiVhFPkBTCcJ4mSF9efjXBSTDeFEtJDP+P1W/VqhOaBpE+jaoi9rUqDPgmkx
	 5aoknWLm9iSsCWyR03AgdtnRfMz4u6XLiRTR//PzPgEhwkYG5xEJlQAqf46VmehnbZHsU
	 tS2jzjT0x7I8cbWYIq5BT0GS8Gr20o7Q0MqHwaIQLVsjxDIh0NqMvi1HKyIkNSS7rImFp
	 6/hl0TD3nKJrMkACeE42yEFvQV5fZuYk7YDmwQO7R0lzn9yxErXT+OpuwVgKCzJ7yy+yP
	 imD6+TMgMt6lZMRyvCLTB2E2pWLBOAVa3PUCl2nRCD92RELao3Q6nd623qqHwrIIajA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jCpPoMO5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6207606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 18:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6207606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jCpPoMO5
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-679e6ab6471so919566d50.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 11:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520557; cv=none;
        d=google.com; s=arc-20260327;
        b=JfsWAUe0tX0pAucn8EVlsyDW/UtwY1jIrss5tAtcfGrdKTUgV9XqYo3glTC8YdZ3FE
         8rFphQkWTBbFCa3MMOdv7GRim3UyS/A8NS+uZ5w7qo3XMtqF2TlE0dAuNA5f5/L+tQCH
         +03R8wo6AJW8NoynjBsLZPzQoUPU8/arZAfj/oi2PCFaf+utQOo5j2y3fidPdg9ffL8L
         kIH5gEjphWcKHIxHDkXsen3aaczFTAHxEJpo6vx+Wwxj5KwGD4qX8R47X2odVzFxRnjS
         RRCwXMpGyDiffnHHS1mPDBpgjaHpna8GIrYucVc3uBiurc+bnWvmgoJEqgoCRKP1ct0n
         4HWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        fh=9lOZXR8/DeFY+4r8zKCA+a5gfJxXyfwz1QOdF0Szk3I=;
        b=iU6mGbPHHiPicX/BxyvABZV84sdgZ06t//mCO360ZDKgeRk+ajyCYH0P7BNuLgyI9H
         xOOlXqrv+KiJ4Loqj+GR3+wGJ402Xrim2Y25U89ubaJIEaL9b0wRQ06r3LWZEUSWV0B9
         q1r8LQf1oR5ZAHpeeMOjdRSIwZ0L6CLPLde3q1ulwOoIH5hQ/nK/E3DQpom2eugvcmYd
         qtQerZd/7JEgWp+m6ogJ8Ou0oUNj9aKW2x2e90YAOUOBn5+QEFqqr3USnH25ASZthN0B
         m32aeSsKk8OGBZOb7FMJErBFcnY9H/BGextMGVBnRpUCJByrtEQhkB7ACByLk0onR1Ne
         9pCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520557; x=1793125357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=jCpPoMO58y6sJRNyUMWUWt3Xaw377KaYeVqrCJswRAQ7oKQE3kKZ95epr4PHsw8jDo
         +Vymhp4pDTcYix/GYcYigVbhJ1c35neN7bD/cng2pd+6S7s+QzkwOXRmFWhmrZrBgKtS
         uF9e/+MT5cJsEuOOvqCc7whuK+e6LEQbbFr6JTp6HpsdMQassQUMqaIylxCgHB7Nna4X
         DLnrnpOCODqRFSx8BjU8GCmq/xzr12NndAQ9cVvg0WQ8c0FEhJ/i5779DSYCzc6Mmt29
         TZInkgPURMOVAxBDShoWsPQiMMC6ZVT87Cq5hblK6YvF0yoLo69dvfI3KNOWArT7GB0M
         CZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520557; x=1793125357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=gu/PRsfTtPVlrDXpNGO5GYLWC0sxmUCiBOAxUHxlNkKd+2TT8h7kvHnXWR3xIXQzXW
         rG4H0KEoviBZi2yrT2v5Mp5xZqtNb2YoAtRlzhc/hVr2IT/bFUdSaFR+57a76hDbJh5Q
         p4QPYAkIX1M6uwUD34hSr4rvWm1DRjTWz1viq/VXpEVtGhUTy28hwhObbuuqzGI7QgoA
         vxjTA3vqSVyLjBqpyitWC09E1JnKJy6UpQu2dpt1y/kxn/ru7gW5ZbWUfm24m5y3fvuL
         uHe4uk9jwc6Qvgi7DjWeFh2YC9cK2nTZgYAnOJJUeNKLHV6SRQTrgv3ndGwXRD7Qq0l7
         b2sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj33+0duzd1AP4poXI4FbIbUn2t8fPYZ2iGplYC5Tkkqgg6foyn1YLvdIMH0x+F5NyvLQCIOSyOKgNojM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjRmfR6riPjFAmS4GwzE35HQWaLbhRZ7gYoGv7LPDAKbGrdKEP
	+Uu/ztH/yqGNFos6IgW+3ZOOHzlL5RGMtf9kAe6j03khIy87+M4RbkD/u4JPOamZTJFSFgI5mog
	dE0RoQJMraTllNEj5JKcRrG+LFMsAGLV/pn8LAHGH
X-Gm-Gg: AYBFou3u2x1qRo8A9CQkd6RhoyJH8XfdqJZIDyOoC5/dEXD1Qe1I1mnibRUzMDMLtoY
	hz6afcKU5PRUxGq8KEsoL3/TycTJ/FelnNKDPAcFyAHwCyI1z/euoUbEgdw6U+wxrotRrYFRI0h
	hHWdrAI+jZr0VOpBSu6YZptNQkHRUpGowgv2Bj0Jl5wS1GkncJk1Bljv/xvKKNUatkED4LDTlBc
	tWOqK8ltG76UUBkIiFhzlU07EzXR7HidQj+/q0NdqJ9+Cf33+YDNrz7yDvphRT89JqpQUZ53y/j
	W0qss7+qxTAaLBaOYUmDhl9uifOIetUd/+I1JvO0X/CACyAXllYIc0mH8dNs0DexnrR94AXUVk7
	V464IokCon9U=
X-Received: by 2002:a05:690e:1508:b0:675:61ed:ae79 with SMTP id
 956f58d0204a3-67a0e53f3camr15368d50.40.1792520555651; Tue, 20 Oct 2026
 11:22:35 -0700 (PDT)
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
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com> <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
In-Reply-To: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 20:21:56 +0200
X-Gm-Features: AclHuK_xIgQ2EfRpHmzLAMkZfp67LMe6ufygxtV1abJhpWdiWd3lua4TQ51kRJc
Message-ID: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Tue, 20 Oct 2026 at 19:09, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Happy to take it - but in the interest of avoiding conflicts, thought
> > it might be better suited for the Rust (or Kbuild trees).
>
> Same -- happy to take it too next cycle, whatever you prefer.

If you think there's a low risk of conflict, I'll take it.

> > Needs some -next time, too.
> >
> > If I don't hear otherwise, I'll pick it up later this week / next week.
>
> Do you mean for this cycle? Linus may not like that, but up to you of cou=
rse.

No, next cycle. I'd pick it up next week, push it to a branch the test
robots see, and then update my -next branch after the current cycle.

Thanks,
-- Marco
