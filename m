Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC7175A75
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Jun 2026 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758098; cv=none; b=nU2JTalpRecUZwX5nzz1MFR7TgNMyxwTNI3L8GYTlEg6odoEQwojcBuwqH7RDe4b63i2iK7ofMvyLjFDk6y1ouqjvj8C4lJ1B/iPmtnhkVfAZGq0ybzLtP/5NnZJYTxoijvNX5qO42Q6yWK7Yqegr47EA/gBboA8q5vY1bvcneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758098; c=relaxed/simple;
	bh=Q7bvcNgJBR0xuXybvJDUiVtpofQYpuoyQGJUe+NPFBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpFSoBhd+PNoOj7hJaWJr67qaXxOmIOrgkoaDtGTsytqtKvIxCDtBNElFhQobczOUGG9rycFNSpU7+6PvXroqir4/V6drFl+ljK8R+1WEQecGK0HaleFnDcalOxLjkkXo+EBz25OJfNx+sWIKTWDvLg16x0Q4V5DZE1+jcNS9us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8f7BAO9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8f7BAO9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b7866869so33966225e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Jun 2026 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758096; x=1781362896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7bvcNgJBR0xuXybvJDUiVtpofQYpuoyQGJUe+NPFBU=;
        b=c8f7BAO9NBT1bmm7IlC03FBkQdql/LMFu+ynTcKEKX8LxAPayqKSEY3wKFrDMa4KrS
         dAK+63rIL2yVAmi2wMvzQihE0pQLBxITm6Xkzq2r44ABw4aCS9eTihxA0SfZ8uU31sTN
         Yp3hrU+xFgp+xbKFDHw6j9y0VPu4/a0ZG6YJEIiicH3wyWEuSsfJM9jp2Qk0N3QGnQJ9
         Jcf+Mexai8N46jQ1im+GY6lMwOw6leRSEDurx4FLobsegcz1cBLdCzVL20zU6W4r1Gkn
         e1PoW39rmMjHMmhr+xv0Q77Nu/+RD/sIDUfmZNMoWBAZz5iI9cGyxE0Evx8PNScn/JuL
         4NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758096; x=1781362896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7bvcNgJBR0xuXybvJDUiVtpofQYpuoyQGJUe+NPFBU=;
        b=VvwkxAty1u5rwg79crs0/nt/IDRqtqJ7Y7j81hlwLYjUD0Y2e3YPGT+GgbHtkgHEa9
         pHe+BMozy3snApKh3M+avuUGZs/4/pkP0Yj99U45VUMdrI7iGzNwoQy2fT13njF10IBs
         8cLZGF4VEKIU35HC1CuQjHkewNdbh+PncyAMAvKON2gzuVeqhLTgpa55OWTq7asPsrcu
         Jco6wzYc0KHV3Jfh+ox5c7rTwkTqipo2Y3fNQux9wdEsNdI6g7A7OJUeNw0+fbqijgS/
         Kue6kh8KuXM8WOrruBSNXc15oglCKkatYxaAVnSLf3Mk8Zp/Edvf5tZ1fNePjzvLRgNf
         dpJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/m3xdEY6Gu01zUUYWMfnIIlle9NzASGzxd6dUa8Xj+/B6aZEi6YmLmgAvJ7aAtDbpy32xsQjmiyGqqR08=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyFTfSiYYk+FrIBcnL8AuJhYVB2x6WeXUk1BLh+lJoN/OoUS+R
	9bzRRdH8flB3X3S0tFeQDtb/StZFnb97LvZd5VqgZpRxDH6+rC0rd6qP
X-Gm-Gg: Acq92OG+2hLYXnSny4tZUN4AawswnK40z3znepxJ5mL+o9mwGD7s+vJa9IdfPGOtJUe
	xoldXDikWSCruwAOj2gvCO3CBNHxbgcLw4pBlgRQMd2Nd64trupvnbKqIIH1ja7FKAUIBUq182l
	5/+AvEStwUTPAyqNhDmwONRLh4dM8z4pXYcoprDyEFUmjZZ7LrCfR2VYy431x2d9lz0ek1M2m+7
	DOJEXJDfux5ZVjClvF/P4o9A6xSoRdzQw9Tl+ep008Q5ALN+45gP7IwvwQpiFwQ6UjZjbMIf2pK
	I/uN8NEoFzH5a6yVN5vyuOsFn4k8X1PbRC9xlF/df5QE+TZwoxEwgLssdvibtMjHAGTuMe38gcp
	xnFfJWFBCg1ZZ/CNkoOC9KcmJZshmV6Py71u3bFmkuhota+Vkv1vUVcTrFmkdsTSbYJ7dh+Xmgs
	XwFUpDPXy8Q1pSo+oZ4OQN2kcXa5355mPl4T4ZXMJDaiMw2m1oeoF+wv+POlWAya8k3voNjPd6Q
	4xYh4ml0R2sRbp2zygIziy9VGjAYA==
X-Received: by 2002:a05:600c:3ba1:b0:490:b072:1be6 with SMTP id 5b1f17b1804b1-490c2633778mr146118015e9.25.1780758096032;
        Sat, 06 Jun 2026 08:01:36 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm290985935e9.9.2026.06.06.08.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 08:01:35 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a5d09cc6-2878-443f-899d-dafb286322ad@gmail.com>
Date: Sat, 6 Jun 2026 16:01:34 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: warn on dead default
To: Sam Ravnborg <sam@ravnborg.org>
Cc: nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org,
 masahiroy@kernel.org, grahamr@qti.qualcomm.com, nico@fluxnic.net,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260606140008.271929-1-julianbraha@gmail.com>
 <20260606142326.GA117482@ravnborg.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260606142326.GA117482@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/6/26 15:23, Sam Ravnborg wrote:
> I looks redundant with the two loops were we for the latter knows it is
> a P_DEFAULT.

Hi Sam,

It may look redundant, but we do need to check each default we encounter
in the
```
for (prop = sym->prop; prop; prop = prop->next) {
```
loop against the previous defaults to know if we've encountered a
duplicate default condition.

I guess the other approach would be to copy each default as we encounter
them into a hashtable and check against that, instead? Let me know if
you have another, preferred approach.

- Julian Braha
