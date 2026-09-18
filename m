Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089465208B5
	for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2026 19:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789759652; cv=none; b=tb2CRzB04gxNdJ4BXsneTOO0F2XEYHipYc/8yQWhDTUV0UfJHqRB5ZfpdLqOtN241MS/+iJ+g7rYjx+FIYs+yaNlPlvnay0MkMO+ZVLxXGg1T4RMohOpz9IK4vg3uPipzkyh43vYU38euYgDiQ8lzV5Af7J0kiRtP+mrxLvtnXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789759652; c=relaxed/simple;
	bh=DAldj/Gh26pnuR/SGM3YThS496ZfVxHqxnXg+1JTpV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3FH8S/r+Tg5fewTt1doaF68qfeWlRmjglrN0CG4PoqVyooJSaC/PXG+Tpe+bQNKw4JQQVTBLWaVZ2mK6YQ1TZHN3/jpkZSXXAWsONaeytg22ACqzQdWnUhE8GdZNsvPPCpCVuCXeE8XJA1Dnj1hiFhrNpMaMBaWQk64s19X/u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7IsAdvG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7IsAdvG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso897299f8f.3
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2026 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789759646; x=1790364446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ugu90flrKaiozY12MfQtlH8FAVcr6Zl8htAnhRTuHCg=;
        b=r7IsAdvG+XQTmob5tC2KXcM/pGWOINR2vJSda5Q6RsoZlivSyRP3DIkbYSMqDe5WmM
         RiBExmAEqPSagbh1NUaqUFVYjXZOet5a5DHL2bxzhzONuKbi4CAel9u3roA5fHncA/Hy
         UbAQR5SnzOufjJjlBZUnMs9pUHfMvnkVfTktdIdzjeax7XhhqIBFJs6rLEY9ZJb1FHLX
         RqKLjbmGEJuK4z7QRIWw2jEoCllDhVG5WB/DqQ+Ud4U42JgCGQGA/sQeZ+l1miuCRuy7
         5BNXg9ruUi2MdPE1z8YejyQkuHy0TLCPuSFHVAHABVkAZQl0tS73QCK/J4k+oseg+hzS
         m2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789759646; x=1790364446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ugu90flrKaiozY12MfQtlH8FAVcr6Zl8htAnhRTuHCg=;
        b=pCmD/jX8KwIRvawZoU4viywsJbyZGojjVAWkkwM/zI6Hu8vaDqlwXRKr9rjcSIyMOE
         Wj/ady+1HN9Qrw22IJkOc8rxpWOFxD4aANckndPxfufZNYFLGiO/I0ThrywcCIsWoL1e
         YNeg6WABiGPZGpBz0oltFaHycEh6eadD521yf5N8vayLLgiaw+14jHOwAxEjWtJMqQRM
         tdGLO2x96yIPJNbXKZA66kkAD4ZEGfaBULBgucuJt38NmD8NZKgOl0haG42W3S1dLqoj
         KJ/9lHZs8Rj0O9Nbnjyp49AOw+MNnEgDOE2492C8xy9DerJhavn/bO/tsYq4AccBZqBK
         CAGg==
X-Forwarded-Encrypted: i=1; AKwUvBzUpD0fF+gfeeucDyqSIRJK6jwD9tE7c/VlR/DPjCy9plId/yO+og+AvXzAI3/6oSYzdXay7+GcHDeWjk8=@vger.kernel.org
X-Gm-Message-State: AFuF++mgJy2t9Al6Wwa2j6hnGDIwEWf15P8r0FqfTWgv0ia9SgBkCxqi
	336tvA5TxJQg59v0/xe34+G0d48marHDCVvY4nQZ+YNgYiRVKuODNy/P
