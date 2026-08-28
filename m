Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E983A389116;
	Fri, 28 Aug 2026 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899156; cv=none; b=P0Rz9IXNCGpk2sk8hjWPxlfcDsfgGV5fu22QhoRaA6oRh0VLRIGNYtwC3IimVm8B3Ru4rlwct/ejFJxDndUZlQEmioriAorGNbMkD2g61wijx2Xi9Wqrj9piOEAM4H+1h6J5QROmxsMYpaalEGk0j1VZqgi0ai1fsh9vr83yaHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899156; c=relaxed/simple;
	bh=FvqYokxa7b4ERMmqK+ISvEpBiMhA4S2acjDPbxpaObI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acKrGVsl8isZAqmu+bdaaRTChqZNFcc1qy/NU3RSGXyeDMoocP1vC9+O7R7OMQffzBZaQ+GTTMOERqJgSsL/uNX14IqDrMPnmiLku9Xq5Myt4Zm96mv1BEiiuNgiiEaaUrNR4QOB1DT3J57mbhf8BaqpkzgMyqp6dN6c6BS8d+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=m5EBZY60; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="m5EBZY60"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CE811F481;
	Fri, 28 Aug 2026 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787899152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpDaQn4XBfoSKAzquH6aw/Az8cXNcTO/tso/f2BJu4I=;
	b=m5EBZY60QXuEeYhJLBcanNdtA7hmmQLQnnvu0VPsxILE7o+eNHuR/BpDDDFTkJ4nkqFf+j
	KRFvClMvGKx9a9dJTRMGuCvRN9IgDsSG/DjBTUVMhBROYotJSMTsHYzigYtjSbWa6kjaKG
	PMIqlnE63oaRbxx8ZADLF89hwxapQxIPplVGW8li2ZKvooKjvs/g9UKc7c94ugpTfWhjvB
	MbMd4MABAaLsJRieosICNFlsSG5uM7E9Bg/7EyTCP9B6Vlo8PvZy9evdVKAHwax2AqYgVb
	ZTfTRnpCwHcGjfYKomkH1VScfcLZ8RTTG/GevsJzf98z71iKjMV3xTTuOhiA5A==
Message-ID: <14d64faf-264d-4a7a-b707-387d5f03de88@gtucker.io>
Date: Fri, 28 Aug 2026 08:39:09 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTEEqbYBA4Ditot789qNJM3akOoVfNHO08/K+rVQdOE8UyXpCeRWiSH29c2qdVJAgdPj+BKJLOwy2fp/8jVDWWJmFXx54yWaZCbyF4w4u4jiWgP5MRI0w/4cmQB2IfI3GI4w4KFaVw5dyv+Wust8Aumq39OJOQO9LCeU7KbG61JojkD91A/74ZZJ2sk/TRxVJdpj50gBQEMuD7NcjOOg6pvYW9NVd/AkNFYglWxWFgtEVbYHazmPO2cTmHHwl6fLtKxPhPWf1bc6afyIGKplu8PQ3q95UQI89ImxWiBbdyN1REozbzgqYS8WJQdc2cNy4Y5Us0NAYvP30zjIAxsDP/f2UG5fkLX+2LpiXp1pQzjLqN45yV9CmUeu9dW41kwmbAX9NoCsxUrav9antgdMIbS0CBzrGTxIi8RJDgcSEP5f9OPYBjUQJ5Oov5M0xGoFw+wm1aiRR0jz/7EXyuXgQa4le2ZCZAslnuxQncdM3Qixl88oQFX3Iiji+Dq5ahKkPKi8oFGzFTF3328H1LQuZtxVtd8DzUwCrwDPsXEFcAqIQK8pqyOCJxDz36q4Z3xGlnSyE5VDdrtH8zvVpwq1/9lXvJLOJUTfZmE/aH1Ic0FacnSSQ4InbmOYfPmoPrlsp8Fksu8DhCl9hQfxhYAk7dEwLm5W5qrsLA0hvMa98W3x5Q
X-GND-State: clean

On 24/08/2026 12:05 pm, Guillaume Tucker wrote:
> @@ -20,10 +22,14 @@ class ContainerRuntime(abc.ABC):
>   
>       name = None  # Property defined in each implementation class
>   
> -    def __init__(self, args, logger):
> -        self._uid = args.uid or os.getuid()
> -        self._gid = args.gid or args.uid or os.getgid()
> -        self._env_file = args.env_file
> +    def __init__(self, args, config, logger):
> +        self._uid = args.uid or config.uid or os.getuid()
> +        self._gid = (
> +            args.gid or config.gid or
> +            args.uid or config.uid or
> +            os.getgid()
> +        )

There was a bug here when uid or gid was set to 0 (root) as it would
evaluate as False and be ignored.  This is because they are now
treated as integers rather than strings.  I've fixed this in the v2.

Guillaume
