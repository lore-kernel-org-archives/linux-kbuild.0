Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F87649159B
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2026 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895480; cv=none; b=fHUXaADafIp/Fu1azMQSTz3Vch1Tn5xZc9jqxI944iB/Ztl0mGuMCtkUatWi2V96tMwDJ+qVhJIE5/E3U7v6FEDAIx40SScKzEp5jfCtQZP35MQsChqEMiSmMqL/Hw8IkuVTNIeOoyMcmZARPmVk4AB7RcJyHeYZesCXC1Yj7G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895480; c=relaxed/simple;
	bh=IJo4RpE0CGM0swZSY+NEpI+fOTRQ0NURBOLjSAwlAS4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nAX8FC015dNgxbz9jErZyYx5Hn0ggWJrVhudonww0XaD5ed6f8P0I1Q+62crL+W1Cfnf2v8r5ox6m0WAvvf8VpgGZpwHTaU74ZfgI/vvuDjZobJYF7tWYk4wTo/jPHvIRP6aUjpZbns0XWLacRe0dMpRsglUYQQAEssd9IK69J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W261d9vk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W261d9vk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49954b88fffso37493605e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2026 12:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895476; x=1789500276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjUx5jDKzwh60+DV4HlvInbhvI+U7rjo3NlQfXuuqmY=;
        b=W261d9vkwbnpSsmVt26deZOGNMKKjjYIiFO1SPKsqSEtvaiioQKkOzRSMVbUo1lFMP
         ZHhfFnPlf3W7+rc37a3pdt7WKo1OI2F1gTfZ2YvLLLOgE97jcdFoLVvk8xmLBv3kCYNX
         5+Y/619MxEKfziZwWeMfcJw9uQEReMRAb+pkEiAfQw7rL8P9MyU9m9FT1w9mLuTEl3o/
         Holr7K1qPROQ3r3yMDBlsuRgJSGWIR+kRnmWeLD2kqd4PLV6UUFj4XOvshce7uy34uA+
         NdTT2TCxsRjRvZKFUwAG0zhQIY+x7Op7or2KQDGAEtSbYCM70HXBhLeSY0pgGSIsPUdM
         W2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895476; x=1789500276;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CjUx5jDKzwh60+DV4HlvInbhvI+U7rjo3NlQfXuuqmY=;
        b=CN54z+RJraipR2CuTNZnJKGVzCR4Gd6aw23aQrrQrcgS2zBoYR9n0y6cB6kjjwforp
         N+F/sdy811HYvecKa5b2qbvwgHPrH2QKtnbx9Zzl+TkZfYrBBgHIwl7R3jZPpEhfuZw6
         outOfSWNe5Wz4kJ5k4qVn9LkV2xXLQApYnDQoaeQXLvPW14Z/aVjE/doyXdqCgxl7K37
         zeFfEQcfTV7Ehetw8hYSuucKhJZXSaUFLyQnMBCI8jh11g1NAh1LNuyY4pTI21Row3AD
         HleuI/3mKtP5IvxsvB83OfGghDtEF0Wziy6eG+a9wWuygKXq0422tS37BPj9ycp0HkEj
         s5Tg==
X-Forwarded-Encrypted: i=1; AKwUvBwEC3C9/NE9xODtkiyLz70fBRFAoHpBHcyCT/aU919+WpXymGAXIePXNYo2ySC1qC+gD3OXLL2tZZJyNh8=@vger.kernel.org
X-Gm-Message-State: AFuF++naDKzmiFPhwH6z1pRPFxHnPe+zqywpP1SxvmcIPrP/D+WY3TyW
	quqfhSwKjAxBTwghc3EljBoGZmvUGMi9SAlDHffCwk2XEKKQ/ijSJ3zRFUlgIVoz
X-Gm-Gg: AYBFou1lcEKCGPLR1+MjnpbslXE3eTeQOknmoHKRAJyIIs2aUVcx/71T72jVOZd5R4G
	N2i0aClg5BHMyptmMf2K+QG39SdOSFv8lxJo0V3Q6CFpANJ+XP5FCzkJ261d1t018QlJx2d0Nwz
	PxWwxnT3TWS4oJVrWb3yrfqtllu4mO/FxNLSulsQoxpQgT8AMBB2AuZwPg3Sxs0ROv3RMa2w9wY
	s2YcqkKUn8XDtBSnpGQvx9pmHKYbYSsoLzUr9VSpJ9+FSLYw/r+Q/iujcy3dD//3UVtubJZ48MT
	eiMcs47n3bm4Ey/fFv0D0CJW1/14HofFIBRxXGci26GIwzzQmA5tuvMm1tqwXY2LESTvovm9rcW
	B9ZRZf2WDG/VxGykxBSW163oZKiwVntPZ/HucBZOD4Ge7xyZ8US1QEs0eaZ4DG1riQEjBacHd1T
	Ds9VHNb7n33wxMUZtWjkt/0tWIsiuMu1mKnHJbDDWIn9+fxqXEEL7ey1fN0F6C2ATAgMAGwSL5A
	T6xvVutIzwy9t2kPXMua1lFLi8v1QXJCeCXRWBrCbOwdFKPddo5AQ3E
