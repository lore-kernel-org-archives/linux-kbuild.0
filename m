Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5A83AD538;
	Thu,  2 Apr 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128084; cv=none; b=ZmV7M/3r8iBrbIpIEyUB8hBOr/c1kpGmeF5v2IIvWdmfQre++kw/tj4qdrvPbgRCSIILraEtBstOp2B4D8/84Dc+MVeHVLWchOIRfqudqlFyetquWjJ5rzhuw9qtmCBpoSX9omcjSQi9Xb9ZYdrRQFB1gcIcyyFiBIWdQWxDFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128084; c=relaxed/simple;
	bh=HKSyNeUFKSDjim+c3VtsiyBL2Wc3W0yW/3ajIY7AdYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWGLtyqt0jwK9V7IIt2BJr/t58CPmwpqQBRnKBiIthKJDu7hLq0SxB0wKny+WB7hunAJrLAUa1SbTgI5jCvEIOO4bCpmhYfPdz4tO7NNuUibweXNmEnDImO+TC3QKcJ9P38YrkFoy2xPcfhUuztf8AVLRNhvc9/7H4LDn0xANqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sY0GHKJy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sY0GHKJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07A3C116C6;
	Thu,  2 Apr 2026 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775128084;
	bh=HKSyNeUFKSDjim+c3VtsiyBL2Wc3W0yW/3ajIY7AdYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sY0GHKJyymLBaNjEHjwSY1SML6TYcxrCX+81IvD63cHzBxW68TTeHRYlRkoWH8wks
	 0Yys6j2d31MPBvQ/1Z0a4IiA2WAl1ExUvIIRzZmTuOX/gGK0dnk9weSeDAOAhlWkTv
	 11d49EUPEOhgZUWviYqK8ECOzd5seOzRctcvvmJk=
Date: Thu, 2 Apr 2026 13:08:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jesung Yang <y.j3ms.n@gmail.com>,
	Carlos Llamas <cmllamas@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 2/2] rust_binder: override crate name to rust_binder
Message-ID: <2026040255-clump-hypertext-e242@gregkh>
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
 <20260402-binder-crate-name-v4-2-ec3919b87909@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-binder-crate-name-v4-2-ec3919b87909@google.com>

On Thu, Apr 02, 2026 at 10:55:34AM +0000, Alice Ryhl wrote:
> The Rust Binder object file is called rust_binder_main.o because the
> name rust_binder.o is used for the result of linking together
> rust_binder_main.o with rust_binderfs.o and a few others.
> 
> However, the crate name is supposed to be rust_binder without a _main
> suffix. Thus, override the crate name accordingly.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/rust_binder_main.rs | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
