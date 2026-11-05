Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919708;
	b=qkl2QRz4Ax09rVvQFuAhq3eF1/Q1vE3BjjaN5dt6Kw/59N536VaCp+khD4vRQ+6MjUUq
	 CAoTKFIh8nWCwxekd9+AButh0CUQILXKSHDmvcK38kZ6klvvZsrEH5sASqWxjASM+XleV
	 8dBfP/YxCiTPJoMl5vgDnB9RIrVkzM3u1u2zA1hS6YBE1Yz4eqbHH86Mh1QmRagsHuNGr
	 OQKfdnha0RdXaGXpdy+hUJCIVX6TLvaQB4ZqtG8W93POmCkug05eiKICRXIRz4Ji4e/an
	 ktBb3ilym1d7j0UO4vGdDSsIUt+lgOp3hPgG6ctrlnUooXauuyIOS1vKbTG4MhZX/hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
	b=fxtIQPLjyH2oPkvT9/dVGHhFKq6yoyDQvyyeY5Fm9qi/6NSRU1dMXDEVPc+Xo8OeYY7H
	 8fX7qQu7Kg1ok7qpXyPPvwHT4AZy0kbByYC8mWo072anhO+XF0I9iam1awZAF6k9pUti/
	 bBf4oxl+/cbmPKWB5PnUTGYqKR8w1Y6TLSrcLBigZAAaRShQBYFKN7V75NvPuK6zQ9qJV
	 cL9Qy2r0W6kcQtkrq/DsvoBfT8/sn/t7DfOkiKOtR3hwLObO6LxWTHALWxJSZW5zaTR/G
	 Ulg4IDKiZWWzwldqums1OwXmEa4HeoDc2JAYHjUScnEbi/Kb8tr7Xoxs4c28+Ld+e/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YmwIjo7W;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198E4606A31B
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 23:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198E4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YmwIjo7W
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso45206e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 15:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793919706; x=1794524506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
        b=YmwIjo7WCzwrHUR+gdLIv98iJLxcSxO3k0axvCQz3QQTpT03hvGWT3JEKmP7P8FjMm
         oiy29dH/Fz7GFCN3wHcBBOaCBC+zuTMEvaBLSmwNEV3nbDaOlRncYq1h6JNkmQ99X8j5
         AwQSGxZLNnxGW6gnxLabbTA2KoJNdk0XYQ3yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919706; x=1794524506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
        b=twf2K/Je5Rwig6ygN+PMk2eLBIAhC9CTmGoAv8JLuOX70iVV5OFDRt75WkIiNKaGIU
         atPZLuZ58B3iuN63c4pp6/Xj0ywnm+h963YX41YyZ45q3IhIPnnWaXKWVs4hg/AQoXOA
         UvmRXdH/5Zw3eyoq20oqunaBSl57qMwbsTxfJpU5Sw9dG9Rlm3OVi/MOtZI5W/6ZoP+b
         krZ/9+Z414rEU67w4GsVNmgTNtQ+rG4Ybnpb3I3RsGOMlzwlzZ8KpOdBtjB15/mtVEJe
         AEJQ/th3ptEcLRBThmA0y+fPFPw1o/Kaq0L7ZTl5kr16lBnhbHMvmy/2njg7fjMKPtuF
         ky/Q==
X-Forwarded-Encrypted: i=1; AKwUvByvmaiv7WACqCdSpVCq0WGIlajj6yJXF9KWjNAWbMAYeHdLUa9wu/P381NwyAdER+b5zXcMWiHhmHW40Ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O5x4d9j2wYvzOI9XeBWQ+Ui4x70enfspNHOUU+G6TkZOoS99L
	E95txkWWx2gIxdqxRfFsAZ940ESTmtewCotAPOtGIMRjayJzFJTFkvHa2MdzOhrJ+EiGHBl8Gbl
	7DU4JHpZl
