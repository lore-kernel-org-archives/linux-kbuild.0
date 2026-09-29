Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756D0395ADA;
	Tue, 29 Sep 2026 07:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665748; cv=none; b=aS+6sA3m3Y9X/DTaOm5NqTWqb15AqkWWgjWJ6kjEY5ALms3umaRKCDVVA/Z5bgZCzGo5MRxKI5pNw26yCJEzvWbkZ19GoGhvpOIoEYIEIRBbMuOsBf3xY+8X6u1AJ8QRp+weoZhhoor4XrjWYDBZCvYuTIBvEeetl48vKhUVFnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665748; c=relaxed/simple;
	bh=opN0ophgBAoWkcRmCvvxHECSx0MgTmTQLigDgTZpwWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVHKmZF/u+LxJ+4pg7KF/U8RDM/P85M8dRVHtvMeCAdBxyoaIym8q8lKJsvLRq60ZC4Z38mXZlpG1FmFHkVv4LEvIlNnvs9UZRHLG43TtpwFzmOGXZCoxi8IvaL2An+sYgRR8Uti3ZaDRPWspXVeGLziE0iYi5EjjzdnpoDXrY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=iO7DkInj; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="iO7DkInj"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 616053ED03;
	Tue, 29 Sep 2026 07:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1790665744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w9D2kUR7R279hz9z6RiS1dtj9gZjtDtF0tTMRuWfTyk=;
	b=iO7DkInjaUo2llNTS9reSVo6dbxpIc0X6qLzRs9G4epQNB8Sjk18yz+OWdKKyiaGsOg5RJ
	cj3KtRmYYefl2DubL0511BRAqLskrI9mdpFksWXBAmTREjveix48qkqQoLXvAVRCbXMW0n
	tdeYQQ7Y+qP5M4gr9stxopqlUyEck6icZ8jly15eTggFP9s1VaNcCbFe0mG0wwbsERztQ3
	RqeLxYRApvaysuIiJs/wlmepw48kXgUQPM2TScrt5o4TnhqgibT4obDxahBJE5ltZlDgz2
	l7uFxi1/dg/JoyBq5OdbdQz6wVw1p7BDRG+kX+jgRAhj9AdXJI+Rmf3T8FujZQ==
Message-ID: <72690a8d-40b6-4109-8211-32e1dcdb8a39@gtucker.io>
Date: Tue, 29 Sep 2026 09:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] scripts: add TOML config to container tool
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernelci@lists.linux.dev, automated-testing@lists.yoctoproject.org
References: <68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker@gtucker.io>
 <03e8513a-3480-42a5-9d1b-fad6c36ed07a@gtucker.io>
 <20260918214804.GA1849926@ax162>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20260918214804.GA1849926@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: dmFkZTFenxi55h2HBRShrkenX+7C3lnxqudytjtg3MfMLMOvzVQksYNZDyiz06KgEyx/pFrpwWWrCdcxrYqmCYdyzMLl4Mhahq0XMT37B0AYGHfNy6TT1dsdE93geegPHS58w2IdjuPf3RhlHtJiGrTalRzyveMs0c35rKwcEY9+mzchD9kzOikL8J629xh0Szp6bhqvwWMSnP9RYXS67YaJCOs6UlcPvGoCUVJET/zanBS0DiEgPh22+YQn/yP/ql/46RNRD7bMTCZydJ40Esu5MoiUAt6yO+qtqQSAbMkTwLhJ1+umiafwjTbo3thmLsb6MzVozx5F1W/QFpUNZA1u11/dgZc2g2SiUOnGqiVDezAUcu9to6nkoflz40Vh/tNsjW7SV9LQgfgkgtcsLXDjUZAybO/8t37QZznPIG1d7w1p2z8e8Mc9+EhaoenLnKhPyTYPElAifxkGCjtlrlrDHzRqP3xF2/j4TVMLfK95WFKhm4JYteKSdnNmg0M7Mz0YCDb/CuMliTn+ZkBdb1jSh56IHpUvOGaPaE8zlu5N7Sp1NH8NQrnhj0fhdon4E85UfqkEuZB9qj4/9PBzp874fvYxO8f3USY0UTx62SXfxnuky+JKO4O0v11jIg5hSLJLSK66s+FxT064EG9Ba83Yd9ld6BKUPFQLT2H27Pfgd2VRRw
X-GND-State: clean
X-GND-Score: -100

Hi Nathan,

On 18/09/2026 11:48 pm, Nathan Chancellor wrote:
> Hi Guillaume,
> 
> On Fri, Sep 18, 2026 at 12:04:09PM +0200, Guillaume Tucker wrote:
>> On 07/09/2026 13:10, Guillaume Tucker wrote:
>>> Add support for a TOML configuration file to the scripts/container
>>> tool.  This improves user experience by not having to keep passing the
>>> same command line options all the time or overly relying on built-in
>>> default values.  Include the concept of 'profiles' with different
>>> named sections in the file to cover various use cases.
>>>
>>> Command line options take precedence over the config file, and values
>>> defined in profile sections take precedence over the default one.
>>>
>>> Add a -c option to override the location of the .container.toml config
>>> file which should otherwise be located in the current working
>>> directory.  If not found, the file is silently ignored as it is not
>>> strictly required unless the -c option is used.
>>>
>>> Add a -p option to choose a particular profile section in the config
>>> file rather than the default.
>>>
>>> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
>>> Acked-by: Nicolas Schier <n.schier@fritz.com>
>>> ---
>>>
>>> Notes:
>>>      Changes in v2:
>>>      - fix uid / gid handling when set to 0 (root)
>>>      
>>>      Changes in v3:
>>>      - fix logic when loading config profiles using None
>>>      - fix typo with missing whitespace in help message
>>>      - clarify how UID gets used as default value for GID
>>>      
>>>      Changes in v4:
>>>      - drop registry option from TOML config
>>>
>>>   scripts/container | 86 ++++++++++++++++++++++++++++++++++++++++-------
>>>   1 file changed, 74 insertions(+), 12 deletions(-)
>> Thanks for the reviews so far.
>>
>> Do you guys need anything else regarding this series?
>>
>> There's no rush of course and we're all busy, just making sure I
>> didn't miss anything.
> 
> No, my apologies for not responding to this sooner. I plan to take a
> look soon, I just keep getting preeempted by other stuff.
> 

Sure, no worries.  On a related topic, I also just started a new
thread about hosting container images[1].  And I'll be at Plumbers
next week so we may also catch up there and discuss next steps etc.

Best wishes,
Guillaume

[1] 
https://lore.kernel.org/all/01a87de4-8de5-4ff0-941b-2e5932a3a19c@gtucker.io/

