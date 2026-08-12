Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBDB43B6C9
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 14:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544755; cv=none; b=OTA8WYKICiwz67CcbfSb3IlnCFx2DbK5LtmwrSFrWNqRNWxyEAJ2FGbFg8b/Z/pqfEKWiB0zAzhPjD+3KMA4WgHrcSHMMuZNPDj92YXsv6IE0GNDQ23RnoYqnNb6dwIpROI7ajHKum+cCFeOD1tjWa1n3j6GhTf20ijiTvtYACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544755; c=relaxed/simple;
	bh=w1ULzdV2qwbvaV0HRdjBxjj7A/O3zYU9nDWPgPZmyf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ko/5Jy9w59Ig6mMyTX7Vg5ImIBJ4z2sYTEPTZ0aynzWlz03DEuwCXy+3Xw4A6fX2GD2Q7yWSAA6kqtP1MbmU6dmgMTto2BUA6LzNRnr57hSs3EMeqGjrO6fM/Lv44ODvCjRIft0uevPD0JS6kQa/TNRbruYCy1JZhEAXyKV7ze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqeKn+3R; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqeKn+3R"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caf228a910so8693525ad.2
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544753; x=1787149553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9s7tY9FyrfboX/STUHSdcJVn78sWP0diU8alEnKmPv8=;
        b=PqeKn+3RqfYpeeeEkjV94oULAzCT1IFXcoohFwgGlISg942c1e4Q2pCeyW+APf4c9Q
         09G0Qs+kQExzuFnblKWRvg357H0EHaZy4gn1gu1Gl+MgTh7Ry23eAnrnQRpEnM8sYid6
         KqIfGzPX3oKC0T6sZDQZqYoOb5YFTumwP7Ld2nZZmlvV1GYCdAj/ZS5eJ9EMpQX4fLxh
         m4iSA97AlP/GZKGwPwQcf4M9rPRdyO8Qx74YAMwwiFUNynro9DpKzIh7SsHBwCJw7btl
         hjj7K0m0XBq6L50+CQizon02uJ+9ZCawmGV0cyhG7EsiXvm147SH6tX1qQ93zi8hU4SZ
         1y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544753; x=1787149553;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9s7tY9FyrfboX/STUHSdcJVn78sWP0diU8alEnKmPv8=;
        b=FpjsoCp5V8qfZdsMAlMDiEECqK+yvs/eZVSxYO5E3iJ+MwgVNd4pq2skz7OaHQQwve
         Usfg15EsfZLC6fh3zU7Gr0d+rXzzvY+9DaqlRFaDWkCMgEGnzCTT6HBhGxDDn56gxS2T
         IdbIW4zqQ3JtlPYo+E6fd5SP/G3pdMNZc78fJF7nDIXeGvnQhIClAVZADA+XG5dDn743
         Cq6XcmYzfRL1MRA7nwKcigLEz7P9Gs+p31e+GMF8dzf5x9nrnDfbq2Uqa/7W/Dq/2oLZ
         RFJHCYyffmSdlwyqMtfNTZn9Mh1Hcx37o6SM/bE1b3/+bLkoiCyzYbw5oqJHjHXXDOf0
         Q0SQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8fiSUQMFGE3ev30dhmWiYOVhmDYQwVymjqaqsp3b+45XKCqbxit417qYl2SJUs55wnzI1cCsMheITLUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtMZBAuJRBQPDQpX252KQCv7KPjzmE66YKq8vi/EjOFSsGyoo
	9cS+4V0yb4QU9FipBc0x2t/i3yS/ZVpiKyWjliGwruInLQ/Ke3+i+qPM
X-Gm-Gg: AR+sD12H5rRAdReG4emO45FBsFks5HKge3SUgALeIzfGDL+5+GctCJl5v+OgdcqNRsd
	ZwGNF2OgdMbI+xapwzaWSAiu6zJSupzIPPYOxy8a6g1BngVFvb+nI+pW0oh7lpsSh4B8izQPzzv
	CxtrGj21orwyRXY5Mx1jIIrp54EHzqknpUjSClFNkGK4TcIwt/CjzCehSw23mzZ+J/aF/SDVXhe
	LeYwgHp2VGWhHy5T3HeKwVJIThWu+lV3LZPUBKVz2TSU/ywDQQJzqHvJSpbL95oLNqAYYZMnRER
	MKcxJK/OMzkz22XH9mNFhLI2wSI8Db0HkWM+hJUIDNHevRT3CUhJ6tpUYSL95H0JPopaMqzVmCT
	WYVpAqtVSSIkzNg0kwc4aw1P0ITuzWG3f+LrxmlIEwKEpDuzMzHRKglTIz5b+xQoq2e5kkAvWb/
	ljGxD2fKqBtbTHkdSTY5hdQPyqmX3Gw3X168dbXaY7LudtWt7jzdNEaOEKkR7NjAOjKVmayU+2A
	YW/Vifdk+aiSBFsHCcodGYzOSXTVB5rW19FLeEnt+8AOClDjw==
