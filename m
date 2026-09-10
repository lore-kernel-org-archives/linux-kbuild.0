Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E94F583AA8
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068164; cv=none; b=GKXXGx4tVsEQV/oHPJk4XCdw9rdOOGs/PEx9924toTK1wqdbqSplja5j5H826gafc4Pe32KCTLG5Se8BBwy0AlpExyVXeEhsq9CtImhRbUGJk06atYllh9HLcLSStM0+jdh6cdChLDXbBtrcMgM2FdXFU94Jj0nUXI7LLNNsDLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068164; c=relaxed/simple;
	bh=PQ7ZF7tbCdfpJdm1QzKqAujOYElxa1wi4iIn5WHbJZM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xno2dv4orkHzCoIaFJpjKBely3HdgyoD8PYafhKMgaj8HKQ258ESaCieRGLJeKTokOLVMf64PVRGUTe7atpKhBGJ+f36y+ujcKRo5gNfOVQvH87vbPF3HMc+LjosR00aVYi+k7EdefZGLyCG+d1UMM3pqHl+wRO+IIOD3BIvRuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDpzPQX8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDpzPQX8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4858303de5dso100385f8f.2
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068159; x=1789672959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STtSOXgwYAOvGJIuaHYNYi0eV6MrslGFexph89oXLmw=;
        b=hDpzPQX8t7KrWSTwafXDYXis4e5C/y+oKRIhW+8B5izsciQQ4uEnr8Y50NCGluVRk4
         GoAdO3p2RxcVU13EMWNGGmfMGUbluXfAQNmwp3gXFtJXTsne0sdpEjPUfpPSqWgddfyE
         DwQxJc8GBp68qvsB8eyUZ38fOBnIG6BYanHjqteCvIaSLqhyWzbVrkaDkRHfHrgPvr6b
         c+kvhQvbcC+xeDWXrXEfNmXf2kCSptnoNNnAB64ify64MuRgqqcjdfEKpkEmddH37tHz
         r1V/HRil1TH0l283RXn69KWn09r3MR6EiqFFhVXHr247D3MNrjsfkCtlTMya/rxsGU8z
         gGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068159; x=1789672959;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STtSOXgwYAOvGJIuaHYNYi0eV6MrslGFexph89oXLmw=;
        b=nfV60/6eDWwK5QoWxiN85qK9j8J9mpRB8bfI9MiHlzu1jlo9mxnpSb1XpnL/vYyLBl
         jdtmvfZoha8u7nP8iu2yJMTyLDe8i6ts53ByxU0qVZZ2XABU3v5Fw19JXM2ukoIQM39S
         lbtPQUsc2501WEgtluFuYL7Bn2o2MkZM56Qqrhza6ndBFbqgBW6NPO87ap/faZSVyX7A
         jF+l3kfrbGjKom3rtk21QaVh35wfg+FvI7VzwlXkVklqtnofMeB2ytesgD8HT0mWuSne
         p5Fj+qC35uo/Jl0rDSvPKYg+iS+MZnaMqqiFmiSoC3HLTZ6dU7jnFqVkqwPj0b0AVi9X
         mpww==
X-Forwarded-Encrypted: i=1; AKwUvBztaIBto42Ug76Cjn1rL6FI1zDhZlx6xJGeCownpIS1Tnir4wmcul24wOTmDb6DSIqN1Kj8O85CtbAOVAM=@vger.kernel.org
X-Gm-Message-State: AFuF++k8Qbcvql6aI1JLr7y+2vprCisNd7NKyINYZOL9qDo7T811dSGT
	zot+by+d2ojr+8aOZd/28nQlM5TaTy6f4wgmSKSYgdmUgKkfZ8VuTDi/
