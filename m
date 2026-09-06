Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90D532B132
	for <linux-kbuild@vger.kernel.org>; Sun,  6 Sep 2026 16:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788713823; cv=pass; b=bD4ANbmVLjD3X9rOFv/G6PXu4Kf4PKeWPRFaAoEhJOSgYKHveVPzDBz62zHxRVY5HA/vRDaKQLVBmz8HBB1EshVRVECnkJcbd8EDRiibGROff6XgUdsipUVpQ2VSZXC0vcy2X6ARwuShYhnTyu2JLxsHix4zYHcZURnAtKT+HSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788713823; c=relaxed/simple;
	bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jpc0LCwIZDKd3XbsZESIYyhtYWCyiJTkw/d7h2RUr/9Bm0M/NUIBKu8AbnVmVIjHuNSkwE6KjSJV0HY/Vx29GMo141/qs5ce+Q2ZurVVNS5TRSCZJNja7WW4BSTJVFtD/HOWjNd84sNNbkYeTC4Yk7QTz3/BLCfPB3FybvwSSOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjHPtZQt; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjHPtZQt"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9eeso176706a91.0
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Sep 2026 09:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788713821; cv=none;
        d=google.com; s=arc-20260327;
        b=TKJJH/DNzc0bgYR+am1jiY0RS3sLawDeLqTGq5p/0Aq1fyMxrqlHNapjAmB6enAj17
         W/i6mgvFL1Q5pbm3jyaO6VRcAzuyjbfpyFJ7GXDSKi7kBMZd2ndfwp4JXhzNtLNEHGbk
         7A5vkhHTg19xv9I/yumlyo082iz98e83LW/w3txlOjNj1ACA26BryyCqcSBgrlH5dWWS
         TO1GCC5bwS2oIDoHqBCqQ4aAH3FJesTw6Xl4OQaKLdZ9JgTBUjcY/Rh5Nq0d316zJUXJ
         0yEhFiFADN8SwcBxp1oYsQg3axkuhA9t9lQswILDW6Z8I6n10P7lxFG9or9Hi1VORsU1
         QIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
        fh=yaj0vcJME43EChKOQNNdBaAHOR4gTv0UNQZBCfLMqDU=;
        b=cntBRl/ijqroVg+S3OHZkqFkIxpZReSpi7SKCtfmuvlo3FhQmLv0FglIxrFmrX+Bsu
         YHAvhckmHzFxQ9QKCuYYGk+rYHnVZOIuw5RBj3D2e3DfHR8AjCo9F0MYU44PMivZShVR
         uEtv8YoGVUnNCBo+MRQebosO0KJNPYnTmqFuXE70eo7Fu1dIKWnaM6eZ9Tov+2KsGZGk
         FeWgvTQz/PqikGNrVC0FEaruiVJLDLZvT4iUGjJQwQYQKA5GAQQ+Z+wYd9DfHZcDkQcd
         lq56CGQbvRuad5DT05H29A+1xxwEu/WPuercQ2y3jxXJWAba9hraumGp8JfmxWkMx/XU
         5uhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788713821; x=1789318621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
        b=UjHPtZQtZlfn+jMBdsesbKV9hhN0VxB45TUW8NF6jsIj/u6sMjuVZl/S6vNiEMAdHB
         Te+UXjaLTopyZrVKblQ6F2RdO17BiDzp8YSjJWd1LjGv8/lpVMX/mJq6tjMcQBGE+lh3
         gkbl212FSvMq4hzn08kjNsXAWfz8CFVxj8DwBvGDcA2V9pboEq4SigdRgrpS5P3lbPAR
         WaeQlpczdSbYO4EXZkRcm/d2DFhfIccQOCyUcacVGnAtc0aqHvm4nD/lvAQStGw+ys2S
         nEMr3QPCYz3NCaB4lrh+lVRBv1NLXl63CMfDijyK5BqBSV6Pp1fy8GFAFtzsiR1Bm/Qi
         cjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788713821; x=1789318621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
        b=Par5v0XXuEd8H1zHVYL0ob7uUlE8xX9Y/dd+Ck/TXfYINHGMxIP2Q5e2cWen25BD1y
         cUPusjwL6b9ACeAAbK3+91YYm+g/LK0W8j2GC7j1c6opykCHfndqtaeM/bwpVcabMnxl
         XSqxyr0MJ8/CijSWGMWSMDlKz0xE91z/t5v+lC3Ird55d8+ckBpC9QD+kLhz1Gi09FD6
         swHiPAKH4YGs+Jpi0Kjc2pXmni/mFdsxKP45uqUYKJOn0R6xcXyjGkI3kXZDqnBoGDK3
         qOau/nmA/+CizoDeJHRdLA1MtgpTt4O8erAnHkRA2BU/AUL2opcfPXPj7QquWGEcqJub
         r18A==
