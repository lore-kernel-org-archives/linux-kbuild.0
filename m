Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D33B2C11E6
	for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2026 23:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477586; cv=none; b=MRAa8gWfENeW9+T/4Ih1gWtU4kxpl/JH24/41AFF/bnpCPXeggczJ1LlaGKq6FlcgvnhaEWmDrUOxSIhrlJT3sKdqmphNMkljxQy/McxN9CnacR2hcVxzZho6tPFVTjGDn/7bhGCgJfow2BxHClwmEbkZpr2tjrOhI/LQr8rcxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477586; c=relaxed/simple;
	bh=H9PSJZ4zfhmN7k+khECsCDSkPGvzosVDvCsz7jZ/lhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvGBfNsQDPW6rRDp9JcoBN0OrBCwmgSS5nCQMtBXX5gqP/NbRhNLbwfYTLPKkIUqupIsC1J3tShChWUfEXK6RSvevBEQQTLMftIJfA42kiJm3bb40mcPd6WMHuixu5xmfqs9pLpgHBRb2Bc3gqy80CC8VYZfWzfAzwnzWP7+FSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZumUEDN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZumUEDN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48442ea8f59so1139446f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2026 16:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788477583; x=1789082383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSs3v1Vyvq4Ow93mM/MagS50hMlBjFXdv/dnrSISiXM=;
        b=LZumUEDN0NtDMa6aNtHc+Sc/pVLJt6ArBUHWh0J0s0bk/HDNPa0ir08UGipd7gEbmY
         OHDpDW3bthA1KuqSBUNmE1ttnzMbzgukBMAc494hwbuBqwFDLQaOirmZihkG/b4YeNFH
         ExWjyyJqmJZhAI9HpxXXac7WRCJXa7O/fmxB45uiZu70XPjwYwlRgEjUHKGj1VgYaTy5
         Z57qi4q+AC+KlN5mdMqfENzDU95ZfwibRdCx8eeeSuKeAJF9lGQNwFlEloJpirN9IIiP
         bO+9p2Qk0KD/L51LxkJr7tTntGs8KNKBMemdYZ2d1btiZreqUeysiLxv+JKJQPlaMhZk
         J/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477583; x=1789082383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sSs3v1Vyvq4Ow93mM/MagS50hMlBjFXdv/dnrSISiXM=;
        b=iGwMzRoHI7NUH8+OmCdSzKsQsn0PAELuu9HRmbyZK13/8Tjq6pptG+6TCKfwGF2fBr
         0tpf/KG/m6uO3e/9VyizIUIeefU9kLpOG/TNj9MOc9oJZc2f+LdmuV+xkRstf95hdux8
         aUVIl92bjeTcjX8NRW88RLPwbUPwn/4hcaByIovh8FAakTUipn3Rr2lWo07t9omGF+MU
         VrClgb5YqUrsASsvAB9/CdxOlTOBJlZBv+8i0N3Dp4exCze/6ayHIVCIadqdzu9PRR8t
         7IRFN8lHM1mL0PDFBGXAUtOUi8cgpO/l1pjZX9fN7JfNIakC9WsS5d2EPntRaqjS43jr
         3GqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwub8HJkUCgiTPSqgVw/bieLHnpl3caLjQSy+Z/kYNtD4CKgwKlrqnfalHmBrIrsQJuTYVw/yoO9K5/EPY=@vger.kernel.org
X-Gm-Message-State: AFuF++kHBve5Ev5LcFvyfiFtfO5guxZRacr/WzLZP56Z5/kkTzR8nB5h
	f0rwyl+XZd1weKH4on952X7c3Cgiz8bYcXMXwhyT2nvWd5cZP299IYSv
