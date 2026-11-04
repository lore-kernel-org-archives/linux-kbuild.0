Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782233;
	b=I0tAQYdoAL1slz5D62KoSbnU3e0bN4bXwF3Ta8fo94QNLsf23vkL9xI+ZGJ1P6VkLOQC
	 3YRAslR1RDTUNpYpZQPceVB/Eq123VoSbQU+YAxZAnQtF6cYABIgPR6FJDhsgJe5jNSkC
	 2NA9sm56CAtcIQh5zzCfy2LaITBHeSJikY5yfNEdquZ0c38Ch4qE2Or45nYyByMj8NO8X
	 HXPXPmZFAouIzpb0SWZpUlG8aUYBK7TanWP09WyjyCUIq8PUbzV5EP0CUWaIzII2+dXYP
	 DLPpyFoUDlyqIuuMejYlCoauI87xvlcBgnDetCkABQq1SwccfEJ77I/oix++UzAmBmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
	b=UPZW8qyQ6KD8RTN3DbcZbitikHzjvezbP7IODxDIqwGP/qMMwvzka6I3xCOIT77HWdLQ
	 c+5ZF3QcsV7BTMsU59Hq7n/CCaN05ed/0HDPw9ugLKUOjVWZTsJxLxETIGLmzjwe5cY5J
	 Sum4wrat+9+ysH5pX87LzXqy8M9soi9sb4bCFf+suBcH63L/fFtLZ7nRINLVBEfNflvPR
	 Mw0Hv6hlSQRAR9kDqqs3EioixZoBIRCGZYiZGHJS0I+Rj8XyLgsR4FoIRv1afzJnoI0Xr
	 N08YziXuS5qvvT0KrLjJQTYSM0/rVfeYVowSh5H0xMDZIvnkMltbtsWT8AXyEqAvDWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BeGuGwgx;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A23606A32C
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 08:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A23606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BeGuGwgx
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3acd239776cso4123431fa.0
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793782231; x=1794387031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=BeGuGwgx4Rt87ZlwOx/3AgYM5Q+NiOd8+GRccRF0FlCMrtzc/x8taqLQSg4KpGaFcW
         HgXjPMzoEtBeUJrJfyGki5vj42BcCyW6KuzYGXmKgKsyQdhx/1YqynSk8SkoZjYTqGsG
         kmJnggFJovR02NygTlrcWhWf0lZ39nxvFPuZtvGmWPkrTlPi2XqgbFTdDGngKh2Z4KNT
         cTiQYEX7+c+hx99SZcocOoLEW5nVULFDjHc3EUR44oXYQPDqVQ/RcGn9u+NnhrlR4fnK
         9uXPpNhVdaseLgNSTovn1tSJPvHbL4tY144qOx9rJLcOu+xL+S9EBRK3GtOzgeJOl1/b
         6AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782231; x=1794387031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=FWkDAaqfd0b1LFzeSL5MTDLTQIFCFHH6XdND6Nt3nhtjkearPbHouUQ+1Rg0tkdZ/U
         8t/L0ue5l5xCjnMUX1w7vVr5aT+iL7CzDF0yjhFIjLQ43YLAVq/JY0Yw3e4JrK56sEES
         bTGcIbXSbyGQseyNZBMFv0I022I5Z4bXrr9ico++gJtwWirRNqw1TrRWFuexZ/VrPZmd
         PvjmAXckp++cwmMyMCaRxj4bEt8C+2EtbqtHtn3HIt5bn/p+GB8pGHecWNg6YV7EAwfU
         TFyzsa90bxNHMo0+Xrv7nHMhDLjvIFDd9YFkqsDn5PrKyDs7ddjgZYKiJfjfupL3+XLC
         /rpw==
X-Forwarded-Encrypted: i=1; AKwUvBxJVr+XhAfeboVCyokw0kXFHf/8R/cgH850Xb1Ts5s4sKYF0jz8Wv0y7kR4oAVYkdg346ERJDuzIDlOpok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+thL/nnor3v/y9809RWwvDZ9+Ai+Ih+KjBhvYJ58tRQzkfixk/
	wiIDPlqqYbk+j6CYTfGKjRZVUIeAe5kQ5D/bHcl5SLOgsyZhOxufn2Rzgw7o3JBhw+k=
X-Gm-Gg: AYBFou3QufJznLSQOaLz9x0FBOQKMDPx0qhHWZM1sLGBvnBQgcrLYkOecCinQegkH+E
	W/dz9PvkuoMFqJvl7Bi7km6TrCxep0sKebwek2DqNxApOhY5aAnoc411DSUspvW25+wtof2jcLQ
	DtrQtKyahUqzu9wjiqf3FZMMEFNyKmOOknBEQa4NeIHqjxF6b4jzcXUCuBKPDAh6oxIHp7HKhvs
	ncWk+MgJ+T5Y3QF7EFShGGju536FfGMtcu8Xvnf/JCLWb/5CrqoyBDo6Ali0MMJfUaQ89ZosOfI
	glWwvMLLF32+Y+UuipOnNYDO7trcqmzdsFSU7MYxrRI0vZ13pwfrv9qydjwuQxhfKeVx08sm1ei
	xSB49gRgHC4qn+Kvncu7kU5/7Nt+hi+YIlvLZBroCPVZ51qR4+5CTm3EAdunzrj0v2dbZ+gZ4He
	EF54AR/UbvL9kNw2McJAiAH/W/WMiOb1FwFzWg+tE1TyutLhBnj/q0tdsNpLc+oPCxjlhiLyvhf
	/XSED5IfZLIK5GttE2lm7eNJ+jE7azomwX8ENXqyn0+fOqspzxXOz03ZP4bk97LaTUAg89w02WA
	Q2LeZUouOX4sutls9JE46dDYbXyLbJHK8kac6D3dja3QpKF4e8M5DKg=
X-Received: by 2002:a05:6512:2250:b0:5bf:a12b:9ba8 with SMTP id 2adb3069b0e04-5bfd957cd8dmr5159537e87.65.1793782230950;
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c97csm278483e87.5.2026.11.04.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Date: Wed, 4 Nov 2026 10:50:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
Message-ID: <aurx1DKC9JQcO94B@nuoska>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
 <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>

Hi,

On Wed, Nov 04, 2026 at 09:37:27AM +0100, Konrad Dybcio wrote:
> On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> > (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> > yocto kernel maintainer Bruce)
> 
> [...]
> 
> > With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> > in arm64 builds:
> > 
> > LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> > 
> > In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> > get applied in the final .config etc and one of the checks is for dependency loops which now
> > fails with 7.4-rc1, full log below[2].
> > 
> > To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> > driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> > depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> > on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> > now can exists in the kernel tree.
> > 
> > Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> > loop to and from LEDS_CLASS?
> 
> https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Ah, excellent! Fix is coming soon then.

Cheers,

-Mikko
