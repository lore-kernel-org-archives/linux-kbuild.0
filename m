Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC66A35C693
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Aug 2026 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787701013; cv=pass; b=ibeI6ZYrEsDPj9xGmeQ7w5ld9nYNfZ5ec3EVh4MuDIMiNGCBT3YWcF0yTf7Epo+ciGFlI0bzGMeTlEshhyYJNecbkVWdD8vhFjQVrddw466p933eJP7kaDoHL6eXGD2JkE344E7yurxXxBPgC3Q/vcwun9LAa5WI0pWYztE7BEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787701013; c=relaxed/simple;
	bh=h1DbMee42kDTE/h0M3ZhHKpBRN+EYlu3Xiaw/VOWNzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhX21P/wJfuaHsLfElF7GE6Bithqv6IwH8mxRx8VXkrmAkeF1jBELwJ+QvtbHQiR0dfRaFi6ZnGfhV568TVdimhxgmEAoVsHuJUcwa7UovouLsa4+oEP0Qfes8NimetcitAkK/2lzVIpFlbwNIEes1OmqwZr+cyjAtOdHAvY7yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq5aUTeC; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq5aUTeC"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d5862bc921so1092755ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Aug 2026 16:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787701011; cv=none;
        d=google.com; s=arc-20260327;
        b=bqeAFqdyp+qDJgxvmfKs1+jrP+4yBroyM5rJox4jjaOCjXEvuTMdHGUi+DTfBQ8Zi0
         SBIpAhKIuFxCrSuF8Of9qaX3zSzfarYL22A/eShwanBoOO8PGC1uywWHW2MPxnDeNWjJ
         JW/JeR8psI8sjYj47IlXqA+LHYnka6miz/7cPuX/V4hrzZTHn3tJaRplI6FmQv+5e3qb
         16X9bWQH6W74OFhHY7IDpBt9srKJ0l8HaZyvMl+77ENM6OUNvC49Oxn6gGT9ua5WbAQT
         qYT/ERt1Mmep8v7mYd3eeDWtnFUITxIHfHI1jaTWSGkl3BmcuuuKslymo/krHiir0gT8
         RJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2fMZcIr7PJYUKtYt6N73x4GUy9xmDK+BvFmvurRf9/Q=;
        fh=v6ShFZ8xDPxKMUmmUEECk4uYW56Y/6hFEuCMdCT9PrQ=;
        b=nrtk429tIJPqfJv2dlX92ek4jV5Xuiu7oETavYSzDaK0p70i/5qiQCQXq3G9ZiKHFw
         vcC2iB1xAJ+I/0iByNR2TlIbpuuwIR70vkXn6OPzS6R2mXYko5+Ye3B9QhgjV81DsL4J
         VhvadP2q03hrXvRm1/pS28BW9JfqnM9eZjCpdsFJKr1e3PnCHoCfCNq8Bv4dAzINXDtd
         K9UUM3qyPfVDwNkuxbo6EPSCPud6B8bz5fugBZeFFAgRoBmvQLonwAvdPxnGAIRGn1uU
         WWspcYdER6dkwAgk8WUV2SEKT21r9dDZvKROMfp0KgMDzAmn4+tLwqv2ZzEcYTBdPpVn
         AajQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787701011; x=1788305811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fMZcIr7PJYUKtYt6N73x4GUy9xmDK+BvFmvurRf9/Q=;
        b=cq5aUTeCIAE4mPtjyZVij1Hq4AplR5/esWhQPkNAERpwIuaaWIPVGtfFgZstEhFweB
         pVprFD7Z26WLT36SDmmhso44Pw5y3eJJ4CGWxpt/0kMkyQFS1459igOdKymQnRGZLfVq
         gE9Q6RCmNodQEOMsKejWCjBl+3ZuR+kihYHbMZjB1tbPNGi68C/P0mVCVHY/VkwBKY41
         EgSrSi3jUvk+ZK9zbs1/tYQDh5qE/8OPY4YzjYKQfMS7EaQixYtsf8k3oPCTrsq/5zkK
         1EY5tldB36zoQowFXpBqhhiX138FcQoJcT66X28v0gm67EMWKqTl5EAtfCBoF/QTFf64
         LTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787701011; x=1788305811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fMZcIr7PJYUKtYt6N73x4GUy9xmDK+BvFmvurRf9/Q=;
        b=R9dqLhfaCUJi0gZtpKzKGfkh/Cz15R2dOLJ+yJbTH45/Bc+BA5kR3mr2AH6K3DvLWT
         KJXQ116QNls3ZT2ftzm+QvF10hVuctye6/DDr9lzEUpeVHgGX5f9QEBrzPqapxn6XN8e
         mBTuM+MCm7mX8VSrth8DDndrHtbIIUplaLGd235boLOKRGYN/TQQDwNvh6BObvi20MxM
         6ykb1ih2ve6fZmra+kSlfqEY4TY9yeMux6ivQFe/j4NulA2jyRa7rjf7vJ6NCA8orTad
         qbvnlzPXpEVG5x7Vne1u+gPf6w06clXM9N1QcJh+YZU+Dxjfk+m/dVwMoGw4DY3dGtOj
         Wcaw==
