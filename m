Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793295143;
	b=1sdjAAIGa/ZfyVnNcVj9uhsSU1BDkE8CMs/67m6qaU0u+IT/cqjhF3NMvzg8GE3Jl0RR
	 n+GqQCVCmGA09TajzqKDVRxH7T5j3UTa5PoyhiOOq7pwVsn/cqnc6PUHjdfT3Zv4rd2jB
	 WacD3T8IzQaBtabuNp9YcTEukL4VTY+1PtuZvZURmVA973CDeDJ8d7zE/tLEaqC/qBK2a
	 FIUVhZBXz9K9qxlvOH78mwzk2qd1mWX8QmUSdHxUQ0uzL/TDXJKWF1OfsJQYfpHLp3mry
	 1Fv11U5GwGMBePOae1+Fa8FprrawJyEQxRfFds/vCIOsPQPY5bNgT7P2IPclnA1DzBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
	b=duWds38mukFqSiDo9UPtZzM2v+Xc8GeX2YHqM+Bw6yWYpZwBtM6CCOI88Ycd+o2To2wF
	 2vi1JPV2lniND7XYG15tJsMvHaPzYA7xel6h22sFI8drYHxPU4fxL/FGocrNzT8vbgIIV
	 VrRz/KstVCbPFDcPlQqBh9a7GxCzy27lqZe0M53IylYHLt3NCosHBb0Qs+j+KMDerAxZ5
	 wirQJZQCl0MXeDW35WCKf0Tfi7XhyNq9j6eeQrbJrv8KWeI3Cgvp1UrP2rmvcRiiBmxO2
	 7djypY990SrILmtHS36epQAT+inZdTdgA2rTqK+t/A9KvhjuV8o44xnVemJTqB/pkHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sn8ZaqyK;
	arc=fail smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027F606A31F
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 17:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D027F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sn8ZaqyK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369fc2e984fso233684eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 10:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793295142; cv=none;
        d=google.com; s=arc-20260327;
        b=KuNIl7Swjzh5D52ZIRCpTSuIgNYNXaguJjTMxaaczoN4W68ZQLtz4PhhVw9mrEDpDv
         P+DLAJZImgRBDa3yFlRSwbMDrLbRdIF8iSqHSnqg4RGywsZsjPQU7Ymcm+DxPyUdxZNV
         7cIPKSTF+Y+PmA15uq7Dv1Eo898I9HQL0bUJEN+ocZd3ifzhdyaOWJbrtOJqKX2WdNgr
         TZuWCAmK2nMYJWoMRAcEivuImKSVYGaw11PbXn5FKVA2KnXxJNF6QTd1nGnspelUTSlG
         rFH2CSGbTiIC4m50RsRX6yG2WDqVy4Hjh/4+s9P4CPrmLnY9gRZL/VHmIuH5i0DGdQQ2
         JoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
        fh=WGn9IFuKE8y4VKvpdh+v172rEj4Y9NZZw+/I+wDooZk=;
        b=Gdou/oA8ndewbG+eptCFqBcIcyCJzNZC+HllobRC656hipo8SYjsGaHHmohqtYRhCi
         yaaMV8/iMFJHxT7LdMRdAsMvuAKSws33LIM+dXQ0YnTkQlwWVrAw8bqoAlXNGSsIiMn0
         0lt+0agVW8WY7TmycwBxmBpAraSSWOMw1xKvoHY8DRweN/2AFVMRzR3Kr+VrvNl5Edof
         nbviS38mh5cW9Bu2dtbH8mwZ3TTunDjhNjwehEDFyu07uAFYsT+DWxtjWgrkOEtmkHbr
         ub6eY0KsjElxOAhqaamx49tOp+6zh5o/3SY5TO8bb00Qcg9pizTyaVghMoXy83/ZgrX0
         C1iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295142; x=1793899942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
        b=Sn8ZaqyKa9l3To+a5GYvvAD0uAR4LJpfMXeTB71mq8b5e1Cu/L8u9HO8Zj4J0B5nci
         ikPSN1UBdudd69fky6nx+fn2zpQNEKKb8ndM85agvMeZX1huHviwXrVWGf3dK98oNA2n
         kPm3sFQi0kDHKs5E2U8HTKnHQfybkyFStMtmeFjCEYXW2mEF15JtSDG+5XlGpHWRHj6s
         p7K5MntJv9WyU0bgxVoYY7vLJvNAw48cDUARB5+Bim5Zy0yKYy1Tv3NY6ydDdUGsXC0O
         83MJ9sAETqsv7YSQ9eLhf5V4kUe2K4/oqFg8hHLQtP7JGEDhl74TjhF3bkIgdYuBHeUM
         yhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295142; x=1793899942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
        b=y1dRkx9pesR/JwOT7Ja4wiXtfMCR2dimN3IpOtnWohBm30g5ZvRSxrDdBVo8qs9Ko7
         XYMjjyGZL37FP2/uOjPkAsCk4ffOMAHxA7Ek/V28k5iKTXjtVsy5CYMM66EpMelgx8WC
         T19gzZQ7z/77UW0C2rRUQyMkYjG1IrGPpi8hu042X7djwcGh92F8h0fhrYXh4Ce9+j5I
         7Vc0RcVTaJtNroV5H/ly9o3nX/kGSsN08c2wGv4zPbOxxRh9JyoOlIiVuizJqW7a3hM7
         OzVBPCwI2HRF31tzUwXmDtYuYSDRc++8gww//3mC7zmj3fCDaI+WRpWks0Ek6MZS0GXH
         gt4A==
