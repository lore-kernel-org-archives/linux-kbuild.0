Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6963B47D6
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352102; cv=none; b=P1INh/sVsysyduHfbo6QXG9MU3EONt8tW2fCtjIDvxLLGxoeitTn1O5YKDYONcFI2LxhH0nwmaw87MvrCom/3PlfKEckvaJ632P9zHjTHvJYCmjotbLrwXUi5hWnR1/ErXtDXvp/4jxn2FNvOGQjnityo6JerrLhqY9v09ZLZSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352102; c=relaxed/simple;
	bh=dLxLDhZsluEJozasLQ1fGGLtCpEhvnHZVUnXZIn1Mkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mhj3D5jCjCILmFS5pmogYzPXhJohnrA/YuVA7G9BoYCnZxk5o5Kh6TZOGZvh48iELq3THVfsh0woPGBRjnXKUuc2rUiPQhT/5Dn2YdR2VbVlLllooZPLbEcQAEbJXhyHhvBDswh21XHadlfKcN484WT7+w9mgnQGLrNWQo2Btfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FTlLxERo; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FTlLxERo"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40ea611d1a4so3439717fac.2
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776352100; x=1776956900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vbhnmRO7MCa9WiQ7reMvzj2c+4J3QkirLTz5X95JsY=;
        b=FTlLxERo7Uu/U/a4EemrfEGA0qwIXn3UL5UWyGoyhxtb3wthNw+jJCkozbkwt1m4BM
         bb/WmlkaqtZA1XhF3VRiUfeDhTay/sLoPFDajQlUwn9vv7HZ7VSTobqBj+zFj/adSTsu
         3/KZQWzh53NrUsTAFqd9AlEHKZUJHVpvMk+bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352100; x=1776956900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vbhnmRO7MCa9WiQ7reMvzj2c+4J3QkirLTz5X95JsY=;
        b=ZstiXu5maFd+f+G9mO9nm+Ayz0LRFMOuDU4kdPO+xUbc0qF8v08XeJaX+QOyHNmE/H
         SZhNPUIBWmRoGEjHYeSu1LIkqHNLMWudgIzQWM1/nwzhQnyIWu9VAlEI+jxLQ1oOuI2G
         LBwVsfTvuEZz/fWFMfF8A6+Wv4GLRx3VLCGBEiFH0DnqtXzE05HD/9uJZ0NPo6tXb/lw
         i6GbkyHlPFH7c7WpNSN9E5bd9HPRZFTX3Lg7K6AcxHV2cT2sfbdW6h3ZLJOqPKMPds6L
         5xIEGcLFQJKar9ZyGia44M1feIzE2rG98ACPNbATTTypcHjDj4JFxRPHBWdNADU3A8dA
         z4mw==
X-Forwarded-Encrypted: i=1; AFNElJ/3lkAcxYOUOZ/K5e2TSvHnaifzfeQ05ZUXe1zndk6ad5t3YIfvrQ0tu+M97FDi5x57jJpqXreFnRHQuqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2KfeRrfsrXJuMq15YPcARF0mo5kxXhCF1hV8gXCzkrPVyxGGV
	oOyXTy/TaGlxS/nJkCiEh9+UX376gdC3powY9VkNK86VLxjCSc8td1L9oAGJ4DR3EWs=
X-Gm-Gg: AeBDietjZnYTGnQs5Ts0bUn42xmKpeS1LYwQkbVCx52m6h3yx5LnHyiLS37HgSsd1A2
	VhKcG+hsXQpkXaABx/hgY4HKLPRmKEzLjbcK+9PWaQXJ/1fCwoWBG8vLXeVsMp1uGeOqglh04P5
	VZpGVzm2UeQOtIsH3TPx9txQoBuEx2+EuGd4bdLMIs0Wp+n2SB/4OBrjx3cND6U7tq9rqQ5G57Q
	V82Y4RvROyjmsJrCFZkC3pMSPl1D9NYiym/z1ebjftlXysfY/pD0KIqW0saUcBoLsaznpZrh9fu
	UsFyra7nkd3IFJXidmIMtua2mXWlI9/lXxxA9d6AUpdQdrFTwMUiBfPAOaabQLhgf7AQkv2ZSn/
	TnS1kbPnWYAiQwdqwbqwYUCF1+S58RPsyUB4LfY5gAtFLkR335Qhjguo8ufxmrvtw6o4UZAQzUS
	LKNPZCeXvI5ZihnROB3aIrevYUsmJlTB8=
X-Received: by 2002:a05:6870:7883:b0:41b:f7f5:e887 with SMTP id 586e51a60fabf-423e100f0afmr16167618fac.24.1776352100022;
        Thu, 16 Apr 2026 08:08:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42666bcbedbsm4045489fac.5.2026.04.16.08.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:08:19 -0700 (PDT)
Message-ID: <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
Date: Thu, 16 Apr 2026 09:08:17 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <ad-8BIkw_ijCLqcF@sirena.co.uk>
 <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 07:16, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 05:25:40PM +0100, Mark Brown wrote:
>> On Wed, Apr 15, 2026 at 09:40:37AM -0600, Shuah Khan wrote:
> 
>>> Mark, would you like to a revert for this?
> 
>> Yes, I'll massage the text from my report into a changelog send
>> something - it'll probably be tomorrow now.
> 
> Sending shortly, FWIW I'm also seeing a buch of issues with:
> 
> ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
> ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file

I will take a look and isolate the two commits that changes
run_kselftest.sh - sorry for the trouble with CI this time
around.

thanks,
-- Shuah
