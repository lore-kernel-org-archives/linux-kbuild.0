Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7698C48C8DC
	for <linux-kbuild@vger.kernel.org>; Fri, 14 Aug 2026 18:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786733075; cv=none; b=qUDQuuwGmglD89/2RGZSQj036eUunVnhvQv0IFsKz4FzHf7T5vNL5/YDxPG3mcbAOp/+rAxoIXKQhZAjfL4ePWRNlgQzCCJ/a2Py8fCOe+oJFCukLqwwj1RdIT5bl79gKRvQElHzaK8+YbDojJl+rzTX3VX7G2MYHWAukoOm05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786733075; c=relaxed/simple;
	bh=PZi2Ut81WMI5mH2Hy30495bCQTdz0blS6RZgVJ89PPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pV84AAlb1B26e8R9V+9KqaJt1AxRo2qVAx29gDIlDhhvAVhH1O/ZGU1iEVGY6Nn/P561H/7o3WT0MsAGdWbLiUnwA62wmCZwileyhMtRMhCTrqJwhYiqGylW+xjzrXkx/5Yme52PigJLi2mwBKyTuUYYXhWwmQutskNe9d8zus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3+zY9m6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3+zY9m6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d049069377so15067455ad.0
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Aug 2026 11:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786733074; x=1787337874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNEidr2KFt1I7RwedPmL91IOikOMlVYzJSqT4ObkJNk=;
        b=p3+zY9m6oCQE/2Ls+BpqEH6Uf5lEYQ1IAizbAR8zW/Weg78KzualS7LNluQMSVc+yu
         LPJEHAspcooYtiZLq52mm0zMwBiwdEx4KjIGJEBsAR3NLy08nGHm/lanJsQEyImy+Ubz
         5uUDsTA9OJimFewFEA5A0kbpxMJ4Qum0SIsw/CziwlyoALmDQzN9XTs4mcRQgf23vzY7
         mxJEFK2A0AZmiz2rUVeDaYd3+Ok4xaPXTbBUehnyrpFNo7f2Z+YQ3fbkg13DlNWBtdZ1
         EpJV72c4UjebJLV5ATlCBxGKHRo8yF/6MpVYiIGsMNVtQOSv56/Qsn6UiJsjFcTN60N7
         2QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786733074; x=1787337874;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNEidr2KFt1I7RwedPmL91IOikOMlVYzJSqT4ObkJNk=;
        b=VSgeYwjOaJfKg97TKZ7vDNMsgqpKDg463yeZDyWzWtS9ilNw+j7fxuyAvs1wRI8qeS
         e1LP3MOPpVES2BAPTmskVsOag1UDZ/shnKKcnaOoFUnLwbD8SCAdYIDubyDHLN8hdwzr
         SyC26oa29iAV5ELelKaElnTSLnJvSVXhH58krkbOA4+gDT7Bk2xQVkGPVgDQHKwdPO00
         X8C6t0Vua/9ErW9Ri8hZaJQTb06r3P725adgWV2zLgbgSG7KLlFXkIIo+VxXParOoZRY
         tJiBerNSsOSKFSLOzC/XXnSbET/Ij11njbx1LNPQ7u+/wRe4dvdjgad0Wgi2t1YberBK
         cbtg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Za0NfEdf3WvLTM3b6iTumWfRtstNIZmzx0k8tCONklOurGSo8YsWvRV5MZ1TvFgzbiE3K7/DZmYgYsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/rVpgsauVvSMikJQs0gYo6Sp1NPsLZtwz4yLGcfnhcRiGRc6
	qjU/Kh8XHG9mMBOu0cQnlND6/9uVhP4F+45bVTb4Uhgv6I+tfZb1zF52
X-Gm-Gg: AR+sD13wdOFjPAMAWNEmV1FyvkROeXfrNKT8ishqZ7ERAelCvQ0SYzn2IbAMiwNpLrM
	0cNFHTw4cSqw8ayn2xTMwjz0be0x5ntaWl8O3PQZxPEvzWSRpqjzNQcpzff2IcaINxRnHen0P9d
	oI93gHVQBdBIVx6HQ2obMzSENGJ5ypDW3e3YLaRfv8eZjCo6RQajP8BWi+dCNHwDwJ2V0P2/kSq
	koSlkyBDqAifHjMeDjF3tGEFqbVXzd3cZl2hSrBg8to7Su+xAOn19pSFoELtLTvqWqVZYlnuwM3
	REoi0wSwH7mWiccV/QA5htfTejrNGpJPcWJClY93y0y2oU175YysUvkOM+ufZpUBDKL0lFDuRTK
	ZKrCSV3oO+NQ4Zbc1gAne7h0WH+WW9CM9arhhDUo1gwM2dl9imlW8ujOidNZ9ZyGwW0skmLoDQq
	fNMaMnJhdqVSDSNryvFTEkXyBAx7umP5FByxaOhwwM+2bLJwZWCG6O1bvPcl+9oQ8Td4ZwgfebN
	B8Rr/NW8Ax7XZD8vlPcFzLEV+HiEcEY1eaRnsDYJ3cxouFR
