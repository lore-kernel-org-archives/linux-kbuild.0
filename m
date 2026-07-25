Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB893644C5;
	Sat, 25 Jul 2026 08:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967974; cv=none; b=ppNWNm+hwHsxy6OoGAz+A1JH8jakTl2WwxqZFgmv69kDdc527J9MFrVK1TJRqqzGho5ZNJCfOoqpH62d+4vcL4RN8e4tOYg6I7FBk2q2Wx/XTfGGmhtef1jpPkxBIbrgC0Y6NXJJi0mm4zvtV7iw8Xpas3S+6W7sz5yR+nWpS2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967974; c=relaxed/simple;
	bh=Yqw/IytsBhFnFa8Y4xvjgMY9i35m0yEFfHW6L+jpCZU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uh/jQWSWPr+gBIBmOg6N9bFxAL6W4jC9VB9FYLUf/Pdl+a/Ap80pD4t5NHAxPzlwm6fDoVJX8luPOeS0vwgyFx2WGSD/v9rnh6tL1x3r5gmQz61VXFCAkQ05Kizz9fgzedZkXQ+8kLJZ6aI8xt4s+DdzSTR9xIsvDY558JzJQB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KdFLn4c9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k++cLYjd; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KdFLn4c9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k++cLYjd"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 97A5D7A02A8;
	Sat, 25 Jul 2026 04:26:11 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sat, 25 Jul 2026 04:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784967971;
	 x=1785054371; bh=H9TCAsXrxBD4nvG0mIu7k1mjs1LSwjpcjW8TJh4wn1w=; b=
	KdFLn4c9RpFBe+0YYl+TxCCIlBYTLNSYjK1txcQj1Q9h3loUAeXh8Mn/fY1+uuut
	1n0il2HIB5l24T+mNLlLAMOGp2NZdI4z4qycelKP/HCCs2tnL2lbZPZD5AkiJzl8
	PMkAM1/3btZYGLhXxkXataJWc7WMflP7g91qFdjwDv904fMgShdcNNOaYmmfvWDv
	1rfiueTIZLwXq25dEtUdPi+19KckIM3R1or8HRb7VMi5BLWAy+lFKZBom92YWerl
	KOAQt+Begp8Fxrb1nV8Et1ThEVhQejmJAfHBJcWkX8QLskCNdjW/4RrQzlSkbjlr
	OSBxCDVvhEdm+r4VAXjUvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784967971; x=
	1785054371; bh=H9TCAsXrxBD4nvG0mIu7k1mjs1LSwjpcjW8TJh4wn1w=; b=k
	++cLYjdrDshkNLPG5DIPpxtIa/+hqcAZO2IhjzKytURlln70F2hc6bZWI6FgXNh8
	2uTzqf9OygO/EMdDmXPo8tVJ4Udti7/HJH9ZmxXLz1HhmjOc48aZjB2ybIyeon8F
	zXxVNwXNrddW45PD+Hy/+PACt5H2YOt0QSmVaSlXAFjR7JaVUVMlPOHGCqFcCotz
	eaT5Id5ENhPdMs7r4uP+PxHyMOx9bFPcJLR/laYQGQj7ca5VRHUyTOrNKQff8FB9
	jJeNkYJmKEgDZ3VVZMxyMbSETEbhVVedA96mYVykbNqDcrw9b+zZSJxKCRi1eOw8
	ZAC/Cy0I8hfbKLuNfbbdg==
X-ME-Sender: <xms:InNkahot-8y_W9lPuIdPGPna9unuGS_0xPAuP5mYiaC1G50siRwJJA>
    <xme:InNkaudj_uw1GLkRiIucP5TcYvkWBoshxGS1WGc1AEBaGJy_jHUVHGbXqDDropx6m
    E3ZhOvnOAbE3rtGWd55vBY3juHKvVlwWPDORqjSIDgOOqC5_P35g4Zb>