X-Gm-Gg: AYBFou2o7TF0ywWhgvcbdiJOuhL75VVEQebBJyMeRj6p3S/HYhl3EriQfwErZo/zjSt
	/iRPRRute2cmnSg1scieAL5UmGPW+9gwKF9WLm8iQ0Z9hc7i99ROfT9wJNftXwMwNyWugVUuv8j
	ZA/ar6/PZn3qLoN6LkkiglmSMF45NwtFljYqQnnjRnyek/Mkhj/SPYaApIoK/zzyEGQE3USaSzW
	0MfeAyAq56pBWE5nb8lbVp2eg4R0BVVA8mje7r+mfLbfPyy11vVOKF8a1u9blJoOfHBM8/cgfEg
	7KXgQFMZl5U04DjGZJjL0aUN84mw1CLxmrYaOtplWqSZEOck0uWbfSRRRr0QiOF44E3Khj9q2cl
	rp9/b9cWj1VYPygPWg9guFDx5om/xH3HnvvjQhoOJRY+HpQoChGr0FHZTnooJSlnOIjcAYAlGuo
	GUGVH4PtZ7REuKGptcQyAtfFzBpuJDpAAV7UdKc68hv08CFFAkUWCN9QckKf+NKywzyEoSrnJj6
	cMtcbbR9a11Dm775tD3flj+4mIx5BRyO4WG1Q5iRO3/fv2UlMtP14HyHHKziOZzW5u8Pivhl0eg
	rA==
X-Received: by 2002:a05:6000:4b14:b0:487:f18:9a3e with SMTP id ffacd0b85a97d-4871e3aa52fmr4557105f8f.43.1789759645299;
        Fri, 18 Sep 2026 12:27:25 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724564565sm784590f8f.19.2026.09.18.12.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 12:27:24 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9ceb2ab6-f532-49a2-b30b-ecdb4eb4b7b0@gmail.com>
Date: Fri, 18 Sep 2026 20:27:23 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: jacmet@uclibc.org, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <08755883-4332-4892-98d1-92e530bfa8bd@gmail.com>
 <20260915151823.50-1-tulnov.dl@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260915151823.50-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 16:18, Dmitrii Tulnov wrote:
