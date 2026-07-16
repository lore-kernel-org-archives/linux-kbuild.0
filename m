Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCF937C0F8
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Jul 2026 06:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181882; cv=none; b=eHhyD8B7mtAjlBWjRqLS5W+bi8irK+q2Bcq7dDAyVPJTuRuJOwiB+woJB3oaWuWEYJ7QVhUNtm+t/5LoJKGQY/2g6pX0g+ZQtV3Gmtm9POTs3PAZwoAIjDyFSpQcz5yzJOujRyl8LcQ+Qw7VLDuPLLceUJphWLHpO00J77GN4I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181882; c=relaxed/simple;
	bh=klKIgWivsTCeKC53xwG7zHFtKvNJmDXHDfW4hAl1X8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJNaqiclDpXJDXDM/iDju+HByfRBHFKdrug+Yw9hATqyM3AIiZPed/TDp3nF4vF9GTfyLajWq8QOHP6Cm8qQXPr+QL9W7xliGlbOBYQz4rOy1zV+VBNsPzJLE5WElMpQI/MBN+PMISB89Yy1P3KG9sn2nU8PaAZg+I3kS3wXw60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IppDfIcV; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IppDfIcV"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7ff05e5d009so83810527b3.1
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Jul 2026 23:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784181880; x=1784786680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klKIgWivsTCeKC53xwG7zHFtKvNJmDXHDfW4hAl1X8c=;
        b=IppDfIcVo2VMV969yqpwBWLLL0OJ6kRtVTMWkM04XzwNtMW0yYiOnwC9uqRvS/W2Pm
         fh58YkR7DCm+9Fl1FYSeysVvPnwMYz0ijcICw7YwJriiPHY3gvigXhrca7S3f06/pGUH
         kwyTJ/QplB7Jw5qydZsBqANWnbAzsUlIZVLYFaR4h8RCjyIEzeiXOh+av/lUixuoQMVx
         agtHwYu9ajv1mkGNN1ZyWr3pxsf7iKkunhVbMFxq1xeog7xvuxAACzpY42Ic2mjYwTyw
         XLTEacTzMNJKHyIEgnIHvazI/4vwmV87tcMkU5ECnuqHaYkY5lfyHUJdKfzPfGJbPDA+
         /yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181880; x=1784786680;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klKIgWivsTCeKC53xwG7zHFtKvNJmDXHDfW4hAl1X8c=;
        b=jT1LFVUCpQ7ETWgXCFSy9ze9Cm+oobfgt0vML3iELJeB2abZsMNyEisw4LJbCfYjH8
         SABm+wGDs4weUWad87QLbktP0lPG70Ih3fH4QCFzjorP7xMLeE5Ctu9za2VLtfCtrFb8
         gnzHDEH0/t8eOFhg72CZQbvQH+pL9Mdv3dDsNOhEkd5JJDWH4reMy7TaKq3i941SuWwm
         VOMXLR4ktMuQef0/B8Sy/ouIe3jxN+ELqyfQ3AQVyWaUnH/5BSZhC6CJYd5HR1rqVbz6
         bUj/oSkuGuFeXBfpsiMCxKIeZWHgLVPCXxIBC4cBsw62dTMsIdjIx/HV8b/AmXMf6Voi
         dFCA==
X-Forwarded-Encrypted: i=1; AHgh+RqSa2NCLKcvd4vg8n8B1iORDtAzZIV1RD2kmWu6X/vUgkKKppDGybYWPAnIHtuM5KJSqHFaeX6y94kvLyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Ga45LCAuzq7Z9ZfhfRRXOMpLTPAuR1yJuHbBNo0V+8vFBaV0
	bvIetNY9wqFQzNpIfx3L7IGVCAD2G1T5qC/Cw/0PB8K+XZkdRKvmc7b3
X-Gm-Gg: AfdE7cnHaJV0srbDx2ImM4HdyqW8vmdDFvmwjJF19qSneb0R6LWDktwGQtFjNr3w5oy
	Cq9eQTTPJqzcDoT6lqV0AECIy+b8zKdnkLeuy5nOQ0FPth/hx8VZRgZV4hPW52Kqm2tGQJOXgdc
	5iqndsmJsM6u9wKvdXsZ2DYE7MwlzPXEbuNXKFYQ8aAM0XhmT8OwQk25uN8rTA7EB9znZl+5BuS
	OIe963u7yP+7zFrSxqlJLXgTEwBLCBVcjC1v5X+EOh6CzJt+xB2AJe2Pc7JRC26SsWw4+7x8l3q
	M3Cl2VOmpgjoF1ZhJxRgzL199XNgMz14vw4RK9D/DZP28CPD3gkpYUbump6uFwf4A3x0AsghuPw
	d+ausp3LAfvykFy/0cwoXVIZF4GxAn4w/QwMLlLKgUm3Vj7+5BAluKdG9MDPMpo53kQuzkvnXj1
	DNGhEICuRWu8aLJKkyppgy/5i94GXHH+Z6/ix6dab3IaPQYENXXMWUwEmLEtQ3QywCUy2pE2i4U
	0t1igHyZbuWcwE=
X-Received: by 2002:a05:690c:6905:b0:81e:97c9:bcf7 with SMTP id 00721157ae682-81ec0167c80mr68242497b3.71.1784181880199;
        Wed, 15 Jul 2026 23:04:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:566e:ba00:6d29:5fc7:266a:e62a? ([2600:1700:566e:ba00:6d29:5fc7:266a:e62a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bf58f85sm187966347b3.18.2026.07.15.23.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 23:04:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a4d8cb79-a696-4016-8c8a-a56b14992309@gmail.com>
Date: Thu, 16 Jul 2026 07:04:37 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
To: Kees Cook <kees@kernel.org>
Cc: nathan@kernel.org, nsc@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, arnd@arndb.de, stefan.hengelein@fau.de,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, nico@fluxnic.net, officialnaumansabir@gmail.com,
 rdunlap@infradead.org, vegard.nossum@oracle.com, tj@kernel.org
References: <20260715220149.48700-1-julianbraha@gmail.com>
 <202607152119.BF8E377B@keescook>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <202607152119.BF8E377B@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kees,

On 7/16/26 05:19, Kees Cook wrote:
> Yeah, it'd be good to add a checkpatch or even build-time check too.

I'll look into adding a check for this into the kconfig interpreter.

- Julian Braha