X-Forwarded-Encrypted: i=1; AKwUvBw2vCPi9ykE6MOwm7wipWVMVpGFJ8kJR7+Xt6u2Q5/F97WSrvLwLxqVSHzg+LunuMFj6uUyrEVlHcHxp8c=@vger.kernel.org
X-Gm-Message-State: AFuF++lYstwuta2xmd+cJZhbbCk7e7kq5GL3NW9JWkz7TX8hSOe247mh
	9eHi3wTOSoxE0bi1CwSVJvstM4n5m67BUEJjsVXfAH3HxdDY6Nza70NzBHIJPrtyx3VyLR2yPjD
	14uhdqIcFv3ovWOL2m+5V0CuPWUsC/ao=
X-Gm-Gg: AYBFou2trjevVl3wGv2+4BfiEumV50hcGKubx6TERCCRmaqeAK/NiOhF0eTZLt9EVuq
	AQdOuygJY2XFKZJEO4TW0LkDy9VLSs7Qc9h8RexUsYMTCbvDPlIPYF4LHgXXUHlGh+ljPgCV/R+
	rJZmlQLpvUp0y43V6HS7WoC9RCeQRI9w/S5qWK0qTBwcf+bNhzQWpotVzDkbfh+lC4lGAUVGaEm
	cAMCmKUTxxJtjctbE7OOLra3j0Gq47NM0AW6DibygjICe03/L4ERyPLV2HRSJqtRoWeTXxJKsdP
	3gCD02gI7zdbeV1X7+zGMTstodeIvw5xQcLqHR9AZpcAGcPfE4IUVSbncboTi2+ApyRzBObL0zf
	Uydc0i6gNVoBe7+REIMK5+WNMkwrUukMjbR/j4EzRMMefFu/lYY/PcTJDsDhQfFSedrJFOJJ3
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id
 98e67ed59e1d1-39b3d8377camr12050791a91.6.1788713821151; Sun, 06 Sep 2026
 09:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev> <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
In-Reply-To: <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 18:56:47 +0200
X-Gm-Features: AcwNN1Vz7OHfpHx7W0dFC3jg8glvxcm1hmRiClFLpwy0F6DpBbL1JHHuwRxDDvo
Message-ID: <CANiq72=xOrSXBBdmrKYfX1=qgF37LRAMzMJd4GJkXaYHMVe9yQ@mail.gmail.com>
Subject: Re: [PATCH RFC 8/8] arm64: ftrace: Allow CALL_OPS on kCFI kernels
 built with Rust
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
> +# bindgen generates no code, and its libclang may predate the section
> +# argument of -fpatchable-function-entry that a kCFI kernel with CALL_OP=
S
> +# passes on arm64.
> +bindgen_c_flags =3D $(filter-out -fpatchable-function-entry=3D%,$(c_flag=
s))

In general, one should be using the same version (we warn otherwise
early in the build), but yeah, it is just a warning for now and it is
nice to try to remain a bit flexible.

Now, if we are going to filter this out for Clang, should we just
filter it out for GCC too? i.e. outside the `ifdef`?

By the way, "generates no code" sounds a bit strange, since `bindgen`
generates source code...

Thanks!

Cheers,
Miguel
