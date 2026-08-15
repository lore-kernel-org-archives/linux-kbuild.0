Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C256923183F
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Aug 2026 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800680; cv=none; b=Gjpixu1zaH+YOZewMamMqfNCI6jZFKOWTW998EkaOcrb3z1+NP9cQCjBBGI6cnF7XCdS0EUBAZ+x+CPM82Lpiu0pjnYlhvIaQ+6nLHQzsMq5ZUUSegYfqygb2vTcyHguJOwkyQZ2Po0/jig9sRIdem9+GY6yloFkGJQ9BSPP/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800680; c=relaxed/simple;
	bh=7vG4w/vaAjbhiK3sLC4GE7yQUM4mHAtOE6DBrVMaAcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAOzKMytWgZ511JWZEcAZtvgs2FEZy6KdZZpRqPMI8yBG+6UBlqHq3pSKR3DnD+rMqSseoQiQN5JrmL+CWDeUC25fyQC+5GUD6VK3nSFciXSD9hZsrRLQMl3Nw3uqpeUjvhafUiCm5WvtypDPpMzfwsfRhbQCjN0cQ/ywwoJsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKVrtRNP; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKVrtRNP"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e08baf860so2013605a91.2
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Aug 2026 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786800678; x=1787405478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV62CXzf5K42ViVKXjIE4H/Klf/9YX5YUXCrJukmmRY=;
        b=mKVrtRNPM4XZcJxWbWdy2zyGkw/KojUcS5tAgM4i+eUHM6ToZ/e0wJUWPDBDcbSuyx
         PGjucrmalVOdB3SYO2oLcx1LTsRg5OMnTvTZuAdWIe4yi+L9miN1UmTatcqMdlMZtX+C
         ap/GE6Dq2Fhola9YAmIJz/y/wzeKMYSpQTKWrDScO/Pb7vcwU782ZkS/hI7MyRf+1Dop
         qvslVKaK1TztoFd3/fG9nOxaXcEnr9oOyddW2uZbPyVEo2Xm8H54My1+1fAWSfQL/A+b
         ZyfqOyPNseeNmw8RTCDRN5i4Z6HMKnRmY+nytQdnOLMBWRnAX/QfNxNMuD+t3W3WOOMR
         7FnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800678; x=1787405478;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CV62CXzf5K42ViVKXjIE4H/Klf/9YX5YUXCrJukmmRY=;
        b=sHKYeT+v0t5EUmzR7Eegbft7yV5sduH4qbrG8z7TjU3SFbjv74fE13Uh97Cr5tneF4
         GBM4kIC1RzWi9VpEblATufIkTwzBxkRAX8caH/33cAh6a0VdDHiEj3zW80QKceLDZrQs
         oLnfjbb5qzxv1vGovzb3oEQrXP6eGh8NoAbEeMsvivleUocfOjPIyw2+/7cPZ2QGLVIT
         ObJUbxxA8NotZGHBc8NY6FwXGWNEv9tko1wj1aPHEI0iTV0p2XcTS168twzERZpm2lIB
         IKRFgSB3D4EX5fM01/UMbLkmlvO5G1yiN0vMpy+qcX6WoyK3itLTNVdcJcWlSlPLM5fj
         0mgw==
X-Forwarded-Encrypted: i=1; AHgh+RoHKRvcdGtDzd0lKNo1dVSywO9YCXCz2W5n5w1cNGycDNCJJg8tNja+8MzmXgMkusriorpoodqwVoLwoIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZbyCYpsLfWaNg4Go8oJIZH2uBjpdz39njjFCmkZZr8kO2GzhF
	aGmsc0LVOB7OYb0R4etNq0JsW/Bkz11u0ry9EEboizpswJzeyWzGY6M1
