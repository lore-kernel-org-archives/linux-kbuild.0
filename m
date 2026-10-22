Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672425;
	b=nXkvaZU9L8RC8v+jZXtvs5S03dIvdnjYuokenhnk9UqjXhCixZg9MYWAWcCoyWF8IzTU
	 qiljknuR6NWphmEQqnJGqpPWkfsATG3xjXJLqoMVkc18N6u8f8x1NN1GzKSleZgh5Hwn8
	 1b3qJIaUVWJaHdrfOZI2NVMw5CgbHmYul9FVVWoIgdsSTr6ENlw3ijSO9gZiEN6Col6DQ
	 nykYY+2w4mj9ETWKZKqFUWq0tKJIDk5K0p/3CQ5QR6MBqxtZ+4EiANB+rDDb7KMGYb2RP
	 uWerrVo4kJoKyJkuttpmWwrLLWYnIt3x9qcTKyZI1HV+Y07/xTxGV252YW2aHO/tzGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672425;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-GND-Sasl:X-GND-State:X-GND-Score:X-GND-Cause;
	bh=PzLdnwzhOpSaZeeNAssy8uRY/6VB3glvi13v/N157wE=;
	b=bvoghF9oHiwoge0xVkLkb63CDtUgkjqkmIONDhi3tn/mvDwfftMxrnW+VvLjXtkxTdaG
	 Nv4apg4ZGwqBGKd4ERgxk40CzOFsk1DbP929IncfoPucZixvbPXOAFMY95xfw4p7OhxbT
	 OXQ7tyAA8toANMtTMY3K6f86IVZq277UQVfWWagW734RKXw7ap6uRBvSU/r37JUt2ZJ5x
	 7OXfj/5YLVAxSHHo5NyoMyrEs4b93HNu8ihDkWEZ+UjG7eF+vkj9gcOKBNEg9egt1hTyw
	 04RQO2BrNNwsKVBHdx/i6Ii1X6KZjoEOcLpYZ4XQQJ9VOH7Lh0pNbtB9aEKSRJUSv6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gtucker.io;
	spf=pass smtp.mailfrom=gtucker.io;
	dkim=pass header.d=gtucker.io header.i=@gtucker.io header.a=rsa-sha256 header.s=gm1 header.b=FE+nZqnz;
	arc=none smtp.remote-ip=217.70.183.193
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F132606A31A;
	Thu, 22 Oct 2026 12:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F132606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gtucker.io header.i=@gtucker.io header.a=rsa-sha256 header.s=gm1 header.b=FE+nZqnz
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85A243EE42;
	Thu, 22 Oct 2026 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1792672416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PzLdnwzhOpSaZeeNAssy8uRY/6VB3glvi13v/N157wE=;
	b=FE+nZqnzagovPS6sjXCGGFnQSpspoz0qLOR1FIELg0FnbWsglTZ3UTcz18JCBAB5Cvzxbt
	VL+imIPqCDF92Mie1SzlBgk9h6j/xZtyQN3U6iXuQY2xHNe+TH2wGu2YB64hPk100dBoai
	xUsvbI8OLMCKgjD9QNZYpdYEuTBzdj5NY0GLPM7A4E6DExBljtD/TuaeIuXPSoC+iyJmDo
	hKQSb75hVmRy/SxBt8KZZj+/PIflEfYbg679qNqs2RGKAscuyh9VhbvYlp2mTaV4V2/VhJ
	qwtp/mR8b4Io9v4jDvFvcVJLJIVSS8sdEJb0KILVzZUdZzy9Fg9fL55zqospKg==
Message-ID: <8cf6a585-515f-4ebc-8a8f-29de56a83529@gtucker.io>
Date: Thu, 22 Oct 2026 14:33:35 +0200
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
Subject: Re: kernel.org container images
To: SJ Park <sj@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
 linux-kbuild@vger.kernel.org
References: <20261015133638.86959-1-sj@kernel.org>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20261015133638.86959-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTE/S4BhfnCjrHhOIlr0QTUJfqSf2ospOlnXag/baLHqELxcqhoBRQvdpRPQ9FjAA3fP5kKxO7EODmMchnVjwUFQDVpmDzqVqTO8oAQp+flafGTKg5VCs12OyXXWJ0JDeQvVUmTksG5NyvH54blEfmMIMmYpjJxGzfXELLmO/Wfpv69m/huOXzh7RM1ZjjF7IJjC7SXl/5jy67x4Ol3jYsdDqtRVxBOFIBnZ2aKGtbAh7oHzMFMjwKMyw2hXHF1/KrwJ+trJ3MnqWrkZVfintwo8aLYJ/bk8n/k+TAyFx5zlkll/zQe1mvK/8YnLtfIL1SKrFTmU4qmjDVWNZxm+F/g8Xi5dL/8Q4t4fpksAgGjCgsU1VQXWx0mdaqB6SuknPWllPptBOhwxm02SJSlqtdUw88O+E1ooK5/Y0WWZkKW11aB3YRtDA5EpwlbkUXKVPiwt2SQmVXltQIzk+9VhUWQ9xQRq/YVQhljVv2NpRdf5JWqt17e9PjX2GcwKAsOvRhnYOYM+JYJHocAEpgwbxrcLT9LxVNEL6DujCjjXs+w/KDy4Wmg93SK1aeERbPy6/jvTvwEuC1yg/uNAIEINWZMLHfzuRW7qjM3BcBAyXosSrenCsgUPeN2nAbKRxO1W6s+Y/yqLZVIHQ/SnfiMM/kTOwx4aaCQErQfd1AjEKMm6PQ

Hi SJ,

On 15/10/2026 15:36, SJ Park wrote:
> On Mon, 28 Sep 2026 14:30:48 +0200 Guillaume Tucker <gtucker@gtucker.io> wrote:
> 
>> Hello,
>>
>> We discussed the topic of managing container images on kernel.org
>> again at Kernel Recipes last week with Konstantin and Arnd.  The
>> idea is to provide a set of reference images with kernel.org
>> toolchains which developers could use via the scripts/container
>> tool.  They would provide a common denominator to facilitate
>> development and reproducibility.  These images would of course not
>> be tied to any single tool and could provide a basis for CI bots
>> such as KernelCI or tuxmake.
> 
> I run a few humble and hacky build tests on my local machine.  I also want to
> do the build test on more setups including rust enabled build, and on more
> machines of different architectures.  But I'm short of time to learn how to do
> cross build correctly.  The Rust for Linux training at LPC helped me doing rust
> enabled kernel build for the first time, though.  Kudos to Rust for Linux team.
> 
> I am therefore considering options including use of the scripts/container tool.
> I was unable to find a time to do that so far, though.  Having recommended
> images in kernel.org will definitly help me prioritizing it.
> 
> I also find opportunities to use the images not only for build tests but more
> use cases including benchmark runs.
> 
> I just wanted to say thank you for developing the tool and this kernel.org
> registry initiative.  Looking forward to more progress, and I will also try to
> find if there is something that I can help.

Many thanks for your feedback, this definitely helps a lot already.

It's great to see how the tool can improve workflows for developers
and maintainers as well as automated testing.  Having the generic
kernel.org registry will be the next milestone as these images are
meant to provide the foundation for many use cases, not just the
scripts/container tool.

As discussed with Miguel, we'll work on providing images for doing
Rust builds using kernel.org toolchains too.

Best wishes,
Guillaume

