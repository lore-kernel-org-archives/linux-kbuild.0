Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9FB387359;
	Wed, 16 Sep 2026 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540740; cv=none; b=m11oz6Tby2tcJT5hODgMGdcYZ6c62tbjRxzW6VkLJ2+HWj/nbQgSJ3d9pqiSNrM4qGbDALwH7oa9SJ4+/O0LRFTy2aCTjeP8ckVWT2qOm/2W3CbNMM7m4i86OoUmuEdaBz0CgexUabHEh7Ub+PcYHE+2fFOeZ0mUT2NFcfW4wmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540740; c=relaxed/simple;
	bh=iU6G2m+wrmWgfgn/0yBm7PYayX0WyU1SDB3L2Fyqpfs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XKBlvbVIRYSRnXhH+Udpl4piM0eDFPxpB5WAG1Y+IXUJTbc3u9P/6Kjg5xEZsl50nHa7MD2jmw3OsQtNAz7KVVDgHbXop9g8wCE3+XUWW2ngEljXTCQnRGEnxO06vtD22+TZ1TO9QGUuJw8mrZylgrEScTlRUx7Ywc/RNqN0jdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=WF8L+S0u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i/DWAvvF; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="WF8L+S0u";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i/DWAvvF"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 6CA02EC0E91;
	Wed, 16 Sep 2026 02:38:56 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 16 Sep 2026 02:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789540736;
	 x=1789627136; bh=uVDBK2xNAXhHDNCHOU+SjarglqFyyWlJ3wc704FVprE=; b=
	WF8L+S0ufzaPlWCsrRRscgGvgAxgZTFT+tJOeBIsio2KJN8+5FOYORwMwAkYdAOn
	WyeMCKtF8mm6kAVkl3ezLOHPn4sWcfrc3TtTlIAVkU4Z+lC7DeFfiJxi9WUYc98v
	xn6tB9DwYlFirjYuSyT2YIzx5LvmzTHXkA+Tyapwgr7/Ao1mghZIe0vXYCmEDt+7
	lbXCembmc9Cb8C6tbXyDJura9NlgqslmfHKo1IyLcoHsYVSetjh24+avMUhllgSr
	/QXXceV15HR5ULX4gpX4QQSe1yHg1LCrqr7/SWm9qR8HbV1R5tsY/ZXsNjnvBHC8
	S4t6xtOCNjXtUKAflg7x3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789540736; x=
	1789627136; bh=uVDBK2xNAXhHDNCHOU+SjarglqFyyWlJ3wc704FVprE=; b=i
	/DWAvvFomsvvHufwVst9thwX7fYCHQ2oKF0GOO8jVQBP9AOAWpiEWNiwy7iXoYuo
	GVSODLAIaKAd4VwPl8FFtJ2ISCnR54cx2cfornWk1fpfK2pqQ4EcpeLV33LsEcyH
	lO2bSNLqLWXa6BteDpaKhzFMCVZ9y+WDRf+yvcAYLUEqMf/AFnTSdlN9JQNgfuM4
	uqbmAIzc+5ArvcKN/yNNUa7txHOX8ShOwyYSaUkecYH4MGoUW5iRatiT8nyxhwqw
	9htHm5Uzj5D+MIx69PR0d6gDl2QXZ7oxN9e44hgjUmIuaD+YrUJ66oWoklLUOj/E
	wPxRgiFz8nPw3KhMU/yRA==
X-ME-Sender: <xms:fjmqaqyEN1YbAgTsJ-Wir-N55wt5sUmcN1R5LalCNvAYbKcgPQHL_A>
    <xme:fjmqahHZ9OhzJM3m-4tSGeix_-mxmLAfGHrpO0rhS8qgDj8gf-sOGLcdFWMJmVWKG
    xyX7rSOcSALowzF1EkkmxKQF1EpKrNbogfeihnCvrO1BCadeM2tx3g>
