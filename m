Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617924;
	b=Y1dyPXb2IwYv3CCL6M2ZAEmXQGjF6rEiOqZTVp4v4GXM/4wMxUixAGYvXqxph0vhe7hb
	 KgT38eeUw39c5CvFvE/1ILk3tPNmumQBbZ/32hnLIl8UYZaUWzBg5MDNW9qoxabSmYDYE
	 8lVkr4Ll5X24x8TkVTpwfyy/ARYzubNb0cI3FKUTQv2VPShZ0sOrlOJ/QjkiMu30DXHhT
	 iLf1r42id5qoOglqIR065f0jSZ2RhAlCXuOh5ouDh/iyxR08rN86zfj6aNK3o/RFTf+++
	 Oaa4tPnBof688XzzldD/bPr/ny91qFyExxePgA3Eu6PfZghX0XS4AswFmz1yoXKJ4DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ACRfzynGelllT77etLsakTD4rjTJm7eeOZSx/UN6ohs=;
	b=kNhETTwgzQa0qCiUkKYE9gV45PWq5DChFOcZuxi3cgrFbvHthIoYEJl/dfHk24pG3J5O
	 IzzJCqBWxUE3IgAyGEvFj2QTJqT2aJ0ckALjvgMlevEvuKQFOCEF6R7ISjytVnAj0J+Ay
	 EljUN9UwFZvf/LpEy3P2W0bFsdw6NyTT0WU4op4RwhRcaLcMkXJ18RqSTmch3Vzzje2Id
	 NU/14WJiAJxq+XNdS33ouBtwqjg7nFVQCNUzZp+qC01k1NX+iOdQhmxrTHefL+DmoC3V3
	 4Kg24IDvjVAne6qo/HQlWUxz1T/TbRwB5Mt6OBo8W5S0YTc7Qh+r24NfWXhgRgghwew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=grsecurity.net;
	spf=pass smtp.mailfrom=opensrcsec.com;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F41606A322
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 21:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F41606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c45111bebso785343f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 14:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1792617914; x=1793222714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACRfzynGelllT77etLsakTD4rjTJm7eeOZSx/UN6ohs=;
        b=G3hXgeJmHnHsg7HJF1z8o1Ip7YCRJVYKpWgy89whmtbjA/wKvGK3WFih60brVXSAB3
         BZxgalQ04wlI2vpqTVcfUF7bFM37C4j6A2IeIqs2It3OZ3MHZCW8CX5lBzl9s23BihmR
         6I62CXqTqZry+xrIL1pyDolzUvz7oJvQwxeRVyrj7PWa2FJnT0mb/i1Gs1rqaoKcvIOd
         lJduth6D9DubAx4+41Nv6qMSR8M1JnFSKOy+MnD16nLuFCEEfLM15M0u6IxdUhPfl8jr
         gchiyqw0f6oUfFxoBHmGHZfWCeEVdm8jMcxlLED4qgZMyYPJ+TPNVGCPazKd+rSrTKDB
         q+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617914; x=1793222714;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACRfzynGelllT77etLsakTD4rjTJm7eeOZSx/UN6ohs=;
        b=BH0zyl66pz8QLX2VSrIah0o7j2UkNAQnm0asaaCJ6kf+x/4Gd8zmkp3436FhYXpumi
         Kc6xIpyyzv+53ZYGwNczjix6geBLrql2VStzm0ow2TsWIuiAg7xpRlRdemt70jfk+NrN
         62wSd+TR/VqSapWxf6EJEGFXMwODR9XGZLJ1HcTpwEgeoLyuu1rvMC/wkNPtcENG9pXu
         i2WM4pYlMp+Mk11ZkDal0Tf/oyMpDF2O2rrM8qLw3FJewuJKn6zAGsbpjTBavlgumNdD
         qShxzN50Jbh3EHOdU7MMhSTd9xuvbjTOsFqG73/uLzNQ1uAcivrikYGkREL4Ikq+0+PT
         y/jQ==
