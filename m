Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460042;
	b=wZmgCfHSsKe64KSQ6RT3L9WYNURyyqoAz6d1RH2KNtQGfjfRWRpV3Om/LN4Sku9MKUMv
	 A9VJxgYTA/3fH9lgk+mcBVC5BKlNbDT4jLaVadyH6woJoX0L/jIx+uQqna4xmfiDzhPEv
	 LDDrEMrkEit7PXnke+2phCM1EmQkNqqPtjGLMcTkFJ5JJuoSdqUzidRMKs5vHUKr/vNRD
	 tSzkHO8gD+Ip/yb4HB5CZ6JQesiOmZeDmTGrj41vgIljMX4O3Yp/BwavXsWaaTA5Ls9I4
	 TYp4WgP1toMwhd/7ENtjv3S5Qj5cHhVL0llKvHSo63VtSg787L0NuEB5vQSDxr5wiIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8SgH5fxEZtudzbhgImdsBqLhzOoVBNtmj1AJFkrhZhE=;
	b=nVZvfigJRucE0XjzNLY9oy/QSNdAEO47KUdRWYjo++pPKnkzfYVCGKoEmi22NYEFyUKv
	 jWdRvkfOUL98GoCehiSTvdx6VrdwyuyI3et1m6/Kk0kyCWGcLvGfdqWc0X0ZuyuqHj3f7
	 yBEbtI6473f4sDw9xqiDQCG3Gan7yQ+ofoV/GKCpXbZQtemBUuuQSWKZGtW9TUkqre7Ph
	 udNx8T72IpPwRjPBOAV468SSWzsScEFWMrMjsWrkMCzaS4dW1N+0QPXFcBj75MSgpZFR2
	 B6ZtfZb/GVWrLEokyzUDL8BlQfL7gplC5AhrU5gxacn2DhXjmUCS5f7JsF50Xw7dOSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fQAvHPgW;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92886606A31A
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 01:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92886606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fQAvHPgW
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e987a2ba0cso22454905ad.3
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 18:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460041; x=1793064841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SgH5fxEZtudzbhgImdsBqLhzOoVBNtmj1AJFkrhZhE=;
        b=fQAvHPgWbNH2v61BDc0Dxo5ohn4Hgk7S9DFVvOEobNMdc+OWNS12oFuge8hA2OhszY
         yDqrhNaiUIqX2d/WlYqldrLHZ2hD79Lo/bzcu5lRnQ7CXXYoEDfwEE9PQDM/NEHYzfaD
         d1Ne8UG6eSb3EB2qygROiKOqq1ltPJTChKtUyb8ycDFACIADtGtiI79fVHvxHLpDKmdJ
         OybxtddceC1EnG6uwoCpC4udB2Bnnw/TpOxMW16GbZoeEwlkV7zudoYI8Ts62nhB/h2k
         0buH7Aayw1gDITSLJi3aVEoyGmCfPcYSbmKivUAQ1aPRUL1FUoynEyrRLq+s+wYDf/B4
         zISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460041; x=1793064841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SgH5fxEZtudzbhgImdsBqLhzOoVBNtmj1AJFkrhZhE=;
        b=tjyXqg9eHz4EPvEa8GW1P8tHh9lnKBzRt3S5bZbl6KKzf1qjSeNRVZbWakMqfwaxxQ
         At1wrnrrvQWWcKseGRNupDSYKTRRJKD0gvxKIPxJTQwhP1XP20ODxOxyHlNiAVfSb2L3
         8bqQvq60RQhnBf5EPmqzATsWBuhDLMDvYjxcCa36y02JZf6LyffUmMUOjBD4QM8FpJDw
         gyh9Rztrr0636tc8gYG+DL1PmTeJuvNqhGFZcbYbMNmOEzSVEOCOjnzRWM0e6q9q+QBz
         DNOn8bTB50MoCP260u9tocpsbw6HB0Zhsro9nCvmR9bmnQAaASVhmM7X/UuLhK21Pf/9
         64DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmsPlgxfEPR6NyrZcXqBCcgTauyZLS9/GFthAXh3ILl7D92K0L+YMc8gkab6VM4gL3rTX4GhVMXQPnKlg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGNrdxi+qoO0IuMtVAnNG0OEPdvL1ruD8WVVCjTZUASb/y6gRQ
	TnFRdOJ6DZUWkPboZyRtvK7bzJtD/xwpQeVr35EgJUhvfprBp2nJTY8ncaV6dg==
X-Gm-Gg: AYBFou3LZMHWMeB6EGC/hXg7eLx7+uW8CJSLQKKloLdiWbbW4xF+thUYvlDs952m/sJ
	zfS032ykjO8bf99UWoSwLZr+2lJva0FAUd6bTD3DrrARr6tx4okN2N+WfFIjHSjLzDEHuSVjCCj
	wzT0TpUCLPA2ZI4Zw19hror/vEZx/1DGMQRwrwMzLOXVb8jX5p2/g0brceYwaoIQ7LW+bBmzeqx
	HvE21GQjH+SUq/vp/pGa24BE9fRMrNUVashBvu+yuAVugfKmm2JFUe56H9ZrjQJ0s9iTDGa6qWU
	R/rayL12/v9MPr5PWgMa2wKxDrzaXuWniEzTq+SdXoAtG7zv6ogNAEgO6c9uInP+XQiaGQ4+Tqf
	4bWKAIVmHsMixbQnhBddEoNmG3nklkMxvmrQiO35Rzqw1nk67cVnQdmp6gtvALUg4r4Nnne+1bh
	Q0hYBJWm976/l4QTpptk83qzpQe4l9VUQFZUiuZs+nsHSE7Hral2dH0T4yyd2qyxESHFaJ7WE4t
	31sUvE58OqtxfkyY2Fgo6KvUK6Ib06jOnInXj6B4aDFpnUHrw==
X-Received: by 2002:a17:903:2342:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e9a6d37436mr77794095ad.55.1792460040878;
        Mon, 19 Oct 2026 18:34:00 -0700 (PDT)
Received: from ?IPV6:2001:569:59ad:3f00:d46d:ec53:e9ce:eae6? ([2001:569:59ad:3f00:d46d:ec53:e9ce:eae6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea145b7805sm7429155ad.8.2026.10.19.18.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 18:34:00 -0700 (PDT)
Message-ID: <3f05fea2-7843-4738-9d58-b245645791ab@gmail.com>
Date: Mon, 19 Oct 2026 18:33:59 -0700
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
Subject: Re: [PATCH] kbuild: improve sanity check for ARCH variable on x86
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org
References: <20261020001738.2607318-1-pino.cao2022@gmail.com>
 <20261020003625.GA787785@ax162>
Content-Language: en-US
From: Cao Jin <pino.cao2022@gmail.com>
In-Reply-To: <20261020003625.GA787785@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/19/26 5:36 PM, Nathan Chancellor wrote:
> On Mon, Oct 19, 2026 at 05:17:38PM -0700, Cao Jin wrote:
>> When building for x86, ARCH=i{4,5,6}86 and x86_32 will fail the build.
> 
> Thanks for the patch. Where is it documented that these other options
> are valid? It seems like this is just expected behavior because these
> are not valid values for setting ARCH for x86. At the very least, I
> think something like this needs to be acked by the x86 folks.
> 

Forget to mention, "i386" & "x86_64" are not valid value for ARCH for 
x86 either, the top Makefile correct them to "x86". So we may want to 
correct all other possible invalid value for x86 ARCH, if my 
understanding of i{3,4,5,6}86 are the same for 32-bit x86 were right.

