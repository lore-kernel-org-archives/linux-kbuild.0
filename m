Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7EF486628
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Sep 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524315; cv=pass; b=ihGJGm+dsjkw0H0kDFE5gfwj1cABuwCoyp/L0e1OZiUrKxtyTDGI4xgvCWvRStjFJIzUY6FF9Bob5ircdbi+Lnd0KbYGWDONrSYpOzI0NEPqUDUz6lXGpTyONQg8Ur0jhgSaJlJHACQa0FSwg0Yc7OcfPcdeQLJtk6xuFXqeLFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524315; c=relaxed/simple;
	bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5YOkYBIuH79IJ80CrgrFuGrGG8TQFGTJXBdWKsOKbEvKMdps42DO+FyqiVP8sS3W11nAH4x+HwB5ssYgx2W5HilUdYI7FJ7K7QU5GanZ4tlaBo7pAz5rmN9ICh6EFlKGAn9etODHoLvHT0n1AEHZitVyIldjlxnDqas4MaMiSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMNauiri; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMNauiri"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so108942a91.3
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Sep 2026 05:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788524313; cv=none;
        d=google.com; s=arc-20260327;
        b=pzU4nBhPimJJkw30ollsn2+aaOur/+gr/KO8SWr7Y1ciccX8pO+szmsg62pnHU75Wj
         kQr+1xpnvTN+IjmzTxrl466SAuI2vT/hUgZSJiAOSD4tw5KjDYnz240tJQBsBgubs0ld
         VfBlvzX4LflfYQWvgFjxcusQUNGbv5cwkp1TP1gQ5IQc8EPhinBeiNT36QndBpvCvIFG
         wF3lr06ErVZOZq+H9+ldplrD/yVzI7ZDk4SZTEKSX7NTBuGfICnkrImi7+RPIsFUw0K/
         xsPsA4driipLShMqsK47OB+dYa7DN0g1E1hoeHofYllup1TILN8KtQM/7s2JMITRkKpp
         O1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        fh=dFPtYqjylxTBl37l/Va8lsT5AJ9tCrcxZeCLQ+KoTCw=;
        b=sUgRfxOZmOPb6UYc++k0Mu/ILLd7XtZe0UHR/V7A7KN4MruV0vJmhoKVqZjdH87QhT
         roguvBE+PWg1wuoKI1ZFb7QydUj3gm7Fh7tLBtX7NDcRamcaQzDfulrXAALTmEZFv+vN
         si8al3c6u/xWq2S4+mwD2FPG+SjpMxODr1I6weFaFbwZazzI7YbKxRlHcCAVkPbFZxtz
         KsDJ/kHg3+/i7vd3qGbWTuzofxe8LVmgG+XR4QEqMTbRbeM03ZBvQwWDlYoz0O175zAX
         njwwk9Vxv/H7asgCgpDt+sXVjlU4pOdYjeMkBQM+ET5LKah07fX2BY3jhS5QHbMy/11+
         3Gjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524313; x=1789129113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        b=WMNauiripi6Md2Q3C3KkcuWrocOGGRafMxbYDlATW6HV68aOBusr3FL4eXVoF4vhsX
         DO7Jgfmeno5zhnwRWIgfHvrvUM+3XTG/xFulQb6uxqGbEytQPlf+GGxxMKD983IfwasK
         JZ8dP4XrZbEY8oiEzvYHXjbMf5wbZHBRAbESh+IxlSqcdT149S3ok0u273lxbuoHsZB5
         x3PySqQZGNcJbPkCUFb2OKLEFffWYo+K3UUed1DYlevwTlbFIAr1+u029uYrVRygQ4ml
         OkrtFQlxk0wYKPBPPf39rZeJx4CxE/88YUpd0GyCLyKaJbRs/qop3EUiAQiviishSpQw
         WkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524313; x=1789129113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        b=koMd6p3YlkNpWvVbdzzfytwJaQLvzZJx1viBzfqUgUmFTmfWyPCwjhL6riOOqvaskS
         UygSq16TSw7iYfQkTKDFgpfdnGR4ehC7xJtlnQPoZQcPTTBIA3W46YulVzRJV1sJ1wYM
         2UZgrTOHNqqx1z7sQWjt0KD7xz/hC2evG4CW6y43TcGcHAk0QZandDx/Lc18xpCpDh/d
         augKK+YT7UGxShWCZRdwh3l05ff7w6bZG/f0TxWW+eUxs9oFm1SRGuYagJO/6uTFLiss
         RBDp7KnM50L+Q67+8ZTVRQd9V2K+64FmlxzvT+G9+mSGRJIl1BhHWe3fndGWhbkvCWnK
         FJTw==
