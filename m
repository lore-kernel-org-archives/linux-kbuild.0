Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5AC40DFA1;
	Mon, 23 Mar 2026 00:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774224242; cv=none; b=RtbKHexj7obgKLOUp7KtZbzoBBwm4DcNX8S6uV+80NOrsgBG6c7S7lMuSSjKgecYKlg9VyRnKIwW7ajvOXR4BbUqtb/kHC18/jHIIufgpCs0MAENeEwOKdOwOf4d0sKTb0f7Q2lmaXU4Ww69s8M2G3IYEw+8HYfZbNcpQaXi9WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774224242; c=relaxed/simple;
	bh=TIx02c+Ao/gjEr9Xh8zmMJ4cknC+KKpUO0TYsvtJrYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2xZVFQI7nB9y3LUSzmSktYWYcMffH/IziKC8qUHMpBxWHslI/FcXBRyMxyhKvbWTgwRlUiysHfGXaVJXy/vrJsD1CZObjaIqG1mPXxvvvEltmFQr76lSFDUjA1KgG5YXwmTRdOguRO6QZHFvV3ORUdPtXtx4wu9GepKOcq2cAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qv6Jxmle; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qv6Jxmle"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BD7C19424;
	Mon, 23 Mar 2026 00:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774224241;
	bh=TIx02c+Ao/gjEr9Xh8zmMJ4cknC+KKpUO0TYsvtJrYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qv6JxmleN9/FehBcjvyaVa1MkmaXr4Sv6DcsFlJ96PsdiyVC/3pYc+m9Fwy/RrdSG
	 k5iZa7SJc1Ft+h6UZKpE7yAG8OVAeY+4bKrG5ag2HU4QV8BqxvEHeMinl3wg76IP19
	 XbngVTWCPutXEd0vLUj4yiykgEMAB738SKwiuyl2eLDpHKdp6Dn+XZO24604aijCIz
	 vMZ00TvFd1eEU9/TTw62WquUyTwe31b33w4myELOF078ren7RgnzMj7AwOEOoJK8OO
	 He1JYHC23hpTrczCRcVKZKDqpyOBK3ynq1rAxPlCOxuKwamlGfrVspQwrE3ZP8XexF
	 uqm5O+jaQqgSA==
From: Miguel Ojeda <ojeda@kernel.org>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	akpm@linux-foundation.org,
	aliceryhl@google.com,
	anton.ivanov@cambridgegreys.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	david@davidgow.net,
	gary@garyguo.net,
	johannes@sipsolutions.net,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-um@lists.infradead.org,
	linux@armlinux.org.uk,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	mark.rutland@arm.com,
	mmaurer@google.com,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev,
	nsc@kernel.org,
	peterz@infradead.org,
	richard@nod.at,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	urezki@gmail.com,
	will@kernel.org
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Date: Mon, 23 Mar 2026 01:03:27 +0100
Message-ID: <20260323000327.111235-1-ojeda@kernel.org>
In-Reply-To: <20260322192159.88138-1-ojeda@kernel.org>
References: <20260322192159.88138-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 22 Mar 2026 20:21:59 +0100 Miguel Ojeda <ojeda@kernel.org> wrote:
>
>     On the other hand, regardless of whether we fix this (and another
>     issue in a separate email found thanks to the UML build), we could
>     instead add `depends on` listing explicitly the architectures where
>     this is going to be actually tested. That way maintainers can decide
>     whether they want to support it when they are ready. Thoughts?

Another one for arm 32-bit:

      LD      .tmp_vmlinux1
    ld.lld: error: undefined symbol: __aeabi_read_tp
    >>> referenced by uaccess.rs:349 (rust/kernel/uaccess.rs:349)
    >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
    >>> referenced by uaccess.rs:543 (rust/kernel/uaccess.rs:543)
    >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
    >>> referenced by uaccess.rs:543 (rust/kernel/uaccess.rs:543)
    >>>               drivers/android/binder/rust_binder_main.o:(rust_binder_main::rust_binder_ioctl) in archive vmlinux.a
    >>> referenced 36 more times

I think this reinforces the case that this is something that arch folks
should think about case by case, and decide if they want to try -- we
may want to start simple with x86_64 and arm64 or similar first.

Thanks!

Cheers,
Miguel
