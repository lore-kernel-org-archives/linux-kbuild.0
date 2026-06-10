Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929E040863E
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099096; cv=none; b=d/LdzzsQy7/pLKrAcZFInGEu3hjV/v1wGakYmu5DlG/EFkHdVQQreZgFuhwESnwOUpxgUjDU5UV3W5Fe6W/c6TDiumh0lGiU0Y0dgFlLWGdjH2RXSHmYFsqQzwyeSfTcmV16lR89mTpk7q5s3A8I3Uf2i0XFznSU+i+c4y/owKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099096; c=relaxed/simple;
	bh=pIKr+f7SHAgP+TcmEWYNDpdjqyrYirdvxHbiE+PC0TM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ve5oUvHwRu7P4a6INfVCPzxpQnv48enh+VD4AWuZFpB4kZGPkxEu2Np2zMH+Y165Ep7V39u5LSNIP69UsPceb85IguJrLVx/R9xAdeXiD7Kd5JC3c7d/YQ8MWwBYrWzsFufKIAu6DStG3KxFa974xqRqP9WqKy9nsjdb7ime2ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyAZOCpQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyAZOCpQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45efb698ef2so3345287f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 06:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781099094; x=1781703894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yJu4GWXEjspPhIezkRFpn6+hkFDzwgslLfP1rS8cOdM=;
        b=fyAZOCpQvX1+UQaeAf0tQnTOD1n4Sjo0MTI5Q+XLKy7sgQW+wQNiShywFvjwARusPY
         1DU4dxJnAG4DOgd6eXds7D7pG3i+ANkDhgZZrfgqiNOm7JNPoA67eey9Uzxye6TM6OXx
         6F20MRiO4UCJwy5m4nuc/kLg0zFrh6njTfV1Urjctd6I6FWxrcUuKHDztt5tyOm7wVZ+
         Qn8g+d/lpUusVQ57hsxMvUjzfuohuxTqqF0mznYN9zL1xqJq9VynoqfPpK7JHutj9iTH
         uCRlcDchm2clSvgQYA2cUIQLDvkL0lZfyUuBtDm2SFz3NiI4Lcs/vl7ORvMqiP5efBvm
         pDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099094; x=1781703894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJu4GWXEjspPhIezkRFpn6+hkFDzwgslLfP1rS8cOdM=;
        b=W8YSZO2msTBJSsf005JLaVsfaz/FM0MVtwJyZthTBsrUkW/dxjVGcTi/zZiZWoZwpI
         2nqWNdV66Y91HJLWnWekIZm9qhpL9h9HJ7/63whOv+WCDpvAi6UQ6GMMhwZpMrdkVLoW
         +u6cPhmMJJQ4cGtTUKiB9vOV+F/Lr0A3+qVmbvZHABa9bh58XpdHqHWSV3vKeoK2I7mg
         7RCkwZB+fBj6c2jrT7XFFikJc+SuWyO6jMrlmZXfinqvxmhMwyy74whewJZbHGUzWbME
         hGvP9mSaXUuZBd0iIDMEwwoUMBxMVY/XRzFDtJXc1oqcWgauziXDl14Gbo41Tskk7GG4
         HVaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TNvdP36IRg2GjTq5cbAflyaqr34xIxUWA6Y9uO8C+OP8a1oh+n4VHMnvH7ot/PiTAisMEwEtcYjTUvMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzucrmU6mo7itK6+eFg8UmZdzXr6gq4UNOoED3+XSEO+jqfVCPO
	9tBO4PwzGHAtzdnqh1+TJJNOfC4gnSCFOiPTKOf7VhoPVm/4K3e6LVYj
X-Gm-Gg: Acq92OHGXdHxANUPCURf/FZJCATdG0Od1tHaQS4LhpacNV3wCuge0/5RZxoDP/VgbYi
	IRb1Pp7H4wMGHJqTnbfZz2fKYGLs0vSLuLTK69iYCS5u5m/nMlD70YW8h3djHH6wLbkIxYWTqpV
	NPlhjvouu5vXeG935vu2+ePYhhInmx7DiGqpcBTpi2iLNhHS6hYXLiVhKaRzfKLc/mgjW0IhTrS
	ZuUuwYG+7UNaJoxFTaPx0Yt9ZB+N2uXGW+dwEc5LVqwhAXu0czgFLE//QV+I4SPkfWWZJcLH7x1
	3UupiYDeMH/WLyQ1boXBQ4drBjccR+Z5KOPWMjVTrKe+7z+0yUZmYs07dT62aTmSk28pS/iVqf7
	ty4QIknB7bggujVdZUtXek2xn2Rj+hwEv/5LMsiHUhbt/WimgEVTrnsCj0v+su1jSpnApOe/rUE
	YRCBhmK5BeohVxZbTjhbpjMlcA+fr6m5rhEM22spvQRioILz5oWHurdZOhRcF5FJFzvZHUjNYTZ
	0YotwJTQgpHlUREVSfNwQmbDveUJw==
X-Received: by 2002:adf:f183:0:b0:460:1e5a:2267 with SMTP id ffacd0b85a97d-460304e8b9bmr29117746f8f.17.1781099093784;
        Wed, 10 Jun 2026 06:44:53 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcde3sm73852062f8f.1.2026.06.10.06.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:44:53 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <ebb4fb1d-effe-44c6-82dd-8223b36419a1@gmail.com>
Date: Wed, 10 Jun 2026 14:44:52 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] bootconfig: render embedded bootconfig as a kernel
 cmdline at build time
To: Breno Leitao <leitao@debian.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org,
 Nicolas Schier <nsc@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, kernel-team@meta.com
References: <20260609-bootconfig_using_tools-v4-0-73c463f03a97@debian.org>
 <20260609-bootconfig_using_tools-v4-3-73c463f03a97@debian.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260609-bootconfig_using_tools-v4-3-73c463f03a97@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/26 11:28, Breno Leitao wrote:
> +	depends on BOOT_CONFIG_EMBED
> +	depends on BOOT_CONFIG_EMBED_FILE != ""

Hi Breno,

Just an FYI, this dependency on BOOT_CONFIG_EMBED is redundant because
the:
BOOT_CONFIG_EMBED_FILE != ""
is only possible when BOOT_CONFIG_EMBED is enabled.

- Julian Braha
