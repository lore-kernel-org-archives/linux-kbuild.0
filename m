Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157613B8959
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2026 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361496; cv=none; b=SCtBl1kiz1AenIPadn+tLvdlrRLm16yFDrA8ovXu7b4GCXodFfNQeHDqqmuD8i9yJn+ztiOI05dcnCg7zmOQAc8/Y77jbDHoiUrOuPyRy2VQ+7ui9+lgNULjmHX6LTYIrom7SnubilXzq33jlUcD3QfFmY5x3GaYTx7GzYwK6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361496; c=relaxed/simple;
	bh=x/lNwsxaPxOTH9jg0MYys/GoaE9b3F4jTY+qjkpF31g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riM8K4rA1t9MsOiZX7CTwbDEub6OTSirO7UBNFKU3hSFRvGtm5wtfNjUhMt8AtzjDmIdrtMBl/uiTrLR+IS957cCsRqkQbIv+SiaKQ7to4Nw1v55V19ItYjgx//AW2AOmWI6UesRQkxJXHZcvlAgWTLbP9+P+kRL1vXsRzpuWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKxFTeDQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKxFTeDQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so7442915e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2026 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361493; x=1790966293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvehCLlx7d2UpmxXb9owDPjyANv0KE5Y1MbBvVO1Mzo=;
        b=hKxFTeDQbiDXSA4R0BMBcbQ1/6SM8JocG0U7/LwOWMJM+kkHTQriNmi8m9YNA9rE54
         qq2nSmzmrVHijNIeQ8rxsi2k+zybaro9AtnJ3nYeP0Udg3fFHjNyfkadw+55WOlVlBEo
         nF0iwaj7XbO3jo9jOEnQgLHu4m6FezpLLhbk7EOC4dm0LZjJtZDNCJB83tpNSFwDWQSE
         JqvGBHoPUE4zkb6UfbcvGtFXEXnTcAsHl9gf+D7BQYVm87b1ObkZRQAbTUdI8VvDhSeP
         1n0zxQOXky4H1h7FBT/xRUbIQR28yjnNKpndcx7UR9yBWUlCeju3lwTdZoYmuCAmnxhm
         wAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361493; x=1790966293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SvehCLlx7d2UpmxXb9owDPjyANv0KE5Y1MbBvVO1Mzo=;
        b=p1WoPIUnxPr5fuSd0Zm32FUZni7bt6LWeI85+8MjTpbEh7TPQogq4eW6WgVaYQ0HTJ
         who2ojhLs7ThLht1J7O0myrq9CmJkriATQIdD0UPiy0kAK4JwPpB0wOcASi/JhNP4DSe
         M823ruimTf7SkjKB4VxLmcMC0Ps+HPzs4tSIY6nF+15sWlZGRUvD195fBmqVh/+tiRvK
         nGcrAoYUz9l5+yFdRCaegGGe0FlpcF41f+He+aqZHvdEPX8NNRtYyQyRnTMMoWA6yVMv
         MleqK8Cix/2laA2I+Os3eGMtSbMrIW+Mmil+6TaxIpfnisber5U1V3jZe+2WiF5kBjVV
         WgYw==
X-Forwarded-Encrypted: i=1; AKwUvBxlAuFVlC2We88BJQRHRlSxNHD82YIzl69Mr7S+7+PE8YkKTcDFtswMkvupZdkVSSzl3GdybEorOxQvFVk=@vger.kernel.org
X-Gm-Message-State: AFuF++mlG/Ijj6eUQKFeOcxXljruq9ALiPBVyAQDydGYqCCDYqEhJlCy
	hRuhS/Urvr9qNJXloTabKjzljlBMuktiiWZdJF2j+l64drj/OoWPZ7tQ
X-Gm-Gg: AYBFou2QdC1AVCuynyXJSur0DrmOOF4mPawBGfNSI4gVTt1PyMtA2G6FhA/7E+vS4Qa
	xQmmnB3A28FkqYf+QeS/aLQUGP6b/mL6bNkAUzuPeTh+s+tah/R/qYROsH6zMKho9NtijSlpkno
	5Djjo4aBTa5AZApRTTa6/p3YG6yEmgR4QWTdtpgmHwAc+wv/VLEswYK7hvlCoQCCL4uyZnSBWsd
	12KcUeuLSTjf0PSOYBMEY+amXrTTrW+PSAo8iZV111Aly91XFaeWEjbj+tmY3DhUqDaL1B2Yigz
	npeHSzCMlEstq2dPQHMgfQe7wr5+kHzIevp5kJwdVw0AJhSfWhPvsrF2lWK4yX2fdQAz4RF7HFP
	qmTPxBLKqa2VK5RGvNR8T+XZQirR7o9WSvBCH9zsCH5y+Gg2RE9WUR3RJuxb+vmSTxYE/sYrc16
	mSfKAldl4xIWhEeaV7zcVRPyDarMQPTVGwxskyccphldZW5NX17msDebn7XKJNPnqHMmNA//D5a
	6t5AyMBU70c8mJ+9lN7SofczxI1RDljoCu6axY5h7l36q1SptbBf8J4291ZILZ3RNEKFKQ3bYM1
	Nw8=
X-Received: by 2002:a05:600c:a013:b0:49d:2555:1a6d with SMTP id 5b1f17b1804b1-49fe66f1ac3mr106645855e9.16.1790361493075;
        Fri, 25 Sep 2026 11:38:13 -0700 (PDT)
Received: from ?IPV6:2a02:2149:8bb5:f00:1efa:94a0:1c23:6934? ([2a02:2149:8bb5:f00:1efa:94a0:1c23:6934])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm80484665e9.13.2026.09.25.11.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 11:38:12 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <dbcc5429-d8a1-4752-8c63-08c08ad4aa59@gmail.com>
Date: Fri, 25 Sep 2026 19:38:11 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kconfig: error on reverse range
To: Nicolas Schier <n.schier@fritz.com>
Cc: nathan@kernel.org, nsc@kernel.org, grahamr@qti.qualcomm.com,
 rdunlap@infradead.org, nico@fluxnic.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922163749.2031594-1-julianbraha@gmail.com>
 <20260922163749.2031594-3-julianbraha@gmail.com>
 <179024742687.3875862.11053097465052610200.b4-review@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179024742687.3875862.11053097465052610200.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 11:57, Nicolas Schier wrote:
> Thanks, looks good to me.  I don't like that we do these strto{u,}ll()
> conversions everywhere repeated.  But I think it's ok for now.

Very much agreed, I'm thinking about how best to refactor this.

- Julian Braha
