Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C353B23395C;
	Fri, 24 Jul 2026 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784924195; cv=none; b=m+2CkCEiEmJE7F0Eu92lEv7RnFEFenw5XiZvGnenJxg2nx5nSxszAGAImbr+PjnfHuwUkzxW+lZI3zG7gC/5D0pajEi9lP02YorkZrnkEPlomeD+fkUBNFFcHp0tOysNOffJX/P7uwPn1UsxI1qBVXbywU8zjk1kWHnMPhrMuAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784924195; c=relaxed/simple;
	bh=TeF0LNB1zp2MAvAf/zEZYjFj56kAph/eMmB2+L6nGLw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JLAKj8hiPTK5ros+cpm6IMcFVHq13UyitfIq06b6iKQOW/cwmEkYxupV5JniEGmF7P78YXsqMDQZbQIkE9eqbNv3ZVV6hl7OhB77veAHCzOLbAqZKVC4fGMyI2YxtQGc0CUCoGIdcTVZ15WoMO4QxVx7xqf30syexzVG5uBzpHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TV0fTtaV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FIuOj+95; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TV0fTtaV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FIuOj+95"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 26E1C14000B4;
	Fri, 24 Jul 2026 16:16:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 24 Jul 2026 16:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784924191;
	 x=1785010591; bh=ID8Gh1yVkE/8Q3kWAoTjvXK0TRtzbGH1IFnXhc0a/dI=; b=
	TV0fTtaVdKHIS1OXdPSLtARcRYZ7kz3EvHgivhDHATvjwQgGpYgmhH3tgU5wq+BT
	NG2OwojOmdYfRJCia7fqe8vn6CAEDjbk/K7uU9pK7lemRkbMdowQhDlWSZjPn9Py
	Fv4e9dgqOhsdkWYUrtYVWPwmGupOJHZbK/QA922lY1YfzjjFqPyfpCLebPhTe4gq
	w9m0zdfIxcldRVcf6bHyCrZef12gX8qiyv/FG3GuWbp3sag1RfbwBX+lQ1+Y+jdK
	HUNb1AK37WwNdhafSuiLku4A+dfHpp6Rp3Ff7G5Ui246iQ0wrY6GqfwOrKJ9muFM
	AYlm0jEoXsXxW/2dkm777w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784924191; x=
	1785010591; bh=ID8Gh1yVkE/8Q3kWAoTjvXK0TRtzbGH1IFnXhc0a/dI=; b=F
	IuOj+95buZTOouncW8aGUqueIg6h6FxQgdzEjAv3MkBeVwZswtjaI0cQ0FRtWRXB
	Y8dlN9RojWblRz4S/cyFzvN6WxQfwpz2fbdrRm8qKvbhxK8ceV7HlAjBI0vm1zhr
	BcYLj/ENDg6aewsGJWtewRZlteaGPBNKAOOhYnjWQk71au07/9TI5zFgGVKaMJnY
	eZh9NoUT9XSELoY7/hr3xVMgRnGp5Lw8DPu0LFs3goksHPLaevvmtYxOi8x7eyJ9
	F3D4MoiWLOL4y0XESL34jcxxXxHTEwns73buOzScg5G27dsvima/w7msGhXzHnFN
	xtueSoYUp13s+ldL+LXQg==
X-ME-Sender: <xms:Hshjav7UjqmeGrXLbmzu4T73GuHcV6AC5FIovY1aT4HCCGOimW5e9Q>
    <xme:Hshjavu34_5KactIRuBGHQzV1N0584GdZcdMk1k_auMY7hcenygzYqX1K9pltJDbX
    U2yuW0kBKqvqr8nQOiEjvXcniztDVoehBU6OWRwjGCF4Bj9wbhA1zQ4>
