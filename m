Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7223142EEBE
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781594; cv=none; b=hiJzqWfwgRnY1KiL6OgQtYnVveNmSePXfjJfSVxN2gWtTVCqFEWbELQP7HChp7uJxFTIUXIX6HYewWZYx0cR4gUf1508Mrz3QsNC2xz1erx68Qc/lYnuTkZj6dE8RjdB56beuld6sbvQdRB6IpNEayH12e/5SX4bVcfNVTlu2N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781594; c=relaxed/simple;
	bh=hwElJ/3E3WMgBrgtpSjoWAd6JgFyEdeWgYXT89wOChQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYpJBXzKvENZUVVwCxF3LxlSvcxcUF+MtCHGKqiYS/NLI7sNcvF69cgNrrojs5zdunbVvpR5PGjhNmhLE11oV9m96qkSYiYC2LA3e6Nz+mm8NzEzH15k+oZtD0FzNTXUerCv1LY/oXDyGueu1QlhmBSxa992ymzcmpnSW0H8Kq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rl3yT4NO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl3yT4NO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49553515a8bso38016585e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Aug 2026 11:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785781591; x=1786386391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwElJ/3E3WMgBrgtpSjoWAd6JgFyEdeWgYXT89wOChQ=;
        b=rl3yT4NOl3B0A6qA0n7Mj7nsFPyUZRhHX1CNcVJ2ukHSbLKGxabiyv1168tATGTyAZ
         yl9+4IVENfYbUW5GVSQ7dQr22gNibdn2wjzIocerZiSs9TbPY+Mb/cl4Zsn9z0GEuU2N
         q9X/WflxudXF8aVdhuRWsXihPEMitlNqBiDX6M5+Si/HSiKprih0oWj86/GrPBZOH0fH
         p6MH5B3KrKzOc4+btOJbwehwe63T+JSv95eFAgg6frF9jQeXoqvmPD3QRY2Cyj9I4sGA
         4l1BSmZwa5qV4krPltTIeGb+syJZcnSekO6dMJmqRgK7zza5XePYX4Nvyx+fclLpNkyx
         4KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785781591; x=1786386391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwElJ/3E3WMgBrgtpSjoWAd6JgFyEdeWgYXT89wOChQ=;
        b=e71B0m86xQWeI+Df/EH94I3gr/LHklF07y4ZUjmgVmo2iJxOMBNG0MnG0FnUQIGsTg
         j8KxGegeFUgfjgy0Qt9Hg7MIM+Lsku97W7DpZsN9Uy/8vHnQ3nNuonT458UiQeVV2xFl
         0+A932I7AbKx33uuWKCdCwRUVtMw3eY471/uH7Aukf6K1FfGnqVmMfyi9CvlcSTbrHN9
         CSqxJYwOjqMZD42y6bq1wbWLOBGcm4QJgnfIGCpaHiQKS2zlQ9WtB52bh9RLB6T2Ikk9
         WzIUx3a6ticY9hVM/sdfABJxMgyB83h7RX2P89N2z84+X1kJrgipdmdyE4QcG0m0+sLi
         ilVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4eeCLp8ddpSffZLq5yF7ZMgpnhGIY5Y8VXIHTR/SjrKkcdkiBrSW6P7ckWlbtBYjPjM6oB4QtaVoTZt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Jz3SctE7kqxCZRNvzvTilcYVgtlpq6Fuq3HOnMB3pAvMeVdX
	UPg1DRNAwXHP1dkNBpAPmnxhuXnr8JO62P4YWu1NYGHc23y25/r7Pc4V
X-Gm-Gg: AR+sD10bjsJ9IXNUO430fz0bVaaDZNgZzVOtT9lGs8uRnXeNL8kkPltd5dOtKYnkfda
	aCRpAqlLVCGcQ12lnAZekICZLcHbLXPy3NxYbq7rV++XnvIGlRiHuNcDWV66/1V/B/LTZIQpkBQ
	xHc1bF0FpdMz3PPqKzRAxpPAC0D0KZOWdjK+Db6Ou7JXpRahCEqOU/yD5fcIRl+/oDY25VVIeMX
	glHR4YsbMQroJRxRcPpqYgI3VJRfiv5p6oPTjryhoiAXcgtEMuFoXb3BLGOeQoA/EOLwcTIZDhD
	1nulrHiaIzpg0/TC6HP63hPTym5aUR2hfKWHJVAmjTuH6pRoWxRu1Cdih9UbqfJsut1uhSR+8BO
	V1h1QjXEdYv447BCplohDzGOFZ8/RvoTEK0RSOP/3lGaICi51wW3rhiTTf5ejtzMbv2wclOwx1n
	nB12HSeO/P43abstIKrBDDYvjI5BBlHIBA9KhJJyCVYncXU9ibCkex3KfZQiR8MLcUa279+3oTC
	NpyvHuOdeCVnZnxB61r1NobEgatTs6J8a/Xs0aa5W9wxrNbvjBwziTp
X-Received: by 2002:a05:600c:8b14:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-4980c66c94bmr266920645e9.4.1785781590469;
        Mon, 03 Aug 2026 11:26:30 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7b73sm15094885e9.9.2026.08.03.11.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 11:26:29 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <58a8c7fe-378e-44be-80d1-01479c425f5a@gmail.com>
Date: Mon, 3 Aug 2026 19:26:28 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
 stefan.hengelein@fau.de, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, nico@fluxnic.net,
 officialnaumansabir@gmail.com, rdunlap@infradead.org,
 vegard.nossum@oracle.com, kees@kernel.org, tj@kernel.org
References: <20260715220149.48700-1-julianbraha@gmail.com>
 <am-W4tuI0k7MKXVP@levanger> <30650585-9d4d-4771-af7c-7c3908281719@gmail.com>
 <20260803174736.GA1067866@ax162>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260803174736.GA1067866@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/3/26 18:47, Nathan Chancellor wrote:
> It looks like number 4 has been picked up as well. Given that we only
> need three more patches to be accepted to turn this into a hard error, I
> think it would be better to hold off on taking the documentation patch
> and just push for the hard error next cycle. If these patches are not
> applied to other trees before 7.3-rc1, we can ask to take them via
> Kbuild with Acks and/or stable branches for 7.4.

All good on my end, we can drop this patch.

- Julian Braha