X-Forwarded-Encrypted: i=1; AKwUvByDCwOqGiqAkCjWmI+6NqtHNEqNeub0ZdRrH5I7a4VdCS6MTLiFSWe5W5P/w8I87/JDKXxDM7eqE9HM4Mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfNVajQkvrHH4b838G3luRHzhDCgNX/hdNygzl4kfxh1UUDYmN
	FfsmipMdAAx7fBZPU2AMV+rg8oSgfYDKRajTLmeRyvNhtIPT9UUXnQ0QcY8t4bb+Sas=
X-Gm-Gg: AYBFou1gSWZ0zSLWdgjv/taNbMqQ/2fKB9pQ6S1dSbuTL+uMAtOYT07gAfccWH8Aov2
	CUKXWAw+s0xjiEq4oKZjzdXNNrTiz+IsiyBhNIWCh3IaCU5AZ90HktLEb/1xbqU9adgoWsnfXSb
	cyMM2PGQhwQH9UqmUS4PkbGkp52f4LOzW/E29dofsaTe96Kk8ZKpmiE5awMofLzK4JkWYHdaexT
	jQlgbwj+PQw43hMOsxlxHwvxY0N9i/mZzhT/rSLGRzqbqrS5QkT07Hj79ufd5QiYqEAUfvn+PqU
	MMhf4YDBZaNSgoy8DpzE73bc55NyvqkWR7gY62vGbF77PnlNVrLiqTj3AWfrQP4ylr7aSL77ZGC
	I6J3N5eqm3bR+UYyysCLgeDXsrWX/slMzHcHyWJwWow1ecgTed1oCYypUJgeK8bhP1Iqf/gZ57X
	sL1/5A1dur/wdiayalgCP58b30OiQgaMZ+3lYPJxYXzY7DNJqlL1XbhsIElwskLQPel9k/FikL8
	MKgNdtcs/xUp6yNZ5YJ+yilj4XanKWWc+bi3POZ4mt5UV3+BIaW9VQlyee/ltDO7iDK9cgB+RLW
	s0Fwmzm8+5kv1jKuxRVl8z0XujthZCpTs/1MUXIOy8rHZfCC9NpbWwR8ookbzIQlViNBrN3qIpq
	F3fz2eWw1E0S2
X-Received: by 2002:a05:6000:4b0f:b0:48d:f7f0:327d with SMTP id ffacd0b85a97d-48e264bdb23mr7395870f8f.29.1792617914014;
        Wed, 21 Oct 2026 14:25:14 -0700 (PDT)
Received: from ?IPV6:2003:fa:af11:b900:8855:f04:e797:81cf? (p200300faaf11b90088550f04e79781cf.dip0.t-ipconnect.de. [2003:fa:af11:b900:8855:f04:e797:81cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm8383009f8f.24.2026.10.21.14.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:25:13 -0700 (PDT)
Message-ID: <aad229bb-27c2-4c5f-bfce-73d2a0d04996@grsecurity.net>
Date: Wed, 21 Oct 2026 23:25:13 +0200
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
Subject: Re: [PATCH] kbuild: prevent building single targets twice
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923123936.2227924-1-minipli@grsecurity.net>
 <5836ab69-cfa6-41cc-a28b-5bd3ecfaea03@grsecurity.net>
 <atjwobCk-mdeIlkd@levanger> <20261021190311.GB2611266@ax162>
Content-Language: en-US, de-DE
From: Mathias Krause <minipli@grsecurity.net>
Autocrypt: addr=minipli@grsecurity.net; keydata=
 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
 RzDVkdgPJkL/NFTKZHo5foFXNi89kA==
In-Reply-To: <20261021190311.GB2611266@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.10.26 21:03, Nathan Chancellor wrote:
> On Wed, Oct 21, 2026 at 07:04:33PM +0200, Nicolas Schier wrote:
>> On Wed, Oct 21, 2026 at 08:53:56AM +0200, Mathias Krause wrote:
>>> Ping! I know, it's the merge window but this patch may have fallen
>>> through the cracks as there was no response so far. Just trying to take
>>> care it doesn't get lost.
>>
>> thanks for the ping.  The patch is in my review queue for the upcoming
>> cycle.
> 
> Same, I will try to review it this week or next once I clear my tip of
> tree clang regressions backlog and Kbuild merge window madness.
> 

Thanks, guys!
