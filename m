Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932953;
	b=adbzxjwmTe1XjncHI8G9kkN0NOeG0EJjPdl3RqbxFO8EhBPvNsHdDNkJiB1IB7/1/gyj
	 KHt1+5PL8waY6oFBozhaJecIWoBZBofrP6XdlyKl75mezMFQq5DPKG+UkxcKRXWd2WBiC
	 UWZ5PSyLLHWRwPMKCXmapz5wJPs418ptat7a5s7FhxDXllf9p8KOVZpTasIAghoYCr5vP
	 enMSguEYNqtMSRZYmgMSsifAYtIRREK5xXOE5lSVMBiWGBQ4wCKsrsu1o2ouXaxKWaVsB
	 4kH6W6WhJXGJ4WUvIgA/wOl8kIK+KMEe75xoaMNJpu4rRRWI+Z/YVObDqh85AE2pudQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932953;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=thdVigjkFcdB80wzco5t+F/NbNYFFWE5g57QCgD+R6E=;
	b=DqmkvkEeoB5AuvermwbODjZicZCgIl/x49PT0nauQhyU4RZmjueOqPtFM2mYXNgF5yyV
	 1+Jpmf9fKN1N8hSSHt0/6aFZ2WoBxKcy83JsKPYmo+mgdoECvA4tZ0emnmV3jN+oqMXzV
	 cLihEBECUPD1Et3NRDA+dCX2np8jCFkaZLWvSQZXZDkEjcabhB7WGiXLhSXpqrBkJB1TD
	 KGAPtBH9/sgPNTTwiBMnXskZCwnDcokSXWNvErPuHdPaBKqnCJ+aygaXxXMsCW1tPbBB8
	 jJkDO32kYRQ2wcHBG6g39CZAdJF48LZR/c1L75EvARLVG28xSVZmGwN3e1uAcHR53Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XozpImpV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C25606A328;
	Fri,  6 Nov 2026 02:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XozpImpV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05BA1F0089F;
	Fri,  6 Nov 2026 02:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793932953;
	bh=thdVigjkFcdB80wzco5t+F/NbNYFFWE5g57QCgD+R6E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XozpImpVirxN2nQ0Gze/2lk0g6nWV1VMVKP3BUJ4aSG2MpvW9JUxcrT8dAoJEE05W
	 eazUQFG8qnK1wF9niviEwq2k9qrGZO5bNbnxy7+CpPHAdbs+fFXfw9B0di2vpBW+nu
	 4PpjqrWejoKEE2N47Jv3QYrwRPvrLyNFeUccbDEhWnrgICxwT1kuBK4yaj31WEBdoc
	 6zJTtntr2zY62ZubKz9pGACft1eNz1CDDSh5j5zGolsZfLAOMupCTuLbwnCgeZ+QGa
	 OYwpX2U9j4uyg10UzuhxWHewcMRTNeBtKfNJ2qlJMSloz+GTTy99eCu2nJeNfLU7Gh
	 DaEYoUvUCXZbA==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline
 helpers
From: Nathan Chancellor <nathan@kernel.org>
To: Jenhao Chen <jenhaochen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Matthew Maurer <mmaurer@google.com>, Rong Xu <xur@google.com>, 
 Han Shen <shenhan@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261031030807.4101384-1-jenhaochen@google.com>
References: <20261031030807.4101384-1-jenhaochen@google.com>
Date: Thu, 05 Nov 2026 19:42:18 -0700
Message-Id: <179393293858.309869.13707261529438979905.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2638; i=nathan@kernel.org;
 h=from:subject:message-id; bh=VGJ2ubzK7WAUjZ5bjU8xEGxhCY1jRXw6CJzzqoz4ocw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlv7Sayqc5bHtlR5mb3cYWUaqNFl5RofsFN/uLCm9suH
 i26Zvy9o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzk5ipGhl+T+moanZuli/8s
 uZmcZKm37IX9aeN7d7rSf5mUhsZ5ZzD8lT0S4rzukVd2cLfS0nnrNhp+Pup+WI5LtbNU5nHd4hN
 s/AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> When CONFIG_RUST_INLINE_HELPERS=y, cmd_rustc_o_rs and cmd_rustc_library
> compile Rust sources to LLVM bitcode (.bc), link rust/helpers/helpers.bc
> via llvm-link, and then invoke $(CC) to compile the combined bitcode
> into the final ELF object (.o).
> 
> When commit a960c2cdb19e ("kbuild: rust: add AutoFDO support") was
> tested with CONFIG_RUST_INLINE_HELPERS=y and CONFIG_LTO_CLANG_THIN=y,
> cmd_rustc_o_rs skipped the post-llvm-link $(CC) step under
> CONFIG_LTO_CLANG and handed the linked bitcode directly to ld.lld, where
> the ThinLTO backend applied --lto-sample-profile,
> -plugin-opt=-split-machine-functions, and LLD's default function
> sections. Non-LTO builds (!CONFIG_LTO_CLANG), however, ran the
> post-llvm-link $(CC) step without $(CFLAGS_AUTOFDO_CLANG) ever since
> commit 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
> helpers into Rust").
> 
> Subsequently, commit 5febf432df1c ("kbuild: rust: keep Rust objects out
> of Clang LTO with inline helpers") updated cmd_rustc_o_rs and
> rust/Makefile to always invoke $(CC) on the linked bitcode even when
> CONFIG_LTO_CLANG=y. Because that $(CC) invocation only passes
> $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) and does not include
> $(CFLAGS_AUTOFDO_CLANG) (which is normally appended to _c_flags in
> scripts/Makefile.lib), the final code generation step for Rust objects
> is compiled without -ffunction-sections, -fsplit-machine-functions,
> -fprofile-sample-use, or flow-sensitive discriminator flags whenever
> CONFIG_RUST_INLINE_HELPERS=y.
> 
> As a result, Rust crates built with both CONFIG_RUST_INLINE_HELPERS=y
> and CONFIG_AUTOFDO_CLANG=y emit all functions into a single monolithic
> .text section (0 .text.<func> sections instead of 417 in
> rust_binder_main.o and 424 in rust/kernel.o on arm64 with
> CLANG_AUTOFDO_PROFILE set), preventing the linker from performing
> AutoFDO hot/cold function clustering and discarding SamplePGO weights on
> the inlined C helpers during final code generation.
> 
> Factor out _autofdo_c_flags in scripts/Makefile.lib (preserving per-file
> and per-directory AUTOFDO_PROFILE opt-outs) and pass it to the
> post-llvm-link $(CC) invocation in scripts/Makefile.build and
> rust/Makefile.
> 
> Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers into Rust")
> Fixes: 5febf432df1c ("kbuild: rust: keep Rust objects out of Clang LTO with inline helpers")
> Signed-off-by: Jenhao Chen <jenhaochen@google.com>

I am assuming this will go via the Rust tree.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

