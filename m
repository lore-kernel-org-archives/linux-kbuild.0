Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23CA59;
	Mon, 23 Mar 2026 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272524; cv=none; b=D980w31fPRE+041HZyjpLkb2h2PBvVhdc3OrUj0wYArK3BSuo040PTFg2ytcQTw2vw4nl+F5M27UOTXFLOIW4dSbJA5BRVf3I1fkYlFwLua87kbfzN1qhTBStKN/nvbGIKLXV5mnR1mROqVSd/qxogN1B9Rgh11UKqPBKuRpZSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272524; c=relaxed/simple;
	bh=pRFWswykdWPPE3/EgszhZlw4LhVGl1sgGdoonutbxuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DShYTUf1RZmjAtKFQ+zRDOqFWJW/pJAwvxQx+871Q88BbAWcbLhbkHIBYGtsJtyVmuPdnMvHr4zJHlEKSPtQ4soZ0eK2JPOX+YIiBKdHpoTVww/nwlZOv8I3XsAqNuPPmcBBHBrJu+VP8ur14pG4uKTsyAXWHJ2yBo02xlSFLMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=k7sIINJI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="k7sIINJI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5ffZcBi0UU6q88Ce7nJSzo/9O0PBONBoKE6v9nT0tfQ=; b=k7sIINJIYCzIpzZ2gI5it43Ag6
	kvT42IIsbXwV7JvxdG5TtKzLycY7I/GlZ189VNwiAeNQ09bB8gR5Ah6+IcHW6BmNfxqetQ7Xlt9oH
	T7zzeRvxjh+oHL2kLEEPZALfZYETH8PDWPPP3/DOZmbV7KliYRBmFOeX+G2g6lZbgixY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w4fKT-00Cw79-Bh; Mon, 23 Mar 2026 14:28:25 +0100
Date: Mon, 23 Mar 2026 14:28:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org,
	acourbot@nvidia.com, akpm@linux-foundation.org,
	aliceryhl@google.com, anton.ivanov@cambridgegreys.com,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
	david@davidgow.net, johannes@sipsolutions.net,
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-um@lists.infradead.org,
	linux@armlinux.org.uk, llvm@lists.linux.dev, lossin@kernel.org,
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com,
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
	richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	urezki@gmail.com, will@kernel.org
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Message-ID: <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
 <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
 <DHA6SE9EMEQF.1PKVHEG18I5FS@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHA6SE9EMEQF.1PKVHEG18I5FS@garyguo.net>

> > If you want netlink on um, arm32, riscv, loongarch you would need a
> > different implementation of the binding?
> 
> It doesn't need this feature to build and function. It'll just be a bit slower
> because inlining from C to Rust won't happen.

So it sounds like my understanding is out of date. When the first
Ethernet PHY driver was being merged, Rust could not access inline C
functions. The binding had to replicate the functionality. But you are
saying that Rust can now make use of inline C code, but not actually
inline it? It results in a function call?

What this feature does it actually allows inline C functions to be
inline? So it is just an optimisation?

	Andrew
