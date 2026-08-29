Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09835E1A2;
	Sat, 29 Aug 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787993824; cv=none; b=YIpR3oLndEfZHnzvYNXNB0AKrrwEDGOACsICQNrK1tMHNbKMZmpXL8vsuPzbnyKRzd6BqPOnBMpMA7fA5/UmDAWFAtRWYmErE4t7nHOp894eDd7EvMPr0ZDiYmOMJOMhV8BIygyKG4dsKNygUn2Vix4UTcVFK+mcIZ0ue4vb+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787993824; c=relaxed/simple;
	bh=LGACgt+8Df37Y3JPPTb1rL1JX2ET15vTRLVxMOSpkqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWB+0b2JVElVla6tLY8NT4WTqcMUASzo5rmgZv/9v5y8Y6pU/YszbNJzLG60759bEv5A4RnNXMl5z8GHCzbIzyw3gVYF7HtapoeqmjxvUcDinuWLvJikqkiMHMhacRXYd8c7XoWGr7vdzc2CcFv/hA4Xbl2qHeMQEBS37ewqptU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=ERwauQZq; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="ERwauQZq"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C3FB3EB86;
	Sat, 29 Aug 2026 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787993810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+CpA5GAaRjy3INgxdWrQaq/dl9yZxsAV6OWAodl4SI=;
	b=ERwauQZq5v/JxXo0++DXBPYJ1nC5x6lxfoj5NA84VfazDKD03CsWHlZtxDylaPWhvVTh3G
	/AtcxXnK33qFDHWfv+lWmbzYGeAJd6f2EpNrY1UKnygCRNwywdmtpFXkU3QtNOR5t/CLYL
	1c5AOsfzWPcGe+UqdqVSgSyAYBca6q+68HYVQrXpXb7Vx1DW88w1SAl0+dhu+xJ97ynJM6
	GBcFKtjgBqrp9ycsXm54FnQH7myICAT9wHvHmDLDQqPcilSI/XB4JFk88k0dVF4Vi/Lvgh
	nhNhMaa94dSIIk+WQNByI5u5S76U+/4kXBk1NDZQumJBiMh4PzAgiCGRbb7nWw==
Message-ID: <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
Date: Sat, 29 Aug 2026 10:56:47 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org,
 "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTE1dvSdG2yLVPvYEeDPLpZvAqI4U17AliU/2sONyT60xA9QjvCGHnYlEEn9XGIt3XbuHahlbWdvwXEWRImKnijMDijjF2iSVw6SqEgNXE/BrKi7EEDrX8+WbrF59CL2xLw0pS6tQP9xXF8O52/ynmGpOHva4BnOei9JSPVRSE+k+TSCD9P0CW1zOsWTKk+uSqXBqJCS2BRzojx8J0iCiaCfT9qHvVDYNDnOHw2yCWfDPYN2Ufu5sl/oKs5pxXqo0dmSjctTpcBZRUhE1JQ28sQftLyHKp31QfSW0mthak4nsb/QNkpYXs71gNZfoYCf8rxDEkrg/b6ZKUBKCsCuaIBqqfsrrC6Kh+OvfU1PFK7MYd62ghSoEreATXwdQTSDdEay7t7VoVeXCLFx2eAJrpWqhQ2OcKonA5A+t6x8yZ22ngtl6BSoQTMRZAJjKVcRBc3l7GsaiNhuW5vBqehUbaOeVqQ6YI7NJqYWv1OIixd9H9NChW6W23/i1g0vTLP0u9TkLE5uyfPAdVRE/fUQh9UPdh8jIMha4OTgQ/IcHyF9eNw02GzScnTcz8kVnnZ75h80i9rHHAi1Q1LDKQn56ffRooY+vmP+baIyC1SAXUofDKwSMeRK6D3q3ciNB27e+JVZTS5lEWVyLQ2EDs9DRNjLF8MuNOXEBG5N/9Xl4kA9/g

Hi Miguel,

On 28/08/2026 7:35 pm, Miguel Ojeda wrote:
> On Fri, Aug 28, 2026 at 7:25 PM Guillaume Tucker <gtucker@gtucker.io> wrote:
>>
>> It states Python 3.9 which was already older than the 3.10 minimum
>> set when the container tool was merged.  Also my understanding is
>> that it's not a hard requirement for all the kernel tools, only for
>> building and producing a functioning kernel.  If I misunderstood this
> 
> I didn't check at the moment, but at least back when the "(optional)"
> tag was removed, it was only required for certain configurations from
> what I understand (I am not sure why the tag was removed).
> 
> In any case, it is nice if we could just say that it is required -- it
> is quite useful to have around, especially due to its standard
> library.

OK so I'll leave this part as-is for now unless someone makes a
strong case for downgrading to v3.9, thanks for confirming.

> And regarding the minimum version, it would be nice to eventually have
> a single minimum for all Python scripts, no? Debian oldstable is
> already at 3.11, so I think we could perhaps bump the minimum already.
> And Debian stable is 3.13, which from your list would be enough for
> everything on your list, right? So we could perhaps set that as the
> actual minimum for everything in the future.

I was wondering about this too, especially since v3.10 is soon going
to reach end-of-life which means no more security patches.  In
principle newer, version should be backwards compatible so if we just
bumped the minimum to v3.13 older scripts that were written for v3.9
should still work - but it'd be nice to have a way to test that.

Well that's beyond this series anyway, maybe something for KernelCI?

Guillaume

