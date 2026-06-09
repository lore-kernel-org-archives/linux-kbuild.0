Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DD61F30BB
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2026 12:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008987; cv=none; b=pug8uXM10PxVVIPIgVzdbL0Ee1wXSEDi9blZOPqYoA6Wwq93d69zEXKHHjzTvA5wg91q3Y7rnIL/b7AhYNaZ/PVBFXS7p/LTuCptOjkkMC6aYfC4nM0HQaG0Hv6QhxODuWiupAS3VaWzk6oUi2JIIPboAKePW6gDIcbucJ68TYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008987; c=relaxed/simple;
	bh=XkAcUw/F6WpxG5TIMigB4KCs7H2QFh5WueaHsJwEGCU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=skkceh3iQrL0LHS3EkohkfJgvP9w0A8q8MT/SfB8R9dAd/IbTXiQiHxOCkqR1F3bnn/y8mMtRjuaa/WA/mZTTJT7tlk6OG76ZTgm7q7Q9jIQtY7+1i/63rPckhFjwSuhkt7xhmkorP4Zwd/e/hJ3SVjD1IJU+HpDq6Z/gat/g2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RCPTTBiP; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RCPTTBiP"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6913ff0f1f7so4777481a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2026 05:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781008984; x=1781613784; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JOdxU++C7orsROtXy6rFJqw8HeOFrENXiHCvhnbwKRM=;
        b=RCPTTBiPhzrwVSvIUc04einUleTbwhHNUDkQrfPCEoxliNsxYxNZCk3bAn2Q/wnw8H
         e7NJosI0gFqClDhQklpX7hc9kBUjdVA4A8HdOWw4nioskP+93Gu+lK6L/fVdsEPJa+MR
         3ZTPeONujPTeAKSTGDi+zEFuDj5ubNwPhFOJs06578RWZXPc+16ROhJIs3iEqEIAqaTD
         KH1qngPvBaGgMkTw23ZsX3xTUSQYtqk+aZgTy1y/rPU/lm5PKQ/3Rm/5a049Ghgm3JWm
         wvQBr+5BuP3iTl/x1NtMnv1/jI4lz61WrjUQa1k4HHNfW9PNOTGJ99zacqKJ6vWcf+nB
         HEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781008984; x=1781613784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOdxU++C7orsROtXy6rFJqw8HeOFrENXiHCvhnbwKRM=;
        b=aulaJryUlNhYfrS8Y2ATMryTrjZOsSm11Hsqs98GgKUA8UEy+A0y5JP05bwyVxn8nJ
         FcA4tjbidlZWEEM5VBT3oMGxc09lUXZe01vzoQSsGDlZa8PnBQwzkjw+OSKO+WnlREcP
         682xI731htHXP7XBzWEruKtiKD3LpdyvIsDGbAoYnJF/n4wFJT6N9fSDdCKNcugkqINB
         4RZD0E7Ibb6HXy011DtqomQgDmRhzoCa+KQvSHOWJDy78YkqadJeZE5yhxP3cENaDoPu
         h79fYbd9hdAff+RymikgjdhgxrJ+C7S88lk+BCwGODebsOI9ci6OscFi4vr7szdlMGCz
         Mmrg==
X-Forwarded-Encrypted: i=1; AFNElJ8bJI2NowFKSwjba9kq6DIMSDTZA93XYjmlu71HHu38lAvBj+Ij7qbqM9AuOeouDVwl81qZ7QTco0jfC1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVVsH37eIZb7aq8jVuLc3gAfowJMSmEWepzaGYzfdEeSuJpfGg
	VnsgCKWL+zs3kNi7jFszKhpIpuu8WKurQ/Bd5XKPLKXkRqyPUwP7mJwNxCmPVPh9GPi8Bib6m29
	NF8yQH0JjBE2T1ifPzw==
X-Received: from ejne20.prod.google.com ([2002:a17:907:24d4:b0:bec:16c4:606a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:60c7:b0:bee:7b51:8fdb with SMTP id a640c23a62f3a-bf37096dc5dmr634102366b.13.1781008984021;
 Tue, 09 Jun 2026 05:43:04 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:43:03 +0000
In-Reply-To: <aigFQcq3JHtdpsIn@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260608141439.182634-1-ojeda@kernel.org> <aigFQcq3JHtdpsIn@google.com>
Message-ID: <aigKVysaNhloK9bS@google.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Jun 09, 2026 at 12:21:21PM +0000, Alice Ryhl wrote:
> On Mon, Jun 08, 2026 at 04:14:19PM +0200, Miguel Ojeda wrote:
> > This patch series introduces support for `zerocopy`:
> >
> >     Fast, safe, compile error. Pick two.
> >
> >     Zerocopy makes zero-cost memory manipulation effortless. We write
> >     `unsafe` so you don't have to.
> 
> I tried applying this and using it with Binder. I ran into one
> challenge, which is this uapi struct:
> 
> struct binder_transaction_data {
> 	/* The first two are only used for bcTRANSACTION and brTRANSACTION,
> 	 * identifying the target and contents of the transaction.
> 	 */
> 	union {
> 		/* target descriptor of command transaction */
> 		__u32	handle;
> 		/* target descriptor of return transaction */
> 		binder_uintptr_t ptr;
> 	} target;
> 	binder_uintptr_t	cookie;	/* target object cookie */
> 	...
> }
> 
> The problem is that when the union contains a handle, there are 4 bytes
> of padding in the union. Currently Rust Binder handles this by wrapping
> the uapi struct in MaybeUninit and using MaybeUninit::zeroed() to
> construct it, ensuring that even if padding is present, it is zeroed.
> 
> However, this trick relies on unsafely implementing AsBytes for
> BinderTransactionData with the safety comment being that the MaybeUninit
> actually always contains initialized data.
> 
> To translate this to zerocopy, I'd have to do this:
> 
> unsafe impl zerocopy::IntoBytes for $newname {
>     fn only_derive_is_allowed_to_implement_this_trait() {}
> }
> 
> One fix could be to update the uapi header by explicitly adding the
> padding, but that's kind of awkward for a union like this, since I'd
> have to do it like this with an extra struct:
> 
> 	union {
> 		/* target descriptor of command transaction */
> 		struct {
> 			__u32	handle;
> 			__u32	_pad;
> 		};
> 		/* target descriptor of return transaction */
> 		binder_uintptr_t ptr;
> 	} target;
> 
> It's not clear to me if changing the uapi headers like this is even
> allowed to begin with. It's a somewhat non-trivial change.

Hey Greg,
Do you have any input on this from the C side?

For context, zerocopy is a tool that helps convert raw bytes into
structs and vice-versa. When I tried using zerocopy with Rust Binder to
see if it helps there, I found that zerocopy is flagging that Rust
Binder copied a uapi struct containing padding into userspace, which is
of course dangerous since padding on the kernel stack may contain data
we don't want to leak to userspace.

Now, there's not actually a problem today because I'm using another
strategy to ensure that the padding is zeroed when copying the output of
the ioctl to userspace, but ideally I'd like to switch over to using
zerocopy.

How is this kind of thing usually handled on the C side? As far as I can
tell, C Binder handles it by just being extra careful like this:

	fp->binder = 0;
	fp->handle = rdata.desc;

where fp->binder and fp->handle are fields of the same union, with
fp->binder being 8 bytes and fp->handle being 4 bytes. The first
assignment ensures that the extra 4 bytes in the union are zeroed.

Alice
