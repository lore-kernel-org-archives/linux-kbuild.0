Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792523381;
	b=K6E2PyrF5zayyRUjonDCmTrlYkn5iPjekltYMERBqIHxdKJontl6aBFeHMObUyeEP+0p
	 pQZi4NuMJDK5P4AYefQHuLIEBgVZw1jdVESl+tr/dvLn7XS6TCGZNGYqmE181A6VkAg4L
	 0eX1m7y3hYgSBmCBRpfWi0oILd2pvIKIkP7uzYoJ+mY5kg7h94zZLvJti9DzxZnniV5NU
	 OKML3xkyqr6h0Jow5IfZ0JftfaYLNpPaP7uhuiYkARqPJTeOIToFthKmjt3met7G0qBM9
	 snN6NwPZxmS3jUpCQbD44I1jEaip53831Jax4EyYfuSDpGjk9f6ic2PLio9EoKGIOYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
	b=knddJO1a8PAwq6/ZIdwvssNr6tdQxvoC7YhceZ5MBqwJioysYniwfzMi34CIKpapjWcr
	 Wu5mGmFq2MIeQe7l7M+RFJbYslXhbteOMH8KIRp/0iCQUlVTbZqUheUe0Vw99PmqfGCHT
	 tk6gK1IyT7LI0I/BbvTR8uR5EAZfbUayC4UWdZaBYCab5MrlyXNGiTq1Zu21kVFjvPm9a
	 hCsjmKzs9w5oT0fQx7g4/14TZMWX1psu4CNC4w4XMhJTi7Nd5nur0Mf6ZCyDD98Gxm19P
	 yPI1DrMDSowhCffIDsEiAEL0sTpc5PeLLxc41U0R81Vzo6b3Co18FcPF02Bgx7lIhZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8D606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 19:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B8D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15943c9be84so174903c88.3
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 12:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792523380; cv=none;
        d=google.com; s=arc-20260327;
        b=m9KutoQ4dq0FqaoYeKsvFGf4R6v51CmblAo2oVqiNhlILLNkMIxx38fo1GwniQ02z5
         K4H3bPFZaSRXpGQR319PdeMXHWjhLAJ5mlr8jRmffF+KTAjFhVq4IjIJYDtCR1Y+e9ic
         rSgWNUexiGah+f8VkUaCHSJXaaPXTX3c9HYjjalL+d0ADzeKADvyK+AxGPCDr2d62xEo
         hf6BZaY6VzRR5W06hMrymK17U+Ahg8yU082rqJSiytxI6ZFL9TRnpd+kuwYQqnMfL+ho
         mbs1XNqIA76DOGYWBM0lmO9By21RRX9FvJ6UFmmacvJoQUTY1+YaxeRZMlEjJf3scxyv
         9Cmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        fh=p2dLYHqmNYbyXzbe0tZnJpnKxm1mvziUVdfOruQj4RA=;
        b=IZIMnTLqjc/ncDZ21ddlQutmxi6d3xl3FqfxRAMP0g926lwh4lXTnkzs7DBrW8abU4
         6mC+NQQH/aWCOFyVS+lup1TkgkL3FKfiXS+A8NBRQm3YtkQJsuFgSFx/CaTTu9Wv+pt9
         lq7HoUDQswekwrkWuRyOxp/RfMGcMYfBEBf0QLpeiUJyPXktTFI2I5hPWKPAeDK6k8Nn
         ll34LZgIjB0Dg/JjIyAmqSZ6jqiohQaGzKPfdw8rWqHQhtsz9GdBHFc4AXF3VA8EDCxU
         Ycamk5lqDPHc8jcTSAwKofpcFFz1Z6feBMq+Ol1J8MBTPy46zl57jdsRyqWREzKm8bce
         coWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523380; x=1793128180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=IygMgcs6Wkd11h28ba3ojzsoJTpJa94odgDpgzrul6leMm134UWAt/R1EWFLQ7KrD7
         cBSCFOQ7MVWcZDDh+NFWLTMz20zU5V4OtYha/Dt/ndOifBmQqWKbEPWCSAUmQUCztPrU
         lV/rb5aZyojz0KbkWV7UxioMmIVCAOfmPB183Z6/VcaAHY/R7bG+jTfqiIfMVDC+L9J7
         Ru+qT/CBDKbmkkQdRKoQq1VXCffrvFzcO+E4IgTEus+geEGk8m379SuKk4YQ5MAzXfhX
         dJhCDvgLPUuAjgpRnNwG6zwIfkaC4zt+/JtE4MTaMLMyHELdf2YxSGLFrPDVCiXvHLUX
         iOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523380; x=1793128180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=adxQtXTHIfvAVqEZv03XuNt2G0IJNTmJedzBjNUPKSQDQN5Hnl0UK5njfFJSW5xRve
         6xugACWo7/h0vS8vESVULeXBzUTobVxTqM1pM+YPYHXVTpzWpZ/j3zlaA3GFS6C3HddU
         7lgOoht2mb6dWmwUxI/w1Kay3PlOWPqbIprxL2BIURTBc89OQ+gwSfJB3PfuXMWL61MI
         lqWrEV7Rxw3NgsiRGRRJ2I7qO5YTIrogDU1biFIgayaPtfQXnHrDW3sqfc6Ick4UZsfy
         gDdcVAdznWDb3t+FmOW0vxjYs5/MFUmMmOYck+q94fLC8SfIXYe9T9yDUTAbYF/XzxA1
         Og2g==
