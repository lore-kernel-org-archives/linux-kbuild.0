Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459626;
	b=i6WZG0lM976qAdFZavo8WdzPznQbisgulv4bPath+346Oj7Zm45GUbD3hjb8LMNgg00z
	 EugFQmkoB5N6593BJBZJbvOy/q5CiASGp/wMs2SLaGmjdb1h3O6YdcOsLNf3aItAzstEf
	 sLirbfqQ5P8wdqyhDFAS5sVjAbNTmGV5S0W8sx0k29E39DqtuF0TKz4tD8oc3qAaSIwac
	 xfTOQo+DRHWgSXtluQC0/9X2ugXVQZLmlo+pYEipVhPIKFp6S6FDea6X1ZrB5K4NE/yoY
	 OzebbdioBC8OSSTh2Sokqbfg8pooFr4dMUKG17GQLnXLtBXOwQFrznW88JcIT2B5ehg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kPwBnxV3iPYRn+sXJiJNX4ecyFUSnWk8QAb0fHbFfQQ=;
	b=qJ+4BOFwPPSkRKeUIuWCwLsn7YKwKzZAhRwtrkPNGLquy3JEFAs/iWQusveFkFMQD83Q
	 AFCv2h7w4nU31Vdaal2FMHcpHeYyF5OeMIDMyTeXl7Aun8EM63Lf7CNfUZ2e4iaW02s06
	 CiuZvs9ozxrF6jMiMUCcV7x63mgOrx4IX0PTDXW3SZUmaRGUnV6ts3OYt6tjC902XGM/d
	 fO0wFMm9Bdao3KHLWlwi95xEg4pPOHnE4R3/mr+uOMqPJHIA2abODF77U5A+HwUc6rEUt
	 7OZi4t3cLDfQv3/rYOz6ZbjSqwAhuLbScYSdiJIfyt2Imx+LexVSPOyiBTe21fw3K7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IBi7uHkI;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9673F606A319
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 01:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9673F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IBi7uHkI
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso507686b3a.2
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 18:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459625; x=1793064425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPwBnxV3iPYRn+sXJiJNX4ecyFUSnWk8QAb0fHbFfQQ=;
        b=IBi7uHkITFerkfAaQy2LhzNoa5jV/lEOVz1K0WfkJmeWjj6F8jIQ5z1pSZzEvCkSK0
         GllpBxivcUu3LM++ydIUrrD7s1aX3Qe5HFNGfI5vUR8tyWbCkOf0KQjmc49tRSgiiWbc
         HhGxw5zQePQC8Lbl4f0XnxY/0m33TzZT1lNDkilwjmSdrROVX91ybn8UiqZ5mzjJ2sN0
         eiyjAqCWH1Bd0ZI+8jwhFID67oLrMcPP3IeMedKnCQU21KMiz7szmgcLzLYwlNgQ0zZT
         6lSaEGBc8FoErl+ixWD/FyGSKR7BLHyNl+0MiWKlf+odsWxovTvDWnWJ3J6EGMF3Gp2O
         xQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459625; x=1793064425;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPwBnxV3iPYRn+sXJiJNX4ecyFUSnWk8QAb0fHbFfQQ=;
        b=11htCCTY8R6xBMx8K1oEAl8WMCjdZZxX7Y9GtnyVO2wGkb5s7c4wpdLF2hAMleIqLF
         Itg28VYpyWr6tnyhRbO5BU3G6cOdcKlJxRCltJ9wQAJTs5d+bNVyORC5mOzV1gVoEJKo
         wSplUmyZCMnHD4a+n8K9N16QiNz6wyjqw4ZRXHWn7wPsfOs1sU6IFwoz0UYERWMIFFQ2
         thLEY0ccn21K7cSiGTfCpY3X73oYQ+FJ7XGTnTpGy9aG1H4jJXOzVF3ujuite5SuzLma
         Ljeda/PtVqHbVsdhvtaDa/0BKN/qIE/rQXS5MY8RFOtSfZ34kGeb7JPKWtuPIoibLBrX
         eNkQ==
