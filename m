Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D73DEAD3;
	Mon,  8 Jun 2026 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931395; cv=none; b=ncJLDMwLuW24RnlXRedydjkNCnsyBYcwSe2WhTRCd7zMf2PgxBRJa3sLqTdHPSztibMXNAhBCPncHiSV3/0X5TD8Tx5GE4pXUlHzRiwN7CXlTl825cqHiWlkDGZJLaat1f/vtQ+uSeUft6MyxfY5srGTjl4xgDXLr5J5vBFQMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931395; c=relaxed/simple;
	bh=YmhHaDJpkbSTIn6phIZg6070j1Q5e3L6vXOtYrAUQts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bv5YxbfldmnW4QH7X6fQSsxM0XbzycdhQJp6mp3xOMxhkLZRxcCLoFJXGZ9s3uuyIeX6sKSne1y9fWsP+QfYs4smda0Sev9/am1B9gFhLIf8eVq4fact7wKeyPrI7LinFxQMviibpwcbL8YDeYpXMEEYw4uddrd+dAlHo65q1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwTYgCn3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwTYgCn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B59C1F00893;
	Mon,  8 Jun 2026 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931394;
	bh=zCavk06X8RVMcioqZ27dkbO1RB8YphojkNNS0E4toHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GwTYgCn34V+1AWXKY6Xhv9K3AgRefQgCim4YOvTM8D0LJAwXojFZCr+mUVGiEAqhR
	 cJcKFkzfFjUiIpA33W4uTbRyzE0ozoIKJh8Dyy1uEA930DoVgjJ0euyhRUxX4Vth8C
	 xQWqs+2joCjzN0jUhSzNecbADJzY3PFPkv17Sap1fXhP6mOvdn1qtPZQvTMHaaoz4h
	 DB+A1kTl3Og6vf8YjHTxDGdFOV8sy1E+RdfngLEbau4i+jWadSIiRpPflLZXc/dsa8
	 9WKl0oFVYBsu8oIO4a2hxc+gUKDLAu5yZnX5k3HKjWlK1dX9CQfZgaqZBd317WQaY5
	 tUFMz8+Eeo91Q==
Date: Mon, 8 Jun 2026 15:51:53 +0200
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
Subject: Re: [PATCH 02/18] rust: kbuild: show the right
 `quiet_cmd_rustc_procmacrolibrary`
Message-ID: <aibI-ZUQ99SA1ssB@derry.ads.avm.de>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-3-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602172920.30342-3-ojeda@kernel.org>

On Tue, Jun 02, 2026 at 07:29:03PM +0200, Miguel Ojeda wrote:
> When Clippy is skipped, `RUSTC` should be shown in `quiet` instead of
> `CLIPPY` to be accurate and to avoid confusion.
> 
> Thus do so, matching what we do in `quiet_cmd_rustc_library`.
> 
> Fixes: 7dbe46c0b11d ("rust: kbuild: add proc macro library support")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>
