Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B2F4DE704
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2026 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361641; cv=none; b=gtJinTB4QL/uXV5tIvx9BLSEwv7e3iM3Kk1fZGgr1CWgYS7Pp9zK5tI46pAaaHsBirdd63+F3/DofTqms2ZXxIFoEftsfWNsPKYrmtLL8eJ1kRSHWKgPg0zMSY5ZF/wWoN0Xdf4mgO4nopWYzoJHhDp9JBYANKha4AWJ0NB7tr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361641; c=relaxed/simple;
	bh=yrjRdIB7yjKDF8p4IRGgdzlMJsmvNcqIa92mC7S8Hd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sVy1Bkm9rPdwpOjeYOqULurAsMi1IN8DLm8nLohdgW4VmJVT9g7IkLjo/PdrYIu6ocziuSufMk7Qn5+iRxBaIhjBJVXDhZo4aBnvuZxxVw/9i3AldV6FuR/suUhHTn+QljJSuEJALgy97I3xzpMIpwqo5X5DFYpqnVS7OSasNCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRMbGF/9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRMbGF/9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so6606325e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2026 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361638; x=1790966438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDHeyPGukZAAVeAXsc+OzZG9tX2u373beXPb2WPyRAw=;
        b=JRMbGF/9Tm1JRfTKrpS8UVzpqO2aRCKsDQ5fAwPSAX3/RjPkhl0QKwQEjJ7JoaRptf
         n2T603/AVgLHqO6vkrp2/I7I6PZ1PAoCCQNhvclXca8xz/peApZ4gzZiFER3QfuSJAXp
         Cf2HykQJwafV7CoymaKKfHS6XBsgdW9XoZnRwmnRgeQv3Y4ZZ8HBgBbXYVfJM/qSaYcS
         rk4yCmW90p7tXklS0CaE04HwDv3cJvHHZPDw5a5E3fI5HVj9Jkkxme2mpSO1xucKUPyG
         iB0hZng1tg+YSXIa+jpSWYvpf+i/qbNmvcSt0BvZX6cRMNwZaXK5gzKjIGZjdsosf6Zh
         plIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361638; x=1790966438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YDHeyPGukZAAVeAXsc+OzZG9tX2u373beXPb2WPyRAw=;
        b=YxfR5XCUOP6DWPTg0hFfFOLhcx6P5F7GHTr84/y6arFQB2Z+XMCx3fZXO0TozGazvb
         Lm89V20WJhaMVbBWSeSIIKQMTjlrDeMrnx2KeKUnFdK+jqb+GdOf0o696ueH/O40Arqq
         6Y+xYzA+EKRIOaklLfSYMMSXLaUiWagDslNFopUE8RdppWnqBrLRXx6GzB2jzBBqogd5
         lRWQJRlAooPDO/3wvvAlD9GlwxBiftrRH4wf1/VFPmLN9Ym9sQObFTH4O1b0MMxvQNHQ
         1kQKnH5JzTkyqiOQWYSprePbb2cKtfTSR9khBbz9MwsWZzsY0rTq0x+vmVK43Ei0i4hF
         LZkg==
X-Forwarded-Encrypted: i=1; AKwUvBzH37tmuYHpz7MXWjAm7/LE9Egv2Ot4gsItV6rYOfiCYhJ0dItOYaxpmqQ3bK1Ug7lapvjmRk/h0jXBHco=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ6SPnNNNmphzF5BQ68p0xmcKqmDr5q2/FAakinUryc5A+DSYD
	O8vVlb/tBAvXzmFSOLmuTQ3u0gEmh5BJiKxnmwG6o6oaWrxzqh4+iwXv
X-Gm-Gg: AYBFou3R1/Yv0s4/1z0EmmHorf3Z0NwBufgbHdVhiJAK6BqEF2UaZkWovld5D5NNx7l
	QLai2ZHYsfAKotf3/EyRNSS+nBf31cUxFMms3wRTo9SC8NGFpluVR9qqu/NThldViIwyHxhCPxf
	+kFCBFka5RVSVaBwmbldjYHWzo9+sjyfyeJKfENGpPhHHs5lcFwkapGFlfblX1UlKqcofd3BAO9
	kbePpvnBIhEUimY2R41gZykKNqIroNRHelYdQd50dZNH53L61lgH062q32UWIbsLPKKaqxj5cvb
	dbG5JEBaxL/LXWd4icGlEi+z6JP58mSJb3zfhK9MNH0miPMvsPSG83q/0RCeP3xQBIqLNeG+7za
	c8jRLaECWc54Ga9Wmlm5bFbTYJXWTWP9sUDaPbJ3BTQFQdNCaf2udRH9ATmsvpEgDN2cVw6urtE
	6HG9b/TrICZflyl/AXAaTKywteXFr2cYISHm2sy8w+EAhOubxK4OrdHUyWJYgCte7BbBCN+Qgw6
	9EW+mLxzpxXjy3fvh2qmBeaguem0FNkThI1ouVXACrDKre5meBpMKnZdfqoSX6BNAvPWkA35g22
	g6E=
X-Received: by 2002:a05:600c:4f0c:b0:49e:8418:389d with SMTP id 5b1f17b1804b1-49fe66c6160mr133308955e9.9.1790361638463;
        Fri, 25 Sep 2026 11:40:38 -0700 (PDT)
Received: from ?IPV6:2a02:2149:8bb5:f00:1efa:94a0:1c23:6934? ([2a02:2149:8bb5:f00:1efa:94a0:1c23:6934])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm80630395e9.13.2026.09.25.11.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 11:40:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <5697b1a1-56b1-4807-9686-2ef768da929f@gmail.com>
Date: Fri, 25 Sep 2026 19:40:37 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] kconfig: add prop_err function to simplify property
 error handling
To: Nicolas Schier <n.schier@fritz.com>
Cc: nathan@kernel.org, nsc@kernel.org, grahamr@qti.qualcomm.com,
 rdunlap@infradead.org, nico@fluxnic.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922163749.2031594-1-julianbraha@gmail.com>
 <20260922163749.2031594-2-julianbraha@gmail.com>
 <179024742686.3875862.8878765161331000985.b4-review@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179024742686.3875862.8878765161331000985.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/24/26 11:57, Nicolas Schier wrote:
> I think it would be better to keep the space here and add it to
> menu_warn() and prop_warn() output instead.  Then the format matches the
> warning/error format of gcc:
> 
> $ gcc -x c - <<<"main() { return 0; }"
> <stdin>:1:1: error: return type defaults to ‘int’ [-Wimplicit-int]

Ah very good point! Will update both of these to the gcc style.

- Julian Braha
