Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4052FF507
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 00:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998729; cv=none; b=Lk8AUafjhM5hEL0JexClFnCIdnWND9aR8sfUuv/l5/5GPcFXqSGH41DHqtYXlq/+YBVKNi1a8EQ4vUYeZ3O3w/dj+xW8Ps2bb5z9FkK6nDc21IHadVzr7eeASLkJZZ1HFiOxVtU/qfRsEh/ab95WJrT6B5uZYZwjii9UkJ2+6FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998729; c=relaxed/simple;
	bh=aR0+8yQ6qie6njOcmw65DGioCP0iccIP1IUhgdEZZBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6KpGHGNUILYysMHAnOVvXlYPHGcvrwaDATkjlvBmZ77SxkUmu3t91H4SPhW7vpcYzntaYOxy2CYny3+L8qBa1Qnt92wuuUvd0VYafRFa4TJi5pLvXg6LZ1g+0NYrfdyD4FHHc20QtFYvMerC3jb/+5/HOWa2guN2bpHS61MfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2H1EZ48; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2H1EZ48"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso699741f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 17:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788998726; x=1789603526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MkuZjw5eDGUjlp1TTmJ/AW6kHmyHaaRrgH/UE88Mn8=;
        b=i2H1EZ485nuXarCUOd6vbxADXvrfyibFmNPi6xr3DQTKnT9HozvB4Sk1FgapJMHXpB
         +NUK1FDyCLSM0K20J+idbfyKj6vSrEb/C8pzW0xOQNoMDIw5WnaPA0nl5+R1VzN6Escd
         ntGMdxWgT9DC4UlbxiFc9YdmWTHelc7CWdqVuCSgAX554UuaboTZ61pCPXyEW9Tw+2eu
         xGCGVCF8Wb/XmrV5TTLaKce+eaxC5M9Z4+zk7Jc0WsxJ+WB7r5vDch2ukMbblXe+I4ke
         pTLji2ZGyXSaDTsXCFUUUZs6JY6tTK8kkLqEqz2yKsqOdc7gnrcLSK7UKWoJBO7Hu7hJ
         DeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788998726; x=1789603526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/MkuZjw5eDGUjlp1TTmJ/AW6kHmyHaaRrgH/UE88Mn8=;
        b=Ka2LH90AllTpzjjp/DiSbUL0FhpzwHudzJxwF6LEc28jejFDJuWB7hg5TwBpAkQ8Oj
         RtiPRdDApX281hFg+2nmyLlGQ91dcV/ulSP1RpNgTlZe2n1pNy7AzQ94i1BpxPiqOAaV
         PNgHHa+th0997dq62f8akGR13mzpiZqOeyg8wRpzkE/hfUU7YZet8q8RSwnduNG33phu
         ikIFrXFPspezX+PdtrzJJTnpHIHCvg3RWcKI5Dnoyyj7GU8vW/HX1vjl+OXmxfAlvm1M
         N0nQl/+/9u8uMuCOhNg4MChbRMjxZ6SHSq8OSFCw2BVHCreBobIJ5CdqgEjlUIg9wuQP
         SlmA==
X-Forwarded-Encrypted: i=1; AKwUvBzTKeuPrytu9mqPaiiyuFITZ568z7s2zy58DhIrscO+wgV5sfOIZnWiarPFf40SubdXjgSL38hxArPIqSI=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ/gl3y/e5lUvvWnt/a7eCzI6MVLAS4JVipjFuqDUsl/fEtDet
	sxZ8NCaHxynM4AUQscQ+tWr6vPI/2yaeBxWOUr0d/L0OSLfirtqidPB5
X-Gm-Gg: AYBFou3o6rJ2uZtOimB3kBR9ErGgPB6B8wzD9uWUHbrGsC5pkamFRvikgPtsZu1+JxS
	0H/o21c875FPRpwEizr+Z/ex5WHVT+Hh/iAVCe6Bo6PkuXx833/CNFMS7wly+LCrClWaKmDjLBQ
	kJS0QO1nPWhwVNZ7EHRzWsInEZWDbsKEVmjgflgn3/50jDmOH4t92nni0lt+Y+I/bAKWmdP+LBc
	uUdUAm2Q2HzMahAwKJpCcYp6gIbXBRjikG7vri8M38gvzQpsk68MRhKBlcyaug0fGVjMp0W/T9B
	ehOb+em0groYpQk+emuJrganom7vyhoDpM0/Z1rdiM2SS287ZvJsjNmCbakUldeFc1xL9OfKdRU
	0cKjdicjcFjOgefsqOOtOZdYCE93YKwHpuZMbUIYpAaLQTplJnlvn8uusTv7ki7//nqAa4+B+cv
	IS34T8uYHVsPxjb28XoUhVxLoLui+TEI8leFNtkyqhukOcaSMWKX6U9uUPsEGhej2xXVJF95pEr
	2MZgk12PAzVKQ3yjkVIuVWpVEjcthpj4V6yImvGD6mu0RnCSwa6zpbh82cHBmIUw7g=
X-Received: by 2002:a05:6000:4a0f:b0:485:877d:ea8e with SMTP id ffacd0b85a97d-485c23d101fmr9118139f8f.14.1788998726167;
        Wed, 09 Sep 2026 17:05:26 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm39540921f8f.17.2026.09.09.17.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 17:05:25 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a6171a9b-de34-45c2-90a3-4e5bc185e700@gmail.com>
Date: Thu, 10 Sep 2026 01:05:24 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Peter Korsgaard <jacmet@uclibc.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ce0786a7-e48d-4d7b-b601-86a598bb03d1@gmail.com>
 <20260908203621.4-1-tulnov.dl@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260908203621.4-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitrii,

