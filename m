Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C063C0633
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478009; cv=none; b=KMaF0dzkyN5Bn87EEleDFbrn5a/6IHU33p2UHT0zV+LPrbEZCVou5Y0rcMcRrIum+/sBXu1M5kRU+QEJ4WqKwwJOhVFCjVuYXAXifmyK7LiwMqLb0vbSlCpxcWAEg+VQewSt3ShOSMAkwxNFGBNDw4tyZnTUOb4EGFFKyGtl568=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478009; c=relaxed/simple;
	bh=2qZOTgApo+urlVkwDJfR03ySBnHo7d7qJlq0MTLAgT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZL8cMguFW+nvl0BfYvPbNfwUiOmqiiq0wCGD143B7cLLLN28ZugLnk8x4hC6qA4PkauPQRULWHjpj3+Pp2TP0IpucJXqoMB1k1gBa/duVTeWfAnp2Hu0xGcLzHFXzFGAa9Fva2Gw3QdUoesYs6DHGL+d4R5Ct40lA8u8Xjqyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+4v3h+d; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+4v3h+d"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so749954266b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789478005; x=1790082805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgnuiebg13Nmlc9SkFBtnZR2vUiE46R6S1Zezq82mgc=;
        b=c+4v3h+d9YdhQn3BJ9syY+/RfhivgjrU69kct3JzMCi9POxL5X+DEaWkU37nuc59sV
         zl7OEIRGrUQcmahF/r+hewZCmuNzMWmDM5SAFUmlYm4MSSpI21e0NixueEDKWqNab4sx
         0GWnkJReA9xl+Gvoks4RfY45yBujEaHcfJhcfcUpYqeNX1ey084sNHzHzS5qNzDy5ABm
         A57aINOvHYJ2c+a8VTm3hzN8gKxS2GTuoLUUp12qdaXS5ambhSDl/Ay0oeiUMaJ6Ppt6
         ZkkZB5af46KNtCJmdO8IMkNIt5ZE+/BkKyWAON7QiMJvXZ++4JcMJ3h8kjjVuQ+1J13Q
         bVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478005; x=1790082805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mgnuiebg13Nmlc9SkFBtnZR2vUiE46R6S1Zezq82mgc=;
        b=UZDYIRIxhq/zdjEuxoNeaaLqa1B6fzWxl3ubU3BV85rYwWkWVwW+UjaXM/5Xmgkl1F
         8u9VlC3KFLr2odx9YB7yzhUdUovtk94vIfFL67F/a+Jkb4eV8vFLjnOm35pVVhe0mIX/
         iLQ0RH6rlfSg18I6q2GAQ3Mp4N3E/PaoHAY4gkaueb1Ihyz0RNIAvaAXr/w+jTl16liV
         hz2Wo5mrtNNHAuNXG/EFAOyjXaKx9oB7M9/VM4LB7kfoPCYfS08s2EBZdrtY/WTiwHAW
         hGyEAdG5nXvZEiiP6pHlySKnNW1wO/7Uzpa5+2TXQSzFcrQJ8Um7csjOOS+p7VMimXEz
         vauw==
X-Forwarded-Encrypted: i=1; AKwUvBz8IgNYf9vHpVnHFsiFu6FTmEyvjcnejThSjCZtdzx6bsvZpp1rSL+2PUAZua4yArxOZ8jpwdSwixv5mos=@vger.kernel.org
X-Gm-Message-State: AFuF++nZf3y6EHHtrHJsjBqF0kxnC6ST/Wx+5RuL57hEjDmxqwbYkVv+
	GqFN5CNONEs1oby7I7znRuAxE7arILJO11AUXYfKOPXNxvdjeDjtYPaS
X-Gm-Gg: AYBFou0t0NUkyskqWc5iHvXQw8Jx0uZz/C6k+/ylRaT+c5GKg/QgMJJrjWC8RrmteQb
	pQZqsWOUN402LsTxz+kKWNqM2vu7iBnTVeo+r5hoFwUbfYkoiOkFb31Gs6piJWx72Xg/WqKyI3D
	ZDLx87na5Fkl2HHr7FLF7PdEdYrEp5LXizwZFlDGfMkpxt1/jaTUV1G8aty7ympk7XBpg5ZH2xh
	vFovGf2JeoQbjheS22TA6N8o2z1nowEnmHfqjglQG+ocmSEGo4TsU9Q5v1QWL2haAgwo34RtI2D
	pLDZkuYw5zQbJ1apLQ4QhObSGhp1UrlowOx2YatsiIamErgAX0BX1fheLqh6cCuo4KQoaiksBSN
	RI0QcD2OE+h8dUSeaIEluEukAeCvsFhqgh/dczi6+eMf485pSSohAFMAY6UyFMdNmiduBqZkICF
	vQZbqJMob2bckV4u1UBSOvaAwfw5w/ENWXHIOAp9edLTOcRhUO9gf+73DcH81ztt3Mv9ODE1AiQ
	gy0zLWKqWOOxnxXiw8iF4QfbsqXK23SpUfVQZqc5XGOD1TB3vgT3yCGBkpfbkinB0a9qrkPUfXs
	zKU=
X-Received: by 2002:a17:907:1ca4:b0:c28:599b:7782 with SMTP id a640c23a62f3a-c29b8672548mr503726766b.21.1789478004635;
        Tue, 15 Sep 2026 06:13:24 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:4d53:b3b:9260:9351? ([2001:8a0:e962:d100:4d53:b3b:9260:9351])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm598251066b.6.2026.09.15.06.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:13:24 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <08755883-4332-4892-98d1-92e530bfa8bd@gmail.com>
