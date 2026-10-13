Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFCF486431
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884329; cv=pass; b=mHaUnr54UA51t0MnYbtuqoV6fb+rMWvGxF8ofioTSoWRhhsirFyoYMpWSracBlys/FtjoAB1oLfvEJk6NkpC9teqUlEhrIudOXXIgjCqR4HSCP7BayDW1LhCbKpMSuHk8l2h/rSTbhDlKRhnu2o77829h2WawmMRvs0q1hQApXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884329; c=relaxed/simple;
	bh=8mVe66GEzd6sAkunACXVynKdmNft5klxWxxBXtRex2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEKnBYLmD+VGiYT+6orxNxU5TgJXq06+u3saTA6IITPP4qepXtRaEjPqoBYKHueJIYbN+9v5kwgqhDSQYzLc2RNS6WKmAhwf4UYgRiviW9TIbyE5WMsFJY/j40LiNMHUhoOhcTP0YxP/+M1yQH4roA5IEC6R0E0pFVsLZXLoHf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMRxOVnx; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMRxOVnx"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-157fe9d771bso684351c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 02:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791884327; cv=none;
        d=google.com; s=arc-20260327;
        b=lF/ffmmMw2cEHqKzFRGHZOn7SUzxrY3vpvsPgbvzC9cwFIBdxP/ycwkXrcseFW2rjV
         vUXSiDtVWrvQ25yhLgxZtv28s+M6qP1B4H1iqb8jMpC6uWt47TZ6g0IyUQePMuQ7sYoc
         6EsPVvd1+nqpL53jOKBdM4R467De/ZjD8xzEx8mVC94Os9xOvPmFSSYg3HuxbS0NyZ3q
         eO6vWdc3zIdHeIg9okLbRl23wpX9Wj3cGfxahlfA0QBT4XBx30ACM81cSQEKRgQv9alr
         CGBMhj9jp/qUb/f7bBn+XW4IC8OqQeL44vAd6sAUd1TE3OsLcZaTwHq2g/ux/m1Vd+jl
         ofjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hjiBRpMUG3UtZRbPmQwOuJtx4+jqLwpDEaQOQPQts0M=;
        fh=Kl1DN59yuXh/Ryvxi6/3AGynePR/66ys3W1bHVGMk2o=;
        b=XVoVrKsanvFNsMVd9zyVEKkwuj28c4c1ZIOL8T9hv7ik36aEwSCvdAaiby596SkzT3
         3pSZ3R+xGmQqmE0JN2tFMqW3lvhJo3bZl5CBRuxS6EE015RTf1KmgdFK5a+H+ejNw1QV
         tICbha8USqItzh68OXnGcmgjqQb5NoCeKGY1KGelpvch72NjPHyCa//TJKm3xbYfjvb8
         x6IOD8RhMFcqMRWmlWwdehqSoSg5UqdjT8ird758kr+9xsGpqO+f9xts8iKMKYWn7Jwg
         zw3walD5+iOzolm+GffpJHVzyO1lAtUNoGh/VJQFAXfXBOOCyLWvrXapXDMYt0O+d3VA
         FvOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791884327; x=1792489127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hjiBRpMUG3UtZRbPmQwOuJtx4+jqLwpDEaQOQPQts0M=;
        b=fMRxOVnxfGiRtuHQ9si2tnCUNmkYVlpuZbNO4B59qRQJs2WZVkN7Hc4e9FI4NnP2LM
         5x+bmnQHAe+kOpwNrB8QQChHXAExdMJWVwh8TMgelJmsK4lqhoZXUo0eAksT+Rh1gtIl
         zzjIR48i0ZQle18ZwgutnUmgorlj10HKyXOTbOynbog+3XPnAlqaClZOKNxuyKNohRGc
         /yGnP0zNrfL+QEPlLuWDACcB+IsrXCaJuNI8cfhJyQNPXyshX5xERUlvpZRShgJPORfg
         QLLeVg3U7N2iiA+HblkOI2vjOsDOaFaGgmOoW2+tms4zWVO4qq6K8loph1sr0+XXsVL/
         xsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884327; x=1792489127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjiBRpMUG3UtZRbPmQwOuJtx4+jqLwpDEaQOQPQts0M=;
        b=IF9ml1FxkT8P32Uw1TXWNxZuF7O5w++tzvbZYTqfMbveu6hliXzcuDGJ5pFoLERL8v
         NunGfVzor+F8VJdI3RG/yC4gQTkg8BqNZakN30pN9KESQnLD8odk/487jJrnRtFJbM2Z
         MoBoNftDWwEmteKoBHHy+moPldLFiZBPqvi5TvrP9RJ5K+M52qy+/ayXCLQZArd6b08f
         kvQIQuR8aKMS8/1/G6ahRKR/O6t+yldP+NcID0qBGi+izeDCn5T1rlv49jE5pk1KnzVo
         byIJALb2EEBFst462HwJXJRRUV8hLtphXPnn771/I74gmfK7NUolt/dG7SHt4AlM+pz0
         vYBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2uqK/6JrwLcpSqMMbK9+gNpkut1rjWq9QZfDQoOGhJ/um/udOAgMiIsejGzbUinYeXSkM16nwkAGKVdo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9BJrXWkcOYUiUXEZTUw2S/1/U1ZXho0sZpCMO5K9p+XBrlS77
	NqXueeUeNm5gLthdnhu9ruO+YAR5U0XUN35+0+cwjZ7xqC6jEPA+skMcoq8FEUocbuV5VKzFrau
	NFdI49QL49zzgXg9vLZFssaKWlkvm2AlkpRfKBY+6
