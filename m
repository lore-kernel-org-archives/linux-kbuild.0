Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25854E01FA
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548707; cv=none; b=HOmIA74I0E70NNdNJrp2qaHfUFonAWpXGWHd+NBNnGmnauvEM50gExtHt27lGKOQf6PEX47DLUjHLc5ZD+EBqGfJXx9pGnutdhtbo35cR02iN4gosLVY0lSZO/H/R1rLNekp10l3o+U2tkMZCHqlP7Fb8YbHndsTC3Sj3dfFU4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548707; c=relaxed/simple;
	bh=hIx/JZ8ZXCx17f3OrIeJ7eJQdRS7F04oOVjlMosIUV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDpPS4/yKj5p4av7Q3ujpXDfqPbOQ0j+E2NbGhcgUZcubV7IgiwkNjIJTVEUnnMs26WMvddwM9V1hlTqNOyuGlmxfDzVze5I31XF0FC7/kPhxvYO4gMVa2w8c3C/y78wRMYglarP7fFMGDqyZ8X3z93xAjNgSZumXPaOR0jQKzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5i22PC1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5i22PC1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so25239925e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2026 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548693; x=1792153493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJ2EntfC5k3oRjFV7IUX8CiLH1W3oXSVY1zFXmllLxA=;
        b=R5i22PC11AoAr3E9s8K3T6E4Sh3oCUOmblGiX87gXcEpunhYlVVO51wC7CkeSjXV1L
         2bacCfpuC98uueEjZ47qF4pqrHfle8NTwYPCUPPf2iiORgFJwAWDZbVm4kbVhG+HGNnY
         /OTPY7NYVDyE/9UBoRIObnNUTkP35FrBv+rUt9iZFEMHLeR0gOjnHTRzwl8CVafyNIPA
         OXzkB2EAtGk8vBG3F5RBi3olFSFPYofzbPh4aH0djGz0nggiPzL419jutvq6LKE1IT3M
         MdccBgKHkRvhsm59fjyMWNwGntiGeLUxsstiL39ORZgGoUjdu9E2gioMos0jSKqMHjyX
         Uxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548693; x=1792153493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJ2EntfC5k3oRjFV7IUX8CiLH1W3oXSVY1zFXmllLxA=;
        b=ybfbDyod7wQtMhZr7UDa61E/Qq3kWATfwyuVHcJmEYYAkll0L7FzQ1348IEKmtknU1
         Cpanadotn3HW0sIQ/G783+GKHwiPwVlfbHEWutYCRpI984QZU2/qIiGGu11JIhadH/71
         9aOyvS0+G6ZQH4xTOxlAHzlsQGmm+BciAf3l3S22mcI9cNUdJOq8a9g/xPESpcuyf0vS
         nLW30J5sxHEKz28NwPW6MVsiCPE+Rt2n00UQdbS9OW8yhJL5hHp0xCbucMa0HWnDgL9l
         MsgzDhSQ7kWyLfG3BdOTa1mh4+vtC8B/l/H0vZDe1VTa0QZtK0Be4iOfgMuXtv8qoo/U
         T81g==
X-Gm-Message-State: AFuF++l5F4z2QS/exG5j6yCeJiCfjIfVxauatP9w1RbtMWPnlFQU88fw
	bSMXMVVTcvJmjUvG5HkCKoID5DCxivH00ktLB7c3hzwuCygulL9CsX3E
X-Gm-Gg: AYBFou13DLMexgCSOJM5KaPBwdCt102nLAhoGnz8oNcQkIKEwnn0riatzVDYedqBAew
	5fn8XdCN8Lni9XkgQIPQuUNiygps57w3alO/wbBp2OfRbl5aEgCbpAYGUwKUpPGuu3eGjeguSn8
	nFwuBjpdH4+LrSTjxDtRuQAtyid7uQmL1Qh3APeZ4TWNgoXaeF3sEbHMl5eFsxjMafZSxLk438T
	+vatmNkFMEmv2aHONZMzS2lCua3yL4SGba15GE5zSwSjwlvSY+yOR41PmOAm/XTKHknCC8i6JPT
	L9Fgf7wg7MbcQkVNq/gikTCsB1tHKp9PHt5QFcThbEP/U1MTiV+I4Fy9Rhu3kb6WdfhFNWxvyOK
	b2lGlQDwdopmTGSOiiSJSm9weK0P06+MQOK1BIUGv+8iPqQC7anwf6rD3YwMTa7LTxYfrvlGPQT
	HoCkoWsjesTBRo/7v47kXHyMXDyZa+n995+kdzdJ09ZAVX53QJFhrEirjn7NisaFr7X3VvnHbJ8
	cGAAavslxwueYNEyUWRv5Zdnevqt8oaExrfxKge5dxMm87A05NeCIM1PIDab6Rj2Ny7Yg==
