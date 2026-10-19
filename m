Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447154;
	b=FRRJdzhFhDXUyaQDw9ksqOMHSogdoN0yO4xu+z9eschUcO6wQhIbFYdnbnFNUKx1UbqA
	 nrEH4lPhS6f7HXJONNN/k5u0YVB/4smmAyFkqL8VkpM/tbwPu40X4WIx9VdCbM+cgux5q
	 BQEyCiNyoGtkK6mrVxse6mE2FpFeDqEu1gXyWrPlGZzD5NxnedWKcPdl1zPjjxvNagX0x
	 tifjmV7e3+wxWQTe3iuZH1Eacij8x7myHjk2iA68cHCFDHfW2ArNpHLj9W3V9Y9kt/Qg2
	 lLpL1u2NG1d8Vkq1QySwIivaB6i2K/h0OLeDyT6SmRtllXiJFZLmqo2PuI0Ke601edg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
	b=SVYgIvA2AaUaM4Qi/iagzRScyrjqGJxCyKbxE6FtP5nH3krgO81i7QUGmE8SNjVNv/YW
	 3EmMXLfOiCmChyzlSO14WaqvkpKefvSaBo5qRgrwzTqfIfowKm3zBoIoTyhvVr78pv9l7
	 Ccy3g/2MP4JvPe1C7LecHGZKJN8VlS5K2y+Fxe2yN6L+QyhFGfL/b0QlNAfvBs5X60chh
	 GI50/iFkyXy2b+Zbu+gO4pKxRTxE3uraybOsUG2uJX29sVArjbb7A6m0DyvlCeuP3xlNT
	 VvsQ0D4juPvOrR16wOb7qABnrVRAtsRXZ3WuxO3favH4xjI6HBpsGgLB1QR85/cwjjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tuJUcM+r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE20606A319
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 21:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE20606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tuJUcM+r
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so6768948eec.1
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 14:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447153; cv=none;
        d=google.com; s=arc-20260327;
        b=EDDPaMBQPLowbP/HmOSGaNVEuYaYa6NcDZMe12dWj4q58qd2pamrVPErKDmhd5S1SM
         PyxnVC/vOb6A1o0HxdTIKpwdzE0BfzzlBUYfYpNzgYsm2T5tJ/VDyEDepToW024tQjEc
         eciD27e1ZWL2cRxK9TDMzPuyVnJCjO3yKFQQg3+z3+GJXfQnWUZ/J89TqNCGg7V4iw9/
         JWAX8QIcJX1VJ5Tqmc9XjqGz8Y29DZPm1GwRQgcwwMEJpNoJpyhv5LksJjMGGsddMAvi
         +PJp1N2AKjAxGzNgOJuL79qopDs34U7F+fEwZbhunUFMFOSuxH8JMn86doTgmggVNWMe
         DQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        fh=E3KMQXevB1ss5zkrdWz85ZzZQz89HYhUJrb3OITmbN8=;
        b=kcOvdTMn5z+JbEbBdTll9oE2L1izpDE1f7rIXmIdV0qniXugVbNa0IDW/VMVlkYyqt
         MmcbeIlHy4ahwH5xxqITa/YS7Sg0LyEv7T3nenjoUBqEr9vtoJao5/fU4QS7xCDlOsIP
         76ElcxHI7v0mDAmWD3nKA+WcjERI76IjjQ4XjjwVTsa6/zhm/hAW66650x94Bjl/dvkp
         w0Vtn8ORsBHX20Ms3BK7Kak+Qsmpsz0tRHVU7Zw3s38UvxHzDBgzrj3TRh09nWiP4mg7
         dKy0zLpMpIBRKZNPMVCFbTfyc3gNhsFdW6Bwz3Ig3WPL0dArQOJuGz1qKx9EdKY+Z7yj
         GPYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792447153; x=1793051953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=tuJUcM+rzbY1T3hPy151XGwtTm9pe5er0cE5XFCuBgpHlWmauyO44hNPXyaOBU2k5A
         mmnJCszVpsv0Pq9bmMtXp97kD/V8Cp+eTXquX1wdjYCLd+spKFDiaRse4g6thtSfryQ1
         1dWDYpOJeSVm9jBtwKEOpeJxe2u9AETKpgzKcf5Pgu0AjuDvAUSl2GUhJ72CVGdWQTzW
         5/omJaVlPyPmaUUn3+CHecWeNSW0adLhpRVsOlg1CaWGFUs1q2rqEaOvNodzMDrJHuBD
         SyKst/DGammFWm5vbEb+djqB1R3xDPZ4GXpLWq6wyrPlCKvc++5OmGrDG/dV9HqrNCEY
         9yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447153; x=1793051953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=JznUjuSQqSqKVv5Yhu7LJu1VUhSz/fla4mYBB47uPiI6PgazuSHVqBTmCohO5WMzrs
         3VYXc/ZZm0QhkNCSn6th59pBdiTCHgoV6ciW8WpQ/xU8R4ziMiaoXDGBDzY6LCd5ugg4
         9w20dofPn250rsFHN3f3fb19rYuyceB0reDOP2wVSS3pWbTs+gfB0XATfHZb42x/HUy5
         pemUGTu6dErrOlj8p0fi4Q4/Na+BXI8f+DqBvC5jpYTs6q/GhjHqrc2IQOU6c8dmRYQI
         EROdJ2PMvX9WrZkXDdoB2LUJXGhpd4GBTQKH4nbGJmz9FD+ErEIA5wqrtGGowA5SXREr
         it2A==
