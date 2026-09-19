Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEA21A262A
	for <linux-kbuild@vger.kernel.org>; Sat, 19 Sep 2026 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841357; cv=none; b=Fg6I+ZCUT9iVrfzOS/tUdZZtnQuPp8i1SB78vWFvWZ4T8Dl4Hw7/eQOaNAkF3MZQFUGPI1Mb5JwMf4c8GobHa2OrPexCyNPXkFoqDQrthyzv4AELFASQd8bt5suVVb6Tg3e8+sY0n46fs0nSp4Z5CrlISbfCE8QIkXwhNalP3p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841357; c=relaxed/simple;
	bh=GNQgwpsmu+MroGLaEFGUtpm8ba9OaOuFh9h6nC5SlSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0PMCZM7fiu2FR9EUovP35ymAVh++5djWYnFSvjIT4t7zTzT6ss1fFW7DMWRXl3bnK5GauY/ct0tEIX100SIa5dm+Wcuw7VmHJJTX56yt+dJ1T1/iF4YT/stbhdT28qSwnNEXiU/kd+eYyVAzo7lnOzsxWZ+FhClcS8UmZ26xuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzzPF2AZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzzPF2AZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so9924415e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 19 Sep 2026 11:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841353; x=1790446153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpY6V415b91DqiPof+7OhChgdgeSAFqb9K0yJJZu+s4=;
        b=DzzPF2AZPKpE51ySP1tACySPkP8WN31g/nfyiAnY34dbtvGwzwG+aIPUDQcn1Co3Ef
         nX7DTIVCzuY1Bd7SdrAnocJFHYovxImDIZE5j560j8UNql04pPrqUDhHBe85QlX9U/Pm
         w0u90Am5Qok8Lnso8FrnMnpdWEJgbt2iRiu92oYBCpR1Gs/z0yW2MNlwjdJ3YY50Z2cI
         i2YTlhj7eHiQGO8fWSxYhiVKtnyN8YPkJwCpR2BQpAdAScDeatSNBwatMcjo1WspdnGs
         RFKxILtze2h4qcN7z5VmdM+0OLwrsKU3nl8ic0jx6rODuFKE8OIOSAZ6AxeMXdPuG+Mk
         qg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841353; x=1790446153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xpY6V415b91DqiPof+7OhChgdgeSAFqb9K0yJJZu+s4=;
        b=Gkr0OyxadbzstGQHDHefb4udK74Tu//I1FKNOU5Ni7rXM2FA9BaJif9cTHMelLdt4v
         rh7jmrbQej/OeSD5s2msFoA0nZ4dy+0CiNYtvma6sSopf/InXnbfUaS0XYjQufh5O3aA
         VHeWyTgMFSYzGdWm/SgL54QCy9QfWGEurt7owIva0mP2MtOGpa4lIKMB4+u+UXNZKEZn
         vZYp7b+m6sN3Az0i4euIXIXm7QfH2LsPOaWGklcb9M7Vk9HoCqomV9zKYRv2VVRoXu9j
         gRjh7MZ3nug+YfGplPa8a+8oMQnZkHxuNtwIF60OKlNpD0/RXwAeEB5NHNNc6GsxuSX0
         0Uqw==
X-Gm-Message-State: AFuF++mjkFKALB4gOmXPHRkSCM6r+3bwH5jGPWpESWSQiEubqUsYC9TR
	iQv0XvgbtvfPDxClf8yw8QuxVWljQkVS7VT1/S29L0EUw+EypMOkLLtX
X-Gm-Gg: AYBFou0xV4Sk4kqMV4EEGLpQvmSYqZVbsA/o0FLVEgDkUd1BY9zOaDQESKmjv4qKzU+
	zlydUxeZuh4c//k+1fxzuT1Vl7qLz2BQMlpfhxOjQc6u5YhYZ8BhTbt8ehousLAs7kOMneY9bPU
	noPxjDwjTP5xqrG+B4c1oM41wp1jSC8kWk64bC8vynBoEazd7K6uw0Sjqc1mkvejhM2M9id5rks
	fegg3RxYLFIiz5tG6fB1retgZOsS4It9U0fKcfjYfWk3+F5hgCHER3sMhzu/+loeaHsNxtD9AAW
	969FDZUtPZRjMZO2zdj8kVqyr3L+W8JxqCoew4LKCu6LTeisW3FUwz1IhCUfwldkAyaEyRn2SGJ
	7eDRFY8gtmbEdDRHAHXth79szWjYpIczA/NFef1V+0yPk9mD2FIbd8C9G/4n3dXuiZlAiOFhKRP
	dfniybdXTz900r8/96/7Z4l0O0Exd33y5sl/rSeOH6z4OgIlr1JTSrvp1DaL4SQLysgNXqOVxOX
	CUhZqVv/AaF9RnpmXI77ZAJNrWF32sii0+Ro24WZi3gqvC+hRToqp4HeVCFe/Oubrg=
X-Received: by 2002:a05:600c:3584:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49fc57227b7mr111630595e9.13.1789841353464;
        Sat, 19 Sep 2026 11:09:13 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd115d78sm87499995e9.14.2026.09.19.11.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 11:09:13 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <24810830-b625-4219-818e-c3f9bcbbe41b@gmail.com>
Date: Sat, 19 Sep 2026 19:09:12 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] kconfig: tests: {old,save}defconfig: Forward dynamic
 keyword arguments
To: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-4-286e5c985244@fritz.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260917-kconfig-tests-minor-updates-v1-4-286e5c985244@fritz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 14:38, Nicolas Schier wrote:
> Let kconfig test framework forward dynamic keyword arguments for
> 'olddefconfig' and 'savedefconfig' and update the _run_conf() calls in
> warn_changed_input to use the corrsponding wrappers instead.
> 
> The warn_changed_input test needed to use _run_conf() as the
> {old,save}defconfig wrapper did not provide the necessary flexibility
> for common calls.  With dynamic keyword arguments, there is no need to
> use the framework-internal _run_conf() any more.
> 
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>
This is certainly more readable, nice cleanup.

Reviewed-by: Julian Braha <julianbraha@gmail.com>