> randconfig checks the numeric range of each probability but does not
> validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
> accepted as 50:0:0: the '%' is parsed repeatedly as zero. For the
> documented value 50, tristate y/m/n probabilities are 25%/25%/50%.
> With 50%, both y/m probabilities silently become zero, reducing the
> coverage of random configuration builds. Empty fields and extra fields
> are also accepted.
> 
> Warn when the value does not follow the documented decimal format. For
> malformed inputs whose parsed probabilities are in range, preserve the
> existing interpretation unless KCONFIG_WERROR is set. In that case, exit
> with an error before writing the configuration. Leading whitespace and
> signs are accepted by strtol(), but also trigger the warning because they
> are outside the documented format.
> 
> Keep the strtol() result as long until the range check. This rejects
> out-of-range values that narrowing to int previously made valid, such as
> 4294967296 becoming zero on a 64-bit host, regardless of KCONFIG_WERROR.
> 
> Add regression tests for one warning per malformed input, preserved
> configurations, KCONFIG_WERROR, out-of-range values, the supported
> probability formats, and the documented empty-value default.
> 
> Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
> Assisted-by: LLM
> Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
> ---
> Thanks, Julian. I've replaced the parametrization with loops and removed
> the unused pytest import. All input combinations and checks are preserved.
> Assertion messages identify the failing input and, where applicable, the
> seed and KCONFIG_WERROR value. Each test function now stops at its first
> failing case.
> 
> Changes since v4:
> - Replace pytest.mark.parametrize with loops and remove the unused pytest
>   import from the probability test module, as requested by Julian.
> - Include the probability and, where applicable, seed and WERROR value in
>   assertion messages. Preserve all input combinations and checks.
> 
> Changes since v3:
> - Move the KCONFIG_WERROR cleanup fixture to the shared conftest.py,
>   as requested by Julian. Explicit extra_env settings still enable WERROR.
> 
> Changes since v2:
> - Move the expected tristate distribution into the problem description.
> - Simplify the initial format check to !isdigit((unsigned char)*env).
> - Pass probability values and seeds through conf._run_conf(extra_env=...).
>   Use monkeypatch.delenv only to remove inherited variables.
> - Add -0, +0, bare + and - warning cases, and the +101 range-error case.
> - Honor KCONFIG_WERROR for malformed format warnings, as discussed with
>   Julian. Check unset, empty, 0 and 1 flag behavior.
> - Compare 50% with 50:0:0 and -0 with 0 across 20 fixed seeds and check
>   that each malformed input produces exactly one warning.
> - Clarify that compatibility applies to malformed in-range inputs with
>   KCONFIG_WERROR unset; values previously accepted by narrowing now fail.
> 
> Changes since v1:
> - Warn about malformed in-range values while retaining their previous
>   interpretation by default.
> - Warn about leading whitespace and signs as undocumented input.
> - Clarify that 50 gives tristate y/m/n probabilities of 25%/25%/50%, and
>   compare it with the equivalent input 50:25:25 across 20 fixed seeds.
> 
> Validation on kbuild-next, x86_64, GCC 13.3.0:
> - make testconfig with HOSTCFLAGS=-Werror: 28 passed, both normally and
>   with KCONFIG_WERROR=1 inherited from the test runner. Explicit strict
>   cases for empty, 0 and 1 flag values still pass.
> - The same suite passed on the existing ASan/UBSan build at -O1, with
>   leak detection disabled: 28 passed in each environment.
> - The probability module now reports 7 tests instead of 117. Tracing
>   confirms that all 178 actual conf calls match v4 in order, inputs,
>   exit status, stdout, stderr and generated configuration.
> - The new suite gives 4 expected failures and 24 passes on the original
>   binary; the version before WERROR gives 1 expected failure and 27
>   passes. Loops stop at their first failure, so these counts differ
>   from the earlier parametrized regression results.
> - C code, test Kconfig and shared fixtures are unchanged from v4.
>   Earlier C compatibility and file-preservation checks were not rerun.
> - No vmlinux build or boot test; this changes the host configuration tool.
>   32-bit hosts and other libc implementations were not tested.
> 
>  scripts/kconfig/conf.c                        |  16 +-
>  scripts/kconfig/tests/conftest.py             |   6 +
>  .../tests/randconfig_probability/Kconfig      |  12 ++
>  .../tests/randconfig_probability/__init__.py  | 139 ++++++++++++++++++
>  4 files changed, 172 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fe8ba09b0..ca6d9d735 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -186,12 +186,23 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
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
> +			if (!isdigit((unsigned char)*env) ||
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
> @@ -227,6 +238,9 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
>  			perror("KCONFIG_PROBABILITY");
>  			exit(1);
>  		}
> +
> +		if (warned && getenv("KCONFIG_WERROR"))
> +			exit(1);
>  	}
>  
>  	menu_for_each_entry(menu) {
> diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
> index 66f95e4ed..2263bd2a3 100644
> --- a/scripts/kconfig/tests/conftest.py
> +++ b/scripts/kconfig/tests/conftest.py
> @@ -312,6 +312,12 @@ class Conf:
>          return self._matches('stderr', expected)
>  
>  
> +@pytest.fixture(autouse=True)
> +def clear_werror(monkeypatch):
> +    # extra_env can set strict mode, but cannot remove an inherited flag.
> +    monkeypatch.delenv('KCONFIG_WERROR', raising=False)
> +
> +
>  @pytest.fixture(scope="module")
>  def conf(request):
>      """Create a Conf instance and provide it to test functions."""
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
> index 000000000..5f9c90e17
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Validate KCONFIG_PROBABILITY without changing the supported distributions."""
> +
> +
> +def test_malformed_warns(conf):
> +    probabilities = [
> +        'invalid', ' ', '50%', '50 ', '0x32', '10 20', '10:20x',
> +        '10:20:invalid', '10:20:30x',
> +        ':50', '50:', '10::20', '10:20:', '10:20:30:', '10:20:30:40',
> +        '-0', '+0', '+', '-', '+100:0', ' \t100:0', '0: \t100:0',
> +    ]
> +    for probability in probabilities:
> +        assert conf._run_conf('--randconfig', extra_env={
> +            'KCONFIG_PROBABILITY': probability,
> +            'KCONFIG_SEED': '0',
> +        }) == 0, repr(probability)
> +        assert ('warning: KCONFIG_PROBABILITY has malformed format' in
> +                conf.stderr), repr(probability)
> +        assert conf.stderr.count('warning:') == 1, repr(probability)
> +        assert conf.config is not None, repr(probability)
> +
> +
> +def test_malformed_preserves_config(conf):
> +    probabilities = [('50%', '50:0:0'), ('-0', '0')]
> +    for seed in range(20):
> +        for probability, equivalent in probabilities:
> +            context = 'probability={!r}, equivalent={!r}, seed={}'.format(
> +                probability, equivalent, seed)
> +            assert conf._run_conf('--randconfig', extra_env={
> +                'KCONFIG_PROBABILITY': probability,
> +                'KCONFIG_SEED': hex(seed),
> +            }) == 0, context
> +            assert ('warning: KCONFIG_PROBABILITY has malformed format' in
> +                    conf.stderr), context
> +            assert conf.stderr.count('warning:') == 1, context
> +            malformed = conf.config
> +
> +            assert conf._run_conf('--randconfig', extra_env={
> +                'KCONFIG_PROBABILITY': equivalent,
> +                'KCONFIG_SEED': hex(seed),
> +            }) == 0, context
> +            assert 'warning:' not in conf.stderr, context
> +            assert conf.config == malformed, context
> +
> +
> +def test_werror(conf):
> +    probabilities = [
> +        ('', 0), ('50', 0), ('50%', 1), ('-0', 1), ('10:20:30:40', 1),
> +    ]
> +    for probability, status in probabilities:
> +        for werror in ['', '0', '1']:
> +            context = 'probability={!r}, werror={!r}'.format(
> +                probability, werror)
> +            assert conf._run_conf('--randconfig', extra_env={
> +                'KCONFIG_PROBABILITY': probability,
> +                'KCONFIG_SEED': '0',
> +                'KCONFIG_WERROR': werror,
> +            }) == status, context
> +            if status:
> +                assert ('warning: KCONFIG_PROBABILITY has malformed format' in
> +                        conf.stderr), context
> +                assert conf.stderr.count('warning:') == 1, context
> +            else:
> +                assert 'warning:' not in conf.stderr, context
> +
> +
> +def test_out_of_range(conf):
> +    probabilities = [
> +        '-1', '101', '+101', '0:101', '0:0:101', '60:41', '0:60:41',
> +        '4294967296', '-4294967296',
> +        '999999999999999999999999', '-999999999999999999999999',
> +    ]
> +    for probability in probabilities:
> +        assert conf._run_conf('--randconfig', extra_env={
> +            'KCONFIG_PROBABILITY': probability,
> +            'KCONFIG_SEED': '0',
> +        }) == 1, repr(probability)
> +        assert 'KCONFIG_PROBABILITY:' in conf.stderr, repr(probability)
> +
> +
> +def test_valid(conf):
> +    probabilities = [
> +        ('0', 'n', 'n'),
> +        ('0:0', 'n', 'n'),
> +        ('100:0', 'y', 'y'),
> +        ('0:100', 'y', 'm'),
> +        ('100:0:0', 'y', 'n'),
> +        ('0:100:0', 'n', 'y'),
> +        ('0:0:100', 'n', 'm'),
> +        ('000:000:100', 'n', 'm'),
> +    ]
> +    for probability, boolean, tristate in probabilities:
> +        assert conf._run_conf('--randconfig', extra_env={
> +            'KCONFIG_PROBABILITY': probability,
> +            'KCONFIG_SEED': '0',
> +        }) == 0, repr(probability)
> +        assert 'warning:' not in conf.stderr, repr(probability)
> +        for symbol, value in [('BOOL', boolean), ('TRI', tristate)]:
> +            if value == 'n':
> +                expected = '# CONFIG_{} is not set'.format(symbol)
> +            else:
> +                expected = 'CONFIG_{}={}'.format(symbol, value)
> +            assert expected in conf.config.splitlines(), repr(probability)
> +
> +
> +def test_single_probability_matches_tristate_split(conf):
> +    for seed in range(20):
> +        context = 'seed={}'.format(seed)
> +        assert conf._run_conf('--randconfig', extra_env={
> +            'KCONFIG_PROBABILITY': '50',
> +            'KCONFIG_SEED': hex(seed),
> +        }) == 0, context
> +        assert 'warning:' not in conf.stderr, context
> +        single = conf.config
> +
> +        # 50% boolean y; 25% tristate y, 25% m, and 50% n.
> +        assert conf._run_conf('--randconfig', extra_env={
> +            'KCONFIG_PROBABILITY': '50:25:25',
> +            'KCONFIG_SEED': hex(seed),
> +        }) == 0, context
> +        assert 'warning:' not in conf.stderr, context
> +        assert conf.config == single, context
> +
> +
> +def test_empty(conf, monkeypatch):
> +    # extra_env overrides inherited variables, but cannot remove them.
> +    monkeypatch.delenv('KCONFIG_PROBABILITY', raising=False)

It seems there's still a lingering unnecessary monkeypatch call here in
test_empty. Otherwise, I think this patch is pretty close!

- Julian Braha
