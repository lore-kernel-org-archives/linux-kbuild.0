Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB983B71AE
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491019; cv=none; b=Qaat5TqST8ffn3ulpYhnAUnMoqU5f3f16lH3kjOWT6RAuVsYAX1Ay45yHcuk0U648vin2g4BjRxNY6Eb5K/0F2XrLHWvxcS18h6wv0z6tLKqyafLI9fc/HsA/fi3mpa9LqD5rYygxzivDq7tBJ5z0SxcU5CR6mg7IL4Cq9ahoa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491019; c=relaxed/simple;
	bh=/QdSdLjUr8GoKIicMzB4IspDt8INcXs5W8mDh6en7SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HYiDls/N5zKytqILTV2ZXohyio4ODnVkuhE/PWjc/y0lp9544K0EaShKMMLJ/vSTpddHinDV2IBW9k+8ZiSnCBGYZyGUZoXv97zmpHPoC+flPFMbaslMLMZLHD4WeSepVW6BYq6FEQv05yb0bx6l+4nKp+rtwYTBUHU2+96C0dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWSW2hUi; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWSW2hUi"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so72762366b.0
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785491016; x=1786095816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEjpDgsNWoQnVSD8E6tp5/NrYVs6Sj6Mdfebm6L48UE=;
        b=OWSW2hUi3GW5HCGtWwBrlY4S4Jfdhhfx3fW/PT5IzMZla2KXF9yxZdtpJGHAlDfQLr
         k/oeV+rXuVBkq44qDR/gR6H/NyuGhM+aBkuoMZlAlPotQCsJ/M7QMgCUfRnDmu0rw4ql
         hTYOuq0HzPt0AhebQO0jDB5zF3z37nkkvS4EgOLt+jcMa1IKE2d4vX1+/ZxJOv8XvHWX
         Os8E6ENkLEMytz6eQ9jjU/prHt+f0M2WbBktMssan0n/PrWn/6umiW/dRiazk7iYOrzX
         nqvZj+7fhZS/JJm1qV4xhH/oDJ2447uG3lkxCId91MpcGLJjgBOYIQQy/+tzrJA0KudL
         b9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785491016; x=1786095816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EEjpDgsNWoQnVSD8E6tp5/NrYVs6Sj6Mdfebm6L48UE=;
        b=ee7SDB4zYgzwqUkXwrIqplVwHio82BywewHCkqQGu3MUqeEgjCmCNQ+2XEwa0yxRAe
         0N/cYyCjbWFmEWpDRS99m5CT9oPvlKWMUiD3UQihrT6eaQMwFKzh/c7Dm4xswhT0Hrb+
         c+cKUZL8d7pXAK4vTZGD5xUu0EHzR9Maxo604ESeixRXBUMvztjCGtqoUAEnivAg83sO
         1IVtdnG/KoHcyr8LKDdIA88UaPg9dJQajZ1oX+rWv+ZRuuplBkFk8pbO9rbB+quWkvg2
         7u3brLx+lrMPXccOXhCz++G+/y6RQuCNXaNc3gMgus37LXs6QwjHlbJlDyuwwphmu2NZ
         xWbw==
X-Forwarded-Encrypted: i=1; AHgh+RpzUfEXJJ72LvoTTq/Wb39l2z8XTrQRbrEWKxrMXwE2/+FANfEufQPKPRbgND1/Edx6pLsBgisuxj8/Ops=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyju6nHZ5ULg9bG2U6T1QNH8utBbv7QljV+FSrSN2YJP3BVlgDS
	qsrsFfVy4p9zUaa7pOS5kYVNPLw8ba+Z6kYiSV4eYtOfjg4R3XkS2WCW
X-Gm-Gg: AR+sD13unHTWhjOUG4Ey5E7bheXZVs1IjjAyzogckbP8K39cn9yTXDWZXgi2rWL31iU
	CNrQ374yRDE5U24hVH6twiwoKMVUgJaJWGbIhyNga/MoT/5InwSiCuE/vPYDuJANwt1ti8TqdEa
	p/E/nCUPx0IHf2Z6A1zbl+YVPJt49ncW+mJl+SWpirpJo6837jnwkb5NaY4nUE8t0CQeWz9a63H
	GcsNCo4oBhrgAaG/uibmvjZUGJvFoezCu48vsPOvsbxMKRPOLhPp3FbCYx61+vwApfuN5krnpiZ
	OBbsc4BBSEyRSSiF9mtRZv+n6Gc4zcHwRqgzXMzJiBURFgv8kng59C6hG/tB4bVlwVITVpieLjX
	oaservAl8z1AJxmz9lM9Bkg7wp7yUY3zxam5JOaP6F1Xo/dz5zINwLCA56venOQSngQz7iNQZRx
	MbfFYUX+56HUJbSzzglIc5AlV5dQT5nG32YXmeg60jwZIKQ4/BC5zAAC3Xzrki0ICVNTA+iLc+I
	/RYf8j6lOoOLYWMcEqMvrND+GXKpqmGMxc23Ddoa0SpwpS27ioipnEj48nYFcJdiRpsd/yIhGFf
	fcwtyQ==
X-Received: by 2002:a17:907:7ba3:b0:c16:1031:e719 with SMTP id a640c23a62f3a-c1fd200f156mr73940866b.11.1785491015661;
        Fri, 31 Jul 2026 02:43:35 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:1418:46b6:4675:1031? ([2001:8a0:e962:d100:1418:46b6:4675:1031])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4532e1esm81618366b.50.2026.07.31.02.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 02:43:35 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <b756801d-873a-4b77-9385-d4a43f7dd28e@gmail.com>
Date: Fri, 31 Jul 2026 10:43:34 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: warn against using int, hex, string
 options as expressions in Kconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 jani.nikula@linux.intel.com, arnd@arndb.de, stefan.hengelein@fau.de,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, nico@fluxnic.net, officialnaumansabir@gmail.com,
 rdunlap@infradead.org, vegard.nossum@oracle.com, kees@kernel.org,
 tj@kernel.org
References: <20260730140108.683967-1-julianbraha@gmail.com>
 <178545753473.3004192.2499981065379649802.b4-review@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <178545753473.3004192.2499981065379649802.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/26 01:25, Nathan Chancellor wrote:
> Drop this quoting of y for clarity?

Sure, I'll send a v2.

>> This 'if FOO' will always be false, regardless of FOO's value (even when
>> FOO=1). The same goes for strings and hex.
> Hmmm, it might be kind of nice to either:
> 
> 1. Warn about this in Kconfig directly (if possible)
> 2. Support this usage in Kconfig how one would intuitively expect from
>    either C or Python where symbols with values of 0, 0x0, and '' would
>    be treated as false and every other value set as true.

Agreed, an interpreter change for this is on my roadmap. Though I was
also considering to make this error out.

Would be good to get some more feedback from others on which approach is
preferred (Jani, Arnd?)

> That said, until either of those potentially happen, this patch seems
> fine.

Thanks for your review!

- Julian Braha