Date: Tue, 15 Sep 2026 14:13:22 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: jacmet@uclibc.org, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <55e18f27-0ba1-433e-b4dc-a7db70172f7a@gmail.com>
 <20260910215224.26-1-tulnov.dl@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260910215224.26-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitrii,

On 9/10/26 22:52, Dmitrii Tulnov wrote:
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
> Thanks, Julian. I've moved the KCONFIG_WERROR cleanup fixture to
> scripts/kconfig/tests/conftest.py.
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
> - make testconfig with HOSTCFLAGS=-Werror: 138 passed. The same 138 tests
>   passed with KCONFIG_WERROR=1 inherited from the test runner, including
>   the explicit strict-mode cases for empty, 0 and 1 flag values.
> - The same two runs passed on the existing ASan/UBSan build at -O1, with
>   leak detection disabled: 138 passed in each run.
> - C code, test inputs and assertions are unchanged from the submitted v3.
>   Its earlier checks remain applicable: 74 regression failures on the
>   original; 1,635 comparisons with v2 and 380 documented-input comparisons
>   with the original per build; 120 strict error file-preservation checks
>   per build, including ALLCONFIG and OVERWRITECONFIG. These broader C
>   checks were not rerun for the fixture move.
> - No vmlinux build or boot test; this changes the host configuration tool.
>   32-bit hosts and other libc implementations were not tested.
> 
>  scripts/kconfig/conf.c                        |  16 ++-
>  scripts/kconfig/tests/conftest.py             |   6 +
>  .../tests/randconfig_probability/Kconfig      |  12 ++
>  .../tests/randconfig_probability/__init__.py  | 131 ++++++++++++++++++
>  4 files changed, 164 insertions(+), 1 deletion(-)
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
> index 000000000..78d367a9c
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
> @@ -0,0 +1,131 @@
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
> +    '-0', '+0', '+', '-', '+100:0', ' \t100:0', '0: \t100:0',
> +])
> +def test_malformed_warns(conf, probability):
> +    assert conf._run_conf('--randconfig', extra_env={
> +        'KCONFIG_PROBABILITY': probability,
> +        'KCONFIG_SEED': '0',
> +    }) == 0
> +    assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
> +    assert conf.stderr.count('warning:') == 1
> +    assert conf.config is not None
> +
> +
> +@pytest.mark.parametrize('probability, equivalent', [
> +    ('50%', '50:0:0'),
> +    ('-0', '0'),
> +])
> +@pytest.mark.parametrize('seed', range(20))
> +def test_malformed_preserves_config(conf, probability, equivalent, seed):
> +    assert conf._run_conf('--randconfig', extra_env={
> +        'KCONFIG_PROBABILITY': probability,
> +        'KCONFIG_SEED': hex(seed),
> +    }) == 0
> +    assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
> +    assert conf.stderr.count('warning:') == 1
> +    malformed = conf.config
> +
> +    assert conf._run_conf('--randconfig', extra_env={
> +        'KCONFIG_PROBABILITY': equivalent,
> +        'KCONFIG_SEED': hex(seed),
> +    }) == 0
> +    assert 'warning:' not in conf.stderr
> +    assert conf.config == malformed
> +
> +
> +@pytest.mark.parametrize('werror', ['', '0', '1'])
> +@pytest.mark.parametrize('probability, status', [
> +    ('', 0), ('50', 0), ('50%', 1), ('-0', 1), ('10:20:30:40', 1),
> +])
> +def test_werror(conf, probability, status, werror):
> +    assert conf._run_conf('--randconfig', extra_env={
> +        'KCONFIG_PROBABILITY': probability,
> +        'KCONFIG_SEED': '0',
> +        'KCONFIG_WERROR': werror,
> +    }) == status
> +    if status:
> +        assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
> +        assert conf.stderr.count('warning:') == 1
> +    else:
> +        assert 'warning:' not in conf.stderr
> +
> +
> +@pytest.mark.parametrize('probability', [
> +    '-1', '101', '+101', '0:101', '0:0:101', '60:41', '0:60:41',
> +    '4294967296', '-4294967296',
> +    '999999999999999999999999', '-999999999999999999999999',
> +])
> +def test_out_of_range(conf, probability):
> +    assert conf._run_conf('--randconfig', extra_env={
> +        'KCONFIG_PROBABILITY': probability,
> +        'KCONFIG_SEED': '0',
> +    }) == 1
> +    assert 'KCONFIG_PROBABILITY:' in conf.stderr

So I've finally had some time to test this, and I found that all of
these pytest.mark.parametrize() calls are causing the number of test
results to skyrocket. As in, this one test would actually make up the
absolute majority of results.

Could you remove them (and then the 'import pytest') and simply loop
over the values in a list? For example, something like this:

  def test_out_of_range(conf):
    probabilities = [
      '-1', '101', '+101', '0:101', '0:0:101', '60:41', '0:60:41',
      '4294967296', '-4294967296',
      '999999999999999999999999', '-999999999999999999999999',
    ]
    for probability in probabilities:
      assert conf._run_conf('--randconfig', extra_env={
        'KCONFIG_PROBABILITY': probability,
        'KCONFIG_SEED': '0',
      }) == 1, repr(probability)
      assert 'KCONFIG_PROBABILITY:' in conf.stderr, repr(probability)

- Julian Braha
