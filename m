Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28E7359A8A;
	Mon,  2 Mar 2026 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478131; cv=none; b=SVHsY//q9nFu1D/ui55qaFZtlxXAa205WIIyUt6W8f5MmMj9nu2oaOGrC6m319YVKHvdM3nBEAcFTOpM+usNVALciya30xhRy15Fho7Gynz1BiMbudp6MQgVQXIgWN9wavK+WvClZ/omQUxZwST//JRSCw9ZyY37ZAvZDl5LxtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478131; c=relaxed/simple;
	bh=eDACkq+WhQ+eReuSdkI6buH3D3FbP8BKMGoSHQTq2pY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iyF0Iw4E5Wp/mpdGGoTpUor+0p4gH8V/4w1hUob5uFA/fs+pNMm9UBG59Urw6rw7zuUFS8jMRYKhbHYi+oTQ5ameOgtY7VEsgYjh8E3+HG7HYn/X24ypL00IGXv9y1L4etP1E61yZ0ZF9rNEG1Kyk6hDY0lT+sLzr0LJpCGkqC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uL9oa3Ep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL9oa3Ep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91635C2BC87;
	Mon,  2 Mar 2026 19:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772478131;
	bh=eDACkq+WhQ+eReuSdkI6buH3D3FbP8BKMGoSHQTq2pY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=uL9oa3EpXE6LptWFxCz7QFRqdS4Cky62A5u9kfwgiTdMLh6UjUIPuXjU2uotYsyID
	 PYaPxqKlScmoymPqEHC81TGSYvalmjFj/uj5BTmyjyhcHET63DhDDfXonSsrDqFtq+
	 P1sYaZDkNwCUMPV7HAFtThoatPmq96TNUxeRuO8na/x2OSU+4RBqU/uHbfUAe9PyOY
	 iHzzVF1eKzD2oTbR9Ir2BJsx3FiXtWj3V3V9jWJljaMtvLXteIeel1B2fhsOborNZp
	 oc9yRnWVvoBw44GOjS+MDWmPgMs2Exg2jr5RqJ2L9OUstuN/qTC1KbiehN49Nr6Nnl
	 09MIoq3uO/ucg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 20:02:07 +0100
Message-Id: <DGSJ22HTG3LE.3GD00J7KJHBPV@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] rust: ptr: add projection infrastructure
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302164239.284084-1-gary@kernel.org>
 <20260302164239.284084-3-gary@kernel.org>
In-Reply-To: <20260302164239.284084-3-gary@kernel.org>

On Mon Mar 2, 2026 at 5:42 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Add a generic infrastructure for performing field and index projections o=
n
> raw pointers. This will form the basis of performing I/O projections.
>
> Pointers manipulations are intentionally using the safe wrapping variants
> instead of the unsafe variants, as the latter requires pointers to be
> inside an allocation which is not necessarily true for I/O pointers.
>
> This projection macro protects against rogue `Deref` implementation, whic=
h
> can causes the projected pointer to be outside the bounds of starting
> pointer. This is extremely unlikely and Rust has a lint to catch this, bu=
t
> is unsoundness regardless. The protection works by inducing type inferenc=
e
> ambiguity when `Deref` is implemented.
>
> This projection macro also stops projecting into unaligned fields (i.e.
> fields of `#[repr(packed)]` structs), as misaligned pointers require
> special handling. This is implemented by attempting to create reference t=
o
> projected field inside a `if false` block. Despite being unreachable, Rus=
t
> still checks that they're not unaligned fields.
>
> The projection macro supports both fallible and infallible index
> projections. These are described in detail inside the documentation.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

I have a naming concern with `ProjectIndex::get`, but that's only used
from the module & macro and unlikely to be used from the outside. So
renaming later should be easy.

Reviewed-by: Benno Lossin <lossin@kernel.org>

Great work :)

Also found a typo below.

> ---
>  rust/kernel/lib.rs            |   3 +
>  rust/kernel/ptr.rs            |   3 +
>  rust/kernel/ptr/projection.rs | 294 ++++++++++++++++++++++++++++++++++
>  scripts/Makefile.build        |   4 +-
>  4 files changed, 303 insertions(+), 1 deletion(-)
>  create mode 100644 rust/kernel/ptr/projection.rs

> +/// A helper trait to perform field projection.
> +///
> +/// This trait has a `DEREF` generic parameter so it can be implemented =
twice for types that
> +/// implement `Deref`. This will cause an ambiguity error and thus block=
 `Deref` types being used
> +/// as base of projection, as they can inject unsoundness. Users therefo=
re must not specify `DEREF`
> +/// and should always leave it to be inferred.
> +///
> +/// # Safety
> +///
> +/// `proj` may only invoke `f` with a valid allocation, as documentation=
 described.

s/described/describes/

Cheers,
Benno

> +#[doc(hidden)]
> +pub unsafe trait ProjectField<const DEREF: bool> {
> +    /// Project a pointer to a type to a pointer of a field.
> +    ///
> +    /// `f` may only be invoked with a valid allocation so it can safely=
 obtain raw pointers to
> +    /// fields using `&raw mut`.
> +    ///
> +    /// This is needed because `base` might not point to a valid allocat=
ion, while `&raw mut`
> +    /// requires pointers to be in bounds of a valid allocation.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `f` must return a pointer in bounds of the provided pointer.
> +    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut=
 F) -> *mut F;
> +}