X-Gm-Gg: AR+sD11Wr5rCd3iFEsoeZYdp5hP3oqnjjDPz2MXW8sI3d4lKsiZe42jaYDa9lpE/iHI
	mhIGg8VpsZIRjE+p+TPrQTEtMiQ8Wpsars6o5lJ1jRoMH2x7b7GdFvNGGibvlsmikZHbf47G5Yn
	9kbe4ZvYoM9Vs7spEh3q+i4SusYPNJwfxa+Jb01zjmjB1gwn9L8oPJ7lNbdDFR23WBVLTI9SDV2
	CdAEMmd4VgW6ZYoA9ZPTvmGt0pNas/+hiQTmeTFJEiD2t/0wqobbDuuR6fcJ8+mIe7DhnAixBTc
	ESqovUAnI6yHt1ZPZ4hihdXm0UUkK+jhU5FmB5WX6VhnEB9EZAXySP8qfsgqFFm4CoAsOD/vb8o
	2aGYlmD/B9f43yJrn3o2CCuXilKqI4OwZx6c3tDQPw2DWNPWqlRZZxJqNuNbnaLxCk1CIv6YsbR
	IgFgA9MhV0fTo0FSnD5+cstNc6BW3Edc+RWHACZM/3EUYR8P0KBYpWh2HBkOfgsyJc1G+5Xhn3a
	Ser7sre+FzxmSKNJBh2q8AV63xE+CMEdfqWqQ==
X-Received: by 2002:a17:90b:58e5:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-3933caf3a05mr14623380a91.7.1786800677874;
        Sat, 15 Aug 2026 06:31:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea97207fsm6224722a91.1.2026.08.15.06.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 06:31:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7322fa42-3b9a-442b-a49d-ec456b273928@roeck-us.net>
Date: Sat, 15 Aug 2026 06:31:15 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: cap LZMA stream pool size
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Gao Xiang <xiang@kernel.org>,
 Michael Bommarito <michael.bommarito@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 SJ Park <sj@kernel.org>, Gao Xiang <hsiangkao@linux.alibaba.com>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Chunhai Guo <guochunhai@vivo.com>,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Chao Yu <chao@kernel.org>, David Hildenbrand <david@redhat.com>,
 linux-kbuild <linux-kbuild@vger.kernel.org>
References: <20260728065447.91511-1-sj@kernel.org>
 <CAMuHMdWq1eutRM4u1Q3r50f8W4oSejo_XAgyjEKuwi4Lw6K7jQ@mail.gmail.com>
 <anBYnPELPotUiNjv@monoceros>
 <CAMuHMdXUyAX0TV0Sq9_YxvipzkVOBX=4s_r5mVQcZ_7nL=-AQw@mail.gmail.com>
 <87853c96-cc8f-49e6-81b1-02bfe409e372@roeck-us.net>
 <CAJJ9bXyC=piPamaGJN=VMA72Ws+WqgJbYZgTj_w6NFzyLa_mMg@mail.gmail.com>
 <anuyFHLUGDjZWY4K@XiangdeMacBook-Pro.local>
 <CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXUJM-Q@mail.gmail.com>
 <anxQ-DohuQvuKwAH@XiangdeMacBook-Pro.local>
 <5825b5c2-06b3-4358-91b0-d7bf437528a3@roeck-us.net>
 <an9d0zxE5J8txxf6@XiangdeMacBook-Pro.local>
 <1638f2a8-d9cd-423d-83f6-2b436e3c9de0@roeck-us.net>
 <CAMuHMdXpJY3gqx98z92=P8NxV2_-_N+5OVqNvMLDMKq9bhuY+Q@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAMuHMdXpJY3gqx98z92=P8NxV2_-_N+5OVqNvMLDMKq9bhuY+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/15/26 04:41, Geert Uytterhoeven wrote:
