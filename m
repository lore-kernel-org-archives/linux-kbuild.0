Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461118;
	b=ELNiTbs08TQ0O4ZPwKzxOCruYUu1w24mV5h9/K2OoFGhQooow6r0mtPEdvjhVg0v9AA8
	 hTg9qsAGou+ZkuWAKyTPZ2l0tYbTTm0F2Zx1d3Cq/TU/P+1FwxLuVQhTStROlvCPea8K9
	 2HLIeM5minzzX+kZlQ/5EWoJVfFsA+zjGv7z7NzT2zGgzI94eOrkl3WeUmTwzLp4sXa+M
	 ha4mBvNV0I1B4S2YKZxMyLk7/0/c+8ShErfI4gQ8Cbg+iXWht03XxTc4JUEW7klyf01Z+
	 yeLwbM4ulqo50gWVjH+vBhaFy8gzgMnC+jXdaEDGVRQh/DWwkUy8TwMQN+zXcCa3/lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8aTN+KAD5LuxmeEGZWy9pky1GfU0pY0/7sO1o/7FYZU=;
	b=FSFj4BVTttGa+uy+5s6Qxi3ixG9Iw7sFZktv+c8lvNxVKL3WYQSgja7FYL4agxjBncP7
	 RFLk85ACgjV8+EYBIrCdygVOWywN3qvEBguUVhcjKSdgfQUwL5qhXUyrqHeNGS2kkvM1p
	 piVd2P7Z8Zn+SniI2hh9BXjC8Zw0dwqxs08aDS8GZpLhHBbbgekZUdhMFKd92s6zLnxVZ
	 5iZucBeZhiaL0ezzqagL7tI8jA/MlUWHHr0Gi4vvOamWZg8U/wnonWtpp2nhba+v4oRrX
	 h6weQTyV8oTUVCjh0ptAJQxcyjE32XVXs+Ijo8/MssakGGNxP1+GYpNjcBwwbM8Q2dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f5VweZ50;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0412B606A319
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 01:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0412B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f5VweZ50
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5378b281aso13363175ad.2
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 18:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461117; x=1793065917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aTN+KAD5LuxmeEGZWy9pky1GfU0pY0/7sO1o/7FYZU=;
        b=f5VweZ50szoa9z79rW67cFT6/zsUGZ7O0i9RKgMcIKDjU+3WgH7AMIK1/EBPW/fvHu
         DYi4O8uf1rpDzUSKe5reocJWcVfFmD4X6qWod1cMZlCXSc7Vp3FGg7ZU320Wgh4O+wc6
         +N3cNVxhLurRtC/ElAKFBbZ88gnqPjHud9qwKxc7j+l6oURgTZ3+aE0VtOwEKsW8cAFU
         3U1Lm6PrgB5YlZE+hhkFK3yUex8jc6UF9cNTn/LjiXYNqA4pOgStxitekyxv7o5CY/2L
         k79ZSZP6msZnDiWZiwaO0YS30GEp393cHM6/PGWR32aGv3v6PTztf9NxWhFJp8K2Ksxn
         bv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461117; x=1793065917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aTN+KAD5LuxmeEGZWy9pky1GfU0pY0/7sO1o/7FYZU=;
        b=mVswINfbB9KRRIAO74KnBAJLPe2TihywB1JJ/P19BHs6v0nmqvcv8DQu0qa/En6yZe
         oZ788mQbuoTk8Jo1pHC3EL3N3XOlYmMAprQxnuNwbL3MBK7kGpwfabdhjJ5k4Mfuudcj
         dLsi8XUJvNrSE5Cte32a87akuAfs/AfY0ELsZxUqUXVdv4g7DxK+7sTJFIRvPE1uPCLD
         U661zIfjR+OgaUnTFpFNfQqyGL9cWir9565NgryzvjQGKLdm2wAWJqkvr9y0mFkyVYjP
         93QkKTUMNW8Qy2j3v/sdxEb5gnuo+fbvfkrbv5+qYantmhkCST/HXgV1GkH6/c6v2OP2
         jB1g==
