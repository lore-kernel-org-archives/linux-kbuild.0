Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C93AD518;
	Fri, 24 Jul 2026 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784924728; cv=none; b=d9V8gBUjYn5S8jIFte3zZH2XU7W+cBdGWwTqoH+Hp4N+MuPzHTgqUhgjxJy39Lnu8aU06PDos6Xe/TbDec1+i7rnphYBGvwOjfdGvHUOakQfUGSuG9sfMVf7Y2ToEGgXm3oKgDOTYa4HVBUYheHvO4xBPD3A5Wudp53ubif25zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784924728; c=relaxed/simple;
	bh=6rzuhe6TlMiRWj1FuR0fsLswxmgb+bPZogfQRLY7fRE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sDMjMQzLTolS5Pjh3k9Pcr36b1L/NaLVZHIhidTmDfvo7IiM9sRIiWoGzfX9Xs6oOU7FlMlaneh4tNgiL/CEPYywJ+qa++TDfruIWypPupzSPCsbow5Oc5dvCRTP4nIQlxVkg05ul7xglPXwBwTB6xzSicK+eXh8AtmyEbtXOHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iOQTYWIU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E29GoDyr; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iOQTYWIU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E29GoDyr"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 93BA21400043;
	Fri, 24 Jul 2026 16:25:26 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 24 Jul 2026 16:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784924726;
	 x=1785011126; bh=PKL/lIn65hdnSF9Yxcyoy53x02iNMOjWpwNar3iCBnM=; b=
	iOQTYWIUJ64C9fIk/gyc3HWXVwb3WJ4N61MQS8GOA/MtGl/GOr7v6pv89/Qytuzy
	YDp3zrdxVSKZWLo1o+kQxanvZy59/RCMF+O42H+Q9Cd8PVl4ME4ehrSh+KOJGD2W
	bstN/JRr93Ca8XFwCr0Qc7RWAPTcvdUQwerruQx4XeQti3aOCFwx2MDT9nxB6hiF
	aiFS992jEDAh8OSjkRhC88Uk+gPL9W0j54MoVCjTNP0MxdaX/3zeLYqjXUoomtBF
	ZZT/BHCIsnIQmnccOkijzG0xFyB1fY0tUguMUgOPx6vOi1froi9LuMZ9ptIGEGGg
	3K8VTxQdmwVvssA23Q9Chw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784924726; x=
	1785011126; bh=PKL/lIn65hdnSF9Yxcyoy53x02iNMOjWpwNar3iCBnM=; b=E
	29GoDyr4dcnmsR+72vCIfpJRKrfKvUjj1y8W5gVJVZJh14bdt3VRO90aSUPFBU5F
	NJxPS9BHWYCU9nyXgEvwXxnG7ANMgSwVfBv0S9eVLL8o5BrJKzwJJJ2Gj4LX9jXD
	/lPCRZdukCsX1/GI8at4bd4sw50bKlAtMoC9CcHRQhCptWGStI7ikgsExW6oZ5tz
	jzjCOhUeVxmCx7K0a66v/zjiJ4fMo7V19US8LivBh4D0rCkZ+8OAFhCyA1sEB8g2
	oyXHWq3qGnbSVPUP8nHnCAncpYReM4jKlz4wkbPF1ZnC2Cgz9+6gx0Q5SziksQWj
	KBt7CCuu9E5SYl1LcMYmw==
X-ME-Sender: <xms:Ncpjal-c4kLjO4rGiTXi_FTrw79wgVFgJ2CgScwpMwqdX_njH3Dm-A>
    <xme:NcpjakjCHHgSxyZlgN70OaEdrYEU_B_raZTOdjiGwjfd7TIivB-rUkQHn8wN1PMeU
    IqBdCUpx4-4LfX7-aK8xDPyFG5j5-gYJp__POJeg_WvNdnpAo14ne0>
