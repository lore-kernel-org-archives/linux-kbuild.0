Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6225C2C11E2
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422855; cv=none; b=skn5dCJwIxZ9iWS3ovjSFlM0UW+it29OVFgJcLr8pKLVVjZQvrLWXS1KCWWGkdABZlCryFevwfKV5T8MIauGBsq1M6nCZHkCikMXuZuBAn2OSYcLHq6N+u1X5b9vCPdzIai4GY1g9Yk8w007DR7oRxzcwXM420cxxOE8H855TK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422855; c=relaxed/simple;
	bh=wSahDUxMAu/KTsE8WIzk28eXDFwofViLXLphYhM2ZXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qzMKfREHkLHqhBKNke7ftHzDusfPAm7SinPwJQS/ChdNvtSSzn+zprGduLu/QTLkcBC5hn/3eCFWT5nd6YI2cd3bSbdo+BUhyy4HClUzQA9JR8Q3rBc76ZRfPIMWvfFgUGtScNkp5fm+Huv8cI6Xpyddwy7XNCfrbgTJDGkmsNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmkeuNUQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmkeuNUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1607B1F00898
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780422854;
	bh=ocCyWLz5TiPAT6PlSGlYvtcNs7yG9sMDA6UHnOxRQJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DmkeuNUQFY8GjsL4tiPVK8zqUi+KRu5fGt02lG0gTDwtqu3EAuJheW6tlAfFPNQ/b
	 qNkOuekAhO4yuHnOQ5BYhXWJecPDwTVMQ2qEAGKLiPZLDy+YZoBAqMrgXgfrA3Wlih
	 xKg+WiJMjErqXXQ6qsJ0Hb3yjD6MvgChQR+DN4Tl9dfqaSb5PPRBviwYpXVUEcv3lz
	 LZIENIQAooysMSmy8dea81qTgBM1CEl4na2h/fi1iu/VHRjnbsT0yAS1bXafxRBcbz
	 9/oPa/3Rxm7EoxCa6v7HOB5urCyBPCUmuCXu6zaeUEeqCjS8F4ArqZZiCxGThGdBbT
	 3SDSDv5C8xI4w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39677c434efso32367611fa.3
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 10:54:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+68qFJ5XaR8N8dB76h3krW+OWF7gCsoWWxYVkaZskqHbUkxtJAZiVF4v72M6e+kyDt7+69rCPPCuiXfi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDa9FER6lOaRYJFQ5qaVyBn2lzIHmxnYr2UzgJo/uas+a4A0J
	fwrqvRivc1XJyfiZGIGwlB0vktQQpzg7KDMRgX03OdW/gZFyUUz6ZXGkSdR//ecSw0befT9Qz5x
	r3RkJGb3VMs1hQiBu/huWTQ0UcaQ3nI4=
X-Received: by 2002:a2e:a993:0:b0:396:9598:aa2d with SMTP id
 38308e7fff4ca-396ac1f9630mr2253651fa.1.1780422852908; Tue, 02 Jun 2026
 10:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-2-ojeda@kernel.org>
 <CAJ-ks9m-Gt3qiBRMq7HiMDjRVHmyL7wrsm+3JHOoPFC2Lz2BDQ@mail.gmail.com> <CANiq72=+f_139RtP37FSHkZ+9wuATgf-9KzvSUfwqO949iqT5w@mail.gmail.com>
In-Reply-To: <CANiq72=+f_139RtP37FSHkZ+9wuATgf-9KzvSUfwqO949iqT5w@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 2 Jun 2026 13:53:36 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kM18eu2A=_3xeBQdhdQWDvhi98OT-omxeqtd78LCd5bw@mail.gmail.com>
X-Gm-Features: AVHnY4LCoADW22Jn_abeYebOlVkKSukmWdPMzMXNMAfaa_sFn-oFvGSPY8xU6Uc
Message-ID: <CAJ-ks9kM18eu2A=_3xeBQdhdQWDvhi98OT-omxeqtd78LCd5bw@mail.gmail.com>
Subject: Re: [PATCH 01/18] scripts: generate_rust_analyzer: support passing
 env vars
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 1:52=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jun 2, 2026 at 7:47=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> >
> > This can be
> >
> > crate_env =3D {
> >   "RUST_MODFILE": "This is only for rust-analyzer",
> >   **crates_envs.get(display_name, {}),
> > }
>
> Sounds good.
>
> > Acked-by: Tamir Duberstein <tamird@kernel.org>
> >
> > Did you want to take this through rust or did you want me to pick it?
>
> It is cleaner to carry it with the series (I will likely create a
> merge commit for the patch series anyway, since it is a major one in
> volume at least).

Duh, I missed that this was in a series. Makes sense!

> Thanks for the quick reply!

You're welcome!
