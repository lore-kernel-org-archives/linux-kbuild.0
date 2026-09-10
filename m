Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C1643DECD
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075088; cv=none; b=Y910749a1W3HEZZ3qWAhwGC2SZJmenkkAoPKWnx1l9kG8YfT4gcLcVetg6EGZYmpAmcxNvGWvmt2k0xfHwL0Re39IH+Ok5DvEqFoVB+1TB4iG3EL0/oqZ6ttpd+U0IJg6hZudTa6fimNiPLS0e7uH4A0nBpnIUVYc5Recb6kk8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075088; c=relaxed/simple;
	bh=F9HgVcWPXpU8hJ9oNZYqhSMCDj8N62eZk5P035qTYQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayy7nwV2/NJrqXx2aPgucaSxkG/MIkdpX+oO30HKkOPNDhpxf3uDkWmR8OZENcRHwVl2QZRCNyzkq6hHwwfh4s0V47qrMyfwMl6kwONNwY9JdQ5tyLX87eS0nOOy9/UTFh6G1yur3uN+n4xaaQiOwZChotdBagxzRKXTNRZomJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lb3K4ynJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lb3K4ynJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48589798dbbso161548f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789075079; x=1789679879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5aCQnhClDl9eNpW8F+cN6KkIYA0TsSlZlvTBInA/6z0=;
        b=Lb3K4ynJNVElpJ39InDMIJ5MPmOErz8P5gGHc/P7yDveW8t1MBr8LGQ0TVmswVRUn9
         kh0lZjvIHPtGKsEmxMt2YVTB1/e0W0j2JT27xtQXfB8vjLzJVO+yAO0TDDj1YzpTsQ81
         KB2GGQK+iqOvE8uv/ORla2V/JBorE4pfHNB5FHEu61rux1yRVMDkx3Q27eH9BvCGtJNe
         aLvOJGX82fYex/RNyYWv/yBVSRAiONrlf/4dlJd3/vApU2lUyK65uTZ5kO1c+VrszTCf
         eJprpDWPpWd7+OVnGkogfO9CUw2PkrXQM6WBtHJAKLs/xeHlrI57bjTPAHHMzS6L0SPA
         M3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075079; x=1789679879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5aCQnhClDl9eNpW8F+cN6KkIYA0TsSlZlvTBInA/6z0=;
        b=J6S+5Caa8uq/yjl5VN80pAiu729+umxHzA8rGk26XsCNQvSth+GHODRHk69FCaEw4+
         z09umr+UF4Qee3WcdOWapLe0FSYfRUkR16daOEMCes6ofrOyvY24lVc4D7YCMJqj/KFv
         R0fP/dIAkKdf7b94BcT0GnYMUg8bltOAaV6uQQvU+4WO27lfnutn5W65fH0xAlxpKa+s
         T2/NC//KCzjaOT0OVZrIQ0Oat+ytbU7PMAUILuo70n+RTuX61T11PZMGtUJW3QwxxDul
         4XykjMpbYkdV2+JM8/bg6hwSDh12/kWSByK/RmxjAX4HUaHGTaa9dpsLtVNnXU1N8ITy
         Z0jQ==
X-Forwarded-Encrypted: i=1; AKwUvByZWyOCvKHIb8aTl14oyumctiZp0Uw9M2rVqQofptDTLE4Nsavo8D6xBjpg4kS0vCahKUS2h2EVFrbjMO4=@vger.kernel.org
X-Gm-Message-State: AFuF++k/QcB7ufHhTBetdVhziQYAXo1ZafON0hrk0S7S0yJcsm9X4Q20
	pT3tYy7CfhTP8Sw1HIkwkQFrbL9Ort/Khl4uCA/7ndagmWINVkknGxYO