X-ME-Proxy-Cause: dmFkZTEcbeDozwnHAtefzxCdjVrxy44eQ0W4JMcITvdA6nFiw47286weUj1gDYTliSHH4a
    Rfqdz8Mrz97dBI+IwH04tfuE//abx6WtmjpzZg/LAsqMogvt9wWgFFWmmSQRyPty5Nblel
    m5mYI+9xEWV2DsFXbtKB7jR/rStjdu+K54REUm0gLnliqYggb/yCjX6+PhETHeSyElMsdc
    HayPYCXV/o8dR3r0loJwZEEqh6eM2h0Ablsw8+0M156E3Iqn1byCf60SNceA2hnHquj7Jp
    +Dj5/8RQEWUTcuBM4dLYqAIyuLOfa56oA6gYoWD57ExcXmY9ZbKQ4m9jrZVijEfzFO1jPy
    WCJ5Xw67hyN4Ay4hWGK9UGrYprN3TuXJXZGouGoVJqAFNDTp9HVWAdKtC9zergK8G6GNpA
    gkWc4Coi9Od852jtnj/wfnZ+AvspqYcyTaEzMBU7ULmEq4az03IJKHKmfI2QNwJftcN839
    ixNewjok96+mGfHbim+ouDAw7PuA4jt468FiqbjUah4rAhP4Ov/7novyx1eZicT7AkWiJ1
    UlOoox36cM3+Fk6EPA8WqVvzc0K40NiwWKmr478zCCUFlZI1j7W7z3uVTWreOlEgEX7qnf
    yIh+j9vAU60iyiFf+ylTjBDuWvrBes/xdclnpbohPjaQ+eYUbq6JwCnugK4Q
X-ME-Proxy: <xmx:InNkavOuY-_ghHYOvuEExSk_HEUWTwOJJEJNqFtGNxMwgIkzsxPSHA>
    <xmx:InNkaiLgFUGYRtvMSJGV7gxw2S5R9Y7AbYhV_hoEepOwfr58w9lWLA>
    <xmx:InNkap28gQL1hB5OVU18F4ljY4wXeS5vtsZwMuTQVnntOlTkbc83RQ>
    <xmx:InNkauXi5gm5i7O0c-Y5mC8GvPeMju9flC0aw2cqze5KfGGFntDAqg>
    <xmx:I3NkagWKjbfbNzKk6Olutx__XBlj2U9gdHkI-1rc7Ij8sysMvc48CeUI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4AA14182007E; Sat, 25 Jul 2026 04:26:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AEcurKPZ2CIZ
Date: Sat, 25 Jul 2026 10:25:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "H. Peter Anvin" <hpa@zytor.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Borislav Petkov" <bp@alien8.de>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Gleixner" <tglx@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>
Message-Id: <97cafb31-fd66-47a3-bc1d-d335c25d9523@app.fastmail.com>
In-Reply-To: <D43E56E4-209C-4E77-97EA-C62DE6D7BBC2@zytor.com>
References: <20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com>
 <20260724-tonyk-syscall_table-v1-1-9c53188423da@igalia.com>
 <3a481359-72d0-4c58-8a63-b6d941a22482@app.fastmail.com>
 <9a9caecf-5d72-4c68-ad46-5779c3fb73f0@igalia.com>
 <8550e179-3905-4275-afff-c19990a329ab@app.fastmail.com>
 <D43E56E4-209C-4E77-97EA-C62DE6D7BBC2@zytor.com>
Subject: Re: [PATCH RFC 1/4] syscalls: Create unified partial table for all archs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 24, 2026, at 23:22, H. Peter Anvin wrote:
> On July 24, 2026 1:25:05 PM PDT, Arnd Bergmann <arnd@arndb.de> wrote:

>>> It will wrongly add
>>>
>>> __SYSCALL_WITH_COMPAT(441, sys_epoll_pwait2, compat_sys_epoll_pwait2)
>>>
>>> to arch/x86/include/generated/asm/syscalls_64.h.
>>>
>>> Maybe I could add a --ignore-compat to scripts/syscalltbl.sh, and add 
>>> this flag for 64 builds. What do you think?
>>
>>IIRC, we can just use compat_sys_epoll_pwait2 for both i386
>>and x32, because compat_sigset_t is compatible with sigset_t --
>>they are only really different on big-endian targets, which
>>count the bits in a u64 different from two u32.
>>
>>This problem also goes away once x32 is gone.
>
> No reason to introduce another entry point if there's no difference. 
>
> x86, after all, is littleendian and alignment-tolerant.

What I meant was the reverse: if the common table has the
compat_sys_epoll_pwait2 entry for compat targets and x32 is
the only outlier, we don't need a special case for that
to force it to use the sys_epoll_pwait2 variant since they
are identical on x86.

Looking again at the x86 table, I see that x32 is not even
described as a compat target and just takes the second (native
64-bit) argument of __SYSCALL_WITH_COMPAT() instead of third
anyway, so there wouldn't even be a problem if native
and compat were different.

     Arnd
