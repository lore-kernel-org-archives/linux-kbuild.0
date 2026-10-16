Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F5D47CC7F
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165347; cv=pass; b=LutDWXRSS13XuMOKEokRKTmocuIm58VfjrXG4+1BchIbq0hq592TPcXSvdo++Up4/e12cRJuMTOxEHlag6gkVtT8jPlss5AnZdpneAQh2U+b+HaV2hzqnNg+z2bqoFdoXHKTp/nHQEt35AO+NolFoLAqG5T0pD/Q4fscPduj5J4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165347; c=relaxed/simple;
	bh=wEx/7wCNfeHOSauzGB1wU8Hea+BIBDPfoLRDPVD74RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huDHbKlttWY7MmWlgtstfsGy3vXnvnpA5seBxEyhX1816TFh2WOMtUeLJOseU2lI7iwSP9gJNoS1MPyPTf+qLBawTlQ5f5ml0zEbAI77XpPQe10cN7nSqnW6rxuTOASNO4DuztfoWS9M/1Ko6dUaPc9LD7qRAiccweTahjsScbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gzQ/X3Sf; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gzQ/X3Sf"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b6dad2382so45953eec.0
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 08:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792165345; cv=none;
        d=google.com; s=arc-20260327;
        b=SOVXqOsMCoApbKk9fNeuexhqW7rcb7g6QXRhnEllGzNWrNHx6DFjWRK7LHfdPttVyR
         CQOEJ863MBIej30YPePjhYtcbmSkbCa95q1rc3c25fvE4oFwcpKB1xxHqcU5D2kfXJql
         3vzQ0bIgIrJXkgvVY/Mds7AreEsd0xzVQSRb9wM2AikOkbzYnXv1r4jMsTH+zBqo5m98
         aEzy2STl3RCaAPRvo+XlC+DMe06yk8SGnSkmTPIt33wOCiOEW4whLEu6o85qQ9c8zitI
         1bgAXOnooN2ctXd4jeRnHMQ2XkCYF7hpKgvr/qmbd/79HVBBWub5rbY20RUfKPes/rwJ
         +HlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/nYhRj4X6c1IBw/Jup8hasTqp4A+rlYmbM569hgNCOk=;
        fh=Tkmb1GGZCt83gcBywhvOsoD2vt2radYZWmw6xK2lvHE=;
        b=ilHROk4U/wBGs1k5DnvVAVycDuZcCrTT8rLF5o3HeXATquW3halvTKeNWPPedgI2qL
         3HLFCPhTav3rN/AZoyv7OgNZP6pWIgQ1+9sHvglFpqvgpWg8CrSmGqwFPHolKehCKs/L
         E58SDHEdo+J9yqaQLpqXrvRsHoTNI3TgGvcssHkR2I0ZbmStvmYm8OyCL//tAAyxdfyl
         wUw5Hd3iIwObLxR/FVqAiheKRIakh1VaXCrd2qLgYP10bE4WzOrCUHsxcIX6odBYrxxG
         cILHUWeapozTIP6iPZT5E8iPo5IFTAz7eK49rS4YWo40GIanKk67cMJJFP3SvVK9VBYV
         d39w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792165345; x=1792770145; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nYhRj4X6c1IBw/Jup8hasTqp4A+rlYmbM569hgNCOk=;
        b=gzQ/X3SfCmSfiYwmtM7AwwQfrcQ7fmCF3EYSm7DBt5ydbzPAbkrVzVeKjCGs8ApPUE
         OXC1XZrrWWwKwRqw2BlZBIIeasvaXWOiuKIZ4EX9/GIuqUeT3Eu6FATFLnIYyGLwgry9
         RnRfxSqjtHiy6r7K43r3NEyVsbnSJ8jxQLzMlnB130v9sbqcgYLyKBN3CxjzwkqJuK42
         sAbT5yFIZUyrO9c4aYgZjTTtnYOEy9+E+0RpoHeF6ycJ2Ql/s1fK0nkDWoDQ17/44qwc
         MHf7fiuJ4p38CJP3UWXtBjrftVFqcnb/n2zlVbfJxsCqLT3rOUS3A0tlMDvghXrZnFur
         9pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165345; x=1792770145;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/nYhRj4X6c1IBw/Jup8hasTqp4A+rlYmbM569hgNCOk=;
        b=N1ve3DYjP8n113yFfzzBFeQRm6gcedlm4PSJUoYcTVKaGevTLmXiyikn5CR1oEV9dF
         ZJOU8OZNCnQ76NpMRZUMRFeEowkGdJS67JgeiYcvYkPMHHTkHDEIuKHnUpAaQDwPiTIp
         utfOyAJOtu321xfZnV1OOQkMOWSCa7CP9nTBOekogCh1wf7TQ/ndaF5eoENwmvVq42AK
         QFUf7O53LsRan2TfQPejvrxm/5++2DsRQ0clhysuTc1HRlDsJYzL6p1E6zDYNU9H/NhC
         VR6xv3V3B7kk47cBaAkmn05HgqhfKm0iFytHJPnnGMU7b3O7izrG9AY1UItyFNRcrnXP
         p2Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxpMDONKz6CZdU013eDdKHk+hcjsZep5kN1kPOqIHyN7wUI7v5V1tjCGhZ8hQcsCeSDX8qSSNdAxwZoPOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOh08NB+fFXcPncWoOmVRhn1H5Xrg2pZBvkzVnvumP0HakiXXk
	4VD1ieCeMOxELdCh1h6r1sSfHor+FwZxi3iCtoUlImSP1P8I47e5OaAyAdyWGsxn3P9NjaTA+1X
	X74h/C79+BAQGblzumElI/oAefoKVD/VcaeO7faHN
