Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F02E2D3220;
	Thu, 29 Jan 2026 22:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769726438; cv=none; b=alo7Qw6RA9WaHl3NJZOne6TIoIdeaQfdMF5iD35si+GT/GO7IHPXPEqmY207LHeJm+EFd1eaWfr+aBjQJu8Lb150bIgoDHazgcPRsvi3Uy03MFlzr2qsbcgFktiRlfIK/ER5iQBSmS/+yro54weGJ0y+OzzgjHifBHSqY3NSklc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769726438; c=relaxed/simple;
	bh=xtSi5LDy2VLevngpWtUgTscV+hk8mKNOyyqkZOYAcq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GN6H8E3+PRCFrPLYuFfjA53bvbDdy1FYajjpvH1mSLTjqMO9AIJsqOOhS35ja4o0cbOYfM5egaVHsXBtEC+F7T7HQk5VMZsxsTqibEyglTES1PL+jW7RjGkjJK12xv/tYIlyHVYugmIRXh3P63pofKqFD3sxUx7v1WnNpwf/9hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNnKmAOu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNnKmAOu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6116CC4CEF7;
	Thu, 29 Jan 2026 22:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769726437;
	bh=xtSi5LDy2VLevngpWtUgTscV+hk8mKNOyyqkZOYAcq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNnKmAOux33eR/V56A5vvkVt0BxmZNMnOERd/zeSKT/UPl5v7Bym72Ae29UxpcHUn
	 hTiK/SIDZQbRLl3UTwb9/OQN/i/V2jHbI9XhUKN3xumfO3ybWS54pVEbVWept/2RXw
	 GOKFdxbTj5thLyQ+ToVj9ZMn+PGZtw6YtQ+1Pno/4tn8LUn1xHcfcw6jjBHzazav5T
	 48Qaw6CNGolmwaA/CGS+xanT0SNxhWWHaJRnw9NGcc0gO9XvEVu/CXPaQYUFQ0QuXT
	 GK20nHZz6zVOC8OLDK+TThVdE44HLHC5n80zT7yjH9PGl+GXNriwj6+xcjpAessAtL
	 fCEmD27SI8E1A==
Date: Thu, 29 Jan 2026 15:40:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Cc: Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Jason Montleon <jmontleo@redhat.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
Message-ID: <20260129224029.GB844102@ax162>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-2-2ac86ba728c8@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-gcc-rust-v5-v6-2-2ac86ba728c8@isrc.iscas.ac.cn>

On Tue, Dec 30, 2025 at 05:47:55PM +0100, Asuna Yang wrote:
> Generate a friendly fatal error if the target triplet is undefined for
> bindgen, rather than having the compiler generate obscure error messages
> during the build stage.
> 
> `BINDGEN_TARGET` is actually defined in `scripts/Makefile.rust`, but the
> file is included regardless of whether Rust is enabled, so perform this
> check in `rust/Makefile` to avoid breaking targets that do not yet
> support Rust builds.
> 
> This piece of code is copied from `scripts/Makefile.clang`.
> 
> Before this commit, error messages might look like:
> 
> error: unknown argument: '-mno-riscv-attribute'
> error: unsupported argument 'medany' to option '-mcmodel=' for target
> 'unknown'
> error: unsupported option '-march=' for target ''
> error: unsupported option '-mno-save-restore' for target ''
> error: unknown target triple 'unknown'
> panicked at bindgen/ir/context.rs:562:15:
> libclang error; possible causes include:
> - Invalid flag syntax
> - Unrecognized flags
> - Invalid flag arguments
> - File I/O errors
> - Host vs. target architecture mismatch
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
> ---
>  rust/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index 2603b34f9833..37b4205afb70 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -385,6 +385,12 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
>  	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
>  
> +# Because scripts/Makefile.rust is included regardless of whether Rust is enabled,
> +# we perform this check here to avoid breaking targets that do not yet support Rust builds.

This might read a little better if it were

  scripts/Makefile.rust is included ..., so we perform ...

instead of

  Because ..., we perform ...

or at the very least reversing the phrases

  We perform ... because ...

But that could just be personal preference.

> +ifeq ($(BINDGEN_TARGET),)
> +$(error add '--target=' option to scripts/Makefile.rust)
> +endif
> +
>  # All warnings are inhibited since GCC builds are very experimental,
>  # many GCC warnings are not supported by Clang, they may only appear in
>  # some configurations, with new GCC versions, etc.
> 
> -- 
> 2.51.1
> 
