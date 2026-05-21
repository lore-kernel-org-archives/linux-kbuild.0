Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B88376BE8
	for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 21:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779397302; cv=none; b=leSkSqfEum6YYTvo0v/viwMORt3DA0PirrhTuM9rINlzkZQ/6TCGg3tSVx2HujZUMSennLfqSTId78YFOntiSLHDy3DzOdk1YYphJQSbaFMm83LZ/iJsSHgQMOJnvjtTXORoKMehTi8vDT8SQOjnvcLwzgOtYy7RyAsTsVEjEFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779397302; c=relaxed/simple;
	bh=2dZP4Z+pEIjRI4KrQR1jPuvLkiNb8ctu5quJ+7R2ujo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GU9XCUPQxWsEyimu8/yrCXionHYPZO4x8uz9uWQivtqEtwi3TvUWXCyL2efX9NXBhOBRS5bccApOCVMGDi8X6tEukvNDo7ouxv5gjXktlds4zsCyc6xswaSvhlPUNW6TpHutbU9dw5sF4QuzQXyHJocGcN4RVhB1FvTrpqQjt6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rB3q/Q0J; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rB3q/Q0J"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so52152335e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779397299; x=1780002099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2dZP4Z+pEIjRI4KrQR1jPuvLkiNb8ctu5quJ+7R2ujo=;
        b=rB3q/Q0JnnjSfCux6vR6fF4mJGzFIVKIzo/qcl4pfbEHwPGdBY2snNtfRvC366/16m
         sI70wB8EUhuIb22Xn684HLWpfa1q6q6acHVaj2r8FebE+oYAMz8KCkPHSZPKhSUEE7Q/
         eUwEtvWSNNT7vkfpBWB6TjA2O/wGX2EO/muNmoLOY0hO358vDDX+9INJCLKKlnXrsrYr
         BFRW77DQHx8lzdywF31Ve5/6lBcpQZFD5WPxWgpMHhkNr60NKEyLuv9nvbUys7z6vze5
         3W5NuQZbxUhyRxUM3dRpPlsSY3nfToqer2nBXLv10Rfk9+FN2aayLVKMYb8/dZpSulUV
         Fjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779397299; x=1780002099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dZP4Z+pEIjRI4KrQR1jPuvLkiNb8ctu5quJ+7R2ujo=;
        b=Gm8ra4F9458gzM3cLnHQ0hP1Z6V7RLzuEbnPvOT48GwZxKNVGMJYNY/guW1z0UwLe4
         j34E7Xu6RRun22SwXXXIwbszYJSeSYrWYL5hBlSVxjBFyn7L/yx3/XoDjs4U/9RwuveY
         ctU3MrboaQMnC/I7ohUpqpxDEZInFlCEI//JOQMQ4sCJsKhKPOKwWV7prIf9GOjeT2yX
         c/4gceLlaBvro+gA434BYa82BKB9IO0HbtWa5ReLdiO4M5BbBqHoENh7ZtYFANEvfhRr
         BTopj/2BbcJRxzk8dFS7lf985IVvkm4HFMfXtNVIDnuyqVmyPCdOXxVVocJ48HmaPLIh
         gkzg==
X-Forwarded-Encrypted: i=1; AFNElJ+QrFg2k45ax3h6One+xKGaBYz1+f4hxbVjhPeDo8QD3wJMT0CcK4CNpxMyLIHcdQwjBF6a2BnRKTKEejs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiAzyu7CfFp+nOU/WcgmuO4F4V+tSzeOAmOtQ4cRUeaaKtuKEz
	QXZ0zAfmItkY6C/GF1biDb0a2ie9IxVA/Ftedx/MNhbopLSjRGSU6B4DvpRUMx91KdPUhQ==
X-Gm-Gg: Acq92OE59ShwP0AZAzMQ4cxsb/VTICoXYeyp0K8qLH29MZ5mofQ97yvujxRkkj0JMRL
	XrHWczIXX8QbX/JyClVs/MpSa/ydHvfwGYDcB6CNhxHV/i3eAnAKxPHMGb9piE3fWQzE8nfcAoB
	lnWo19degyNGrm4ujCKrL5ZvJrn1m2Gfb4k1IqA+LLyhf775AU5RDsuiRYiHEAUIlZULgLCXqbl
	cLBz6zlzJ0X0ldJJppUQD323ukQ0LIfXFVr5BH4qlExVF8m27sj3q5KDedUXxcFACpnJlf+7t1b
	FsGU3fXSuzIm12XZsvndI1X+fXvhPyYP/hPO/FBEynn7TgpHitLYGEIaRls1jua7nJhuL8LR5OU
	85Y2PYLT42WaJ7rDFQTgyJSzsNNnUFRs6/MUmabMjh4gVWgVo3g4eWjOEYkOXg1hSkDjVNdIS1g
	mBjdJajmSAFEDFAsrM+/wt72AsOES81P84d81RkIJ+4oWdJrfZt4AbOkSm7EY=
X-Received: by 2002:a05:600c:3547:b0:48f:e230:8cab with SMTP id 5b1f17b1804b1-49042adfb3fmr4831985e9.31.1779397299031;
        Thu, 21 May 2026 14:01:39 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c99cb43sm51920365e9.4.2026.05.21.14.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 14:01:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f3eb96da-cbe2-4d07-a586-9eade3bf39cc@gmail.com>
Date: Thu, 21 May 2026 22:01:37 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: add kconfig-sym-check static checker
To: Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: nathan@kernel.org, nsc@kernel.org, andriy.shevchenko@linux.intel.com,
 rdunlap@infradead.org
References: <20260521204435.534773-1-andrew.jones@linux.dev>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260521204435.534773-1-andrew.jones@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/26 21:44, Andrew Jones wrote:
> The checker also warns about uppercase N/Y/M used as tristate literal
> values following the same logic as checkpatch.

Thanks, this is better! But...

While it does catch the Y case now, it still doesn't catch 'Y' with
quotes. Again, I had to manually inject this into Kconfig; I don't
actually know if this is used anywhere.

- Julian Braha
