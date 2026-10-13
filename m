Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991011DF98F
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895220; cv=pass; b=n0FH2xJq/bWjK9ZKcPnFBGs7R6MCoyQR9Qf+lHBoKJuGkY8dr91Xm/TfOG9YRCjvhuUT05muspuK40a7V0hOKLTcvRACY/PCVre0lM1IUfjddhw9N4NotD0+l4KuYFXT6+CVrusP+dHik2s12m7wkCBQviVpGk73OMdlUeujzzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895220; c=relaxed/simple;
	bh=2xcKVenmsOkTL/dR7a9UaRkSdDoYvwvb2hQq8wsPR50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mm2pXiFz2Xw178aKLKjx2clFYwzTd7Pwcsj0b5eBM0lvQpKDzW/chBMJglNWKs6xDff4k33sBAd9zfu4SowewjZmvL0UwwDPJCI5iI1CiCKenc7f5r/GjeRvSOElwR0YGhAXt5dUzDOK3Fp+6/q8ZWHKfmIwBkXoe2xkCQinShM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8DrU4pZ; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8DrU4pZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2069359f8f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 05:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895216; cv=none;
        d=google.com; s=arc-20260327;
        b=Gpe8qDgmAYd9KphZzOIB+87Dm098igzXBmT6e7nFCPggQygs2e5zq+4heCPgpdOpKH
         vuYPOjY2VaVeLFU632GoKBRxPjq+JL4XTWwHJGZwgaGEwYm9OBmQ4NiPbUDibUM3GO9E
         mnCcFzlpJL+xfNEPnPe6o0xo2hTsl9RTRtZEvf5dt048Azk9cVrFQ4txEM3mqbBp54dx
         tl0ZwsBEPNLq8gBgdXinXu8fHXozjX9YLXDK91DBZmGDwJw91CfHRIrA+590APB+roiP
         BeZA+3xl2NNxOCLwSwgMddaVBmWnYjzJTfvUEIFlos7t6TDiNPcr38SNlryetfzwV2rO
         JaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        fh=7GKxiPGdUwOjz9XEa5fF3VJ02okoOycs0Ae5sKfbIyk=;
        b=kdok/uuJtDlSKn7kUYQK1K9nRhzzT3hp2xZ2SW0FZQXFZP16Iu6w7LwsBAvq2xtmjg
         s4Uvh1MelRvnJhZMOXdfEHNJG8iXK3bDJYzklH3HH03WM0Gn9NKGykPcQqD5+Mp7r2hX
         BsMAqroeSRoXbReer4u4vx12/oe1IPQqCTa3Ng+mXLhWlFSb3dG/I26Z2ICnZ9L8832o
         YHEZAvR74w5nfHpjmZehtYG1HiDWMdiRpQSgbIE/bcgvZ39CNyLfarU7kg+e0UYaZ77f
         Luoqdu/RDnQUwezKURQMZgIGPQ4+FpYt0OSaRpbWUd5VsReBvKa9IwsWW5v2/wgNHps0
         THtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895216; x=1792500016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=L8DrU4pZy6lObZsY3CcCLNFY6pLCfmuKnb5MhJbhxEbXnEtHWeVBDHA/xYQ6FC4TGL
         V5XNDn8fJdNx/uI3DEUeswYU8Kolgk7PP8Jfz5PL9EDloPkBgLKpL2UHOxWv4PmG0LOk
         5T8mw6OC03YMpzP/Bu22TpMc4b8HYLJcJwHEXWKXyGTtTmAvoxlwCfHV/rsgAPAKu5Bj
         WkBrlHdIBl+eclwY7V97giPr9FpbVb0wVkAEJxHwM7JI1YsENcXY0LUXsFKnzKGYbZXy
         INifoEBz8db9sTW33xlVj6OnsCVhVtIyZx3x71VRWhc4Xnfc/3oytpCoro0rd982wx3T
         Nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895216; x=1792500016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=rl76hNO3w6VH2zQN/6XO4aL7js/wU7ajdV7/3kD434XZ0lADYHIFQVp1boSJ/v34xs
         ix0hTjZiBTUQCmQc1ZwxwB3woXEklEtlK9XzRod+ULMk+gWoXIZz2oBzh9qQxqiDnwVl
         veczeMkpp7Aq4v1IaXFfZxWzdqoN+nhN7TPH/JB2cX1mZVmIyPwtm447Bpb+euGib2S+
         4zTh+4FbNEOUYIuYtyP7PyzMjahw5aTnKpliX+8P0eUMoxDxJ+UG4/MDE4OHl1UGODm3
         m0YIsnybDJgIz7J0csTQ1eXGVXYuyrMcW/5w+N4P/Irb1jsl9crAFpyFwbmwZNRZyVbg
         KqAA==