X-ME-Proxy-Cause: dmFkZTFygWMdVWQFjZJET0AtJ+/g2L5YGwls4f+GJqWt4htk5VR0iMPkBD5rZexVV9vHTJ
    0rTBi7vWxVYrz/QztRTyr7WPPGJad4pxucs8oe7LNnhI1IuzU7efW2E8gjmobudpVW9FNV
    4mnukPhAXEdXo4ZXi4JnVUNVCS2D9pVmCz1rj0jTET3X3S0rYdjbO6Gq+zRsDMQ+X/mSex
    rNVGykUDd2bYlsOZWvMlY8vN4IS2WSc3Fmkm1vSZcaHxTCWAYYuYx0gRh52yXWinj0njJl
    B5Fmq5VWT0d41jebTxCM9ZSfrbgzYxkEvb0R9JfwdfsjPm5wHpH62DDcWOlEg2w+yfaAUJ
    WKvCk00qgp65MihMH0MqASL/WrmpmQoidYWHFousYHzo5AikTgcYMxwgldWPfvzHqCeDz3
    NW9W4wT58zTAgpzWzY2u4mSlZIs99y76OkQSEthMgWfYmBL9rbRb/4H1oXBw+/VR87br0i
    d01hwP2oZEyEhjNIRkSupbWA1MzXUh33s3hwNXYyXjTtuhugGNZg8TUp2YWaUrqVZBhh5l
    q1dhb+HQkHeExoNqn+MdBuAn1/zaJ1/aqcoq3SP0A3E8H/a7RUi7cXIFiCu8yr9QFazJw/
    hEoO+f1uNsLYzktiLe1NvOsak1HuYhbdM4wUWSEtGx+BBD/O/NALc7ZVdXCA
X-ME-Proxy: <xmx:NcpjaojKqS6MSKiLsVjjaWrakZfKgoyZsOUGzLJPRg6zj4WvMTX11Q>
    <xmx:NcpjapN8E9KNeeQ9L8NGc-hlHDvif00traaZ9d_15LvajVb6m6wPag>
    <xmx:NcpjarreNs-tZNH8d8mbwRL-dV9c2u6MAEFB0fEL59mXw8RzGNfQXA>
    <xmx:Ncpjaj53aIi9wSf6VYssbp3cVp5VwQl1fIu4VluWfnBajb5tunW_xQ>
    <xmx:NspjaigOd5XYU9G_mhT_9EVWG1WNxhWC0c13P3ppLrLIoJ2soNmtyd5k>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 97330182007E; Fri, 24 Jul 2026 16:25:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AEcurKPZ2CIZ
Date: Fri, 24 Jul 2026 22:25:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Borislav Petkov" <bp@alien8.de>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 kernel-dev@igalia.com, "Thomas Gleixner" <tglx@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Ingo Molnar" <mingo@redhat.com>
Message-Id: <8550e179-3905-4275-afff-c19990a329ab@app.fastmail.com>
In-Reply-To: <9a9caecf-5d72-4c68-ad46-5779c3fb73f0@igalia.com>
References: <20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com>
 <20260724-tonyk-syscall_table-v1-1-9c53188423da@igalia.com>
 <3a481359-72d0-4c58-8a63-b6d941a22482@app.fastmail.com>
 <9a9caecf-5d72-4c68-ad46-5779c3fb73f0@igalia.com>
Subject: Re: [PATCH RFC 1/4] syscalls: Create unified partial table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026, at 22:18, Andr=C3=A9 Almeida wrote:
> Em 24/07/2026 17:09, Arnd Bergmann escreveu:
>> On Fri, Jul 24, 2026, at 22:00, Andr=C3=A9 Almeida wrote:
>> It should really be anything starting at 403, not just 442 and higher.
>>=20
>> There are some trivial differences that have crept in over time,
>> but we should be able to work around those.
>>=20
>
> The thing that prevent me starting before 442 was how to deal with=20
> compat. If I add to the table
>
> 441	common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
>
> It will wrongly add
>
> __SYSCALL_WITH_COMPAT(441, sys_epoll_pwait2, compat_sys_epoll_pwait2)
>
> to arch/x86/include/generated/asm/syscalls_64.h.
>
> Maybe I could add a --ignore-compat to scripts/syscalltbl.sh, and add=20
> this flag for 64 builds. What do you think?

IIRC, we can just use compat_sys_epoll_pwait2 for both i386
and x32, because compat_sigset_t is compatible with sigset_t --
they are only really different on big-endian targets, which
count the bits in a u64 different from two u32.

This problem also goes away once x32 is gone.

      Arnd
