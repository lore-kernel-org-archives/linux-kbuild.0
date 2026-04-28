Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63DA265621;
	Tue, 28 Apr 2026 18:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401917; cv=none; b=XkBSZtgQp+8ZoGSNTVcmYjTY4uAhA6I2y4vDmJBQggsArNna4E6Nts8jslHwN0RqeWlyyMyl5Db4EgpkQtW5qA7juJBi5K1GUFv4cCennII+mvlkbZ18fHHMhMX4vwPzt6SdjYJR9TZjfQhbVSEMMDCDU4XFMeVwtguElPFrx8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401917; c=relaxed/simple;
	bh=q2KQojMX6ggbQIQ/rMVU3akN2PquJ72DrFvJJo2UzTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tx9Mf19rIZe+EvKZGDnDrWXFusdOVIkx8GkkdTsTPoP2hsEsuih8fSWt6/KxjNrpIxbzRCZ2qfwLJ4I6eecfDDe/gQAGlON0E8jKpxdAldqLvvxZ3vMjuBgVXUCdTlFIHoEWKzUCr4wNMKPlf0llHx4tg8CZ+SAacNwjlB7rt5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPnhbRU4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPnhbRU4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5D2C2BCAF;
	Tue, 28 Apr 2026 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401917;
	bh=q2KQojMX6ggbQIQ/rMVU3akN2PquJ72DrFvJJo2UzTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPnhbRU49tItnlMby984osH8D8n0JyIL/TLAbzmMhcfbA3ntRKQIw+aiL+FysPlnG
	 rTGdZtAWR0yXLTvJ418y/a/eqbkt8Viui9uWvcHbJq/AiUAUHQPb+twuoBh2NzcO7Z
	 eyE2mKdsZYsOdXNCogGtZD8RmGg2Q7e96595AUYgtb6rK2sowma+wltt3EKVbfZ237
	 GUlo9EJMqgn+5MOrqrQO3EozHKCLqtrGNOp204GPN5z9kOdYuEYw80ZddJNIZ9BC71
	 jnbhNvsJ2ffCsomwt4+4+DZINAI2f0+kIGJrLSaS8U+exPDHadPxmb1H/RtGPhBD1g
	 YHjx0Te7arbsw==
Date: Tue, 28 Apr 2026 14:45:11 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Julian Braha <julianbraha@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, ljs@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
Message-ID: <20260428184511.GB3304253@ax162>
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com>
 <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
 <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>

On Tue, Apr 28, 2026 at 01:51:09PM +0200, Miguel Ojeda wrote:
> Then I thought if the same would apply to `clap` etc., but then again,
> we may want to write more tools like this in Rust in the future (we
> already felt the pain in the past the pain of not having a e.g. JSON
> parser), and whether we could have a more general solution for this,
> including perhaps even a kernel.org registry (either as primary or
> not) etc.

Yeah, I seem to recall a previous proposal for a host program that was
written in Rust, I think it was the vdsocheck tool?

  https://lore.kernel.org/20250812-vdso-absolute-reloc-v4-11-61a8b615e5ec@linutronix.de/

I agree with the sentiment that more host tools may want to be written
in Rust. The Rust build in the kernel does not use cargo altogether, do
we want the same restriction for host programs? Would these tools be
able to share the Rust build rules so that we could have a simple
hostprogs syntax for tools integrating with Kbuild to use? Obviously, it
might be harder for some programs not to use some of the nice third
party libraries available but it seems like it would eliminate the build
system considerations from the discussion at that point.

Cheers,
Nathan
