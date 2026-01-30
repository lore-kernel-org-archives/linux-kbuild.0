Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F66359FA1
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Jan 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772313; cv=none; b=lgtYev2hYh/Aov/ggUxw8+/y7Nl0Tg5BLY44KvOOSyzAaiGSnd3CxbZwBywRsSp4zgzwBnWaGX+5kV1BltZAChQljctoEbmWYd+n06r4RtSXgrN9MW6zN6rmdxPHVhDYOiiSh6AJfZapN2eYtc0F7xqSCgV5JtyWQADF9XHAoCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772313; c=relaxed/simple;
	bh=/Is4pF+G/cAVaoRANAVnOakAyrY90dOrluvgZxDsU3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lf7QhK2t3+FmZ5C3fTYOR9FNJsHuUSf/V8HwRHGC5kGIsWtwpcbEiYCSBGDv6M2LChw/bMbx31adN4D+QcurxAFQD9GIVDlYw9qBWdevEU7u+WaUVWSAuMjiAwg6QtkvO8lOS9+Vf3jvYOJUXG10cCoUAlhLBC4+Jlp2i8BS8sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7PuIOUK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7PuIOUK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E661EC19425
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Jan 2026 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769772312;
	bh=/Is4pF+G/cAVaoRANAVnOakAyrY90dOrluvgZxDsU3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u7PuIOUK2J6AWwefUUjfa1qkpxuKuXHSjAdtUAJpXG6PE9gf7/lG3PYwU8lOmrvfL
	 cfjcWsu7x80DiuHCOU1ElZfyJHFPnNM+KalIqjIQUJ0zwIKGM8IcCiLWTq+P3eNIvN
	 qLb3gtKOfdb3eU6a43I1jGsGSfeyBLoXthxi6ipWvDSxRT2djX8iF/Mk+vNEyw0l0W
	 P2qltqpOzmj5SEVhxnnFA/uqj9yJ4euAZwRacpZlIz0+G+UQUMiZFV5b4Zh/5kuz5g
	 1/LP7y4xG/TNEC00T0XMD3TIdIcX4SVLrwbP4qoZkACJkt6uHnlrnO1TXkAYLOZJW3
	 TkZ2B8Q9KrM/A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-385bdc72422so16722711fa.1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jan 2026 03:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjUMbQBBbgT1TJFwp1CwAO2+dhLfzi6OAhY83nSa6xaBRQRs4LebbDWU/Y8W3XiShEZT6IhvZgzKc2bQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfRcgPklhDMZwQqKXEyCOGShkQLkd1UYbkXMgm4KR0EtYewO96
	vGfAj/zIblCILSyNIu/9r/L6FFf1Wb/9GCXEboBo9++pTjheqal7d4QXqpUh7B2K5gJd+rcbPU1
	Q2hpmGg2gdC///sKRBVrM3QLzSa3DhXo=
X-Received: by 2002:a05:651c:1501:b0:37b:b140:e512 with SMTP id
 38308e7fff4ca-38646523bb6mr8808741fa.10.1769772311581; Fri, 30 Jan 2026
 03:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
 <20260127-rust-analyzer-pin-init-duplication-v3-1-118c48c35e88@kernel.org> <CANiq72knqZ7-xXjuSdv4rAuxpY5u8xF8DvGyKVqWnZfGyRf2rQ@mail.gmail.com>
In-Reply-To: <CANiq72knqZ7-xXjuSdv4rAuxpY5u8xF8DvGyKVqWnZfGyRf2rQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 30 Jan 2026 06:24:34 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nuS26bxqSwDcQ9+N=bPmjZhPjiDGWt4Txab23wzSAu3A@mail.gmail.com>
X-Gm-Features: AZwV_QgzWNA8amtP91hQR2Vy7ysVURzVirKm6ZDuOm-OlKn9LXIa7aZyFmkEg5Q
Message-ID: <CAJ-ks9nuS26bxqSwDcQ9+N=bPmjZhPjiDGWt4Txab23wzSAu3A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kbuild: extract configs for reuse
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 11:43=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jan 27, 2026 at 2:55=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Extract `pin_init{,_internal}-{cfgs,flags}` to reduce duplication.
> >
> > Acked-by: Benno Lossin <lossin@kernel.org>
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>
> Applied to `rust-next` -- thanks everyone!
>
> I rebased and things changed a fair bit since now we have a few
> `--extern`s more -- Tamir, please double-check that things will still
> work with your future rust-analyzer patch on top!

Looks good.

>     [ The new variables will be used later on to easily pass them to
>       the `scripts/generate_rust_analyzer.py` script. - Miguel ]
>
>     [ Rebased. Moved new variables above. Reworded title. - Miguel ]
>
> Cheers,
> Miguel

Thanks Miguel!