X-Gm-Message-State: AFq9FYKoFIUHKS9+m9gJ/saG20ATRTWcNYEffpkeOshYjcVSMmg+KQH0
	iCTaLx2uTviUP3O+0q8K9P1g/kMPYiIGimI38xJvkgliR9edXHav0IrI
X-Gm-Gg: AYBFou1/aiv7w/1tVIjiB+nresWTNazTPjpbB4oGK+lG8eqmCvRsFcHE19Uv6H5xSsl
	kVifZQ9s6hPBKl3icxpu0duNacsbZyRF15SKTBl+vp0GeZoYEzRoOhHuw2mujDY+3n/l6wvXjj0
	UQ6uT3JFHFPpD8zMd+jXMc22oix0ZP7garE8QLkFd7vQPRg6CR7usK654QrsvE/hewviI2XvfFd
	h0zEbsX5gszHF+cQ3DAP84aMyokLNKGEA/8x/oU3TcpZGBoGS7f2dSkiTNnM3MhJt40Md4xoN+j
	H+lrDLuRVgP7ep7hxIlzkC5WJQoDRSjEnv3n7HCxhbok8RxS5AwnffSjWJhjT8VucOuHV0AjNlG
	tKMJ/c2N03rjxg1Wed+CUVoYmFhIDB1gR0VRevj7KqBQ0goIs7rloJ77zdcMo3CJgtnbuapbSwJ
	teiM9UT8dVBIl+ri/u4Y7RUhfZmqPrGQKYFblB4cmQ9xdlDcWLIsoKRiIt3VVdXXHM+M7W+paDC
	fBKdHNr2/jby8iFNJxP7FTMb52SrMwFoSQLFy3kRWhJ6LmpNc3bx8RWxKEZv0LOq/drBGXED85z
	egAxPmugbZZeeaOOde+9A5ps3fBkJFE=
X-Received: by 2002:a17:902:e74d:b0:2e2:aa17:477f with SMTP id d9443c01a7336-2e9a6d247famr77865685ad.58.1792461117311;
        Mon, 19 Oct 2026 18:51:57 -0700 (PDT)
Received: from ?IPV6:2001:569:59ad:3f00:d46d:ec53:e9ce:eae6? ([2001:569:59ad:3f00:d46d:ec53:e9ce:eae6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea15180273sm6984255ad.60.2026.10.19.18.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 18:51:56 -0700 (PDT)
Message-ID: <516e38b0-b681-4655-bc17-91b99cea707d@gmail.com>
Date: Mon, 19 Oct 2026 18:51:56 -0700
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
Subject: Re: [PATCH] kbuild: improve sanity check for ARCH variable on x86
To: Randy Dunlap <rdunlap@infradead.org>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org
References: <20261020001738.2607318-1-pino.cao2022@gmail.com>
 <a2209e20-b50f-4642-9a2b-5cee734aeaf6@infradead.org>
Content-Language: en-US
From: Cao Jin <pino.cao2022@gmail.com>
In-Reply-To: <a2209e20-b50f-4642-9a2b-5cee734aeaf6@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/19/26 6:38 PM, Randy Dunlap wrote:
> 

> 
>  From Documentation/kbuild/kbuild.rst:
> 
> ARCH
> ----
> Set ARCH to the architecture to be built.
> 
> In most cases the name of the architecture is the same as the
> directory name found in the arch/ directory.
> 
> But some architectures such as x86 and sparc have aliases.
> 
> - x86: i386 for 32 bit, x86_64 for 64 bit
> - parisc: parisc64 for 64 bit
> - sparc: sparc32 for 32 bit, sparc64 for 64 bit
> 
I see. Thank you.
Sorry for the noise.