X-Forwarded-Encrypted: i=1; AKwUvBzrkv5phsNgan/qXZsFDvjBfR/nrqAX5E5kqerXG68Enbk00IIhDL79cAjn4ovMe5oevF4OmyMJoayNT8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCBmC0pWVzy1nqpLoCVP0MUSd4vHViNSvALWY+rEMaBAwCpv+p
	BRnU+78hmmEywaVToFB8SqRcMKu2eK7ICIjHO0RJW+jfXU8L6mDyLKLBvHoe2T1+/qGQ4SzxQwQ
	jsZfvOLdL9OJJjRXo0oYf7DuhpR1s+1o=
X-Gm-Gg: AYBFou1naf8K0szcP+4PmKe8VZYs/V9HrJCJFw521aXSlIABChQxp44r78StNnGeGwB
	vo268/FbR3xZjejYC5sbk2cjS0yhaztYeoPXltMMAW8n6vMC+WHnfU3rSRtZ8Ype0gABlsAKVA+
	ZXr5oLUj7h7MSbcFxOSt5HQw1/mxd1KNWztr5G+G9B4UjHVlN6YAHtYqUQvjjlAX4DWRq8YA44L
	RiXiSYb+fhTwlbhGtCDIX3orKb86j4ywM935GIGeuhHo2Bn7i980IA4pXRYivltrw2d14wyXIGt
	+/eYRAEsTBB8ORZYbUhxyz0qtARz4u3GblqaPENqyoFyDs6v98s1Qc7FlCSopte6BcYFV2Cy9Lx
	sec4yTgdC8vpoTRlGYwupoqZEELeqkqjSUdbUvv8Yt1ZM5j9+pNuYRunW9YKKYXakE3BNhoquEu
	t9PTSeCtG2fGzn3VRq/rhqc+YDzS5vKwFb91/qmam58eCiqwfU9Ys=
X-Received: by 2002:a05:701b:4510:20b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-18507ce1c04mr25464534c88.0.1792523379507; Tue, 20 Oct 2026
 12:09:39 -0700 (PDT)
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
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
 <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com> <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
In-Reply-To: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 21:09:24 +0200
X-Gm-Features: AclHuK__St0uTCw1avvWmNXKKyd1psXINLsd-c9PUmbMZ1zOmfz4IJPwzKvtrCE
Message-ID: <CANiq72mcCErQoK6wmtOcAZ+SOgRNZO2fPoZ1dac1Now6txy=MQ@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 8:22=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> If you think there's a low risk of conflict, I'll take it.

Hard to predict everything... but conflicts are generally fine anyway.

Thanks!

Cheers,
Miguel
