Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A927E35BDC2;
	Thu, 24 Sep 2026 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250488; cv=none; b=kalOvt/QQYDrI3t23rky8EeMWZYRMH9Gj8UMzgQMyMP3k/JpA4ToaWCtlDRBLuV1un2zssasIkww4hXKsmr/UWICkaqq25nbJg3Oahrmmvs1FRSnwtbUeeeOdcnE5u4m+rrb1Hld+b5x/KcW3JSNNA2DJ5BWZmFY6UOIx/3mh9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250488; c=relaxed/simple;
	bh=yabKjfXT3OyynXkRhg4NghX0yI19qCOeAlMUA/kgIEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XefHxTg0m0GuIQf7vuhgYaoy9VodStCgbK6HZ+wj9CcOpiHPWogkpx3R7ICiDozPmy2wJ6K+b4hQSqYCYL80DwYWQF2lKjNncfv2mC6C1OL0BF3BuuLSjOZX3NzwLoIzmo8S8MBDc1TfDje+msxdEb+yxKSVYGB0Gr4lSZND8r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=iHz+alGX; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="iHz+alGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790250483; bh=yabKjfXT3OyynXkRhg4NghX0yI19qCOeAlMUA/kgIEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHz+alGX1O1FkggTxseS0Hk0euub7n3FfQyx7TMXDhIMAHUjrNd9drOq+9zvLLrGZ
	 JEJWmCBGnjjrQYegnH4Oyn2Ry+mxaQXNjuHk1KiiFomPwqP4U/ukx7cbsdSKsmH/bL
	 kC1iz46dzuKZ3/3q1r096RGKiDSe9lCPCaupbDNTuck7GONdiQ7qmr5Y4zmgWhSLSy
	 HIyjcxBa+x9PK/kHmh3mo6jFmB/T+/TSZpKwM7EJONJ8vlBBcugUTR5rbTNRKM/jPO
	 Lbrn+95JqL0sCNlvWcxTGTBgyLdlliehwRJ6EyAD3Ah6FXzumn0S6I7TEUax58MUae
	 mX7dBmBp82S3g==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab50df2-0449-7f0000032729-7f000001e836-1
	for <multiple-recipients>; Thu, 24 Sep 2026 13:48:02 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 13:48:02 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:48:02 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v3 12/28] kbuild: Defer running objtool to link time for
 all CFG features
Message-ID: <20260924-translucent-chamois-of-bloom-d3bc7a@l-nschier-z2>
References: <cover.1790028654.git.jpoimboe@kernel.org>
 <989e3baa55cfb395d5dbcc4223816dbbd4dc45b1.1790028654.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <989e3baa55cfb395d5dbcc4223816dbbd4dc45b1.1790028654.git.jpoimboe@kernel.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1790250482-14F9F965-E3725E7F/0/0
X-purgate-type: clean
X-purgate-size: 3055
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: EE5B0A07D0  external: no

On Mon, Sep 21, 2026 at 03:31:13PM -0700, Josh Poimboeuf wrote:
> noreturns.h file is hand-maintained file which hard codes all the known
> __noreturn functions in the kernel.  It's fragile, often missing
> entries, and keeping it up to date is a maintenance burden.
> 
> For LTO, IBT, and klp-build configs, the majority of those entries
> aren't needed, because objtool runs on vmlinux.o, so it already has
> visibility into whether a given function returns (with its dead end
> detection).
> 
> Remove the need for many of the noreturns.h entries by just always
> deferring objtool for all features which rely on having the noreturn
> information: namely the ones which rely on the reverse-engineered
> control flow graph (CFG).
> 
> Note that NOINSTR_VALIDATION is a special case, where objtool runs on
> individual TUs (with all the objtool-args-y), and then again on
> vmlinux.o (without objtool-args-y except for --werror).
> 
> This change makes NOINSTR_VALIDATION just another OBJTOOL_DEFERRED
> feature which runs deferred, and *not* on TUs, so now it gets all the
> args like the others, and the special case for adding --werror on
> !OBJTOOL_DEFERRED is no longer needed.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  lib/Kconfig.debug          |  3 ++-
>  scripts/Makefile.vmlinux_o | 14 +++-----------
>  tools/objtool/noreturns.h  | 24 ------------------------
>  3 files changed, 5 insertions(+), 36 deletions(-)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 798a10ded19fd..e5aea1c0e54a2 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -575,7 +575,8 @@ config OBJTOOL_WERROR
>  config OBJTOOL_DEFERRED
>  	def_bool y
>  	depends on OBJTOOL
> -	depends on LTO_CLANG || X86_KERNEL_IBT || KLP_BUILD
> +	depends on OBJTOOL_CONTROL_FLOW || NOINSTR_VALIDATION || LTO_CLANG || \
> +		   X86_KERNEL_IBT || KLP_BUILD
>  
>  # Objtool reverse-engineers the control flow graph
>  config OBJTOOL_CONTROL_FLOW
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 9bac917e8b819..df1e3584883e6 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -30,20 +30,12 @@ endif
>  # objtool for vmlinux.o
>  # ---------------------------------------------------------------------------
>  #
> -# For CONFIG_OBJTOOL_DEFERRED (IBT or LTO), objtool doesn't run on individual
> -# translation units.  Instead it runs on vmlinux.o.
> -#
> -# For !CONFIG_OBJTOOL_DEFERRED + CONFIG_NOINSTR_VALIDATION, it runs on both
> -# translation units and vmlinux.o, with the latter only used for noinstr/unret
> -# validation.
> +# For CONFIG_OBJTOOL_DEFERRED, objtool doesn't run on individual translation
> +# units.  Instead it runs on vmlinux.o.

According to the proposed commit message that's not true if 
CONFIG_NOINSTR_VALIDATION=y.  Is that (still) correct?  Might it make 
sense to mention the exception here, too?

for kbuild:

Acked-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