X-Gm-Gg: AYBFou1rJuwi1rWuXcWR6DnvtTPfSI5KAvZH/qG5iHRz28REty5aAMv/7hCUO81O+9U
	ehAQfoas9TGucOp9OG3VN6kuTLbCW9vXplP9W/DOKaTXRUuMwIonVsz8WPag+CM1Pr8WppN3ai1
	x5Kcbwm0dySKB9nU+XLzfdWGiEBg4+118cSviEdQpZXiNBLAF9pSSP2SYyya1tFYG1QELviRXq8
	EbEdZTsiKV2r7MRyJBdGabNPO3pAqSF1yrQzEwUEXqaVqA03pOAuDD8bUEyymx2P6L/qeMIAHtr
	Ak87mUH3b4qFrMu/B3sjs0K/E71boorq0k7esgY5dZoDtfYMGjhHcn+zAxCPVOsmdj9lD0uBt92
	7eGz1hjD4ivEPdS1Mazm5e4+2q4EbhXoBdplUKE1VpfypiZ2FKBLrRuA42svVSDcM0xVZlbpy0X
	8N3E7BW3c6Ba5xkSm5p4TXBmopG5RE30KUkZFBRMDSooKRI2aZrFdZD7zQgUIickHm1/LxfTGgU
	cwL1PG5ZFuiJrHPHSYb7iB6+rnkPtHYRLHZOdFeUgyaD5WouTGRMpSX
X-Received: by 2002:a05:600c:5247:b0:49c:ee3b:723d with SMTP id 5b1f17b1804b1-49cf81f69ddmr9744375e9.0.1788477582575;
        Thu, 03 Sep 2026 16:19:42 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm107836255e9.4.2026.09.03.16.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 16:19:42 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <07f208ad-824a-4cf5-a360-f93546b92d6d@gmail.com>
Date: Fri, 4 Sep 2026 00:19:40 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: fix extra output from savedefconfig on
 out-of-range defaults
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, geert@linux-m68k.org, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
 hongbohbli@tencent.com, guochunhai@vivo.com, michael.bommarito@gmail.com,
 kees@kernel.org, vegard.nossum@oracle.com, sam@ravnborg.org,
 u.kleine-koenig@pengutronix.de, mmarek@suse.cz,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20260830221129.2668354-1-julianbraha@gmail.com>
 <178847452255.440755.3609720780671235760.b4-review@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <178847452255.440755.3609720780671235760.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 23:28, Nathan Chancellor wrote:
>> The Kconfig interpreter currently allows defaults that are outside of the
>> range bounds.
>>
>> In these cases, the 'sym_validate_range' function will adjust the default
>> value to the nearest range bound. For example, see this example:
>>
>>   config A
>>     int
>>     range 1 2
>>     default 16
>>
>> Here, since the default value of 16 is greater than the bounds, the
>> effective default value gets adjusted down to the upper bound, 2.
>>
>> However, 'savedefconfig' writes non-default values, and without being
>> aware of the automatic adjustment to the range bound, it would write: A=2
> 
> Should that 'A=2' be 'A=16'?

No typo, this example is adapted from the original report where it
needlessly writes the adjusted default. In the original it was 1, here
it's 2. [1]

> 
>> This limitation is also documented in a comment: "The following fails to
>> handle the situation where a default value is further limited by the valid
>> range."
>>
>> To resolve this, let's factor out the default-range adjustment logic from
>> the existing 'sym_validate_range' function into its own
>> 'sym_get_near_range_bound' function for 'savedefconfig' to use too, so
>> that it compares against the effective value.
>>
>> Adds tests, accordingly.
>>
>> Fixes: 7cf3d73b4360 ("kconfig: add savedefconfig")
>> Assisted-by: Codex:gpt-5.6-sol
>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Closes: https://lore.kernel.org/lkml/CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com/
>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> 
> Thanks for the patch!
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> Given this is a long standing issue, it should probably go via
> kbuild-next for 7.4, especially in case this results in problems like
> noted downthread. I would revert commit ab74edaeb1ae ("erofs: Fix
> EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic") on top of that.
> 
> I will wait a little bit for the folks CC'd downthread to reply to those
> instances impacted by this change before applying this.
> 

Makes sense to me, and thanks for reviewing!

[1]
https://lore.kernel.org/lkml/c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be/

- Julian Braha