X-ME-Proxy-Cause: dmFkZTFo6N+eyntVtdIU1AxyJCq4N9vnDxbCRp4nPjWrobmdZ9js/OvMMkuzKPVwg4e0XZ
    KNa2/VrO5RBb0uLVonnkDz+3YlkFRo2YlsW3HfyBsnKAr33GeTytpiCOIwFe4kvaO8XuaF
    UZahZ2N+1OqfNlHSjPd9W6d33Sl8sxqQUeYQRHlRR/idMGQHnNnj0Rf4gT6Gta+IqwfyJ3
    /YQm3d0DvEYCvlE32FAUIP+fXws4+CzyhhD5Rny9z3/OH94gPlFQ/V2WMT9+ntOdGffMjp
    1pBjB47EOGmdkWcGuNXmLdWlkxeJllX456XEd1f4jRNfcVOiBdTto84ZiSgTK8DC/XcFra
    A5/RHA96DZHO48W9Zh+mbKakBgEHdZ6UNONXOjj0u3bcE81qxt2G8I19a35lqX9/a+JClc
    X1IWP2OeEplF0bcl/INad4jbwjFZlpjyQ6u543mAJdtEz8rXvUO8UPhgdhkI8fuy+IE866
    hObaIc7Cbw+i5mS7TTL/cj3W0aLToECIbQhNbon1tNVqHBn48ZDsnUyY/hebBu9rEz6NEw
    2ySakRM0UbA97qmfTNzUUadV+57wKRI2sOzxWZjVJvv4V9qZ0lmzUmnDZt0cRyCb3HvwlR
    B56SjiXOfV7HHm91yFsWFGbYK7K8PcEoM91m6HTdE2pK3aEw3swkohYrMYOQ
X-ME-Proxy: <xmx:fjmqakdl21LlggRARau_1VgXYEZH13NWocxL-MTopr8K1oeNcdTorQ>
    <xmx:fjmqatHPCG9_pDHZC1iZBWsJgkQ0p7XX0cxudVxvkXtc2IJh6eWd3Q>
    <xmx:fjmqat3UNKe2j2B_Wwt6dVYh9emalHhLdYZmZms03RlEclBIJ5pCJQ>
    <xmx:fjmqallaGhDc6jeLXPTsfz3ZwEK0BLgHR3EDJqkfsv9etYwYJUPUTg>
    <xmx:gDmqakkPuKOn0yE_b_Yn5xtFj8dC9OR8213unWHyuqj03fKMM1qZQYj6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id EA77F32A0085; Wed, 16 Sep 2026 02:38:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ArHA-gVR6p-N
Date: Wed, 16 Sep 2026 08:38:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kees Cook" <kees@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
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
Message-Id: <081b2b60-e295-4cd7-b201-d996a88c5f28@app.fastmail.com>
In-Reply-To: <202609151758.BA5732348@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609151758.BA5732348@keescook>
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if available
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 16, 2026, at 03:06, Kees Cook wrote:
> On Mon, Sep 14, 2026 at 10:22:20AM +0100, Lorenzo Stoakes (ARM) wrote:
>
> Makefile:
>
> KPGZIP	:= $(if $(shell command -v pigz 2>/dev/null),$(PYTHON3) 
> $(abs_srctree)/scripts/jobserver-exec 
> $(abs_srctree)/scripts/parallel-gzip,gzip)
>
> and the same scripts/parallel-gzip:
>
> 	#!/bin/sh
> 	exec pigz -p ${PARALLELISM:-1} "$@"
>
> And then replace the /boot/ KGZIP uses with KPGZIP. Then we don't need
> to change modules, config_data, new users, nor cmd_gzip, etc, which all
> continue to use the regular KGZIP and the "use python" part for the
> KPGZIP case becomes is a 1-time cost?

Nice, I like the idea and this this will work. I didn't know about
scripts/jobserver-exec, but this does seem like a perfect fit.

I checked the other compression tools we support, and found that
zstd is another one that has built-in support for parallel
compression, so we probably want to have it there as well.

     Arnd