> Hi Günter,
> 
> On Fri, 14 Aug 2026 at 20:44, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 8/14/26 11:26, Gao Xiang wrote:
>>> On Wed, Aug 12, 2026 at 07:25:50AM -0700, Guenter Roeck wrote:
>>>>>> Thank you, that seems to work (despite still seeing the warning on m68k,
>>>>>> as NR_CPUS does not exist).
>>>>>>
>>>>>>          $ make ARCH=m68k allmodconfig
>>>>>>         fs/erofs/Kconfig:137:warning: range is invalid
>>>>>>
>>>>>>     Warning...
>>>>>
>>>>> Yes, other arches shouldn't have the warning because I think other
>>>>> arches (including microblaze) defines NR_CPUS in Kconfig, except m68k.
>>>>
>>>> That is not entirely true. openrisc only has it if SMP=y. But it still
>>>> does not generate the warning for some reason.
>>>
>>> I looked into the documentation a bit
>>> (https://docs.kernel.org/kbuild/kconfig-language.html), especially the
>>> following parts:
>>>
>>>    - type definition: “bool”/”tristate”/”string”/”hex”/”int” ...
>>>    - input prompt: “prompt” <prompt> [“if” <expr>] ...
>>>        and "If a prompt is not present, the config option is
>>>             a non-visible symbol, ..."
>>>
>>>    - dependencies: “depends on” <expr> [“if” <expr>] ...
>>>    - Menu dependencies ..
>>>
>>> and I think that is true, taking openrisc for example:
>>>
>>> config NR_CPUS
>>>           int "Maximum number of CPUs (2-32)"
>>>           range 2 32
>>>           depends on SMP
>>>           default "2"
>>>
>>> which can be transformed into
>>>
>>> config NR_CPUS
>>>           int
>>>        prompt "Maximum number of CPUs (2-32)"
>>>        range 2 32
>>>        depends on SMP
>>>           default "2"
>>>
>>> which can be then transformed into
>>>
>>> config NR_CPUS
>>>           int
>>>        prompt "Maximum number of CPUs (2-32)" if SMP
>>>        range 2 32 if SMP
>>>           default "2" if SMP
>>>
>>> so if `SMP=n`, it's equivalent to
>>>
>>> config NR_CPUS
>>>           int
>>>
>>> so NR_CPUS symbol is still there I think (and its value is 0.)
>>>
>> $ grep NR_CPUS .config
>> CONFIG_FORCE_NR_CPUS=y
>> $ grep EROFS .config
>> CONFIG_EROFS_FS=y
>> # CONFIG_EROFS_FS_DEBUG is not set
>> CONFIG_EROFS_FS_XATTR=y
>> CONFIG_EROFS_FS_POSIX_ACL=y
>> CONFIG_EROFS_FS_SECURITY=y
>> CONFIG_EROFS_FS_BACKED_BY_FILE=y
>> CONFIG_EROFS_FS_ZIP=y
>> CONFIG_EROFS_FS_ZIP_LZMA=y
>> CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=0
>> # CONFIG_EROFS_FS_ZIP_DEFLATE is not set
>> # CONFIG_EROFS_FS_ZIP_ZSTD is not set
>> # CONFIG_EROFS_FS_ZIP_ACCEL is not set
>> # CONFIG_EROFS_FS_PCPU_KTHREAD is not set
>> # CONFIG_EROFS_FS_PAGE_CACHE_SHARE is not set
>>
>> The symbol may be there internally, but it does not show up in .config.
> 
>      config EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
>      ...
>      range 1 NR_CPUS
> 
> Apparently the default value picked by "automatic" configs like
> allmodconfig and defconfig is the last item from the range.
> If NR_CPUS exists internally (e.g. openrisc and arm), you end up with
> the "undefined value", aka zero:
> 
>      CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=0
> 
> As NR_CPUS did not exist on m68k at all, you ended up with the NR_CPUS
> literal:
> 
>      CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=NR_CPUS
> 

Upstream commit a64d500b0078 ("erofs: fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
on some UP platforms") should fix that problem. Apparently it did not only
affect openrisc.

Thanks,
Guenter