X-ME-Proxy-Cause: dmFkZTGuWKceVEyPWwT1hpr+hAGJd9LfFGn8pj0ZKA+y2N7mz1gVTAQj3uZ1dJ5AkyzEPF
    TrUMY1VCP0st+fZr8JF3mICPw+yAbPPGeXWTuAhsG6WdacfVjRx+XsQyYggv3IGkROQ2qh
    o9c8yNsGcFpKU2GyT6yrjxyCm30nlKajhaeDeM6u3pa2twRXf72rOPDPemLy46eLrzA3zb
    MjPlN22DyM+KsKM6Jy5iJvi5V+tke1S5wyiuSa16TRiqartzDzZlAoYdSgxTvSrhX4YNyl
    URjuankCMJiA0iKOr2y58qZA70LoLCeVybiCXb5Fyb0hJ7ruTE3o4Sb7shJWwutJAys8ni
    d6ptLpXLjY2NFx+Xsxg0l1tDypLlFlwRx1s2zBSAFF9to8Pa2F9eIjBNDztEl9jP9Az7xf
    IGAaOqC4H2JDGPKvSyNE6jMUXXT84Gt/2eJDFjZSiQElaY0DwTl8M4uO/PksFJFP9Wga2B
    k/6myR1yPpVAj4yX8DqC+04oHds5rRvYgQPmJBENTLv5drC9SyMVGb/oo0b7oEdhLUa+Mv
    AiSWENjzAU1o3aqzTgxt61zUyGe1pfS7TCguzRe5m8Sq/fHV3UVT/7YdLsDIzH4nhLDEUj
    UQ4CD5VHTxDkfGq02JC1x94SZlUnI2PS2VAualv5LsRpPY/nllIMLj+uM31w
X-ME-Proxy: <xmx:Hshjahc1CIh1wZsoIbQrKKQMFzGm8h3PHstTjDndaLdVyXJRv2gZaw>
    <xmx:HshjanZV1_DjiVwbUNXLvhkqcGpN-69VOlG6UOyhGWJwuoEYEuL37w>
    <xmx:HshjamEpuqif5f_Pzv1V6rTNQknWLLNzoRea-Hg0bnU2MNQNVBoXcA>
    <xmx:HshjallKVb6fgnB_cRdQmg2UW-GnU6ZIEaIcFwq8smmkgYVYfxp5cQ>
    <xmx:H8hjavtn9LgsxCXSdp3eYWPegJsVGYqzx5IH8C9wqD-If76uM-nF032b>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C2CEB182007E; Fri, 24 Jul 2026 16:16:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AJXRYo5zINsw
Date: Fri, 24 Jul 2026 22:16:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Nathan Chancellor" <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernel-dev@igalia.com
Message-Id: <5b4e3a79-c170-4c48-ae38-d457a85c792f@app.fastmail.com>
In-Reply-To: <20260724-tonyk-syscall_table-v1-2-9c53188423da@igalia.com>
References: <20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com>
 <20260724-tonyk-syscall_table-v1-2-9c53188423da@igalia.com>
Subject: Re: [PATCH RFC 2/4] syscalls: Add support for x86_x32 for the common syscall
 table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026, at 22:00, Andr=C3=A9 Almeida wrote:
> x86_x32 has a peculiar ordering: first, goes the x86 syscalls. Then, t=
he
> shared syscall numbers from the common table, and finally the x86_x32
> syscall numbers. Adapt syscallhdr.sh script to take this into account.
>
> Let's hope that x32 is deprecated before the syscall table reaches sys=
call
> 512, to avoid making the shared table more confusing.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

The suggestion at the moment is to remove x32 in linux-7.4, and
I don't think your patches will hit 7.3 at this point, so hopefully
we don't need this bit either.

As we discussed recently [1], we likely still need to stay away from
the x32 range to avoid having conflicting numbers on x86-64 between
future number assignments and old kernels (< linux-5.4) that fail
to return -ENOSYS for x32 special syscalls. The only way we could
arguably consider reusing them is if glibc increases the minimum
kernel version from 3.2 to 5.4 before we get to that number, but
that is still slightly fragile because glibc is not the only
runtime to consider here.

     Arnd

[1] https://lore.kernel.org/lkml/29bdbdc4-caef-4486-8816-84422c23bc20@ap=
p.fastmail.com/
