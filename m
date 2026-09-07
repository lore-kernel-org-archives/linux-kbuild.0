Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4723B47F0
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Sep 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809599; cv=pass; b=FEWjbTfulDprVkkVryQPcXe6LlHg/JMsmXR5+xW43H3HpH9Gj4GKvVpzjJpjFa0DvK0MovhX/5dRcW2OXrNjzMbIXC1QnW0OWSUgc1KtqXPWJnV/Xn2DtlwbltMLwNpHnIyEkykYuS3rmrUYZBOJU4wELVN8GdUJR5KkJQlHLL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809599; c=relaxed/simple;
	bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRiRLAUFsrqXaVS61oe4V0G9YvMaKDKLV/IICH8gf9pUuNme4Pp1grE+WyLXsDnrY04VhFNX96ijdbotwytFlEcPgdIjBLMb6NXGV9YHzRFqz+mBGxuaJLBqHQkiBikbwaQZ1Lr9i8vbmTTlK6UdqPzNN++zw/98dQEUOn15Ck8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iK0qYj5j; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iK0qYj5j"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8523cc41f31so224619b3a.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Sep 2026 12:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809597; cv=none;
        d=google.com; s=arc-20260327;
        b=sHTU0eOgYhuIJd3jmLcgz69lQnlWnrygWM8/UFCDd4hBtlIJCoFSrWbSbWDvbCyXuW
         LrKYUhYP0u2tg0wL2a0XGPmAv63pjgPedv3QQgdvzprNB30rOC3VBdbV26Kt3N+grfX7
         3NjSGEBgSaFzvoB1N7VUOZMSRQvepHNEHVl08ovD/idwbKsWD0J1YHX+mrSunuTW4qJS
         6JE5Q4UVNFYJFnrmIJrhl59ZwEO1y3XFVZMR+sZ3PHACDzX9nig2GYpjP9MlMCK9DWCT
         VipRULITcg8hNbayoVe+QKbJyV6QFp+5wR7XBvumXbOMiqLypBKsaDWjdLknrS+axeBC
         zW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        fh=XuMNgNtoyCOQj2mf6wmOSIuve70mXvaWp9q9qFcAbjU=;
        b=ULTVvomxLB/FEWwQydw7yWUda3uErJtfxnDcCvkcAhr+cp4B2hO2vd/oLhW12lWrRQ
         qeiKFwx9kixbc6wVvTwiQcHLFEHHEzQHpmgZHAwDJada4m8B2UPR/NtQR1bRxxtD407l
         PQD8P+isdy7GAF7Xvf78FhMrREtWyXf3NiHnivTGuTUgiNEWVUhdta5U8gDgFgEbwXQK
         JlVGu/TyFqQaWUqPAK07lWIFlkQRx5wNUaBYLURlAbWx90QcJeDJ0G8uu0NXxFIC8ZYh
         VU/3gBXTpNVlUbXwh/PGhDFqPsiL7HEUbwGmS8P837ER98xSZ1HHREbxFGjgFKhIf3/p
         3W/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809597; x=1789414397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        b=iK0qYj5js7h9LqZ16ntFi4pR+coNw+J1DIsxddLy2bybdXua8s7AhsQh5PKG4aPy8k
         cWfcsot8Jd3QOFo9QOMLhxclr26W+2bFQXUQb/5htv9RCQ75k/nTYOvsiDpAh9ZC1h0P
         17HYrGhBkPAcaFKfVJDBRota6XZwJTFU94U1d0QKrv1bCLj5OM6vuETU3sDAU1WcF6/P
         XwKGZTES39HLJn7EPOvbTJ556I3rp76dCWF5AVgyuUSKXaJklfe1ypw/YLdAV2Pt4o8p
         oIt3UyGz4+F70fE+3rhKKK66OxHCacES0jUQHDbVEe3CfUFb1qgvkTLFywu8+KyEsrhR
         Wz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809597; x=1789414397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        b=Z+cCPS/DKgehrl0vD3GrPcGMhzmB1aXwxJjNJoP63yJbCzf6VGZK5NC9tToIvKxvUO
         QkMzL1qxz4qXYqQUSSv1J2dsJEK1dBBbsnl1hbEZGX2ukMQqUoWT6+lCSJy/6C0vX9gT
         EWqQLagBAs5s0boVruqyAdF7EYP+RjGEG5ThzdYnrEc7GcR6xiUAMMnX16ppYJ8NUdU6
         U9RMFw9klpNjYaEOEsiFGIn9Mp410Z7tQzbxPIdslu/CEdVLw8h5uJheyHulOFK248e3
         aWMdW+ntD5ECDEKMmz55Y7bPD4UcQ8KS6VOZzkxaaoVo+vrX61Y+05wRLErmw/ioRh1e
         sbUg==