X-Gm-Gg: AYBFou2O97gTG806JDx7weO0cK+hqR8q+z+/rxwN3DmcxCr87Khj8GB4TNigicpc6bH
	pgY4Qw4GMkAPIgFH2Ji+gZzVx+ZMwySvE91zPGenglhqfUVd8/l+Ilj9V1iGd6WTm2VxfDhm6zQ
	vJct6ZR7Ak6o5DGgso7Ej75EMrIf1SRJlqkWRDZ5tnkSplxxVX7iyjegYQL1bWSFvkNaCMxzj/2
	UGxtW9Q6WDysj4VCkUqItDvAu1FxHXqWW0NaHaLVhfIr8wovsr3jnOGyq5eYHiT/ilNZ1Nb4GCk
	EyG3xW8hPzwM/ohh/LYu3glrum6Bc0pZcq/TEou42r6gzCSiK7XJ19WDf32zMG4Yzq4p5uwgXyu
	+Z108D84B+q0=
X-Received: by 2002:a05:701b:2610:b0:143:3da5:cada with SMTP id
 a92af1059eb24-185152b6b6bmr306225c88.37.1792165343661; Fri, 16 Oct 2026
 08:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <20261015145714.3327543-2-elver@google.com>
 <sashiko-outbox-174506@kernel.org>
In-Reply-To: <sashiko-outbox-174506@kernel.org>
From: Marco Elver <elver@google.com>
Date: Fri, 16 Oct 2026 17:41:46 +0200
X-Gm-Features: AclHuK8ATsc8VKpMtjbzGvE2xXlZuEy39NIy8wK_ev4B7i6RuKhKEu9q8cC6eGc
Message-ID: <CANpmjNMfEXXz+PBd4rquzkNapFs3CGygdz_e_OmjJOtOnZZ5Jg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: kcsan: add KUnit test for data race detection
To: sashiko-reviews@lists.linux.dev
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sigh, I'm repeating myself against a bot:
https://lore.kernel.org/all/CANpmjNPDKZKCWc0ubCGATLE05gwefwpR=n4D6E0FKAvsi9DCVw@mail.gmail.com/

