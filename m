Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3C43CEB8A;
	Tue,  7 Apr 2026 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580332; cv=none; b=dBYPE8St4oLgqoSTTNWdZhGTu/+t7Glvm+owhMrd/YdX/kWdwxtaurrLFeblwJhV2xZGcsQq6pChGjDB1Bj1k6IDiJBkqpVU1phfumX6QEuvCOV8JDH36mQWo+kKUEpaqN8KFg7bqwqitPEDyHcUkQdnXnGqeUuFXtm+Cy8qcow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580332; c=relaxed/simple;
	bh=Jxr6pNW2v/ornLuXLgbRCFbpL4mu9BtppK5GRdpYV8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxuqqGxdBq1CgmU5vaJB7sVxJ+QBSyPdvhRSAlIYst5ddKsI82szr27B8yAxFuloXjbm3A5sBNp1V6dPWheuPsBBkqoFz5x97RvV4bMXn2+RpVDYcMhOSJKVzhNCqFqkWIhU2HerikaeULIJ7mUbEuMji5DyXBm5m+uo4otPVFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqvlHMVX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqvlHMVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E0AC116C6;
	Tue,  7 Apr 2026 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580332;
	bh=Jxr6pNW2v/ornLuXLgbRCFbpL4mu9BtppK5GRdpYV8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqvlHMVXfwImEPJZNOtx5Wg/l6VflyUxeYsjDWInCdRNnU96V14pCBZFNAyZXqc3o
	 +1p15QfR2vXwlsuP/Cio2S7Gkq8u4TFy6g6ihiumNkAO/zTOqmmp5w9sYtUPGTAs34
	 R0zEOtpQgrjQl1IGke9AWQPZzTnYptwZFzkya67wFglkQXzEWBUmIqxJqkHv4VBUCE
	 LxH9/Hv8b6qHMXqrWJZwJfYhdNTCNgJ14SX/5/j0H7u4hGhpRILWNmyBD8UFFsaVMD
	 wsPbSXeqYnd5aDVWu+9f/2vhYscUoEaIh5Wfimhyp740Z3nUvdZIEoI9t5Qbl5ILlK
	 znlEcD5Z9gyIg==
Date: Tue, 7 Apr 2026 09:45:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: rust: add AutoFDO support
Message-ID: <20260407164526.GA2309039@ax162>
References: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
 <CANiq72nLAqkMbiNcExVnYZxLN1g7tr4EZpUj_pwvWrjR+zaoLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nLAqkMbiNcExVnYZxLN1g7tr4EZpUj_pwvWrjR+zaoLA@mail.gmail.com>

On Fri, Apr 03, 2026 at 07:02:15AM +0200, Miguel Ojeda wrote:
> On Tue, Mar 31, 2026 at 12:58 PM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > This patch enables AutoFDO build support for Rust code within the Linux
> > kernel. This allows Rust code to be profiled and optimized based on the
> > profile.
> >
> > The RUSTFLAGS variable was suffixed with *_AUTOFDO_CLANG to match the
> > naming of the config option, which is called CONFIG_AUTOFDO_CLANG.
> >
> > This implementation has been verified in Android, first by inspecting
> > the object files and confirming that they look correct. After that,
> > it was verified as below:
> >
> > 1. Running the binderAddInts benchmark [1] with Rust Binder built as
> >    rust_binder.ko module, using a Pixel 9 Pro.
> > 2. Collecting a profile on an Pixel 10 Pro XL using the app-launch
> >    benchmark, which starts different apps many times, on a device with
> >    Rust Binder as a built-in kernel module. (C Binder was not present on
> >    the device.)
> > 3. Using the collected profile, run the binderAddInts benchmark again
> >    with Rust Binder built both as a rust_binder.ko module, and as a
> >    built-in kernel module.
> > 4. In both cases, Rust Binder without AutoFDO was approximately 13%
> >    slower than the AutoFDO optimized version. Built-in vs .ko did not
> >    make a measurable performance difference.
> >
> > All of the above was verified in conjuction with my helpers inlining
> > series [2], which confirmed that this worked correctly for helpers too
> > once [3] was fixed in the helpers inlining series.
> >
> > Link: https://android.googlesource.com/platform/system/extras/+/920f089/tests/binder/benchmarks/binderAddInts.cpp [1]
> > Link: https://lore.kernel.org/r/20260203-inline-helpers-v2-0-beb8547a03c9@google.com [2]
> > Link: https://lore.kernel.org/r/aasPsbMEsX6iGUl8@google.com [3]
> > Reviewed-by: Rong Xu <xur@google.com>
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> > Tested-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> If Rong/Han or Kbuild want to pick this up, then:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Otherwise, please let me know -- thanks!

Unless Nicolas feels strongly otherwise, I think you can just take this
via the Rust tree.

Acked-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan
