Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02B73E1204
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162663; cv=none; b=VToCgfwM2cm2j2L1IQ7BhUKeCDcr9p/5Sz9PbrRqtxeTS0Am1nR5N0D68GnoHi5DJW/Rqr0xH8errFMjO+xj+LOnnhXPxPbj+VRD4EvkJe4fWDOtjcwpZDtGX/FqDIzQPr/g3Cl7nTxZzqXfIqub8jqjeNq5jux6gW02vbuAneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162663; c=relaxed/simple;
	bh=I7jLzE1cBdts1X0xmfx9VTl+7+WfCapkmOpC7nnZEXw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mzbj/aXepL7Aja0b5PnUX7wAo2mzD9h0rGEF9GBL5iK8QhSQqj92AezbwqjwAY92xUAH4ZNi/nNAFW3rMrbhvkAMrs3dW6MTUd8cyAS/P87c0UCwg62dcLq89Pro7T+UO3N1RGUwma0eDw2rKzf54y7TayCwYCsmthgG1eENee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTPoxR8D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTPoxR8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD5C1F000C4;
	Fri, 16 Oct 2026 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162662;
	bh=z4d/SincIWB1TA8LxF3ZeEOF5lnBOtao6ybRTiPoReY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTPoxR8Dey6xmompp9Sy5DIYzd7ZnnNfPotd86Q8A6ADSXTynD+S14+ZNRQYSaqOt
	 Fd9fAqhXc19r+ve5Cx0rJ4zyKdfgGd0JrhU2TdQFZkmNjzXHWvHn90hpbGfMJO6yaJ
	 pTN3t8to0TLSPWdvoxvatgzgox+drOdrcico1N1D/+SED2fbSwYjTeBMQrPrgSPJB/
	 2iKLqtuszdTgmxnjg+dzzoA6FOucIprOz6eWKZmXWVIcYgYJAYgOtrHzKAe55M2j5G
	 jmA1XcozOXqtLEWN9lM7T3yVGnU0qsWEm+jYwc0ZxG5ZIVR9ac9nId5JZ0cv9woTh1
	 AaP9X4EZrI/mA==
Message-ID: <sashiko-outbox-174506@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] rust: kcsan: add KUnit test for data race
 detection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marco Elver" <elver@google.com>
Cc: "Alexander Potapenko" <glider@google.com>, "Boqun Feng" <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, "Dmitry
 Vyukov" <dvyukov@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, =?utf-8?b?Qmo=?=
 =?utf-8?b?w7ZybiBSb3kgQmFyb24=?= <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, =?utf-8?b?T251ciDDlnprYW4=?= <work@onurozkan.dev>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Lorenzo
 Stoakes" <ljs@kernel.org>, "Yury Norov" <ynorov@nvidia.com>, "David Gow" <david@davidgow.net>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Alvin Sun" <alvin.sun@linux.dev>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, "Petr Mladek" <pmladek@suse.com>, linux-kbuild@vger.kernel.org
In-Reply-To: <20261015145714.3327543-2-elver@google.com>
References: <20261015145714.3327543-1-elver@google.com>
 <20261015145714.3327543-2-elver@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:57:40 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] kunit: rust: KCSAN test stalls and spuriously fails on UP/PREEMPT_=
NONE
--

commit 8335c11e7a640669968685ad30c1312fe11f4a68
Author: Marco Elver <elver@google.com>

rust: kcsan: add KUnit test for data race detection

Add a minimal KUnit test that checks that KCSAN detects data races in
Rust code: two threads concurrently increment a shared counter without
synchronization, and a probe on the console tracepoint waits for the
KCSAN report.

> diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
> index 3bf4194f28c7c..26bcd91a48211 100644
> --- a/rust/kernel/Kconfig.test
> +++ b/rust/kernel/Kconfig.test
> @@ -104,4 +104,15 @@ config RUST_TIME_KUNIT_TEST
> =20
>  	  If unsure, say N.
> =20
> +config RUST_KCSAN_KUNIT_TEST
> +	bool "KUnit test for KCSAN instrumentation of Rust code" if !KUNIT_ALL_=
TESTS
> +	depends on KCSAN && HAVE_KCSAN_RUSTC && TRACEPOINTS

[Severity: High]
Should the RUST_KCSAN_KUNIT_TEST configuration in rust/kernel/Kconfig.test
include a depends on SMP requirement?

The help text notes that the test requires at least 2 CPUs to reliably
observe a data race. Without an SMP dependency, the test can be built
and may spuriously fail on UP configurations.

> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables a KUnit test checking that KCSAN detects data
> +	  races in Rust code. The test needs at least 2 CPUs to reliably
> +	  observe a data race.
> +
> +	  If unsure, say N.
> +
>  endif

> diff --git a/rust/kernel/kcsan_test.rs b/rust/kernel/kcsan_test.rs
> new file mode 100644
> index 0000000000000..24810cf2970a0
> --- /dev/null
> +++ b/rust/kernel/kcsan_test.rs
[ ... ]
> +    #[test]
> +    fn data_race() -> Result {
[ ... ]
> +        let worker =3D ctx.clone();
> +        workqueue::system_unbound().try_spawn(GFP_KERNEL, move || {
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

[Severity: High]
Could this loop in data_race() lead to a CPU stall or spurious test failure
on uniprocessor systems or when PREEMPT_NONE is set?

The main thread spins tightly in kernel mode for up to 10 seconds without
yielding. If the worker thread is scheduled on the same CPU, it is prevented
from executing.

After 10 seconds, the main thread exits the spin loop, sets the stop flag,
and waits for completion. The worker finally runs, sees the stop flag
immediately, and exits without performing any concurrent increments. The
assert!(OBSERVED.load(Relaxed)) assertion will then spuriously fail.

Would it make sense to yield the CPU during this loop, for example, using
cond_resched()?

> +
> +        ctx.stop.store(true, Relaxed);
> +        ctx.done.wait_for_completion();
> +        drop(_unregister);
> +
> +        assert!(OBSERVED.load(Relaxed));
> +        Ok(())
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015145714.3327=
543-1-elver@google.com?part=3D2
