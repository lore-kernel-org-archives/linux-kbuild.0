Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624930;
	b=f/qJbOjrM8Nwo/ubSFb7EHYiaRxJ0Ccnx4yJ/INE1GBFdPY3zwiy5YdURvPshhWlnCVj
	 Hxmwm6UakERXSakggV3tgTBq432q+CXzVxXlmOs3Yiq7iK9qwsQPHTgVKVYvsTvD6e1/K
	 0a8uj4WanLQsgEnph+jiu/vxwthRKoZiYSp55rhJVSVxhDlDM8Svo0SVwc3+H1liFvaIW
	 A+9HPfRhKKjtTCele222ZO6IMYlohnVT02fX9T/wPG7dN6yaOMdX7GjOMPGd+g+4Dpc6a
	 2dmKF7Jg3Mp2EyC+mSEOB2RID78jUms5H8+Y1WQjlhQasI2hq8rt+49oGO4CaDr6esA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gCSIudWZX7gMgRZPCCJXakD45lweOzZKZhj3scTS54M=;
	b=D3wCnf2jHeNSZLJiChotA68LCh8vhFv2fTPZCCBwvdsdxK0o0ugWaWCapRAIdfXvzLL+
	 Iv8Tw//KQUJqPUE7ZltOSlMx/NlL307ZEEbnkYQaNm0qKkrgIhuDOCV/BLmsWPStXGHM0
	 BpYoQWh+yNcbYqWho4TeKafsVP9lRAyTyBaemzqpO/UZVFjrsUCTeDNYD8X3KOAGvMaxt
	 bnkZGsS3d4wntGRQ5xq+IWeTwldCEretkQYhVRNlRlm6kEXJbYkM3ngw2IFYXFQ23fe2h
	 IsmlriLNjKCPgTtqgm5nUZOV0Gq6diqfEz0dbYYwp2yvTprLGWf4RiQgVyrbD31vsow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZSkl5Lll;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23D2606A330
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Nov 2026 13:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B23D2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZSkl5Lll
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso2155132f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Nov 2026 05:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793624928; x=1794229728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCSIudWZX7gMgRZPCCJXakD45lweOzZKZhj3scTS54M=;
        b=ZSkl5LllzWVh/snN/qacW2ifgSA582lvODlJLdVF/TgikzFdtTivfN9J0PZ4HsvK3z
         M2SwUwJzB6jI0aZk8QkKvJDI5M5r2cQgrKhetGvZCWL4g2pgCED3aIwSqH46xvG6X1w/
         ad9Im/D6/fb6GqXIjhJv/tBk627Ql7D56//bjqCiRV3tL/ZwKj/It+3sOJ9cOPY8foh0
         RN+erxoz52BiWVSBQ5JpHL36WSjByluaC5y9HLbG1GqCqYEdU/BAuo+yNomf332Z5cZQ
         Fh3CsU0JXLeKmxpEp29wAc2Ggm58ReEyo3T+lK3uGn7hA3l3XMUm7w3oIIZ2+fiDu/Vt
         6Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624928; x=1794229728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gCSIudWZX7gMgRZPCCJXakD45lweOzZKZhj3scTS54M=;
        b=HPVuIlJTgrNkNcH1DT3l/AosZ23kWy6czpsi6XT4a+AOQ6gH7Eiv1V6JJCIXrd325t
         PbcvY3qK+eQp38KcSyUGPagqqeORPnwz+yO410QMoWCBLC/ODjXqYFUV1tNzmJJBkq6B
         3Nze9hmQroaCd7BC7KB2M0HEflJIdFSx1SS0NvvzHLMfBFIFhjgtDa0b1oXmSzEhg4Ze
         UTMKxiTF6e+yAN5L7tbWeirOB0DAjAuy3OP5rRC3AHvKWZuz0VNBvfJSe6DJHCU7ChEg
         6i3cE7jKBXMo04/gfoQ7+f8k/5gMARe95urGh+j6anMdoSlI7b3Y3Q0QCRXFU00ty/sz
         Ahpg==