X-Forwarded-Encrypted: i=1; AKwUvBw3y9R95gE1ajWAlduR8M+nywJu/rYSJ/7AJ/BSQM3lPEuvo/2vZyrACS1YQaWALooFw62fGLrdiYkuAy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxIEY7FMFwwYFsV7K6zUYW/hypzf6x0gUccfrrYUQkCS4kpqSg
	iUUJCVXUTx+s5OTZLJVo8prfxJqTmE9KwmpjMBngCH3MNi84aIvVE3mMW7a98iYtsIJ9WyaFdR6
	spJBG2c4VvktnYnCXGK8N7+9rDSyXN2O8U+G3r8Lh
X-Gm-Gg: AYBFou2mZmMO5+TCL21nCvYobM7bMW771P75pESktVbyXqxjd5ZLev4adyVty1ugw6v
	s/qOgw3dJyPzELluxhpEhwk1eGHlrXfRGus3UIOs1AY+Na+55pjbnfKRugdIOjgGgeTbRoBIfkF
	aSe673xk54rqAd8WV/E7lsZd2F9Ob3TJT9c9hsRRYZzEuksmk4aQOoxoHr6qnoBvKdVizHQ0Ujg
	rivS0Bx0Oo9BwNQ6NEp/UPXUKv7HMZQWDWEgzgM9kA6sLyV4N+E+iLhEvYsxFzuPYqY/xyRjxcl
	Mrp0fOAMCjZSLmMLlOcimaVDOfhxmQ0yVEjvveh9C802X4mOye7kOrQUZiSMq1LcjyTvnXwy4Ls
	D74TewkooXRM=
X-Received: by 2002:a05:701b:2207:b0:136:c443:80e5 with SMTP id
 a92af1059eb24-1876658f6c4mr9237879c88.6.1792447152061; Mon, 19 Oct 2026
 14:59:12 -0700 (PDT)
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
In-Reply-To: <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
From: Marco Elver <elver@google.com>
Date: Mon, 19 Oct 2026 23:58:26 +0200
X-Gm-Features: AclHuK_qWUQb64XA37ScTQq_ZMKUMtenjdgDmPfnErmCHixLBqORRUjuSE_XZSQ
Message-ID: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Gary Guo <gary@garyguo.net>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
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

On Mon, 19 Oct 2026 at 17:27, Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Oct 15, 2026 at 3:56 PM BST, Marco Elver wrote:
> > Rust supports ThreadSanitizer instrumentation via LLVM, which is what
> > KCSAN relies on; however, Rust code is not currently instrumented.
> >
> > Pass -Zsanitizer=thread and the same TSan backend options used for C
> > code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
> > with C (though rustc currently rejects linking crates with mismatched
> > instrumentation).
> >
> > rustc only accepts -Zsanitizer=thread for targets that declare support
> > for it. Of the targets used by the kernel, this is only possible for the
> > generated x86_64 target specification, so restrict instrumentation of
> > Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
> > Rust code remains uninstrumented as before.
> >
> > All TSan options used are supported by the LLVM versions of the minimum
> > supported rustc, so no rustc-option checks are needed (they would also
> > fail, because x86_64-unknown-none used for option checks does not
> > support -Zsanitizer=thread).
> >
> > Unlike Clang and GCC, an equivalent to -fno-optimize-sibling-calls is
> > omitted for Rust because rustc provides no corresponding option. While
> > disabling tail-call optimizations helps preserve complete stacks traces
> > in reports, it is optional and not required for KCSAN to function.
> >
> > With this enabled we can detect data races in kernel Rust code and
> > between Rust and C code.
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > Acked-by: Boqun Feng <boqun@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Acked-by: Gary Guo <gary@garyguo.net>

Thanks!

Which tree should this go through? The Rust tree? Probably too late
for this cycle.