On 9/8/26 21:36, Dmitrii Tulnov wrote:
> randconfig checks the numeric range of each probability but does not
> validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
> accepted as 50:0:0: the '%' is parsed repeatedly as zero. This silently
> sets both tristate y/m probabilities to zero, reducing the coverage of
> random configuration builds. Empty fields and extra fields are also
> accepted.
> 
> Warn when the value does not follow the documented decimal format. Keep
> the existing parsing behavior for now so that users depending on these
> inputs are not broken; the warning can be promoted to an error later.
> The documented one-field value 50 gives tristate y/m/n probabilities of
> 25%/25%/50%. Leading whitespace and signs are accepted by strtol(), but are

This "25:25:50" explanation belongs in the first paragraph where you
give the background and state that "KCONFIG_PROBABILITY=50% is accepted
as 50:0:0". Your second paragraph is about what you're changing.

> also warned about because they are outside the documented format.
> Keep the strtol() result as long until the range check so that narrowing
> to int cannot turn an out-of-range value into a valid probability.
> 
> Add regression tests for malformed warnings and out-of-range values, the
> supported probability formats, and the documented empty-value default.
> 
> Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
> Assisted-by: LLM
> Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
> ---
> Changes since v1:
> - Warn about malformed values while retaining their previous parsing behavior.
> - Treat leading whitespace and signs as warning-only undocumented input.
> - Clarify that 50 gives tristate y/m/n probabilities of 25%/25%/50%, and
>   compare it with the equivalent input 50:25:25 across 20 fixed seeds.
> 
> Validation on kbuild-next, x86_64, GCC 13.3.0:
> - make testconfig with HOSTCFLAGS=-Werror: 78 passed. Malformed values now
>   produce warnings while preserving the previous parsing behavior; numeric
>   range errors remain fatal.
> - ASan/UBSan at -O1, with leak detection disabled: the same 78 tests passed.
> - The fixed build accepted 916 of 1,635 generated inputs (including
>   warning-only malformed values) and rejected 719 numeric range errors.
>   It matched the original on 380 documented-input comparisons with fixed
>   seeds. Range errors preserved an existing .config, including with
>   KCONFIG_ALLCONFIG set.
> - make defconfig, allnoconfig, allmodconfig and valid randconfig passed.
>   KCONFIG_PROBABILITY=50% now produces a warning and remains compatible.
> - No vmlinux build or boot test; this changes the host configuration tool.
>   A 32-bit host build was unavailable because multilib headers were missing.
> 
>  scripts/kconfig/conf.c                        | 14 +++-
>  .../tests/randconfig_probability/Kconfig      | 12 +++
>  .../tests/randconfig_probability/__init__.py  | 79 +++++++++++++++++++
>  3 files changed, 104 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fe8ba09b0..33e8baf8d 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -186,12 +186,24 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
>  
>  	if (mode == def_random) {
>  		int n, p[3];
> +		bool warned = false;
>  		char *env = getenv("KCONFIG_PROBABILITY");
>  
>  		n = 0;
>  		while (env && *env) {
>  			char *endp;
> -			int tmp = strtol(env, &endp, 10);
> +			long tmp = strtol(env, &endp, 10);
> +
> +			if (endp == env || isspace((unsigned char)*env) ||
> +			    *env == '+' || *env == '-' ||

This condition expression is pretty long. You can simplify this:

  endp == env || isspace((unsigned char)*env) ||
  *env == '+' || *env == '-'

into:

  !isdigit((unsigned char)*env)

> +			    (*endp && *endp != ':') ||
> +			    (*endp == ':' && (!endp[1] || n == 2))) {
> +				if (!warned) {
> +					fprintf(stderr,
> +						"warning: KCONFIG_PROBABILITY has malformed format\n");
> +					warned = true;
> +				}
> +			}
>  
>  			if (tmp >= 0 && tmp <= 100) {
>  				p[n++] = tmp;
> diff --git a/scripts/kconfig/tests/randconfig_probability/Kconfig b/scripts/kconfig/tests/randconfig_probability/Kconfig
> new file mode 100644
> index 000000000..84f4e5fcc
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_probability/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config MODULES
> +	bool
> +	default y
> +	modules
> +
> +config BOOL
> +	bool "Bool"
> +
> +config TRI
> +	tristate "Tristate"
> diff --git a/scripts/kconfig/tests/randconfig_probability/__init__.py b/scripts/kconfig/tests/randconfig_probability/__init__.py
> new file mode 100644
> index 000000000..ff1770608
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Validate KCONFIG_PROBABILITY without changing the supported distributions."""
> +
> +import pytest
> +
> +
> +@pytest.mark.parametrize('probability', [
> +    'invalid', ' ', '50%', '50 ', '0x32', '10 20', '10:20x',
> +    '10:20:invalid', '10:20:30x',
> +    ':50', '50:', '10::20', '10:20:', '10:20:30:', '10:20:30:40',
> +    '+100:0', ' \t100:0', '0: \t100:0',
> +])
> +def test_malformed_warns(conf, monkeypatch, probability):
> +    monkeypatch.setenv('KCONFIG_PROBABILITY', probability)

You should set the environment variables using 'conf._run_conf' instead
of 'monkeypatch.setenv'.

For an example, see the test in:
scripts/kconfig/tests/warn_changed_input/
and how it uses 'extra_env'.

> +
> +    assert conf.randconfig(seed=0) == 0
> +    assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
> +    assert conf.config is not None
> +
> +
> +@pytest.mark.parametrize('probability', [
> +    '-1', '101', '0:101', '0:0:101', '60:41', '0:60:41',
> +    '4294967296', '-4294967296',
> +    '999999999999999999999999', '-999999999999999999999999',

It would be good to include '-0', which is the only negative input
accepted before this patch.

Also you should include an instance with '+'.

- Julian Braha
