Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794422911;
	b=5SLDFTUBnmm9POmSBlN9rNCL4kizgXPI9+KxPeRiBOMaw2VKTLICRE6IEk6Hp/rAnAK7
	 R15v5nXv/Qgij7BN98WvLhMJVY92YNvFQ9XHRQDpX4jV8hwiwcALsAUZHE780YG4fR0Cp
	 SZiWMI+7AiwasYjZB1FavlsRc8JY3psj07/ej2qbM+j5kqGJi5EZELwcVCqeT7wuoZZQ7
	 9cIgVH19Cans6ekL3dgj5itjKp2+gx5CEWJMwHj64p3ptPG6oEnx/hP69tKXI1u0RCJ1F
	 NPUq1rn/1wnkpfoVdC5f2WLf7xdWXWM0Yhwrls803yu9p6K9vN/J4kTM/gc3BZPPjBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
	b=2nCaNwcTGiYAIFAtE4j80cWBAD8VdIDBaiqAyUMu36UGDG6GkNJEC0MQ7quRangvHWlN
	 1sYkIfQuCaZ9bIWFWnxDBH+oFsNHv11/bZTbpYBSRANWLOQSHjAqO5M37cVao27e4Mmoi
	 4tAO07EuAu5NxyoD3NmDHfpLslIzUQHDSotZMC3T3AixYfak68+Ujbuf8ZIx/qHk7VAjo
	 quGkuCNlTt4HJw7thrWodKiDrB4VIVoGl5nTtS23ZerualpKFmdnzZmFBFuw8qq+l7K+d
	 NVRqEm1frA6NzfBppPzL1C4Rfm4IsrDr3SaYfwiSXL/wdJ/PQE4+T8o09gp+W81ITrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQvGP9hf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D386606A882
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 18:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D386606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQvGP9hf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e90071735so138604eec.0
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 10:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794422910; cv=none;
        d=google.com; s=arc-20260327;
        b=b4zWzI0hAj1iKTms/XDmK0XChk7r1VpvvC+WIGF/HvaVZBlitAnt6G0VALzAHDAZkP
         rwxlZhpb6R3YmrrDNvOSJiO72S8l5HsWJEBYDAfk0o3bX9Nt5gT/cn0fJgt/JdwTwlFZ
         3sCu2UXg9VhAOpXqv+W0K/n6wqnh76nS0Fu256WI0VGawnDo1KZuglCaA6nflyWuSMcz
         hVT77XBf0xdrcGBXhBuhY5FgsY8Xfr8sAS2fVe0zJwMCwyzD5khv3nxuRt4m1h9sP0gE
         w99CiokQDMkjxFF+Z7GUvY1wXm5t3iOdFLGLu24oMKQsb8aEPRGSlYSMwcZTThXNPN8G
         SWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        fh=gsdjIv2a4c+bljQsZOEpsOZQ+0Ek8yDYXihsPZISww4=;
        b=lhoFpIpXlFp8oL6Jcz/CL3Do9jpswo9L2CuPEC1gjIrk93dXjQtD0xMil9QD/tmUld
         r7bpIBqB/6ZA7AYeKBf6ApY4LymuaK1pc0V6K0NcpCnmtmALrq3FmiuLHrrXVlz3mLDB
         0IxExye5E4xoVZrvHNUmHe3F+/7+P5jmzoo0/Wfozed9aAGjXDbODB91qnTCqvECQfOW
         6YxCUBam+NVetokLhKqG7FC6rC+jat4qsbkAK0Z2T2FVkV0MrQd/Vj6DiW1wOPMRT0S8
         CkPYcyvXSUm4hjlfBu519wNHwpz7OPDWURirGxt60j1k2416jcpkphgacUjA0cR2zNSz
         TmXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794422910; x=1795027710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        b=PQvGP9hfxyl7gyWzaV5E6lfNLMerBHS1TFQeqNTFlBRgy1u2mHjTPPrcCd91suTPNw
         q6Uaf4dfQ10dB87Jez9cMUGPN2gIfnP8MYt4fvSB02tD98zGsncssuArw8oLO8qQtcLp
         44smcorCOoOla3ApsviUxCt5qQlre1HcPD1CCXW1rVJH/qsAwOgwDnYiSivdmVp0xx7L
         wBCpz75zey138eMCPfYNHtAFbF55MWh3FJ9DeyUoLw64eufFG/QR3X/fHQG3aoNdfuHi
         X5IJjIOOyJP1lrz7jfv+HjWLvw4QJiYpCd+oQQEZvYr1Ngdvdq6KHAniGxemBtyICNhx
         xxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422910; x=1795027710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        b=d7cQZzklgtaVXsmSXkdHIBTEAinhqjw26TKIp/Yyf5PI8ioGT7KM8Q5mUAaVIMpohq
         VwfCI62Rz0Euv2X2CHaZS3D068YzrtoJvqqT1gid/ph2eD2XkfmMY6QJvfL91XuyEM6t
         WRseNTYMmF4iPp3H2Ra4rB2QzOFe6UHfcJZfcrqaPFk+k6oGyIAWeteCq20/8RGEHXm9
         S4RWqsB71/8VyLwC61LhrBFYFkKSa3lR4erTIdM0STrAZjpSgoiRv/nCYxIc8fzjgiDG
         vamuY6Y2luu65iY8wkzl0fOYgci/HKcJpBYj4iCn9HgxBA3AqyjpL7xWqHIASmxYh1ND
         Rw+Q==
