Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B90441637
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031522; cv=none; b=EpbUlmKZy+bTL4FT/sQn7+AdoUnqWUnPsvy/B+4uwuOvVLIZWacl9VhElZSWTtCfTm4+9PcBxnTv+dBvX/P44Mdpsml8mG4T3iAs1EXe8SZVspSm2GlGKgpiVm/DKW/mFICoB4/edgnnfyO3s8pLzFs7VfmkMZKNq0v/L4xld7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031522; c=relaxed/simple;
	bh=Xc5cCb/oVxox1DquH4Q5TzTo3y07kYz+jNkAs0DVlkE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=kHDzOUaMniURils0R+BRczK3/vw9SOkLHFQh/Kjc0si1/0P7jb+uc147FGdBAD85xHx09lD6vXYrE2zikTqD3S0CRzgF0cVIv1QVT6J2kaOwJSPZvZxeqaiGkVVGGyX3zCPHu1+eRIqonnp5I6mwoNZgmEwoc/8RLvSpow9jUSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrNqjTn7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrNqjTn7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47df6a5202bso2555847f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784031519; x=1784636319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc5cCb/oVxox1DquH4Q5TzTo3y07kYz+jNkAs0DVlkE=;
        b=NrNqjTn77bHAKlKwsH/UcCkUbN5I37AaBh5uBMEAkBDMtFS5XXDdTON0eERcywY5Q7
         a1czEiG0mFYQwYYG3Sf8X3Ij3Q6fMfyZln/0ncPDaqgzLrTfpeHzRCK+of67gLXThsm2
         I/Fhvm0JmlF0ovbRfiRrpL4WELIVIhSWUp8W+ULB0fBxQCHzT7ceuUehl80ywJMev6z9
         RqyK9K4ORFOgQeR+I2waUBtdn6NK9x6ADRbPEoevhc0IZRvajzv4ujeM6FqtuyF31xoQ
         /+qDwqFbn4dIka5OJQIubMZ2jsm8f+6ELpX1nqqHn6a4gPB+fL67DpqcPxuyu/GM80wq
         hW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031519; x=1784636319;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xc5cCb/oVxox1DquH4Q5TzTo3y07kYz+jNkAs0DVlkE=;
        b=fby6+y2fR9kc9GkvZ6xl46W1YhX1BNyR/x3PK6hQAYR9MSily8lT3bQ24iscMVm9AZ
         A0ZxuoepMhjVdlSBWDQk6fSwJtMCWY/t1kZ/Ow8cRJ1FfLU3D2uJZJdrPSp9otqjWIoC
         8fiqB8C8uIE150gYcSqU3MzSLya5G2XpDqDaupExXp/6ouIHkvUJtF4TO+hT6i8CBe6Q
         WMrlVXuJSnwGRQyUVX9YOv0VU9SsEZcDnANtolEEoIriMcEbK0ptFEd5npvTUViDVXUs
         JXJvuDBHTZ9qOEqC/c8c6lGjFN59EJ9bA9XhzUXFndFJOqu1P4SGQdli5MeENgylakP+
         UAkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqT0zIezOv/30mJrg7Q6ddrHhinzqPlJ02FN+ipXHuLLMso7ZpdYsVyWdTy2w6SYOXzKM8KcfWb+065CDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjzjv8gZeLhV5qa8a9DdIlRyys58l4eALwsM+93lHqStePavAn
	zf8DR6QB1v18lMUeWV2a2fHgYG/y3DfGP2+9K2ibwHgfjW29w+uWfhx4
X-Gm-Gg: AfdE7cmlp1A9LsOpGgULux5PihJPwJ6D6Y9pM0iu6j1BoNqjJsJjoeu5wxb+Ecv7ZRL
	4ExVH+bNLNGCvHsEyvlB+j5tZxxYg0LsEiBw0sfcbjk9KGFBOjZgja1FTGDXPmqK4jTgIdSPNUL
	ZMxOKrV+CidFRP/OHMhp7Zryfro4aGEM9Xh+fDYoa+v/T+GYrkK/hO6Smaz93n0aSVaGnIxBv0y
	NGkUKkIoYkdRrmTkm8t9BbGYP9u4TVTAdx/bNeSuCf6zW/OIdpMfJ16I+HYPORaI3Unr8b6V6nC
	Gd2Si22fV2fJ5HLgSsa+MwTXNWmephUxxaJK/SiHg273QUxYMkpYmtrrWO+917tQQxJ1k6yWBht
	LlkEFnn+2T/57aE/PN7sQ2yjD6wpxmARcnobv5VzZf9AvSVco702nyS40asZvPAifkOSkUAlncA
	gsVo+db/Z6WsyiRh88j86aSSIQQxrUcSF20fuy9cF5VmfPHQP9FjJKsl7tT5BgYMxmYnXPq0vNP
	VjDoMnR
X-Received: by 2002:a05:600d:6413:10b0:494:1cdd:4f9e with SMTP id 5b1f17b1804b1-4941cdd5035mr48252885e9.31.1784031518972;
        Tue, 14 Jul 2026 05:18:38 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a2e499sm370144645e9.0.2026.07.14.05.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 05:18:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <3e3b8485-3cb0-4773-ad23-24c1d56215a1@gmail.com>
Date: Tue, 14 Jul 2026 13:18:37 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
Subject: Type errors in Kconfig
To: Arnd Bergmann <arnd@arndb.de>
Cc: dcashman@google.com, open list <linux-kernel@vger.kernel.org>,
 linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

My SMT model for Kconfig (kconfirm-smt) is complete, and I plan to
open-source it later this week. It will be part of the kconfirm repo:
https://github.com/julianbraha/kconfirm

So... kconfirm-smt detected 2 type errors in Kconfig that I'm unsure
of how best to resolve.

In 'arch/Kconfig', these two int options:

ARCH_MMAP_RND_BITS_DEFAULT
ARCH_MMAP_RND_COMPAT_BITS_DEFAULT

are used directly as conditions for defaults.

Int options should never be used as conditions because they always
evaluate to false, making the defaults effectively dead code.

However, these options are non-visible and never used anywhere else.

Would it be better to remove these dead options, or attempt to fix the
conditions in case a future architecture wants to use them?

- Julian Braha
