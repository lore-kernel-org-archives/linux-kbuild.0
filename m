Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD5F4EB844
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890213; cv=pass; b=u7llFZy+cSLSWq1g4DxZwWs5zn0Xz1v4XYy1XHIM3kOllD1NFrfydbhHJtHxLHzvE0Yacx5PdGSns0UcCw0Q6dSQgqkGnOOh/fzc5GCgKVZyA0sRs5mkUNRNStweyv0a0Of4HAOlsaVJZSblopZHCo9hdR3qT3RdfzMV/GeNOzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890213; c=relaxed/simple;
	bh=rc9KLx7EvkpoTqaPj95lDAq+Pysu5EXwOszhQEsLWbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5z5ghytL2RWsE9lAcVsnCPDskxEU58E7TCdmEyId+dt7hTwQtRRKAKSGGwyjPbJ9ZwijRrkerDUeEuEx6mNSRFBxSjkCpoaTb9OIwVXpU2CN+YPlx4yher/8Rr8YOBgB4Z/1Zrd8eCU6M4C3As6wMXTGv2q4stHXSrdDJXN1CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=askraJ+c; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="askraJ+c"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so1599718c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 04:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791890211; cv=none;
        d=google.com; s=arc-20260327;
        b=ivuAjrrTgtohtyi38K+Z2wmSa3RLqEQ2GxQuh6+HdwE4WUMcUlf3XadIyTkTOXLjgk
         gksVKW19ZJ+m0x/VgTxuTFUNUbBfwFqmgTnKIwbQasUXiTl+KzPc5e28JhsFmcWH3t1w
         XFQBPpBARc6OsXdbWT470yZgLL9fdeixEcl8CvemUBmQRk1f3rVmAvHcqrYUnKrWATQ8
         BYVEXph7jkoC8ntufff2TNo/GeVxHXFrwDFUq/5TYMUruKA/aKa/NXOM3trL8UkE5KUG
         L14FbnZPBj16AlNM4NfhszMFQgZCokeGjhs702CVZg5I+1hMbIrhJu2qT0OWK+6Gq70U
         5f9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        fh=MGCPQe635AQgTfEXDqfV7qhrIqd1N4CZHC6gfHUwj+k=;
        b=X5yS4P+8YTD/pFSE1vs9/br9aWIaNdgWfX/m3RY/g09czTg76RrR18bfPuiJgfzzKS
         QA7EEyyb/820b9BhaFtTqAWbDTI/jS5ZmxpxbF2aBglzFJ+Jo3i6N6uMwAQZX0j2bx4G
         DGInNx54Bvj6GTEQ0RKCswoesB2Td6oyH0bYj7HSwGpjRBjvNoK6n19IEerMtTjC9h/B
         2GKpQR197QZlBVmNGo3/YdJmDVslvQh9lJpICZznY4ProHscXuh1UXdj8AMBNK2HbaWP
         E+ek2qdphHL0Ol0qpeopniyZAu8PF98yJKwI3pRwxLrHOCiYxveRyNRwFJEWtr6BbUAo
         kRSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791890211; x=1792495011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        b=askraJ+cHw/HZjFQZMYHuC67zPh6inbDOkRSbaTFMKPpcyH9vfuACTctZikQlI3BuH
         75D8Sb8Hws4BtwLqejNImj1gI8QLBgG0QEHj66yXBoCCC5FZ8BP4Lz3ngd8JLwajx55r
         mmo4TfCDEi3LWdFKYNZsmMEEmrg1g+fhafVTbBcAMFPB4r5gTAJq3F4EL7CpNzSsAYis
         v0JdDb+U30RHBf9WGSrQw90DnHQ6GMJ9kwaQJwIgXT01QIIM5lHpnpdsupEsfv3uWHsb
         qjsR2/Hd0gec32D3+IJGnF8dqjS2rho05zj5u1oXlH+bFvIJAAwu0V10hhp2YijiDQ/B
         WQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890211; x=1792495011;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        b=g1OPLjeIay9V9RFK89QqBvF31fnH3sPSnv+pt5xJOyomqG2YbSepyloTAVFWNY8gVx
         8a1R/KnsQ+/shzexkcMil5VTeJEwy7Aet6NOA18faQGmXL+9/XFW4/+HLp7GPj8D9pM7
         iCIuHxoUjgQpuc5JLYrIxuxuRtuxBf8gYc3TbxuC1ATYxn5CNP/4Vu02Ue2Ondq+dDQu
         ABR7cfnqtJstY4R5jc0NKeIlQ3B8hzbw1ei1SLtUodFJtgjZ+WVb0rg0x2L0z0jys8yl
         RNt5QVtQyY0gGoNaPC/b4TbT9ba0iGd/64n1omg7+15aZ24DKPJDzKgJ9VGWIc7i2f2U
         zuSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7gR2i/lNpxCeYWAbNTRp2S7eMD7OeHeGEVYjN8tNE6+bITBuGzZE4dvXEqrxuTDukgv8uq6nrWwGdHsg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa0/z1K3xSdxOKZW4HAAF+UuoatBCTxvrR/1vqPFFVHA7Yw9Yv
	FSg84afiTaf5a79XJ9Q5qAXzDzuLtlalR44eVWRsxCJqUce9EnMCYOI3hMr/FuTBKzA8TuZ/5pa
	DdMfpmvDXcOJi86cSIDPn2ZqpQoR6ykipeeRQyWQY
X-Gm-Gg: AYBFou0PrSSt1ujpajpximlaoA8I3sZOZxvxoSu27d8XvN+ij16NyxDTXH/qWcdUJfx
	Y2l0heAYbOWcOTJEtVNxzKf4lyA65ZO5+rR07IfnhU0br9LKR8zb0n0gRfYweLuisbx0lqEIhS0
	xgSByy2GOrzU3OzOGQg+LaUTC7cEVnh3pFlcUmcjw43pQJHal6V3raNqMK8hzeNlClCkoxYyGzI
	SBz4uR1+HYu3Ru8hTmwCnELoYXHABYC102FVTdfWgpRi0Gn9paePWxi9nGk+Do0ri6F5cB4BsnM
	PcijJ414BCaWNbmt6/XSyVlrMl1XPdyxEN4TZNLOgo8GItmRlhjz+x+YbintGDzT4uIbMnKpijG
	YBbL7Vq7sHQ==
X-Received: by 2002:a05:7022:f50a:b0:17c:393d:a0c8 with SMTP id
 a92af1059eb24-17c393da495mr248774c88.5.1791890209700; Tue, 13 Oct 2026
 04:16:49 -0700 (PDT)
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
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 13:16:12 +0200
X-Gm-Features: AclHuK_P6PU5CrwSXdVV6i-xG77HwukstjFkP0Kjvw_NwxgzqD24Q_xKBYjksY0
Message-ID: <CANpmjNNu6VEXtr5zUWAiAP4rPiM9jgE-1ai91+Fpxg2ABeKYFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 at 12:32, Miguel Ojeda
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

But I take it that the series above is not yet merged?

So I'll keep the previous interface for my test to avoid introducing
conflicting patches.