X-Forwarded-Encrypted: i=1; AKwUvBzMAounXd4TD41tkyrs608xQ/Rf9oj2dPQ5S6lSZMEzzHM8ose0DXJSoFDFVvmHa1v3/qp82heI7AMGFyw=@vger.kernel.org
X-Gm-Message-State: AFuF++lLXbY4PdUb3tk9dkQT4AwbvefT4d6IgzoqWB268X9vzLoVniFC
	+mkKstfvXH4DuobltdMjZTN1QGrc99e79vVZ5GDGacE14EQwByPxU5tuktmOwQuL9qQdO8c8/ss
	8cCVN5dLGqylCj0FUCPUYLDilS1N+YYg=
X-Gm-Gg: AYBFou2jP7VMKzRXfOsvppXHRKyxDXEzWG4EzYqnRMJGKgox3TkwQ03n1BH2ZLLV7Uy
	J6iOO6HNi/r4L4FRaThblbHozt2gtc+AMIWWVmGMoIAOjN0DRjlsbCJPvcXt3/tMov/b8XUVJTp
	XZwj3uSyVBnOiJ18D5h9XBciLY6NzOktpmTTVffcm0CfcZ5T9vGOrFb41XpBLFJrfVnd9H08oLP
	QU/LAi+MVTsIKKA4BjPYCxw2zrMOU2hSxcCqenYkEfXnLrF2fhwDtruWgBKpu0klJXL7o+ggICI
	yw64moRsE+gnoEGS7Fxp4msqozJ8Zrn62PFdBrEiCrQ1d51J5buy1Aus1/BPv8vngdusMFP/Vwx
	rJRDYWglsfyJ5Wm7DhYjrnG1Vy9EXpKQslybZrY2YEFJJ5H4BSOEf7tSbHXVMJg==
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id
 98e67ed59e1d1-39b264b24e2mr23088437a91.0.1788809597288; Mon, 07 Sep 2026
 12:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev>
 <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
 <CANiq72=xOrSXBBdmrKYfX1=qgF37LRAMzMJd4GJkXaYHMVe9yQ@mail.gmail.com> <ap3Z-YDtzmdtMiMk@linux.dev>
In-Reply-To: <ap3Z-YDtzmdtMiMk@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 21:33:03 +0200
X-Gm-Features: AcwNN1UJ5AD1nmjaRgagxZvj3fkfuD3Z7c-j0Zc231NENpcPq2HjO9j40kxIvNk
Message-ID: <CANiq72mVXNmqh-RdOunFLBKRwMgYHFBqJOP7NbXrd8WHPb3sAw@mail.gmail.com>
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

On Sun, Sep 6, 2026 at 11:24=E2=80=AFPM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> # Do not pass -fpatchable-function-entry to bindgen: its libclang may not
> # support the section argument (Clang >=3D 21), and parsing does not need=
 it.

Thanks! Hmm... Not sure if "parsing" is the right word, i.e. a flag
change could still make `bindgen` parse and generate code fine but not
match the ABI of the C compiler.

i.e. I guess I would have expected something like "...: its libclang
may not support the section argument (Clang >=3D 21) and the removal of
the flag does not change the ABI" or similar.

Cheers,
Miguel
