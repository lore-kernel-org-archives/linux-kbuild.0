Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7E63EBF3C;
	Sun, 22 Feb 2026 00:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771721881; cv=none; b=qrTsZMrJwf/wyUQ5yPPwKtjTq/CQskX+nCOAzBkEgolpLIOJh2Lxt3yTJvVPOGAgE10nhmi5o0XFCPDZXWVrfxrbugBrIwxjwBbCECSFyR5ElKHIXrgrAq0oFypZi/c/ToJ2es6wRAb2zgNgN8AkDwCwl8XVu/w+MhRJu1kH/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771721881; c=relaxed/simple;
	bh=RjHdCb3H60kxFN78xlvYvl8mWZ1aVWHCShvhyQF/Ysw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NNipfoFkm12KGKHlrNmb0onPNfoQ5O2DMafqa3RJHG+/gBSgu+83QvVnZ6xtJurlFgBKWVL+YKGGAOPx/VB+h6Mhz8wfnLTcfXY6aK0Ep0QywpS6DXvQC3sGNSwrkDE4Vl98CTVF2NGOt5Mu8GEr/YFLb83fDIJNT+XxmSeJZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnShz1LC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnShz1LC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF23AC4CEF7;
	Sun, 22 Feb 2026 00:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771721880;
	bh=RjHdCb3H60kxFN78xlvYvl8mWZ1aVWHCShvhyQF/Ysw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=pnShz1LC+S/D97MyheXIabiDNgGI3uNW7MrEl5QBElyF6J/SdjofpOFPlGfVS2Gtg
	 509rSBIAqHCni3WTsd24LKcFH5aW1kWiSNVcGD0HwPrTv1eUXfyeEFRwnFcpGfOk0w
	 8EaGq27Nob5GNm+yroNqySTS8GAcystCIXP9goS00YQRInW8dy+HPZIEhTPqL0d0+P
	 C8x4ej+Ue5Ebcc81iW/eL9oXlh4mRJqlBVoFQEFFzkZCxId5WbCsxnwZIynxPtyY0r
	 cGKTPrQqU5eYLKW+ObwsXJye1QxTsmxyEEAtGb10DfQK5D1e77uhCDFId9hVACQ+dF
	 V70rN6bxkkDAA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 01:57:55 +0100
Message-Id: <DGL2ZLIOLLS9.1VOJGTUF0J091@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: add projection infrastructure
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-2-gary@garyguo.net>
In-Reply-To: <20260214053344.1994776-2-gary@garyguo.net>

On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
> +#[macro_export]
> +macro_rules! project_pointer {
> +    (@gen $ptr:ident, ) =3D> {};
> +    // Field projection. `$field` needs to be `tt` to support tuple inde=
x like `.0`.
> +    (@gen $ptr:ident, .$field:tt $($rest:tt)*) =3D> {
> +        // SAFETY: the provided closure always return in bounds pointer.
> +        let $ptr =3D unsafe {
> +            $crate::projection::ProjectField::proj($ptr, #[inline(always=
)] |ptr| {

By the way, how does this avoid `#![feature(stmt_expr_attributes)]`?

Cheers,
Benno

> +                // SAFETY: `$field` is in bounds, and no implicit `Deref=
` is possible (if the
> +                // type implements `Deref`, Rust cannot infer the generi=
c parameter `DEREF`).
> +                &raw mut (*ptr).$field
> +            })
> +        };
> +        $crate::project_pointer!(@gen $ptr, $($rest)*)
> +    };
