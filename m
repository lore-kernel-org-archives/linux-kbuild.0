Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E20471D0C;
	Tue, 15 Sep 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462469; cv=none; b=gkRiNq/yGZJH6vI+hQRZUCAQs9b5hg7p8SRK3qEV9tgNMVa79NRi5h2hdN3J7/hkuyvb2u0p6M9+uHbZJ0c2DwzfVPmjAcSma8xdainwJ7lA7W/0k/OCdazJZuop0W5XXayFz3/7WKIYXu0kqVqx/uljkfnC3BY812cP3ph+XEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462469; c=relaxed/simple;
	bh=TrFy84WFLihamQ2UtPEIp9cWrnbixhLsx/cx/JOsURw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tK9j1ZqMGZLqTppcGNNMHYC+GEyfuWsFrlo8IHPBqM0dgKkekX4hV7kmlB8t67CW5YF7iLH54FDYxHv+fl3ObS1hrtZJrVc0RDgaTPCBG6xOKeeh0WeVf5ckdtKxooL4cX3L8badtgq+CM2ncgHCImlgeR2EEgSndY7RE2gKfCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=B4js3Hku; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rqq6TufP; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="B4js3Hku";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rqq6TufP"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2A14514000B8;
	Tue, 15 Sep 2026 04:54:25 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 15 Sep 2026 04:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789462464;
	 x=1789548864; bh=l+Dca6AU7f0s7A11m75QKiePhth6dKEUN646ZUyOcxw=; b=
	B4js3HkurMcjrD15QoLpxP9Izw+a0J+045jNlya+vsO+95WeBQL1fNx/gv3H1D7K
	hxkadaMiyKhro+swwkPcN1YS0uYXOSLVBXOtPLXRTlnJmZV/AR0b1m99NL0u9ODj
	1cgIK5fxz1k+aSyS7qFDZY6BmSAywWMF4uNr4WZfAJwjjQ7txOCzif/YFSFd7DW+
	Qreot+xLqAeO6zioJbeNMVQ6RyK8Ry4J6vk12VSZWNDpjCWpkc3KaX2/lDS1z/c6
	5/FXmzlOdjR+0f5GayGR26Yc6HPdFo6gCUiUM+sBTvfFqaSTrAM4DfXOAOkQlcjU
	ad+BRAd/MLuDV6lqZ8Q2WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789462464; x=
	1789548864; bh=l+Dca6AU7f0s7A11m75QKiePhth6dKEUN646ZUyOcxw=; b=r
	qq6TufPoUIIuHcmsX7aVe9rzHQZRHBxGupo9objyRo0+XC3ikxeBM0Lcr9zpl32D
	cv0t55sm7qfS338Arbieyc7fRqfEVBvfemqYwLRV66yxHRS4D3IHnZsp9nGIRV+j
	x36Ev2kX2jjr8cAp5H2yPSFC7xksz/HhU7tR4OowE+NBfrUlW6vCYQ+xBjNrKw4P
	4zm+WBp3H23K0/SNB+QOLgqsKKDF11N+8o/DxiohqYtbypEv+TKY0yh0QiP4Yt6I
	FdyyVDlnhYvp/szNCcxyX5k0BARgketiwNCzFGUy/34mf9Z6CpUIEJuuC2wzuaS6
	frsCfEznq81YG0oXNr2rg==
X-ME-Sender: <xms:vgepaqzeg64cmmemSKaxQz9rnHZKsUyEL31h1eHIIn8ssri5JUwu1w>
    <xme:vgepahErUxLO-YzklAOx8jr3iVnktubA6trM7JY3QYonHXjl24WwKuxwQMI1QH5-b
    OtPZZDq6kCpXF971wkvINaUhwNSkW8NxiVJvKiGV8JosTU6zVr5aaOi>