X-Forwarded-Encrypted: i=1; AKwUvBxTfRVG6tK4UGkkcSe9yh8cXkD/F7+zzzkj7KdmDao+L3VvWn99Jb7SPb8bj6wdDFcaHpMNAaNSXHWjGKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeonoZOvZW7cTH3Bh5Y6MWQeTbmUfd42oHFDVV4A7u4RMZBvAz
	AAxrd54bVhwYIOxfAWuHXG1QE5PAnS0bExfLeKJEelTWaqV+QWVVuYILjFGPNvxIsmN1WgdME1D
	VDFqecHIw24tuGLDbuNkaw+Kw35ZDxbk=
X-Gm-Gg: AYBFou3BdQO5tZ97VCd7M3xzTT5/mAZQVBV92NUdk2IIX0ZogdvGSTchtuXtnfqabA0
	zkvhq62utz/Au2TDS4UtAaWpNsxMxEDvr2nLOZIJKFtO7kQ4/8K5udOQQpzKJI0bM1OuBrgEk3J
	+Jk+M1PJMFxC5Kacxc5IvvStmeRD9aztYpwrvDkIniHs+xG6n5LopJTn7AWeC3TOrggAGbrRPJ0
	O8GVGGITXFArCfDI6EGSL3HimxBxZciMSr8hArEo/TSN+CfmLaJKqa+9edbsE02xkTpY4EvLvfx
	NiB2J8jq4nT3Q233GaNFiKpTTFwpeisn5O1NpH8BVoVqtrlGjG/lNTJYwvSAPH9+wbB0UJcPtXk
	9GkVa4VY76T70Ll3FU+kWxR8/OBKD9LB+qLRxiTxXy7aiekPQDkpK2BqCP2Bi79iwtt6PUXu6j+
	xtnPwT8Z70wOdizdU4YrdSvUf5m0nq2tkeOOfBzrjUJM7Lzd9Rgqrntu5rEMTPSkULcsRJpeFpm
	T08YsQq50pHian9U8HFuYLUJ3t4CyroEOHuHU5996UnC7aDdcxG4HLwsg==
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr139643eec.2.1793295141770; Thu, 29 Oct 2026
 10:32:21 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com>
In-Reply-To: <20261029162958.3224280-1-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 18:32:09 +0100
X-Gm-Features: AclHuK-0mxI3LKAZpnOHH-Drrv94DNRirn4x7gfXbdMbpDKW_doTTtE6JJd6tT0
Message-ID: <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/3] tools: Add Rust library build infrastructure
 and prefer zlib-rs
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:30=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> 1. **tools build: Add Rust library build infrastructure and zlib-rs featu=
re test**:
>    - Adds `tools/build/Makefile.rust` with helpers to locate Cargo crate
>      sources in distro (`/usr/share/cargo/registry`) or local Cargo
>      registries (`CARGO_HOME` / `~/.cargo`), map `.rlib` prerequisites to

When we were discussing whether to vendor crates for the normal build
or whether to fetch them locally from the registry a couple years ago,
we discussed approaches like this one, i.e. picking a version from the
registry by folder name etc.

But that doesn't work too well. For instance, the graph of
dependencies may change, there may be several versions available (and
the highest may not be the proper one to pick), there may be different
major versions available (i.e. not backwards compatible), they may
change the build scripts, etc. Even picking the highest major wouldn't
always be correct, from what I recall.

I also asked a few distributions how they felt about it, and they
indeed said that it wasn't a great idea without querying properly the
registry.

So one should really ask Cargo for the right information about the
local registry (i.e. offline). It has been a while, so Cargo (or maybe
`pkg-config` or whatever) may have better support for querying it
nowadays too -- I would suggest checking that first (e.g. `cargo
metadata`).

I think depending on Cargo for this, especially nowadays and for
`tools/`, should be fine (we were considering even back then and for
the normal build).

By the way, checking Cargo's cache sounds very strange to me: that
means the version that gets picked is even more "uncontrolled".

I hope that helps!

[ In the end, for normal kernel crates, we decided to vendor for other
reasons, e.g. we wanted to pin the versions, to customize sometimes,
and most importantly to avoid any possible user misconfiguration that
could lead to a subtly incorrect kernel. But for `tools/` it makes way
more sense, of course. ]

Cheers,
Miguel
