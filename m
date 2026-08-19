Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29271448D05
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2026 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138768; cv=none; b=awxP47aws8KrigZ1NBSy6e0z4/Vp4C+WhzXQ2GpYV5TO8alHiaftUDsV2DZnGkzlXWyJH46bADAl8I9uc2PPZaETsi6wA+dT4BcJX7KFXNHXWGsXqJNjd1cWL4zbiQUoCoBCYq3P/8owRDWxfHCsz6AsQ0WylC0WGRyqhzf3Fds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138768; c=relaxed/simple;
	bh=DlndU5taWNx6tKyg+8t2Gy/P71MCmKsz3gxWRPy329I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AJopFt5y38CNlsP7+DEschRv0p9u+D3PMq5+a7sjNxAc6ZELMbk7+SWgHFO/orj1w+jsZYgxaMibyu7ZNN7E5u82IXZjWWM1ErrA7vosM1MQ0B+C8iC2+ajZwxJytsvNG/3ezQO5EYl5IhqZmc272Oc8KVghprNveNLOYVPgs5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZpNjHDY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZpNjHDY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so7463465e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2026 04:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138765; x=1787743565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNv5oyh/WioqDT4lcsso1NW86uSM1Pfl5uAe7Xj7oow=;
        b=cZpNjHDYrG/NDMZpAzpASah3trCCU/navF8+/9Q13fH6ECf0CuY1Pux0ujWdtZEuqd
         SJdqrqz62f1IyzZI9CpY3p4ke9eNjET12J6CExFx4SFRvVOa3m0ysdZK7UP3FezgXgJZ
         BxQ1VcXHUcpvLcxZZfpBSQHxswwWXerOdebqaJZ3Tp4x9LkupeLR8Whh4WghQrRyjlPt
         cd1RakSdQfSW2aUUb44T1j61xh/YBzOph8Jcxtik4heGZONZzZCyC8SXk0GKquXq6mN3
         I4fRb+PAl8ePOwKPYhpSU8OX06zRVLBmH+9MIIW/m3/jjaISV3PfsvextzGQb5uU+A66
         7egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138765; x=1787743565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNv5oyh/WioqDT4lcsso1NW86uSM1Pfl5uAe7Xj7oow=;
        b=LdLVbI8ofAGTmgE1g9c8uMXpZLwnfmhd8h2xUGSWg9GoFVTtP1oluIWOlAJScZWWPV
         H0w6SPdnXGgpcrnL3NfFcnWaPGKa0/8BTKeuomrBJ8tt0gjRfNx5hgp5U//rsVZnk2e/
         CwBPt4YV0pdxBeuGJIngY40OTY8yhSrL9/uIc6vXwcLgtcse4625PNnBKjyAEjnFDc7U
         AqdGcUWszABYOQXs/VMz5uk0hXC5miN4QwalASl6taZykibzHLeixafAP1tso4fGKftW
         vSMMgcnm7KBZGFnMMSxl349Ae43ZOTmkgmAtWuVGcDSk+w31RKMlv2R0Yj9VCUczyL/O
         pXSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwEieHPWG9bDibyLNnyA6JZBzF3Vt+qDHt9fXWzCjiMDDGQEytwQS1defSrSoC423iIhwGxbAZKTb92Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7jHC95GNV8GIucTvdEpN2Gt8AnJS3yJUrxGL7XtHQaEYCU/a
	LrgzFm3JBtTIY2q/fNbioB1427GgcbeCVn+HOoBSwHHaEidKAi+Dk0Iz
X-Gm-Gg: AR+sD115riwzZW2WsJzzOqDXs5pRgMQi96eguxr5/RpSoEHrSF/WWIQCnZRxEEANBca
	YXEggGWgAdK3D+sD+MS7elMiRNss07LZqwQZfgdKxJQaX0tdOk35T3k440Y4+IgBwkbJpDppX2m
	KUGg2PxwTgw4rNtcT3eLSNSkmnbMowVQrlbZkdykYn2CAHuTKOJOYkO9kIsco1UoWb6PKM0N5F4
	iAuPmac25iJR9Km1eMSUumcnjEJUfR7Wu/6/82pHEYSLxFNI/ok6IDxEpg9Ls9n4+GCzA1YOvh8
	BMAuS3Ysv7/LjThDcj6n4jSzOtoJt5+ttMJJmW2067it34Ie46h/hw5wz6iDFjnYwKpzHnP3zKk
	QdpNFiS9MPrqtC0WU/fE1ja++2pxibNTzDkbfBViKsIm+vsTl0c1uSweW2yeYQ7pApS7B+M5Umc
	GeeZSb80lMyvX+BTK0oyjA+BZpysRHlHzQ9ga1yU03EDiRj9HMkaUd6N0vo15KsMO4RrOchfPts
	sN6rdEe8A4qCv5B7L/P/tRnPw==
X-Received: by 2002:a05:600c:5253:b0:496:c18c:f9a3 with SMTP id 5b1f17b1804b1-499aa19a172mr62224955e9.5.1787138765123;
        Wed, 19 Aug 2026 04:26:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9dffa59sm74622055e9.3.2026.08.19.04.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:04 -0700 (PDT)
Date: Wed, 19 Aug 2026 12:26:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Nicolas
 Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
Message-ID: <20260819122600.6324a511@pumpkin>
In-Reply-To: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
	<20260803195135.GA1083357@ax162>
	<CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
	<CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
	<CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 09:24:37 -0700
Nick Desaulniers <ndesaulniers@google.com> wrote:

...
> Wild.  Where did you even get real hardware? I know very little about Alpha.

There are two PC-case size alpha in my garage.
They have PCI, 64bit PCI and ISA expansion slots.
I'd guess they are 25-30 years old and are hardly used.
Both worked last time I tried to boot them, but the scsi disks have
stuck bearings.

They are close to going to the tip, but could be free to a good home!

	David