On Fri, 16 Oct 2026 at 16:57, sashiko-bot via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kunit: rust: KCSAN test stalls and spuriously fails on UP/PREEMPT_NONE
> --
>
> commit 8335c11e7a640669968685ad30c1312fe11f4a68
> Author: Marco Elver <elver@google.com>
>
> rust: kcsan: add KUnit test for data race detection
>
> Add a minimal KUnit test that checks that KCSAN detects data races in
> Rust code: two threads concurrently increment a shared counter without
> synchronization, and a probe on the console tracepoint waits for the
> KCSAN report.
>
> > diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
> > index 3bf4194f28c7c..26bcd91a48211 100644
> > --- a/rust/kernel/Kconfig.test
> > +++ b/rust/kernel/Kconfig.test
> > @@ -104,4 +104,15 @@ config RUST_TIME_KUNIT_TEST
> >
> >         If unsure, say N.
> >
> > +config RUST_KCSAN_KUNIT_TEST
> > +     bool "KUnit test for KCSAN instrumentation of Rust code" if !KUNIT_ALL_TESTS
> > +     depends on KCSAN && HAVE_KCSAN_RUSTC && TRACEPOINTS
>
> [Severity: High]
> Should the RUST_KCSAN_KUNIT_TEST configuration in rust/kernel/Kconfig.test
> include a depends on SMP requirement?
>
> The help text notes that the test requires at least 2 CPUs to reliably
> observe a data race. Without an SMP dependency, the test can be built
> and may spuriously fail on UP configurations.

That's the point - if someone configures KCSAN and runs it on a system
where we won't detect any data races, this test is the canary in the
coalmine. The test will fail loudly and whoever configured their
system (or VM) will know something is off. That's a good thing.

> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       This option enables a KUnit test checking that KCSAN detects data
> > +       races in Rust code. The test needs at least 2 CPUs to reliably
> > +       observe a data race.
> > +
> > +       If unsure, say N.
> > +
> >  endif
>
> > diff --git a/rust/kernel/kcsan_test.rs b/rust/kernel/kcsan_test.rs
> > new file mode 100644
> > index 0000000000000..24810cf2970a0
> > --- /dev/null
> > +++ b/rust/kernel/kcsan_test.rs
> [ ... ]
> > +    #[test]
> > +    fn data_race() -> Result {
> [ ... ]
> > +        let worker = ctx.clone();
> > +        workqueue::system_unbound().try_spawn(GFP_KERNEL, move || {
> > +            while !worker.stop.load(Relaxed) {
> > +                racy_inc();
> > +            }
> > +            worker.done.complete_all();
> > +        })?;
> > +
> > +        let start = Instant::<Monotonic>::now();
> > +        while !OBSERVED.load(Relaxed) && start.elapsed() < Delta::from_secs(10) {
> > +            racy_inc();
> > +        }
>
> [Severity: High]
> Could this loop in data_race() lead to a CPU stall or spurious test failure
> on uniprocessor systems or when PREEMPT_NONE is set?
>
> The main thread spins tightly in kernel mode for up to 10 seconds without
> yielding. If the worker thread is scheduled on the same CPU, it is prevented
> from executing.
>
> After 10 seconds, the main thread exits the spin loop, sets the stop flag,
> and waits for completion. The worker finally runs, sees the stop flag
> immediately, and exits without performing any concurrent increments. The
> assert!(OBSERVED.load(Relaxed)) assertion will then spuriously fail.
>
> Would it make sense to yield the CPU during this loop, for example, using
> cond_resched()?

Where KCSAN works correctly, the data race is detected within
milliseconds. Adding cond_resched() may in fact lead to the data race
being detected much slower in the common case. If the worker is
scheduled on the same CPU, the system is misconfigured (likely UP) and
I want to see a test failure.