X-Received: by 2002:a05:600c:b93:b0:49d:17c5:8f7a with SMTP id 5b1f17b1804b1-49d17c58fa8mr84811735e9.18.1788895476203;
        Tue, 08 Sep 2026 12:24:36 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb058c8sm3866445e9.0.2026.09.08.12.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 12:24:35 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <ce0786a7-e48d-4d7b-b601-86a598bb03d1@gmail.com>
Date: Tue, 8 Sep 2026 20:24:34 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: reject malformed KCONFIG_PROBABILITY values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Peter Korsgaard <jacmet@uclibc.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907194536.37-1-tulnov.dl@gmail.com>
Content-Language: en-US
In-Reply-To: <20260907194536.37-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitrii,

I see that this is your first patch submission. Welcome!
And thank you for reporting this.

On 9/7/26 20:45, Dmitrii Tulnov wrote:
> randconfig checks the numeric range of each probability but does not
> validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
> accepted as 50:0:0: the '%' is parsed twice as zero. This silently sets
> both tristate y/m probabilities to zero, reducing the coverage of random
> configuration builds. 

It would be good to note here that 'KCONFIG_PROBABILITY=50' (without the
'%') should be 25:25:50 instead.

> Empty fields and extra fields are also accepted.

Right, in these cases, I think it's reasonable to assume the user made a
typo or other oversight.

> 
> Require each field to contain an integer followed by the end of the
> string or a colon introducing another field, with at most three fields.
> Preserve the leading whitespace and optional sign accepted by strtol().

I disagree with allowing the leading whitespace and sign. The fact that
it's allowed input for strtol() is incidental to us. The intended input
format for Kconfig is:

XX:XX:XX

not:

  XX: +XX:    -XX

> Keep the strtol() result as long until the range check so that narrowing
> to int cannot turn an out-of-range value into a valid probability.
> 
> Add regression tests for malformed and out-of-range values, the supported
> probability formats, and the documented empty-value default.
> 
> Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
> Assisted-by: LLM
> Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
> ---
> Validation on kbuild-next, x86_64, GCC 13.3.0:
> - make testconfig with HOSTCFLAGS=-Werror: 58 passed. With the original
>   conf binary: 18 failed, 40 passed; all failures are new regression tests.
> - ASan/UBSan at -O1, with leak detection disabled: the same 58 tests passed.
> - Both builds passed 1,635 input cases and 440 comparisons with the original
>   conf using valid inputs and fixed seeds. Malformed inputs preserved an
>   existing .config, including when KCONFIG_ALLCONFIG was set.
> - make defconfig, allnoconfig, allmodconfig and valid randconfig passed.
>   KCONFIG_PROBABILITY=50% changed from success to the expected error.
> - No vmlinux build or boot test; this changes the host configuration tool.
>   A 32-bit host build was unavailable because multilib headers were missing.
> 
> An AI coding assistant helped find the issue, prepare the fix, description
> and tests, and run validation. The requested task was to find and fix a
> useful, reproducible Linux bug suitable for a first contribution.
> 
>  scripts/kconfig/conf.c                        |  9 +++-
>  .../tests/randconfig_probability/Kconfig      | 12 +++++
>  .../tests/randconfig_probability/__init__.py  | 54 +++++++++++++++++++
>  3 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fe8ba09b0..fa5dae74e 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -191,7 +191,14 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
>  		n = 0;
>  		while (env && *env) {
>  			char *endp;
> -			int tmp = strtol(env, &endp, 10);
> +			long tmp = strtol(env, &endp, 10);
> +
> +			if (endp == env || (*endp && *endp != ':') ||
> +			    (*endp == ':' && (!endp[1] || n == 2))) {
> +				errno = EINVAL;
> +				perror("KCONFIG_PROBABILITY");
> +				exit(1);

Unfortunately, sometimes users depend on unintended behavior. So I would
prefer to make this a warning for now, and then promote this to an error
later assuming nobody complains.

- Julian Braha