X-Forwarded-Encrypted: i=1; AKwUvBwMaJ7wnsqd6B8RbAc+fTk/yQaubXyE+iKkkRlZj3mhQaZdkkK/cuF+o4T3iPhHwBoRoDxwefOkgwu/Aos=@vger.kernel.org
X-Gm-Message-State: AFuF++nB4biRfClgFHqLnty84n704y4KJ4nXv5xSVlvD6x4w+U701Tr1
	AnDcbybLSkz38lCkuXYFJ3GfzG38R+yHEAMV1W6enn4iCYe9Z4fvBpOraNqVpLKImShjApq0lcN
	mMMVozblvO9XbR25D1O8N0b+lPB+cZw4=
X-Gm-Gg: AYBFou3495mrQVBNlJjJZ4TE0bnOjXwSQM2uaCT+AwIFmtDHczO/gu3pRvtDzzQ9zqP
	4VFNhvOsAgPoHJyGHbPD3sfu4gHuvIDmumZ0zlJ6XnFT4XPx/7B5gk6aM3r0ojgs3iEQlMJAL7Q
	0Q7XcgCTARcEvoVfZFiuM5e+vzlCdOlAKSKapF0zoec8VW9txdle9D+KZO3zA3gin7Qs3ljoBGe
	GQidlederh4Ha29+u/An/YKVY0dtLKWzXSVzj86n3aa88qEK8lXnz9bhY0Dm8to0bqWgPKoCibX
	vVM89jPiUj62QmjRU8nEHY1wQxzAzYAvkTh3K3bLf51HAEHmZxEgsXkGeyTCT6TPJi5XCAujsUS
	VDHwxCqnn5r/ym2Py4+MZEJjQ76OkscsrEeSF30w612JObwQ9gtSM6wXXxyaC
X-Received: by 2002:a17:90b:5404:b0:396:d28e:b52 with SMTP id
 98e67ed59e1d1-39b26229b5dmr5722108a91.3.1788524312944; Fri, 04 Sep 2026
 05:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev> <20260904-b4-arm64-callops-kcfi-v1-6-ce6687739b0c@linux.dev>
In-Reply-To: <20260904-b4-arm64-callops-kcfi-v1-6-ce6687739b0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 14:18:19 +0200
X-Gm-Features: AcwNN1W-BJa7t0_HMwRoOS4jQPgmmEa3lTrRn_StsdokzqumkRB4EleU3vHebmI
Message-ID: <CANiq72kg3Z5rB28H4Ck+EzqQgiRSSowBMe3YW6p_iNwOG_dzWA@mail.gmail.com>
Subject: Re: [PATCH RFC 6/8] arm64: ftrace: Support CALL_OPS on kernels built
 with kCFI
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ben Cressey <ben@cressey.dev>, "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:20=E2=80=AFAM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> Gate CALL_OPS under CFI on ARM64_CFI_PERMITS_CALL_OPS, which needs
> clang 21 or newer and RUST off. rustc has its own flag for the prefix
> NOPs and this patch does not pass it, so Rust functions would have no
> prefix and a different hash offset.

Why doesn't the patch pass the flag to `rustc`?

(Looking at later patches) Ah, is it because you defer it to the last patch=
?

Thanks!

Cheers,
Miguel