X-ME-Proxy-Cause: dmFkZTEM1a2UcAhXVAnqAiYsoLYvUmMbm3oKeLzqzU27v1LolMVltFpdkPXIAGpYET3aMq
    e/mezrvvuN6yFzn2xUZeCr+P5O4KK4LO5fWCnz8zDMbiPtdpc6CeI0P9rWe1zHc6yduqyu
    6EHuk3EMQpfeExDSBuwV5sp/AUNxp9areRa5+0HlaGu1a4Gxa61ykRHooEzI/RsA8oujQ3
    soJcTW3fybToBsw9p3eyo+obxO7vaTJVWGhirArFyxjRMa9zEFAIoZym/Qb3t13xYKlqlj
    IIO7Lw0XbgJ7VXfd8bZ0NJZwUpMjeYy9w4WmzuWuDpTkkLZn15PCouHIjti9Z5FlAsk+eW
    0Df0liZt0TK8KAUh2G/16mx0db+WU4osmsi31TwApJmKX3nBUFSdNqtU8xLCJRQN6ge618
    cUMQDRblYOceUFLIYEYr1AXMbGy7rJ4a4q3+MH87Hu2aoZIOhM37GUJSeCQv8+5pcJdOL6
    QO5kRU/DkQVdJVOi6OGN6+CGdwpr4WgXynF6L1eDrMuXo7uqUWq2UVrZ4N5Lzd3Zbi66Dy
    q/cliTRITTXkh/y1UQYStGzs/HcsdWrS3Zv5KircaQDvV0D5PNWk9q7cnsLOAue3LzFO65
    N7rFnO/JpW3vaPTsy6Gk+nBYWhX8fPfSTZ/+7QVxe0/vV4MaxzuZ2NT+Mn5Q
X-ME-Proxy: <xmx:vwepake_XBqqsiICtHm_CdVKovj1z196lUy87fv0LmoFA-dml9zeEQ>
    <xmx:vwepatEh-I_ujuAOe7kwLpXSjWgzJ5Y0CNPoaU8zAN599HihlD4ffA>
    <xmx:vwepat2-xkj_SVtYCfCQEPYLap7TtzJdgHNgPlS6P1RTaiHWv5RXNA>
    <xmx:vwepaln8dqt0-c--zPm3rtS2dwauNp4UGSeGvBuNggE8FnMYb3iU3Q>
    <xmx:wAepakkhiEke_PLtrSIwhL1QL1uakU1QQicYb9JQjkkwnVAjWq71GSmi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 268F432A0081; Tue, 15 Sep 2026 04:54:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AGrkui6Nx9zw
Date: Tue, 15 Sep 2026 10:53:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Kees Cook" <kees@kernel.org>
Cc: "Lorenzo Stoakes" <ljs@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Alexey Gladkov" <legion@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 "Jens Axboe" <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Message-Id: <7646eb0c-7c4a-4ec2-9562-66a74c4d9858@app.fastmail.com>
In-Reply-To: 
 <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <202609140833.88C0E16E50@keescook>
 <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 14, 2026, at 17:53, Linus Torvalds wrote:
> On Mon, 14 Sept 2026 at 08:41, Kees Cook <kees@kernel.org> wrote:
>>
>> One area I think might solved via an LLM is the 3-pass kallsyms stuff.
>> If we could get a deterministic kallsyms build in 1 pass, that would be
>> very nice. A lot of people have tried, but it has eluded upstreaming.
>
> Even the three-pass one hasn't apparently always been entirely
> deterministic. We've had random reports over the years of it failing
> in some circumstances.

This tends to break whenever a linker (rather than the compiler) starts
creating a new type of symbols that show up in pass 2.

> Maybe we've fixed it all, or maybe the failures just go imperceptibly
> rare. Regardless, it has definitely been fragile.

The rate seems to be once every few years, looking at the list
of exceptions added to scripts/kallsyms.c (now scripts/mksysmap):

efe6e3068067 ("kallsyms: fix nonconverging kallsyms table with lld")
516d980f8541 ("scripts/kallsyms: skip ppc compiler stub *.long_branch.* / *.plt_branch.*")
b9b74be163a2 ("ARM: 8555/1: kallsyms: ignore ARM mode switching veneers")

I'm sure there are other instances on architectures that get less
build coverage.

     Arnd
