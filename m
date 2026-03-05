Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EDF375F6D
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707805; cv=none; b=D6GJUe8BhEFFSLSo6jLH7kisQE8OC+pNKpASML1qkKLwR8QiglkWntJsM1B0ontwqIMJOJ5fsi5JBKnE49wT7RX9kp2+yaRGUnoTK2Swr84gtV20SM0WcUZl22FVTxHqVy5px5MDOrm3BwwSK3eFbWSltdAiKSN73B9HOvkIxvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707805; c=relaxed/simple;
	bh=4x2ZjEIWiZI0YZvasYAmttRlyXYPSnFjlzJ7NajwGFc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q0eiI1oLt5u/QK+U/70QVnGonFA8Klyc4th2YhOkb1t6nx3FX6xIQfLRG6hfJJBo8cNXBLRxhENKx7yvlAMLgHUo6JG/PwjqOAaCjqrVKG4RD6ChThZjdk/GG+Du905F2XLnh41V8zOTpZLtdQ5gfzyBdWTpsyasgs66PfpJYlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bz/YHTsT; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bz/YHTsT"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48379489438so77083485e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 02:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772707801; x=1773312601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4x2ZjEIWiZI0YZvasYAmttRlyXYPSnFjlzJ7NajwGFc=;
        b=Bz/YHTsTTP/rfNAHWJbvLO0RHR77niRUY9uhX9aCetB4N5Q5HtJpeSrkRIPXjtXc7S
         wzDxOwnn8pKpHJNZmelvnYCPrXxAOfAWUlPx7B/skKQJ1v6kOZbIdqlUAtTFptvnh+oP
         9dLz3rp7D8j8bBMYaJ0GnmCNyl2N76ozfl3yYUBAE1vsJlgX+EzMlZz28xofmbYAidNF
         rGzwI1n04nmG/14ohcVl3X9BMtCok1TxFXRbM+EKqEtJc5YkQpYO5EapCxD+DrYnN3JC
         jWXHo4HY2HmyM2HZp0tgOYHXDETeUCXX9UXQXI08pLSVSMrEKrETGmtT/X69FMPQRIDd
         KCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707801; x=1773312601;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4x2ZjEIWiZI0YZvasYAmttRlyXYPSnFjlzJ7NajwGFc=;
        b=J0GS3xiY87XWfi3wkfjfB/f+UrFIBs4m7EiUdlK0eKgVCaRxsNwJ60yCMIpdaf5+0B
         mjP4NN4S79ABax/YWRxlhFkgE2ficlkOPzDmoVDNHob9VlNgsCCkDf18MHfeG9SQ9Qlv
         4KchVdUU7fSP70R+AQdrJsKojzn4bLTnnTqPc1s3yE4xOPRZCmxqiSev31jCE76GoNwJ
         IwhG7MVXOkOltpbXyK31jgMfzL+IMcQHCn8Sm5033oTt+xfyZZyMUhbPP0PGQ8wyS+KF
         c8Y72bVUw1wWcInZGR2v276AqxhN2Uu35PvHTfc4xZ2X/NnBd1uArE3dDPTTAAcUnALj
         E2lg==
X-Forwarded-Encrypted: i=1; AJvYcCXkaG0gMf0BhtTRwq6/eUSGn/W7oFFnukryUEavsBcCmjAKZw7y9HG2xKjjbXbCTcOyAkadKOhIR9bZDIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaYXIurJbYa81KGzSPcvP+oOPyCpJ5wHgF5Oi/aByDfDNU//GT
	ehWYn86kuhxhDek2CzZjUz0eWI7M0D4NWdm9ui5UAd8lYMYWwtCt5WyW/6sEZXA/qLDKhlBZmEC
	6EkEU2/ocegDLCvzhyQ==
X-Received: from wmxb15-n1.prod.google.com ([2002:a05:600d:844f:10b0:480:4a03:7b80])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:530e:b0:483:887:59b0 with SMTP id 5b1f17b1804b1-485198be61fmr89934855e9.35.1772707801361;
 Thu, 05 Mar 2026 02:50:01 -0800 (PST)
Date: Thu, 5 Mar 2026 10:49:55 +0000
In-Reply-To: <aZ3A_KBWFJES0d_t@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
 <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com> <aZ3A_KBWFJES0d_t@google.com>
Message-ID: <aalf03M58WisOEZ-@google.com>
Subject: Re: [PATCH 0/2] Change Rust Binder crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 03:17:16PM +0000, Alice Ryhl wrote:
> On Tue, Feb 24, 2026 at 02:24:59PM +0100, Miguel Ojeda wrote:
> > On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> > >
> > > Currently the crate name of the Rust Binder driver is rust_binder_mai=
n,
> > > but I'd like it to be called rust_binder instead. This affects e.g.
> > > symbol names in stack traces.
> >=20
> > We discussed allowing to customize crate names years ago, at least for
> > dashes vs. underscores, for matching C names more closely and perhaps
> > other needs.
> >=20
> > Back then, we decided to keep things simple to avoid confusion (i.e. a
> > single identifier used everywhere the same way is simpler, at least
> > for humans) and to avoid having to deal with those dual names
> > everywhere (e.g. adding workarounds for rust-analyzer here).
> >=20
> > I talked with Alice about what she needed here -- could we rename that
> > source file to just something like `binder`? That would avoid the need
> > to have a custom name, so everything would still match (symbols,
> > source file, object file...), and it would give you even shorter
> > names.
>=20
> Sure just renaming rust_binder_main.rs to binder.rs would work too.

I realized that there's a much simpler way to allow crates to rename
themselves: do not pass the --crate-name argument at all.

Because if you do not pass this argument, then rustc will use the
name of the .rs file as the crate name by default, *but* if the crate
contains #![crate_name =3D "..."], then that will be used instead.

Do you still want to enforce that the crate name always matches the
file name? It seems unfortunate that it's currently impossible to create
a Rust module where the .ko file and crate name is the same, unless no
extra object files are linked into the module.

Alice
