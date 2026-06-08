Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D13DFC9B;
	Mon,  8 Jun 2026 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931398; cv=none; b=BY0rcQdeSHViX5sjgwerfNHgvr8qOqlp+IjdZtxtXq+uHKnw6BoCSfwoxnak3FP6Je32E8YK5xG3D3hS4GRzxeDc4FKJIYMYBtz7B8XVBGdeyvy6eeGlVyvtteo1hrvti3UqjqXn4ERWiHLGLHSq3p3knQzwHzMibNJyujq5Yus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931398; c=relaxed/simple;
	bh=i4VWbKpflRvNue6Pc4vgzc8OpCCYkmlO6UP6BH/5aVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCt38QcluQjq+XuNR5n+9CUZpoFXvqP7KylKX/hjBS7y4/yNt9XnSERU/i5uJ8FzQIUmuMKy12qDyrNfRVDEP65M8CZrH08UMckIGCaeKy9Zk6Gv3LwOfUb8y4YmXhofznlgtuydzbyiMRaOGozFlC0xWu9cCUjCER/wevNClUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDZaEyhY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDZaEyhY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4B81F00893;
	Mon,  8 Jun 2026 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931397;
	bh=z6U54lj9DWyAFuT8Xuvt74123ocVh0v9xPup1wgFGSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eDZaEyhYADo6Gv9V7KAqnBaMfVU345TjiZrl98hqdKBdS4B3iPI8ioKe4QVNijcrq
	 ADOW7UP51HDPfXhgigUHDqrDrWZOElqOM8yijO6aZgwLSoz9T6+lvmybEMGw/sSB4L
	 MFNLfJy85mrlfwc/OfJcKx0xden3aJuDs8qjmaaVzbG5MPxeTTNjkmq0a6N8aXw0v+
	 CZ3VaUziG42klk3HNZ/wYyu5dp0122U1YKlm1asOkYPG+bnCBSUm/hizvcPfVM0Ddg
	 N6+hKced2Colc+wq4lNGXYlhHxDV7CCxeb0E9cODYUnyZqF8Zw435OnNjmq1SvrV6N
	 1Filx51I6YS5Q==
Date: Mon, 8 Jun 2026 15:54:27 +0200
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
Subject: Re: [PATCH 03/18] rust: kbuild: remove unused variable
Message-ID: <aibJk8rja-753ouQ@derry.ads.avm.de>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-4-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602172920.30342-4-ojeda@kernel.org>

On Tue, Jun 02, 2026 at 07:29:04PM +0200, Miguel Ojeda wrote:
> Since we are adding one more proc macro crate (`zerocopy-derive`),
> we are refactoring their handling.
> 
> `libpin_init_internal_extension` was added to mimic the setup for
> `macros`, but it is not used, since the extension is expected to be
> the same.
> 
> Thus remove it.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>