X-Forwarded-Encrypted: i=1; AHgh+RrsTe22yqticloh4XnsWSFOoMtUtMu18UvkrLdxZ7dFSFKUbbpnjVYTjjOYgRV6DA6gnYjDqIl2OYMIVXw=@vger.kernel.org
X-Gm-Message-State: AFuF++nfJhb63XUh/tbmsvKrN9DZ1Zcss2jQ28dLU+qIiRmTqWim1z76
	OlIEw18tWTieVCIXHDVk0ytdjNrbQ+0p0VPiPynqGi0D1jrgrix+QtQl3k66kQMafrtVQcQlw9f
	eRbBFqgDnL8qfIuXAl/g2pePVsPKbTr4=
X-Gm-Gg: AR+sD11voC+5veqad185VIsXDu1jr8Zk5X4RLMp7W0XPZPQVc8Ie39H4t2K3perghSw
	RLvwsADfpP7FSyEuvWNiHXN9hwQLATtcoJSBClATtSxtKhtA2FarpFMLqaS4+L6WDaDEwwzlkiF
	rBOViEJtszNvHuccrrUFtKNcfQbkj8Os5L8gNVyXBS3sJNNbIw+v5gV/mWMDNI9OOxTPAgXSD8w
	//487phrO871GFuFHzpyb03OvQJP94jz1koqKcdn3VC1kdUUCMItT69jPswUsa2cGg2JZ3/QC/u
	bPm9IPn9sF7rE6ItPdS9RQPZOCGBFu9uaYz/b1kt5JZTHUFnMLWstal02G2HGMK0bf8Lgm+GvYw
	tNUDtt5IrZU2p1A6g8U4vkZJIheQSkJF1TxR4SOBGF+damj1FGX2nqUQPFCYQXGAZ8Sm+RoQ=
X-Received: by 2002:a17:902:f789:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d7077710ffmr16923965ad.0.1787701011201; Tue, 25 Aug 2026
 16:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823193529.156066-1-ojeda@kernel.org>
In-Reply-To: <20260823193529.156066-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 01:36:37 +0200
X-Gm-Features: AcwNN1XJUdcU-uaWrJb_MWdWJsZH9EysTDIt0KdNtGRwRojvJo_C-_WfkW_E10w
Message-ID: <CANiq72=AXhvxG3TD5QgnLMmL1hcPyahn55wO28MOsWTAo6F_Ww@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: disambiguate `zerocopy_derive` for `rusttest`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Antoni Boucher <bouanto@zoho.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 9:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The `rustc-dev` components for Rust 1.82.0 through 1.87.0 include a
> precompiled `zerocopy_derive` procedural macro in the sysroot. This
> range includes Rust 1.85.0, our minimum supported version.
>
> This makes `rusttest` fail because the compiler finds both the sysroot
> copy and the copy built in `rust/test`:
>
>     error[E0464]: multiple candidates for `dylib` dependency `zerocopy_de=
rive` found
>       --> rust/kernel/prelude.rs:70:9
>        |
>     70 | pub use zerocopy_derive::{
>        |         ^^^^^^^^^^^^^^^
>        |
>        =3D note: candidate #1: .../lib/rustlib/x86_64-unknown-linux-gnu/l=
ib/libzerocopy_derive-54d2b38896fa6bc5.so
>        =3D note: candidate #2: .../rust/test/libzerocopy_derive.so
>
> Commit fe39a233ea52 ("rust: kbuild: disambiguate `zerocopy` for
> `rusttest`") fixed the equivalent ambiguity for `zerocopy`.
>
> Thus point to the dependency explicitly in this case too.
>
> Cc: Antoni Boucher <bouanto@zoho.com>
> Cc: stable@vger.kernel.org
> Fixes: 506054980429 ("rust: zerocopy-derive: enable support in kbuild")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes`.

Cheers,
Miguel