X-Gm-Gg: AYBFou20yXbfYQqPd1Gv6sKTnib8E3PieHjt9NKQRcOjXD0b033Y5DuGzAfB2T+zMBc
	c4vfrG02nOdy9umV2NaAevLaoBHSjGvyEkjBoQOjwvr/WCXmBOUPsw53RsSWfwg6gIEWpp5tVz8
	7SW9orQKNUHGJZLlbDFaTgKA9KySJ/IUrwA3oYiZnx+mC+NC3st6AbNsUZZWvik22tr7aiY8QJx
	9UOIKpx1yI8Y8tgnl3Waru5Bh9kug+1fUjBUw3Sed4X1Ume13X8BC+ANbUNIfw4GrA/lVHVZtIs
	qfjNZLfRNHlkwZnkYU+XqC+aSdhK6bpNAcqxw8m5gfsdCWQrTyALHGsKPTAhQSgqOtGk+KEaTek
	Ib6OgBVxuqw==
X-Received: by 2002:a05:7022:3c89:b0:164:4e36:f956 with SMTP id
 a92af1059eb24-16a5dcf688emr13638519c88.16.1791884325804; Tue, 13 Oct 2026
 02:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
In-Reply-To: <20261012134159.912183-2-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 13 Oct 2026 11:38:08 +0200
X-Gm-Features: AclHuK_RWeXl8fcFHu9JpahURaqcaQuQAyqWtIrLMC7fvirHYIMspTeFsZ9obG8
Message-ID: <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
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

> +        // SAFETY: `probe_console` has the signature expected by the `co=
nsole` tracepoint. Being
> +        // part of the kernel image, it and `OBSERVED` outlive the regis=
tration, so there is no
> +        // need to synchronize with in-flight probes after unregistering=
.
> +        to_result(unsafe {
> +            bindings::tracepoint_probe_register(
> +                &raw mut bindings::__tracepoint_console,
> +                probe_console as *mut c_void,
> +                ptr::null_mut(),
> +            )
> +        })?;
> +        let _unregister =3D ScopeGuard::new(|| {
> +            // SAFETY: The probe was registered above.
> +            unsafe {
> +                bindings::tracepoint_probe_unregister(
> +                    &raw mut bindings::__tracepoint_console,
> +                    probe_console as *mut c_void,
> +                    ptr::null_mut(),
> +                );
> +            }
> +        });
> +
> +        let worker =3D ctx.clone();
> +        workqueue::system_unbound().try_spawn(GFP_KERNEL, move || {

I ran this locally and got the following warning:

[  623.232012] workqueue: work func
_RNvXsb_NtCskctMpSfuwL9_6kernel9workqueueINtNtCs1G77UTwpz6o_4core3pin3PinIN=
tNtNtB7_5alloc4kbox3BoxINtB5_11ClosureWorkNCNvNtNtB7_10kcsan_test5tests9dat=
a_races_0ENtNtB1d_9allocator7KmallocEEINtB5_15WorkItemPointerKy0_E3runB7_
enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Do we need to use a different workqueue?


> +            while !worker.stop.load(Relaxed) {
> +                racy_inc();
> +            }
> +            worker.done.complete_all();
> +        })?;
> +
> +        let start =3D Instant::<Monotonic>::now();
> +        while !OBSERVED.load(Relaxed) && start.elapsed() < Delta::from_s=
ecs(10) {
> +            racy_inc();
> +        }
> +
> +        ctx.stop.store(true, Relaxed);
> +        ctx.done.wait_for_completion();
> +        drop(_unregister);
> +
> +        assert!(OBSERVED.load(Relaxed));
> +        Ok(())
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 4d5c96ddc49c..009efda9e7a4 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -94,6 +94,8 @@
>  pub mod iov;
>  pub mod irq;
>  pub mod jump_label;
> +#[cfg(CONFIG_RUST_KCSAN_KUNIT_TEST)]
> +mod kcsan_test;
>  #[cfg(CONFIG_KUNIT)]
>  pub mod kunit;
>  pub mod list;
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
