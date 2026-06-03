Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C620A340283;
	Wed,  3 Jun 2026 01:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451765; cv=none; b=fbC4LS6BzJz/Ibn6ZjznGcA0GkPXQEtE3T8uT0Oo4WZb6C9WyWwkuzidKxRlWP1mHkws5NSYWplpHU6kc421lCR+XyLSWSr0HnTusDIfkA36CDrJjGElnK6kWObx2VD/qSyrqChsG6xYjBTDogSWq1d2uXMXS0pM5wec0R5Tk6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451765; c=relaxed/simple;
	bh=AUIGuXhsRIC7GOq/ibNNwv74/STwwKHVWgviq29t6Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pA/ALnIh5eSMMQMYsJLLA4NLPApc9hQnQxeqGDTU0Gav9WQMCN+zN8eNFt9EsHG9iCtSlHebXsqzNa8gXOa5fA0uZW1RX9gGC/zvga2T1a+BkwoTQHNwr3UPJY6uZ/sURIa0B6DtUlHaEpV5UGxdcCzAcPLvAvGe5s0qpR3z/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckporMsu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckporMsu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE601F00893;
	Wed,  3 Jun 2026 01:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780451764;
	bh=g2nW8+I1vbywqV2lNSJrR6+k3J/+6tGsD++UMLzD7Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ckporMsudY3y+sW4Op5zpVFiV6s8aGcFVi7lTHg8Xybm5Au0tRELVYQbJ8dQXZhd9
	 4OaDu42E0uA4Jbv+EpPV7ZvbdU5R+C96opkan6GxDttQDW9D6Yt4O3JMjqt80W7c81
	 m1RxvHJTvm3a54eRfwo+EzpgbTiqk8z2kB1KQqP/0VxFmce2l/WjWoCwSMowx2DEVI
	 1bCP1/UlhyivbpuN13De9JFKS4gpRvP9KBTXfAmGKGARGIjFxhvtVrA2RBIdFSE/sV
	 OjpR2Lw2X9tW1EaNle/Z5+4u35DMTh94KkG9Nzzd2hcgGfwI37AroDlYn2eRGxMW4A
	 ojeHi/Nx1iLSg==
Date: Tue, 2 Jun 2026 18:55:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: rust: rename flag to `-Zdebuginfo-for-profiling`
 for Rust >= 1.98
Message-ID: <20260603015559.GA3013922@ax162>
References: <20260602151638.14358-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602151638.14358-1-ojeda@kernel.org>

On Tue, Jun 02, 2026 at 05:16:38PM +0200, Miguel Ojeda wrote:
> Starting with Rust 1.98.0 (expected 2026-08-20), the
> `-Zdebug-info-for-profiling` flag has been renamed to
> `-Zdebuginfo-for-profiling` (i.e. one less dash, to match `debuginfo`s
> in other flags) [1].
> 
> Without this change, one gets in the latest nightlies:
> 
>     error: unknown unstable option: `debug-info-for-profiling`
> 
> Thus pass the right name.
> 
> Link: https://github.com/rust-lang/rust/pull/156887 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/Makefile.autofdo | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 3f08acab4549..1442043da139 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -3,7 +3,7 @@
>  # Enable available and selected Clang AutoFDO features.
>  
>  CFLAGS_AUTOFDO_CLANG := -fdebug-info-for-profiling -mllvm -enable-fs-discriminator=true -mllvm -improved-fs-discriminator=true
> -RUSTFLAGS_AUTOFDO_CLANG := -Zdebug-info-for-profiling -Cllvm-args=-enable-fs-discriminator=true -Cllvm-args=-improved-fs-discriminator=true
> +RUSTFLAGS_AUTOFDO_CLANG := $(if $(call rustc-min-version,109800),-Zdebuginfo-for-profiling,-Zdebug-info-for-profiling) -Cllvm-args=-enable-fs-discriminator=true -Cllvm-args=-improved-fs-discriminator=true
>  
>  ifndef CONFIG_DEBUG_INFO
>    CFLAGS_AUTOFDO_CLANG += -gmlt
> 
> base-commit: 025fd4b4fd382112bd4489e5b4437a295934fc19
> -- 
> 2.54.0
> 

-- 
Cheers,
Nathan