X-Received: by 2002:a17:903:37c4:b0:2d2:da8e:9017 with SMTP id d9443c01a7336-2d3b0c5437dmr96796605ad.8.1786733073453;
        Fri, 14 Aug 2026 11:44:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm7047822eec.19.2026.08.14.11.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 11:44:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1638f2a8-d9cd-423d-83f6-2b436e3c9de0@roeck-us.net>
Date: Fri, 14 Aug 2026 11:44:31 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: cap LZMA stream pool size
To: Geert Uytterhoeven <geert@linux-m68k.org>, Gao Xiang <xiang@kernel.org>,
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <an9d0zxE5J8txxf6@XiangdeMacBook-Pro.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/14/26 11:26, Gao Xiang wrote:
> Hi Guenter,
> 
> On Wed, Aug 12, 2026 at 07:25:50AM -0700, Guenter Roeck wrote:
> 
> ...
> 
>>>>
>>>> Thank you, that seems to work (despite still seeing the warning on m68k,
>>>> as NR_CPUS does not exist).
>>>>
>>>
>>> ...
>>>
>>>>
>>>>         $ make ARCH=m68k allmodconfig
>>>>        fs/erofs/Kconfig:137:warning: range is invalid
>>>>
>>>>    Warning...
>>>>
>>>
>>> Yes, other arches shouldn't have the warning because I think other
>>> arches (including microblaze) defines NR_CPUS in Kconfig, except m68k.
>>>
>>
>> That is not entirely true. openrisc only has it if SMP=y. But it still
>> does not generate the warning for some reason.
>>
> 
> I looked into the documentation a bit
> (https://docs.kernel.org/kbuild/kconfig-language.html), especially the
> following parts:
> 
>   - type definition: “bool”/”tristate”/”string”/”hex”/”int” ...
>   - input prompt: “prompt” <prompt> [“if” <expr>] ...
>       and "If a prompt is not present, the config option is
>            a non-visible symbol, ..."
> 
>   - dependencies: “depends on” <expr> [“if” <expr>] ...
>   - Menu dependencies ..
> 
> and I think that is true, taking openrisc for example:
> 
> config NR_CPUS
>          int "Maximum number of CPUs (2-32)"
>          range 2 32
>          depends on SMP
>          default "2"
> 
> which can be transformed into
> 
> config NR_CPUS
>          int
> 	prompt "Maximum number of CPUs (2-32)"
> 	range 2 32
> 	depends on SMP
>          default "2"
> 
> which can be then transformed into
> 
> config NR_CPUS
>          int
> 	prompt "Maximum number of CPUs (2-32)" if SMP
> 	range 2 32 if SMP
>          default "2" if SMP
> 
> so if `SMP=n`, it's equivalent to
> 
> config NR_CPUS
>          int
> 
> so NR_CPUS symbol is still there I think (and its value is 0.)
> 
$ grep NR_CPUS .config
CONFIG_FORCE_NR_CPUS=y
$ grep EROFS .config
CONFIG_EROFS_FS=y
# CONFIG_EROFS_FS_DEBUG is not set
CONFIG_EROFS_FS_XATTR=y
CONFIG_EROFS_FS_POSIX_ACL=y
CONFIG_EROFS_FS_SECURITY=y
CONFIG_EROFS_FS_BACKED_BY_FILE=y
CONFIG_EROFS_FS_ZIP=y
CONFIG_EROFS_FS_ZIP_LZMA=y
CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=0
# CONFIG_EROFS_FS_ZIP_DEFLATE is not set
# CONFIG_EROFS_FS_ZIP_ZSTD is not set
# CONFIG_EROFS_FS_ZIP_ACCEL is not set
# CONFIG_EROFS_FS_PCPU_KTHREAD is not set
# CONFIG_EROFS_FS_PAGE_CACHE_SHARE is not set

The symbol may be there internally, but it does not show up in .config.

Guenter