X-Gm-Gg: AYBFou1TodlzeNJVQU+5qVDT9PG6z9BLSeEkDWObESDHUKW3fJQdoppK97xPHYai+T+
	OZgvT6cdj8Nx1xkUu/Z7sftEOtz4R+/updAEjB0fma4dnGodWGpAhXM+YJbzifr5lNCruwmVkZ/
	Ae4yg+KAgd4zOU5qx4CLd7PsIDLKl7gFWxfEbBI6GyroedO6mou5qtTC9j8VgSY3FKqIw/vtcOY
	pHc7s5PJW4bGZbwagnA5wOI9BofUnttOTpOfkrNIIIH/W791r2EcuK1pDvVXIFNG979Qh7jUdwW
	9ab+vchx8yAS44jnw8/9m9zfAAg9avdwhhK/WMT8NmjZF4TfC3nikqhwOJzioWTx8JhYNIbaRcc
	WueCpRFTGQin7xNfe9HHUF0H7okB4IST8O/wLT0F3HyH3hbBX4DyxpxMYVHr1Xh1q8YXzv7+1O7
	wV9CqcHo29HOsYro1pPUTqvAA2XDzuHu9mD61TMm/F8eRdbLpCPpZj3LMMGaAd6McrlP08ZdlWp
	nRVUCa0p12npurYNeQ6IwhdIRNrHYtpomajRh4G7wxh0wP5IxxWI9UVdLVPMt0qCdM=
X-Received: by 2002:adf:ed8d:0:b0:484:41cb:d5f0 with SMTP id ffacd0b85a97d-486eb2f0554mr408036f8f.17.1789068158634;
        Thu, 10 Sep 2026 12:22:38 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eaccaa1asm861074f8f.0.2026.09.10.12.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 12:22:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1506b117-6e79-4740-8e31-ce0d7a9c0d1b@gmail.com>
Date: Thu, 10 Sep 2026 20:22:37 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v2 02/27] kbuild: Add CONFIG_OBJTOOL_DEFERRED
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
References: <cover.1788899473.git.jpoimboe@kernel.org>
 <166ab4ef8f062db45d5e4ab928f940d08dc465d5.1788899473.git.jpoimboe@kernel.org>
Content-Language: en-US
In-Reply-To: <166ab4ef8f062db45d5e4ab928f940d08dc465d5.1788899473.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Josh,

On 9/8/26 21:33, Josh Poimboeuf wrote:
> For LTO, IBT, and KLP builds, the running of objtool is deferred to
> vmlinux.o rather than individual translation units.  In preparation for
> deferring it in more cases, add a new config option.
> 
> No functional change.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/x86/boot/startup/Makefile |  2 +-
>  lib/Kconfig.debug              |  7 +++++++
>  scripts/Makefile.build         |  4 ++--
>  scripts/Makefile.lib           |  4 +---
>  scripts/Makefile.vmlinux_o     | 13 +++++++------
>  scripts/link-vmlinux.sh        |  3 +--
>  6 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
> index 5e499cfb29b5c..ab6e9970d4f4e 100644
> --- a/arch/x86/boot/startup/Makefile
> +++ b/arch/x86/boot/startup/Makefile
> @@ -36,7 +36,7 @@ $(patsubst %.o,$(obj)/%.o,$(lib-y)): OBJECT_FILES_NON_STANDARD := y
>  # relocations, even if other objtool actions are being deferred.
>  #
>  $(pi-objs): objtool-enabled	= 1
> -$(pi-objs): objtool-args	= $(if $(delay-objtool),--dry-run,$(objtool-args-y)) --noabs
> +$(pi-objs): objtool-args	= $(if $(CONFIG_OBJTOOL_DEFERRED),--dry-run,$(objtool-args-y)) --noabs
>  
>  #
>  # Confine the startup code by prefixing all symbols with __pi_ (for position
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 134b15a44625e..566e5be4c3f57 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -588,6 +588,13 @@ config NOINSTR_VALIDATION
>  	select OBJTOOL
>  	default y
>  
> +# For when objtool defers its work to the linked image (vmlinux.o or module.o)
> +# rather than running on individual translation units.
> +config OBJTOOL_DEFERRED
> +	def_bool y
> +	depends on OBJTOOL
> +	depends on LTO_CLANG || X86_KERNEL_IBT || KLP_BUILD
> +

Just commenting: if you move this option OBJTOOL_DEFERRED (and
OBJTOOL_CONTROL_FLOW in the next patch) a few entries up in this Kconfig
file, menuconfig will render them as part of the OBJTOOL submenu because
of the dependency on OBJTOOL.

E.g. this ordering:

OBJTOOL
OBJTOOL_WERROR
OBJTOOL_DEFERRED
OBJTOOL_CONTROL_FLOW
STACK_VALIDATION
NOINSTR_VALIDATION

would render better.

But this is minor, I don't think it necessitates a v3 on its own.

- Julian Braha