X-Forwarded-Encrypted: i=1; AKwUvBwwpz7A8pSNtg193xn9Aj9ghE16enqkDc9pOj/rd/PPiGpdzO3t9v419Yrc3rW/yIC0P3HB7B+qDuj03eg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2WMiYCsWRZE+5Z6+yj5H1IRgeTu7QZO93zfoT+s4iu/XbKeTh
	ukyyEjkVNycWqB+F07bB80SsJ1ukO8hgRLtv2C8O7ORmGDPfhro284RCj4VRiJj9gWgFN8olnRl
	CdVzcQYUFI8hTKKL+Q4nR4a6DDhzRxFpfEScYg2JV
X-Gm-Gg: AYBFou251fxK95WGVbxMuhkCfdOrFd+e0ezXtlZB5pKvrMAIhAjKjKwLjhQZBeqlTDB
	dBm3mID2hy2EPsQQJSHHZHbYUvbjP2VUEIM9tDv7w3avE31l3uBZiMR9+qrzoP3qlKKtgOJbCzb
	AqIGu41f8KvikdrcoyEaPZHPj9lleQXwVqOyaRApTmuZwAQ8P1tUPnoBnNPQeYr4RVazZMn5Ss0
	Mn5GUbYIdXwgK4Vx2/8poItkgq9ybWNKNAkjdKGEie21pwxGXE+VinczR31L9dKHv6q2HZKinja
	VjP/rkqVA5zvWuOeninZPZ+sVHwAyIt2VML0fe/Y/mAfSaOnHUIxEnIo9k4br08HiqbhxP6TEgF
	hhgnIOi82Lq1TK9ZrrXuGwbo=
X-Received: by 2002:a05:6000:43c5:20b0:487:27f6:a4df with SMTP id
 ffacd0b85a97d-48dbad3c1e2mr17146863f8f.47.1791895214991; Tue, 13 Oct 2026
 05:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
 <as4DdRqFKxuJNDnS@elver.google.com> <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
In-Reply-To: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Oct 2026 14:40:01 +0200
X-Gm-Features: AclHuK-baEW0UEHM2ney0XhOi65COv0qWM-kqnIhtWfQmlen933Tf5epqt03if4
Message-ID: <CAH5fLgh=TkPnycdZ8_yQKaVeufN1YUS-MTo3EoMVhZzOdpKwYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:32=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Looks like it, and we need this patch to use system_dfl_wq:
> >
> >
> > From: Marco Elver <elver@google.com>
> > Date: Tue, 13 Oct 2026 10:05:52 +0000
> > Subject: [PATCH] rust: workqueue: add system_dfl()
> >
> > The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> > (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> > system_{unbound}_wq is used")).
> >
> > Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  rust/kernel/workqueue.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > index 7e253b6f299c..e46d3acf903d 100644
> > --- a/rust/kernel/workqueue.rs
> > +++ b/rust/kernel/workqueue.rs
> > @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
> >      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
> >  }
> >
> > +/// Returns the system default work queue (`system_dfl_wq`).
> > +///
> > +/// Workers are not bound to any specific CPU, not concurrency managed=
, and all queued work items
> > +/// are executed immediately as long as `max_active` limit is not reac=
hed and resources are
> > +/// available.
> > +pub fn system_dfl() -> &'static Queue {
> > +    // SAFETY: `system_dfl_wq` is a C global, always available.
> > +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> > +}
> > +
> >  /// Returns the system freezable work queue (`system_freezable_wq`).
> >  ///
> >  /// It is equivalent to the one returned by [`system`] except that it'=
s freezable.
> > --
> > 2.56.0.385.gd3acb90ef8-goog
>
> This is:
>
>   https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@ke=
rnel.org/
>
> i.e. we have had a warning like that in one of our current tests for a
> while, it would be nice to clean it up:
>
>     workqueue: work func
>     _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtN=
tNtBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
>     enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Cc'ing workqueue: Tejun and Lai.

I was actually working on resending that workqueue patch series, but I
think this particular patch should be split out as a separate fix, so
I'll go ahead and do that.

Alice