X-Forwarded-Encrypted: i=1; AKwUvBwHcFyubZ8ZZB55Cmmhy26L6/13ROguFh/ulrxoetc1L9zbKAHw1NDKu/qDyra+mxYaJB/7ioUQS9S9arM=@vger.kernel.org
X-Gm-Message-State: APuU4Z86ruagGxhRvgY/LZDsFfzUS9RvZtDU8d7lDl/4yYfrWPqZ5OZO
	RdsDJQhrhdoZmJ9MFXZ4Lyvbvx++RJvGLqUhwet+nmnR+EUU5mS1ZFH50EtYO4BL
X-Gm-Gg: AYBFou3FQa6ymOZWJtpVf3Ezps6Z5f7jhLqDv31lhYP0pA6dWtHbKv+sYjcizIkoCsv
	Oq1298Y8CIruIIIMRyALVYDc6h3RnYqJ2A6DSmyrVzWx5Tfaxgt7HW0tVADiyqO7qKpng+sR3s2
	f9XSN2cT7i/idniRSJcTfG7gXoD5oBORe2t9sRn7wDcPxBToFebw2dEMXUgKaRNiHqy/FGfgOYA
	IGzg6bMbrdjCR7iIwg+NChc6VT23leiY8Av9sz62UUcGqmg5nKm74uclZNG051wsgxMVQPiZpL8
	7sJ/bQ/94gVpdElviD98QL8r2XRQVjjZEdXSpzNjFFOoxV6f6oI+RAj1Uwi/ygQ9kDZh15388C8
	FdycLSoe++CxVA3GkTcfP9ZG01NWYMIta7lLpJjwbHCct+mOMSXqGiNoas4iKIElUqnLHT9FV5E
	2oXG3JnNpW4+NDyPOTjjoA1UC0uvJELbNbqAnAZza2x4cYWh8eVwEosSd4SaXGsengOvOhOTKoN
	1LfD/ppqQ5DQEgnNwYbeEHRaE2sIaKmrESo6ymy2zlfUIFprHS5TFVysfeYB5V6M+7T4XBtQSQX
	pX+5utVjUjbQHpREoSBbAPl3ALFCH9lha+ClwO/obPj6fAYbYmsJXgLX6luNZN+ohf3fz3QpxgG
	86RH56v99Yh25pcdu5fEO
X-Received: by 2002:a05:6000:1146:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-48e64bba760mr25319738f8f.16.1793624927926;
        Mon, 02 Nov 2026 05:08:47 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm22383632f8f.31.2026.11.02.05.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:08:47 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1c3ec0f6-6c6b-4731-9c9f-809a047aa2c0@gmail.com>
Date: Mon, 2 Nov 2026 13:08:46 +0000
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
Subject: Re: [PATCH] kconfig: preprocess: fix UAF and SEGV on self-referencing
 variables
To: Ruslan Semchenko <uncleruc2075@gmail.com>, linux-kbuild@vger.kernel.org
Cc: nathan@kernel.org, nsc@kernel.org, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261102090500.54575-1-uncleruc2075@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261102090500.54575-1-uncleruc2075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ruslan,

On 11/2/26 09:05, Ruslan Semchenko wrote:
> In variable_add(), when updating an existing simply expanded variable (:=),
> v->value was freed before calling expand_string(value). If the value
> referred to the variable itself (e.g. A := $(A)b), variable_expand()
> accessed the already freed memory, causing a heap-use-after-free.
> 
> Furthermore, for a new variable definition, an uninitialized variable
> struct was inserted into variable_list before expanding value. If value
> referred to the variable itself (e.g. B := $(B)x), variable_lookup()
> found the incomplete variable and dereferenced uninitialized v->value,
> causing a segmentation fault.
> 
> Fix both issues by computing the new value before modifying the existing
> variable or inserting a new one into variable_list.
Thanks for your time & effort, but this was already caught some time ago:
https://lore.kernel.org/all/20261008164504.3683811-1-lzsx618@gmail.com/

- Julian Braha