X-Gm-Gg: AYBFou305+4Y+BkbZ1TtBlhD/U1+bjQmFUVe7kSM6vS2UAmoQCqDzJbWfZuAiRbLodA
	13MnLN10Ewuq9JqhOfQF6X3ZEtd7xVEgmbGpZEYECBHZoO6448SsgtMNt36NZiEFPQlj+4j6kzZ
	chTEAYgNa+48+0Oq0naJyP9ubaWXjAH3Pp8hkgUklUQm/FQX69L1fQ/PCDT1vrUPvPUvKX6lGU/
	AhpWfkMNCDTI0t3CbjSEMlzFiofuHfq4zLV3um5PgZsRySHYTTSMtovcW9HwdwWCRoE85Kr8DbD
	SenQVClo1tVkHbIBv0kBY4qnivw7Lert/EKrqybJXxHU0KZ0WYfu0TFgXMxoxs2su946VyOuAQH
	1lQVEtUGcdyH0Oh8cD53l+LE/tI9OZwANROD+F9CDCm8p4l2kMiXytaGNHOCZeb0YTqSSvLmu98
	eIgg7OND/Shbjn2PbddNVcNiPFIIswi8TOCn9phIr8XZViSyqkVtKmqiuSLOUoEzMXhdp3AMJSu
	hCjQq3TZwDVVxTHAFmACS8sgsBkkZfqmtNP/Xx+yPZ9yKtN8RfoLQYMnuq8Hgm0LYk1ffSst0Hs
	0Z+PynvXLteTNB5MTIPhzF7undB91FN5Tkz9mIa7updNU2B3/g5v3kLt2/QbJbljcjZsudI=
X-Received: by 2002:a05:6512:2242:b0:5bf:eb06:d97a with SMTP id 2adb3069b0e04-5c003c07079mr129943e87.62.1793919706164;
        Thu, 05 Nov 2026 15:01:46 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003069675sm93602e87.43.2026.11.05.15.01.45
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:01:45 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab3dd9681fso23936241fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 15:01:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwe95NDZ+A8+ZXEOdvwa/IfQXv1++5T6iescMW/3sO/t2xW3997tbzUbq7SX3DznB+2+bpJWFAivztENHg=@vger.kernel.org
X-Received: by 2002:a05:600c:c4a4:b0:4a1:f736:79f3 with SMTP id
 5b1f17b1804b1-4b6de4a7678mr7775055e9.5.1793919278293; Thu, 05 Nov 2026
 14:54:38 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
 <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com> <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
In-Reply-To: <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 14:54:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UW26c_28wcZeHkZbwwfV6-r6YTzi4BcBmJTJXzCvygBg@mail.gmail.com>
X-Gm-Features: AclHuK_Ffzk__3YGh5Ruw9BKABV7G_tKL1f1gc3qp3lqSWqolrpj8eHeMy1suUo
Message-ID: <CAD=FV=UW26c_28wcZeHkZbwwfV6-r6YTzi4BcBmJTJXzCvygBg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 2:40=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> > >
> > > The issue you mentioned regarding excessive time in applyFlowInferenc=
e
> > > comes from Profi.
> > >
> > > The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> > > FS discriminators). There are known issues when using Profi with
> > > FS-AFDO; enabling Profi actually degrades performance compared to
> > > original profile propagation. When we tested and worked on AutoFDO fo=
r
> > > the kernel, we did not enable Profi.
> > >
> > > While I haven't looked into this specific bug yet and am unsure if it
> > > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > > to disable Profi for now.
> >
> > Interesting. I can suggest that to the team digging into it and see if
> > it solves the problem. My AI agent says it will though. It claims that
> > the default flipped recently and "-fno-sample-profile-use-profi" will
>
> I wonder who flipped the default? Perhaps they're not aware of _all_
> of the existing users of AutoFDO, such as the Linux kernel.

I've been preparing a patch to add -fno-sample-profile-use-profi. As
part of that, my commit message will include this:

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25=
522aa17c2a71003
[1]

-Doug
