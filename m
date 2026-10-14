Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C270476072
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2026 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987923; cv=none; b=PYahz8RBH2X+zCFJmpSi9d74YEefe+oFIRFhFhchpYIf5lHBIFgKR9n1Tx9070zaaZxG0pFo7sGmKYxVyJdyAUa1QJdtLwUo9oXkm6dXP1HY2afsoCp9U7lenDrWXRpJzb9lNKJr/J4WxuHPBBDGyJqJcWuCZJMzRq8eaH8fCjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987923; c=relaxed/simple;
	bh=9BcOrCzR6gAXMvgmdiQwipkPuYztn5ZkvYaCNoX3tsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+u6+sZpD6gCGRkYx6GEqv3+9Lzf/DNpXDdfiYy5yxqyim1IVIQB+dlSlZS6VZhCNoKBealL6lxbdXZa+Snk62v8Es/nBNrEtasGOhz4YuSLBl6mbj85eGXEiCBhjZIlkFrzST65p6Ob+sk8sKIa6HKrfyP52Kro0Yp8Gf9FkhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCw5FWmF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCw5FWmF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49ff680331aso12324755e9.3
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2026 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791987920; x=1792592720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQG5ncX3bdDAIOH4NS9CA+tA8TxC9eCZibMiRHEnU7Y=;
        b=UCw5FWmFd3mV5kOv0SQ+C/YO7e7oUgrGO1mb20iO4u+QQm3avyE0+1sDJDTDpFYTm1
         pS7j5+RGkyYWrqgbQFC4Dnz1JVRmNEyXkyy5+xu2edOTzDWBxnY48XFqk4HBtBNp8FqL
         AeNTxkqmdgNCTGI7CW0GCMJPkQbKC2iazSKglX7GmirY6YSh+fM4MG5P8VOf7Y5M6YmY
         MdoRuJsjrnE6aPRdFWWfDkX9XCUDWnj1SQlPrEEFU6fZI2wbhwVTwcBW8W/lkUMXGjFU
         VU/ZImIAxikC/c+UT/tSYBTXFkWBnIUEEGzfrUZ805Gnco2Y2DEXBCee+Z3BRGvP8Rmo
         MCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987920; x=1792592720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VQG5ncX3bdDAIOH4NS9CA+tA8TxC9eCZibMiRHEnU7Y=;
        b=Dn82nIG/ScWKjA6yyl0M/6Z6L6h3vIYA1U2xPKrC0/OiUScB0ZH8iTOPsJGNP23hgS
         Rwfonl5adAHVRueZmJnlUl+NifUPJUmbHvT1fJ/Rz2B3QsTTTdoKSI8lss2UptISSO+/
         3kUXqyDL6vuWgo81zhr+NdA4wHffHkrvPUpQ7fBhoCNZvNL9t5k8pVmzsK9UkZtfqWmE
         xlzDzuKqXQTSPGDqLARCHPump4pmz7M8IBDV02dXLF0/q2OBB/AIGjYxJrCf5+feV1R5
         NLO11jb3J3O8NgNoCz45qN4h/1pAeNMAwAJhobQwbJNZw1j9nXI8VnfQD4QzdI/2uwMg
         CNNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeSULjs7IBX9ipElRubutsZuNQxvB+rryO+G+x+wjFZGhPfz5qh6GR1ndAbHfr88G35ZMDJCmqjskq2Uw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRIzy/AGTUtyUMUxazuqvmBr9jU8ooScLDPEGgXt6CZicYEf92
	V42ayQsnXhreSVVul9kAEnpMB4Ha+bSGteEwkTJiojOM7vA1P9piDO8giv/tfzPO41TtFg==
X-Gm-Gg: AYBFou3viZoO28fU4bgNgF1sKLRKPfiw78XrpYsR+zgyexYl8kDubkeB7AaJi1MTX3c
	bVHQW9lDrzXNj4LxEtBFC/cc4A2TEi/J9CHnqNhs30GfdJ68XgtBTdvG+5XEfuU+Px7I62R8Lcz
	hzqAqDQRJmKVBMLktg1GdXv6Qfqh9IfvRAR1wTQubfICEFfjYsd0XrHJckcQH7K5uDrKPHnM1K3
	zGMXXoVC11+a++pA37ou4hs5MgMxACMfXlocZLjN9/XfBmVavKwcpOY4VY9t7oTP1MqWR5kV1kr
	qgLZeB2RWzCcwG2e8CwQo5jvAhn6RiHu1QNr1U7iOMcS1L/tK34XZVZz4hhcK4cAxDcPC//CdDL
	g5F/JiSQAY2MBoJbfL2OVPb71/4uRv3ywX/xc+sqZsQMH7zQqrpDELeHUFOq/5dUaqwCq8ZJlsY
	9emxDFqiGHZMvF0IL6XOFNWhqB3zJzCeR62jqs8s355kuo7f3waKvLrVeqRITlenU5nIyf3kDqv
	tonbpCIKiYwTfIj2Be0YU1WKT3TsE1shZpCyWkOXiFKLvsusjQgVCziB1+AkNKQuQ==
X-Received: by 2002:a05:600c:e547:20b0:4a1:946c:953d with SMTP id 5b1f17b1804b1-4a1946c968cmr184860545e9.27.1791987920328;
        Wed, 14 Oct 2026 07:25:20 -0700 (PDT)
Received: from [192.168.1.28] (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf0d60esm4678655e9.0.2026.10.14.07.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:25:19 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c1618f16-ca8c-4e18-8e8f-13f941898f09@gmail.com>
Date: Wed, 14 Oct 2026 15:25:18 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: show number of search results in search UI
To: Zuo An <zuoan.penguin@gmail.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
References: <asvB7fchdB8lUkMc@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <asvB7fchdB8lUkMc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/26 18:05, Zuo An wrote:
> When searching for config symbols, the search results popup
> will now display a count of the results in the title bar,
> e.g. "Search Results (42)". This helps the user to gauge the
> number of matches quickly and refine their search if necessary,
> instead of having to scroll down by an indefinite amount (especially
> for nconfig's UI).
> 
> Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
Tested-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Julian Braha <julianbraha@gmail.com>
