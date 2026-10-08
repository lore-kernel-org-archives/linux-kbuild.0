Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DB2415B6E
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499392; cv=pass; b=NtBjylTWBStEw7swe75G9kSKuXJmEbkKK7sKm+Lcebs+YVuCZMdJAlmvB8j/UQ5WvmAC/RZeyOcdjggBAaGPml5eTDCEOxodwTuSKvT2BlZEeMr6D8n1griX2y4O49u1tBBjJuHsphTovaO+5oALsQbhbFdApL5P7CVSFD9YpN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499392; c=relaxed/simple;
	bh=Jkrge1vcQmIVS+2wnxJm+tmMInEAN+x4OhuxkeyqqXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bo/2nU63hIDAl9qEhw8hErodBKwFvbDemQuvIPnLgPvbVadwqRILshBvITdL5s/3CWyR6OJul4ALfJC/B95BarC7zwB+KvLS/CfJT+zqLFLcWti+pz/fFmrds4Rb3IQWFTDdv/TBR4HGnYTOgNOyW67Zre2QdOy0POBDQwMjMOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqUdeWPo; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqUdeWPo"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-675676afc3cso4128192d50.3
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 15:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791499390; cv=none;
        d=google.com; s=arc-20260327;
        b=i2xa69pghzy93yw2K+SwnXqBWR3nmArkXsvht9bSNzYznzzBvrk/0VZ9pSn5GizRzi
         K4XNDXwYVNPrPYHAIOWGb3WRqnKP9zFYR+UNsxvwPYnRi9JV8M2zBWdnPmFhVdiGHUO3
         YyHYpHOdX7tbf5swB/p1KUKOHlOBVFjK3uGF8bifAHrJIvXctTuvMsGT7rIz2ImwS3Ig
         yVpMsWTS4FP2QrFKDQhNqqVIMJ/oR8M/u29oI/FfHqFooBc+ScQtgyV4Q8XoB9fro8UE
         6gjmAwEsYQurZlOxg8B2WFWFIR3q7DtdDV1DbFOV8W/ITdbAReqqmTUzrq+wQYNMKAzO
         ZLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T27sSsy1//nGPCZ2xCeEy5WnCN3gvZtuuWAjBUul8kM=;
        fh=4J3wILnR4bPVZXnWwQr9LUf1JSleC4yYJPs4icL3j94=;
        b=dhdJcevBIVDRPMghnvFCB+1YMBIIxI4N9GeR28eYcjOc9RgJtUGZxxq8XMv2pCxYIB
         7Sr/zObMEw9qDOWhcojtzv124GR2TqAx+C/thPuYlxHo0KKsFtJeJA1L5o6mm5O1W/3I
         3kqXlR6j7NeBwu/1Z/H1r/NA23yo/x3tf6o5jr1WqtpHAzAm5BMZ1Wdv+/ydSgH1nDFF
         xrgVGG7BoBchy/nvpl+K/exiFn2/LQ9SpA5LApLjee2XZtvCzTHHGf4KyB+JirrTg3QV
         ezLvvC92+oVreejVZVsoCsE1OpzcCnhZiDigxJkXj6b+1mz3SPVI+y8N2z4VzL0ceAym
         Rz+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791499390; x=1792104190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T27sSsy1//nGPCZ2xCeEy5WnCN3gvZtuuWAjBUul8kM=;
        b=TqUdeWPos8qv/AQUh43RFvEC4NxJep7w1ZNcLLjbkZxwOUXMqBU6TXF4mdWDEVC9CT
         4AoNcbthCOQjDTpajp4tRBPJbk7M2xV6OcE72Jeznel0oKu0QgyjTM4zz6g7IpzXBLPm
         85kawtU5S844Jy0QTM+kay2JyQyRlZC5gCBK7fMdXs0s11hrcCewTQ473c1BPciZ/38I
         zWeOC2EOi6nUEY+1ephdkt1Q0gLmAHyYU+SlQOVpyMQdSzylTOLMAbLuCF9x4hICnZLt
         86zZ2NbAMrqJPgwUxRHBj+674lQHTPWVnQQXrN782Xh7faSV4/CjmeM0Wosp6+IniAJ1
         EEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791499390; x=1792104190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T27sSsy1//nGPCZ2xCeEy5WnCN3gvZtuuWAjBUul8kM=;
        b=KlKNszO/9W+o2hU1zj1yWK0LAVY/4qPQwfP4qrbf4AZXS4I7GBaM77JS+CAOvD5mGC
         oBw46m0ohF5n5mMEeFK0I9DOYLRJK0Q2+tOWDEPE8wXkJB9SN/Nw1eKamAVTYd1MNQhL
         FUz6GH+6FVlES5hWo42AsMxONV/FcuEz9gnkvIzk5AkCVXvT13SIlRHlHIeOlbGh/z7C
         KCufwIpPkH4UpvSqWL397kREvrRQ6O9OZkaO+xhztj1cVWqcRfuwCTol/BoHU72/gtmi
         Tm4HMsP5/MQjLzohz+cOsJ54/BFF0qaRULvzmR5Pjimmn+1JUWhGGtPWDu5JZqNWUlUZ
         zO9A==
