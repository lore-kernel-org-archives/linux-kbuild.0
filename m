Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E6131E84B
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Jul 2026 15:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254321; cv=none; b=msAzOBhKXhxkwD/x6XVCMzLh+HYHjKAnvjT3jy1rq4tSi5A2hh4G+u12WiT/+sXC6bYM4QLEfe4pWIzk5HRo/1xOZePN7exZRE1d4bUBT2UWhoGSLtY30wd0Ei+OPMn+EN6M7rRHbILsJx9wq1nQ05bGgBcN9Hq3TlJv6TKorj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254321; c=relaxed/simple;
	bh=bhtTGh3WhKGfAJ2ZgmW3tEJx+gzkw/LVZhI4XjwwUFg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=C+bXXr1oPUtL/yIpqxm0778lIcR/RjUnXdHZX2SFl7htWft7n2duHCz4vrvJxy3zT31v5jtAqdH3KnRNrCkaOXH5s0CsH2tcNcb+4wz9f36+L5FW3a844/cKPCPgxkBrOVhRa1jBebNYm084TtjviA6iMMOVM1iN7mVv9F4vifM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbsDr0L5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbsDr0L5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34691F00A3D;
	Tue, 28 Jul 2026 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254320;
	bh=YMsTw/tkD0NUqorU0KlJogo4RGg+JnwEwCWMocAIXp8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=UbsDr0L5jBAXI3auKrIqD6mHfkiAqE8LzOvnhvYTXMSutyTg71li6QKQewaKLU32D
	 cJvBzgQ9CW8nj0+wWDkPdV7ohTbSping0Z1eq+NOd7Rfj4zr2/qOojc5sODEzbm9QC
	 ADsLEtV/GS7HQLCxwM4a4GZnjVjoTonm2B3fuHdhS3ZrSTxEZL88KjHie7meA1EqG2
	 TCCsKjQnVhUmcaNxpqqpmJQHjYjqC563oW06pakgvdxd95UtzKNfjjxpZ8U79l/nLs
	 Aw8yleIu4DZY1JtuGAv5Qnu7HCOduyLMrdsHPZQqYrD4MLz9lsBvDo+0tYNFK9nPAl
	 ol18d4uqyZCzQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id AB8ECF4006A;
	Tue, 28 Jul 2026 11:58:38 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Tue, 28 Jul 2026 11:58:38 -0400
X-ME-Sender: <xms:rtFoahW3-kMnOB3m5LZOP5HfDX2gfYXwgNesuAG4rEiVN6cSKNCpqA>
    <xme:rtFoasalJwsilIMD1GP0mca7EORw4mG6YJy4gvhK58_IYz2p3KGh-zO29-fDg2ymJ
    bArY1vw6lFqmw2cPL8Kq1ybPjj6WxK6nHkNWbUjsjuhLWoBcLFkHr0>
X-ME-Proxy-Cause: dmFkZTFXEph7YmYEKJKvkqx/ZdeTEJLglIKkWgafepB9fHJPn8OsK8iconXZhQciu0skzK
    qgqISs0IRHKhxPOikf5HYnN4B9n8zgjgnqLpKCH0YUlwfAlLpjkOqe2eSCHDoXnT0kwtkG
    ZN9l3+otou1NmMDVhiYufCajc3kHrICYrXpUwdI+1WWUQmWl5yT3ImOr4nRUpZsvE6+6NB
    a5xikz8zrLhB5zXQpzxqTfBLfjFuHZwDvjjWtJbGbggF1TZm8F/Xvbswf6MOID1iq8Xn3H
    t1cJD5hBxOYFuwWDnyVF0K9rBM5EGxqwSHMOcjbppDplGJksVmxq3U44IBQPSgzZRphQcJ
    s6pUjJcyeC7t9F7IKyH22h8ocZCjQF38nAvrNLm1OISgE49jLC8zL853f9MXLmqUn3CG00
    Ja+X9g5/maHKDxmrmBiSiJhLd3VGTALr4UYgPbhWof3ZxvZl+AOlxD53XMpdn1saCHMM6E
    dZXJgxj2XL+SYcA8Ed91V9D1vbWm1zxzBhMsDNdD/3Qct/prcJXTBie5rhAit/mB7PyNOg
    hebvDMMjKiOMICNi60zmLlKzes035In/dwSoXdNlwEiEVFGaa2tfO98TOOGJev6M8XMjSB
    badIHUxvdjTz5ywH0/5EhoWLgcHreubmDN01ga0QRoj1sbm2TJcv9Qsgb92g
X-ME-Proxy: <xmx:rtFoaoGSuh4txDuVS2kLzVLGiKpuPIASZo0I6qJ1TF1xoO3vz6uafw>
    <xmx:rtFoahwOab2CqPH-fRxQ9yZyE7y23V21mZ2h_H707csdAMfmntIaow>
    <xmx:rtFoanlt9iZg0B8ey5_QHiIcWYxMZaeJM2KA0dhpNVXw5UKmYiGUKQ>
    <xmx:rtFoaoCpC-2_1Ys9mQ4NCqyFfprLNEImXl9ZgD_D9eOGcn-P-XfueA>
    <xmx:rtFoaiKk96He8-dMZPoBHVWFvkBlzNlvN5cjFKMb40UTyJsedHx_fyXa>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8CEA9182007E; Tue, 28 Jul 2026 11:58:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ap1sJ7tdW81F
Date: Tue, 28 Jul 2026 18:58:17 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Mingcong Bai" <jeffbai@aosc.io>, linux-kernel@vger.kernel.org
Cc: "Kexy Biscuit" <kexybiscuit@aosc.io>, "Xi Ruoyao" <xry111@xry111.site>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Nick Terrell" <terrelln@fb.com>,
 "David Sterba" <dsterba@suse.com>, "Jan Stancek" <jstancek@redhat.com>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>, "Petr Mladek" <pmladek@suse.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Simon Glass" <sjg@chromium.org>, "Marco Elver" <elver@google.com>,
 linux-kbuild@vger.kernel.org
Message-Id: <f833d263-9f47-454e-bc64-818ac42d63dd@app.fastmail.com>
In-Reply-To: <20260728143141.2870515-1-jeffbai@aosc.io>
References: <20260728143141.2870515-1-jeffbai@aosc.io>
Subject: Re: [RFC PATCH] x86/boot: use zstd -19 if building for 32-bit
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Tue, 28 Jul 2026, at 17:31, Mingcong Bai wrote:
> When using native build environments (that is, 32-bit x86 chroot/container
> as build environment for 32-bit x86 binaries), `zstd -22' requests more
> virtual memory than that could be allowed on 32-bit hosts.
>
> Introduce `cmd_zstd_with_size' for CONFIG_X86_32 builds.
>
> This is quite possibly just stupid... But there doesn't seem to be a way
> to detect the host environment. So I'm sending this patch as a means to
> ask for your opinions.
>
> Any help would be greated appreciated.
>
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> ---
>  arch/x86/boot/compressed/Makefile | 5 +++++
>  scripts/Makefile.lib              | 3 +++
>  2 files changed, 8 insertions(+)
>

Doesn't this mean ZSTD -22 is generally broken on 32-bit? How is this
specific to the kernel?

