Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6112A3E3C6D;
	Mon,  8 Jun 2026 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931409; cv=none; b=d26PtBaNf/oTRmtC6ouapW057iiCmYL+z5wFnVHzDLBfJw6ZUkM2+m+HIN4PlESmgwnDLL/wj7G7ch09uEXOe8UwPUWiI/WgFjyfVb+18PPVpaFgvyPiADVwNLHxYVVv/OnOXhhg1+rKptE62ThPjpdnmYzYE5gkzY854ARUU9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931409; c=relaxed/simple;
	bh=X3JbA+JtRHLSD1LCxtviIno67RQVkmbjLRCrRLIIfaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+VGzCDZgw5vZFuDR96giETiHJUeW3GMskerzyQi7PHfDUZdcxRSrZVtcf/XNF6bF1PvBYqWrBr5PuQ7dePkyB37r42C0TLjWexzpuEm/ZWgXGaMrsjSp7jZWgWL9DEYlF9qe9akT5PY8wn+1Z9BLThGT0hsxfn2KtswG4LDyvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBqpU+vi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBqpU+vi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A221F0089B;
	Mon,  8 Jun 2026 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931408;
	bh=p1AdhZcgFvpzEbU8HK/3qByp3HTGuRUOHUqgkxSZ/U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MBqpU+viDmTfXqf2JjYDi84o3kVo7Qttku+hDIvkrWn1zfqgYPn+GxDYDRuuOZ9vf
	 DxHiG5V/hzL+a5FGeHhgiqMNKb//S0JCBoAUW59C9gtGNS63Bt6PeRlJ+FwKcVTWmo
	 aOzJxqpAGh7TTea56NbWKov9Yma5NZM2e4EIHfCe1n3VKVH+9qAbWhgex+ADav3Cmp
	 3FjK/ZFdCmgFjXclTyU5MKbeqzAlRZpjTZaZ+FP7MCpzvEmFOGuZsRJq2oACIrvBcR
	 +CGnAFJXoY2gte5iTur7T33mSWq+AuN8ZsbjUWnqcOcHAXkBefvFrZ2kOQR/xiCuM3
	 uJT5Nm3IHzaSQ==
Date: Mon, 8 Jun 2026 17:09:32 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@amazon.com>
Subject: Re: [PATCH 07/18] rust: kbuild: support `skip_clippy` for
 `rustc_procmacro`
Message-ID: <aibbLGOIfq1wSgIg@derry.ads.avm.de>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-8-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602172920.30342-8-ojeda@kernel.org>

On Tue, Jun 02, 2026 at 07:29:08PM +0200, Miguel Ojeda wrote:
> Certain vendored crates, like the upcoming `zerocopy-derive`, do not
> need to be built with Clippy since we `--cap-lints=allow` them anyway.
> 
> Thus add support to skip Clippy for proc macro crates.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