X-Forwarded-Encrypted: i=1; AKwUvBwjeeYlusxyMGQwH7/gD99jS1W534YtAvBE30XosHCmz9pu6g/LlHH9w8s2cexwLv9y73CV+CLA/TVO3GM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXthffyU9YcffT2b4Lnskdp/LmA1czeMW0amWzrXIzH6X+TXSK
	41Ld1GkHtBd1Bk4+2XSu6HZFeQqM32sOrH8rp0P5XCXZP+IeHsJ0tZU3HWGbJzOvdjjrTPXCYx6
	aqDZezjk+agjMlu0F1CNNIcWBfb26TyQ=
X-Gm-Gg: AYBFou0+3iWRUUSMxy/IkSb3UMQOo+dqH2jJhnJcbWS1rOQcScKIC5FpiWFiMr9XRrx
	EKN89PU05uPypAcHx7SkoSd7LdPVXgQBvfrebL9E4exzWWu4bydEKQfDNhzxNjr9OaGLFbfuleC
	YGEwuO+AFBg3Z4p+reAkz5UW+61+IMxHrNhGFHn0notPU4GMXpfsWa3BLYVA8xsU84twkJMXY9s
	IKqOf9AUwiLjrm5mc4nkNSX9vOaROVjqlHdVmWnTmSD4+blTXNhuS/Ukqcxa3JXBBqIWhenrVVK
	3AsGGw63oicfjH7wnE4DeAT8Is4oKw4I/uMZ+c/nzGuSuhfKaawG7u0tOu+YBea/hYiIzaWSWhi
	FgsaU2jbo9J1BX96XwLZ+0YH8BdSxd/zeqUVCzTHhz5f3
X-Received: by 2002:a05:690e:168b:b0:677:d251:cce5 with SMTP id
 956f58d0204a3-6793602668emr129309d50.43.1791499390077; Thu, 08 Oct 2026
 15:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005200123.146822-1-denis.benato@linux.dev>
 <20261006081116.GA830598@ax162> <0cbe9bb2-69b5-4d6c-a780-07a55d40a63d@linux.dev>
 <20261008164736.GA3975095@ax162>
In-Reply-To: <20261008164736.GA3975095@ax162>
From: jim.cromie@gmail.com
Date: Thu, 8 Oct 2026 16:42:43 -0600
X-Gm-Features: AclHuK_qZbHhZtbNJ_NdJzWMdgJh8AbuPiXlIoNGPj1A7YcAc4zot7ziJa-OG9c
Message-ID: <CAJfuBxzMz2YRoHmsr28DjNontvoR6ZVfZ+AbAbOW3aHbsQfi-Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: install-extmod-build: install kernel/kallsyms_internal.h
To: Nathan Chancellor <nathan@kernel.org>
Cc: Denis Benato <denis.benato@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, nsc@kernel.org, thomas.weissschuh@linutronix.de, 
	chewi@gentoo.org, abelvesa@kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 10:47=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Denis,
>
> On Tue, Oct 06, 2026 at 09:39:51PM +0200, Denis Benato wrote:
> > On 10/6/26 10:11, Nathan Chancellor wrote:
> > > On Mon, Oct 05, 2026 at 08:01:23PM +0000, Denis Benato wrote:
> > >> The tree staged by install-extmod-build contains no kernel/ files, b=
ut
> > >> since commit 4fafd1165b33 ("kallsyms: increase marker density to 16:=
1
> > >> to accelerate lookups") scripts/kallsyms.c includes
> > >> ../kernel/kallsyms_internal.h.
> > > You did not add either the author or the committer of 4fafd1165b33, I
> > > have done so now. This would need to be handled by them. However...
> >
> > Apologies. I used whatever came back from get_maintainers.pl without
> > much thinking given this is not the area of kernel I lurk in, but thank=
s
> > for taking care of that.
>
> No worries, that was a little unfair of me to put on you since this is a
> bit of a weird situation that most contributors won't run into (a patch
> living in one maintainer's tree that needs a follow up in code
> maintained by another). A good rule of thumb is if you have bisected to
> a particular change, always include the author and committer of said
> change in the report, in addition to whatever get_maintainers.pl spits
> out :)
>
> > >> install-extmod-build rebuilds the host programs inside the staged tr=
ee
> > >> whenever CC differs from HOSTCC (cross builds, or a ccache-wrapped C=
C).
> > >> scripts/kallsyms is hostprogs-always-y, so that rebuild fails with:
> > >>
> > >>   scripts/kallsyms.c:39:10: fatal error: '../kernel/kallsyms_interna=
l.h' file not found
> > >>      39 | #include "../kernel/kallsyms_internal.h"
> > >>         |          ^~~~~~~
> > > I would rather not ship an internal kernel header in the external mod=
ule
> > > build. If these defines are needed to build scripts/kallsyms.c, they
> > > should live in a separate header that is included in
> > > {kernel,scripts}/kallsyms.c that is safe to expose to the external
> > > module build but I defer to the 4fafd1165b33 folks.
> >
> > Fair. This is something I spotted compiling our training/testing kernel
> > at OGC using the github CI and my main goal was raising awareness
> > on this issue so I simply started that by sending whatever glm did
> > to make it build ahah.
> >
> > Please when something better comes up CC me as well so I can use
> > the proper fix rather than this llm-cooked thing :)
>
> Indeed, thanks for the report raising the issue, I hope Andrew and/or
> Jim can comment on it soon.
>

The easiest fix is to just copy the 3 macro defs over to scripts/kallsyms.c=
,
with a suitably explicit msg about the coupling.

Andrew, do you want it as a fixup ?

> --
> Cheers,
> Nathan