X-Forwarded-Encrypted: i=1; AKwUvByUcJBt+2eWos1wJIaQgq7IPV9eTpuFmrmP2ha1XcWRsphY63m2Fas93UYAP1JQVRs4EY+Ew4IsImFSqJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5jDJXNSBeB1VE5+4b9sU5JwMqcP4GbmF2emCIu+VxQ32ztGlt
	fCq6LuljeTgVeuKySlRxegmT8BnbXHVKlaBCA4BTlLjoCE4PSnDpiZgJWAxy2Q==
X-Gm-Gg: AYBFou2eFeKruwDQa9iIitGC44js8pjju7dih90x/GB0ssnBOTxmbr9d++59iit+7J7
	/MungD8PNgTKLhvX7t4KQuvqtOcqOXqk4Mi+3j7W433qdCFNm9i+jcDwB0pZdV5L28GPzCPwi74
	W8F5yLobDFiAAbSJs379tzQ0mZaBKS38WKFTKAh46UXEh1rIkgpxwud1NO3T/RUspoDBqU+9yt0
	lUjL4UjtX4rItR9tmohiiq4eZhBMHHYtrh1x4C57lCMFXHUolKYmaJXI7f1/XPVdikrqdthVCou
	zra4flWvNbJ+M2AcSnCSeDMJL3Yr6wCwKLE9HXTOBuBHriSYoxxfcR6pHap1BbkTt7JmtUVCQTI
	3SBgJ2FeM1ftm6ICL/+4xz3iSAAO8vY1FVCialpL/iM5KQAOmEv+mSp8aHPydKR3Yz6DMoBjTt3
	OS21yn1CD1vWpic+PuKp7aN19P9yLRhjT09zYgZhAbdaHxRwW5FxzwPixhTTgyxzo0uUMzgS/DV
	SJtaoSFDsgkwCM12D0BMPhKERyBz7btOA4ANPvJmges4TvSQA==
X-Received: by 2002:a05:6a00:2794:b0:878:3538:8f7a with SMTP id d2e1a72fcca58-8a04ce3dfe2mr6864808b3a.40.1792459624628;
        Mon, 19 Oct 2026 18:27:04 -0700 (PDT)
Received: from ?IPV6:2001:569:59ad:3f00:d46d:ec53:e9ce:eae6? ([2001:569:59ad:3f00:d46d:ec53:e9ce:eae6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f54b2eec9sm4380277b3a.8.2026.10.19.18.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 18:27:04 -0700 (PDT)
Message-ID: <b7720495-5593-43cd-8f59-24bfda39b601@gmail.com>
Date: Mon, 19 Oct 2026 18:26:55 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cao Jin <pino.cao2022@gmail.com>
Subject: Re: [PATCH] kbuild: improve sanity check for ARCH variable on x86
To: Borislav Petkov <bp@alien8.de>, Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org
References: <20261020001738.2607318-1-pino.cao2022@gmail.com>
 <20261020003625.GA787785@ax162>
 <20261020005956.GAata9DF4VOpqO71es@fat_crate.local>
Content-Language: en-US
In-Reply-To: <20261020005956.GAata9DF4VOpqO71es@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you both for prompt response.

I don't think there is document for it, and my rule of thumb tell me 
that all of i{3,4,5,6}86 & x86_32 represent 32-bit x86(unless I am 
wrong). A young developer may try any of those values at cmdline when 
building 32-bit x86 if he doesn't know the nuance among these value.

On 10/19/26 5:59 PM, Borislav Petkov wrote:
> On Mon, Oct 19, 2026 at 05:36:25PM -0700, Nathan Chancellor wrote:
>> On Mon, Oct 19, 2026 at 05:17:38PM -0700, Cao Jin wrote:
>>> When building for x86, ARCH=i{4,5,6}86 and x86_32 will fail the build.
>>
>> Thanks for the patch. Where is it documented that these other options
>> are valid? It seems like this is just expected behavior because these
>> are not valid values for setting ARCH for x86. At the very least, I
>> think something like this needs to be acked by the x86 folks.
> 
> I hardly doubt that it'll ever be without a proper explanation why.
> 