X-Received: by 2002:a17:902:e5d1:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d345358111mr58670815ad.2.1786544752613;
        Wed, 12 Aug 2026 07:25:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d350fe9a4csm7633665ad.18.2026.08.12.07.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 07:25:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5825b5c2-06b3-4358-91b0-d7bf437528a3@roeck-us.net>
Date: Wed, 12 Aug 2026 07:25:50 -0700
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
References: <amhMsk5Z6P0IA8sr@XiangdeMacBook-Pro.local>
 <20260728065447.91511-1-sj@kernel.org>
 <CAMuHMdWq1eutRM4u1Q3r50f8W4oSejo_XAgyjEKuwi4Lw6K7jQ@mail.gmail.com>
 <anBYnPELPotUiNjv@monoceros>
 <CAMuHMdXUyAX0TV0Sq9_YxvipzkVOBX=4s_r5mVQcZ_7nL=-AQw@mail.gmail.com>
 <87853c96-cc8f-49e6-81b1-02bfe409e372@roeck-us.net>
 <CAJJ9bXyC=piPamaGJN=VMA72Ws+WqgJbYZgTj_w6NFzyLa_mMg@mail.gmail.com>
 <anuyFHLUGDjZWY4K@XiangdeMacBook-Pro.local>
 <CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXUJM-Q@mail.gmail.com>
 <anxQ-DohuQvuKwAH@XiangdeMacBook-Pro.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <anxQ-DohuQvuKwAH@XiangdeMacBook-Pro.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/12/26 03:54, Gao Xiang wrote:
> Hi Geert,
> 
> On Wed, Aug 12, 2026 at 11:30:14AM +0200, Geert Uytterhoeven wrote:
>> Hi Gao,
>>
>> On Wed, 12 Aug 2026 at 01:37, Gao Xiang <xiang@kernel.org> wrote:
>>> On Tue, Aug 11, 2026 at 03:37:38PM -0400, Michael Bommarito wrote:
>>>> On Tue, Aug 11, 2026 at 3:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>> Any progress with fixing this for v7.2?
>>>>
>>>> I would like to fix this since I started the problem with the original
>>>> patch, but I feel a bit stuck.  My v1 and v2 patches would not have
>>>> triggered the build failure, but Gao made valid points about the
>>>> trade-offs that led us to this v3.  Maybe it would be worth your
>>>> opinion on the config approach in those earlier patches?
>>>
>>> Sorry about the late reply.
>>>
>>> As I said, I really dislike hardcoded range, but it is an issue that no
>>> NR_CPUS definition on CONFIG_SMP:
>>>
>>> I wonder if the following diff resolves the m68k issue (I'm not an
>>> Kconfig expert but it seems to work on x86_64 !CONFIG_SMP):
>>>
>>> diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
>>> index 8ca1767dafb6..2dfc313588d2 100644
>>> --- a/fs/erofs/Kconfig
>>> +++ b/fs/erofs/Kconfig
>>> @@ -134,7 +134,8 @@ config EROFS_FS_ZIP_LZMA
>>>   config EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
>>>          int "EROFS LZMA default maximum decompression streams"
>>>          depends on EROFS_FS_ZIP_LZMA
>>> -       range 1 NR_CPUS
>>> +       range 1 NR_CPUS if SMP
>>> +       range 1 1 if !SMP
>>>          default 16
>>>          help
>>>            By default EROFS allocates one LZMA decompression stream per CPU.
>>
>> Thank you, that seems to work (despite still seeing the warning on m68k,
>> as NR_CPUS does not exist).
>>
> 
> ...
> 
>>
>>        $ make ARCH=m68k allmodconfig
>>       fs/erofs/Kconfig:137:warning: range is invalid
>>
>>   Warning...
>>
> 
> Yes, other arches shouldn't have the warning because I think other
> arches (including microblaze) defines NR_CPUS in Kconfig, except m68k.
> 

That is not entirely true. openrisc only has it if SMP=y. But it still
does not generate the warning for some reason.

> The following diff can eliminate the m68k warning above, I think m68k
> folks could consider this way if you really don't want to define an
> explicit NR_CPUS.  Anyway, I think it should go with another patch:
> 
> ```
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 11835eb59d94..90499f126c73 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -44,6 +44,9 @@ config M68K
>   	select UACCESS_MEMCPY if !MMU
>   	select ZONE_DMA
>   
> +config NR_CPUS
> +	int

I would suggest to add

	default 1

Guenter

> +
>   config CPU_BIG_ENDIAN
>   	def_bool y
> ```
> 
> I will try to form a formal patch (with the diff in the previous reply)
> directly to Linus (since I don't have other urgent patches for
> Linux 7.2.)
> 
> Thanks,
> Gao Xiang