X-Forwarded-Encrypted: i=1; AL+hErHAlTygeh7c2xQcEMrnKtCkCugpxyp6+jZEI9FoZZ06fhF2ZBJIBUv5vZbDc+j44zMh3gi4idTS1kqaHbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HkBqUKXOSxzTnyCUX5opEk/9YKESbKY71CTQfXVkcPaXc5+Gi
	3n+BkkANFTST/rQ27N+kSg15WNQ3tbIdsQhDi+xRvPYomWrPQWsbxduS+4zxoG8XGHOdGRlwAM4
	bFAbFQD8BiuZQokocXuh48WKyq5+c5Ww=
X-Gm-Gg: AYBFou24NEr3sr9Ua9yHxxZQ8QmOThFYh6AQtYsG7NzosCf2m538+ulkVVStsBDTiDa
	UfApYacxH24nO/5xKMJ9ONiJZn815C+v43BkVrpQC+0xGZd752709XEcIbCLh7Ww3g5cxBFD+Vu
	RbF3YyCvd8IwV7Q06UWdHhMUEteyut4u+ZCPw6D8cXlRFUaciEnt/Y25i16mohNw1uPgnNCnTHL
	WHidBYDGu9MB5apd6hJBQ4iYeuCh+4gKFploFlqPx0reY5Y2ocsf68GRiQN9iGIsWqBh2m3JxQu
	F16G+O61A76nkYcLLrpHc6fMCKT7zSmxKNntfF9AoaetHyaiXQJaX9d9UMsW8uMttGALYy6vCPx
	+jyTod3e8I1WlRXLzeOZR6+GzFlUnA8BJDdP4XAQkKl0QdjaWe3ju4Ml8fa3td4pIJmRfCEC4+h
	aExnHWtHBXrei9O8txnhCU8W1XxtGAeDZDKOPAiDJHRwRE/Ny2nYQOFN3hhC5heDSXdg80NzwVe
	/7lQVcSTTGJ054yJI3Dj8/tltWDJjbwclA=
X-Received: by 2002:a05:693c:26c5:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-3768460b9dbmr4877420eec.1.1794422910327; Wed, 11 Nov 2026
 10:48:30 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031030807.4101384-1-jenhaochen@google.com>
In-Reply-To: <20261031030807.4101384-1-jenhaochen@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Nov 2026 19:48:17 +0100
X-Gm-Features: AclHuK9PxmaMrHpe5K4M3MU9aV3mfSN5iKc2YgWLgeAIQXIiJu5uOX8RyqAehXg
Message-ID: <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
To: Jenhao Chen <jenhaochen@google.com>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:08=E2=80=AFAM Jenhao Chen <jenhaochen@google.com>=
 wrote:
>
> Factor out _autofdo_c_flags in scripts/Makefile.lib (preserving per-file
> and per-directory AUTOFDO_PROFILE opt-outs) and pass it to the
> post-llvm-link $(CC) invocation in scripts/Makefile.build and
> rust/Makefile.

This sounds reasonable, but my LLM spotted that Clang will run
`AddDiscriminatorsPass`  again, i.e. on the optimized bitcode that
`rustc` produced. So the profile ends up indexed by Clang's renumbered
discriminators, and then the build that uses the profile will not find
a match for some code (depending on inlining decisions), i.e. that
part of the profile is silently dropped.

It proposes `-mllvm -no-discriminators` in
`CC_FLAGS_RUST_INLINE_HELPERS` so that Clang doesn't add them, i.e.
using the `rustc` ones.

Rong, Han: is that expected?

Cheers,
Miguel