X-Gm-Gg: AYBFou0mCfHOKrLqjsySRxKNGR1P9ODxl9D8FZWEsQVb1Oxgz7hpCNvGh+Z/mCNZ2TM
	yRcI63rS2XX6lXBqQkPfEd+gj1ympEFAtDFazEaguON/UMCIhkIbtaLxsRnzFTvBcrCM77AdF9Z
	uPYE1DBq4hKUjg74Yot6gpAaaoiqGIITROf/Pi6PcMsIpPeCrSGm+/PWMCofXH7/ZgMf22b/gs3
	7xd4DoJmQiwt18M1zPO9ADMaJsXNf075FIfiFdZemQDhAmY9jYn507vQQ3DHBmHFt+B6VCTy2M5
	3naqadMoNR4P1a7C96eoj/bXCy6zkQ2vC6BVzo5ZRkUsetf5kx+g7U9XFAPaYTHnLXZvg6NSM9D
	6+XIPqUtpRrmxzpdM3QVGW4zgT1XircaUZQDEvRFXl+W5YSE8xNXCG0Zkr/N8PNggd3bPoYZ3W0
	lhxtTfFaF3MaQd4wt8CuB+xWAlYamXmrZGNmCT+z9FvmFRVuzYU9Y5uBCKESEC+vcJrOKE7nxg7
	ZKQ/wo9DoXj089Vcl51JWbyXM571dbWSt76jKDj4pSaVgF2KAyfBDdfrzMzEp4DQfDLdIUeWrzd
	jw==
X-Received: by 2002:a5d:648f:0:b0:484:3310:f395 with SMTP id ffacd0b85a97d-486eb308d7bmr760212f8f.24.1789075078967;
        Thu, 10 Sep 2026 14:17:58 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm1112262f8f.5.2026.09.10.14.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 14:17:58 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <55e18f27-0ba1-433e-b4dc-a7db70172f7a@gmail.com>
Date: Thu, 10 Sep 2026 22:17:57 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: jacmet@uclibc.org, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <71d40a5d-21a7-47ae-aa18-34f640a08779@gmail.com>
 <20260910120442.26-1-tulnov.dl@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260910120442.26-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 13:04, Dmitrii Tulnov wrote:
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
> - make testconfig with HOSTCFLAGS=-Werror: 138 passed. With the unpatched
>   conf: 74 failed, 64 passed; failures cover missing format warnings,
>   unchecked narrowing and ignored KCONFIG_WERROR. The previous v3 draft
>   fails only the nine strict-mode regression cases; 129 tests pass.
> - ASan/UBSan at -O1, with leak detection disabled: the same 138 tests passed.
> - Both v3 builds matched the submitted v2 on 1,635 inputs: 916 accepted
>   values and 719 range errors, with KCONFIG_WERROR unset. Each also matched
>   the original on 380 documented-input comparisons with fixed seeds.
> - Each build passed 120 strict format-error checks: no output created in
>   a fresh directory; existing .config, .config.old and input files stayed
>   unchanged, including with KCONFIG_ALLCONFIG and KCONFIG_OVERWRITECONFIG.
>   Valid inputs, range diagnostics and other configuration modes were also
>   checked with KCONFIG_WERROR set.
> - The probability tests also passed with conflicting probability and seed
>   values and KCONFIG_WERROR=1 inherited from the test runner's environment.
> - make defconfig, allnoconfig, allmodconfig and valid randconfig passed.
>   KCONFIG_PROBABILITY=50% now produces a warning and remains compatible.
> - No vmlinux build or boot test; this changes the host configuration tool.
>   32-bit hosts and other libc implementations were not tested.
> 
>  scripts/kconfig/conf.c                        |  16 +-
>  .../tests/randconfig_probability/Kconfig      |  12 ++
>  .../tests/randconfig_probability/__init__.py  | 137 ++++++++++++++++++
>  3 files changed, 164 insertions(+), 1 deletion(-)
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
> index 000000000..76fc39c94
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Validate KCONFIG_PROBABILITY without changing the supported distributions."""
> +
> +import pytest
> +
> +
> +@pytest.fixture(autouse=True)
> +def clear_werror(monkeypatch):
> +    # extra_env can set strict mode, but cannot remove an inherited flag.
> +    monkeypatch.delenv('KCONFIG_WERROR', raising=False)

Clearing this environment variable doesn't belong here, it should be
part of scripts/kconfig/tests/conftest.py.

- Julian Braha