X-Received: by 2002:a05:600c:548d:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a18e49c128mr32347995e9.13.1791548692391;
        Fri, 09 Oct 2026 05:24:52 -0700 (PDT)
Received: from [192.168.151.120] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm61164875e9.14.2026.10.09.05.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 05:24:51 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <34f98a75-1050-4116-a2f7-2f118b77cd4c@gmail.com>
Date: Fri, 9 Oct 2026 13:24:50 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: use the value argument in
 sym_get_near_range_bound()
To: Leizhen Zhang <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008164540.3686383-1-lzsx618@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261008164540.3686383-1-lzsx618@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Leizhen,

On 10/8/26 17:45, Leizhen Zhang wrote:
> sym_get_near_range_bound() is meant to check whether the given value is
> outside of the active range of an int/hex symbol, and is called with the
> symbol's current value from sym_calc_value() and with the default value
> from sym_get_string_default().
> 
> Since commit 9b8719973ee2 ("kconfig: use unsigned integers for hex range
> checks") it ignores its value argument and uses the current value of the
> symbol (via sym_get_range_val()) instead. As a result, an out-of-range
> default is no longer clamped in sym_get_string_default(), and
> savedefconfig writes out values that are equal to the effective default
> again, for example CONFIG_A=4 for:
> 
>   config A
>   	int "a"
>   	range 1 4
>   	default 8
> 
> The existing savedefconfig_range test did not catch this because it only
> covers symbols without a prompt.
> 
> Parse the value argument again, and add a test case for a symbol with a
> prompt.
> 
> Found while fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: 9b8719973ee2 ("kconfig: use unsigned integers for hex range checks")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
> ---
> v2:
>  - Use my real name in the From and Signed-off-by lines. No code
>    changes.
> 
> v1: https://lore.kernel.org/r/20261005202524.3461824-1-lzsx618@gmail.com
> 
>  scripts/kconfig/symbol.c                          | 5 ++++-
>  scripts/kconfig/tests/savedefconfig_range/Kconfig | 7 +++++++
>  scripts/kconfig/tests/savedefconfig_range/config  | 1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 2e87af0985..11302faa28 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -195,7 +195,10 @@ static struct symbol *sym_get_near_range_bound(struct symbol *sym,
>  	prop = sym_get_range_prop(sym);
>  	if (!prop)
>  		return NULL;
> -	val = sym_get_range_val(sym, base);
> +	if (base == 10)
> +		val.s = strtoll(value, NULL, base);
> +	else
> +		val.u = strtoull(value, NULL, base);

Minor style nitpick: I'd prefer a comment clarifying that the 'else'
branch is for the 'hex' type.

But... since I'm planning on a refactoring of this int / hex parsing
soon, this is fine for now.

>  	range_sym = prop->expr->left.sym;
>  	val2 = sym_get_range_val(range_sym, base);
>  
> diff --git a/scripts/kconfig/tests/savedefconfig_range/Kconfig b/scripts/kconfig/tests/savedefconfig_range/Kconfig
> index fd59d9082e..d879870a52 100644
> --- a/scripts/kconfig/tests/savedefconfig_range/Kconfig
> +++ b/scripts/kconfig/tests/savedefconfig_range/Kconfig
> @@ -58,3 +58,10 @@ config INT_CONDITIONAL_DEFAULT
>  	int
>  	range 1 2
>  	default 3 if USE_DEFAULT
> +
> +# Default outside of the range of a symbol with a prompt
> +
> +config INT_PROMPT_DEFAULT_ABOVE_RANGE
> +	int "int with prompt"
> +	range 1 4
> +	default 8
> diff --git a/scripts/kconfig/tests/savedefconfig_range/config b/scripts/kconfig/tests/savedefconfig_range/config
> index d939cfe5fd..079a3107a0 100644
> --- a/scripts/kconfig/tests/savedefconfig_range/config
> +++ b/scripts/kconfig/tests/savedefconfig_range/config
> @@ -5,3 +5,4 @@ CONFIG_HEX_DEFAULT_ABOVE_RANGE=0x20
>  CONFIG_INT_IMPLICIT_DEFAULT_ZERO=1
>  CONFIG_INT_CONDITIONAL_RANGE=2
>  CONFIG_INT_CONDITIONAL_DEFAULT=2
> +CONFIG_INT_PROMPT_DEFAULT_ABOVE_RANGE=4
> -- 2.34.1
> 

Thanks!

Tested-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Julian Braha <julianbraha@gmail.com>

