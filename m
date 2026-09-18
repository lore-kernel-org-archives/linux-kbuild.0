Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB84E73AA
	for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2026 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731393; cv=pass; b=owh29o2zb//+CWDyozqgbkTO95wmrczXaUb2iEcysz/frk1+M7i2os7e0Tl8W1Zs4XzkNBJ2ToizxJ9nIxdAKD1dVm5ctIUJgb2hjF8jSlUlQn/sLgbAOj2UcUWfZtqpdxCNEcqNoihiPbZ0RA16JPY+AuezW1frEldrTzV3GdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731393; c=relaxed/simple;
	bh=SM+WZSPeuzqNNHXbABDFo7m2xf8ZGs0pqFt1fmpcd8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzURpRmHo9N8/IY1aehin+5N+5b8bLUiZvFGAwCGQMPliKb0nf+5tDXvKO2+vXycpD6Jz8E2BSAZVrZd1rhXhS1I0+r4Pf7eLR2ZvWNrmdhCJQAKiMld4KdyzJdDpqP6qAHkE1/iNoW5HV4YBLSmL2TdQYHnrbCPTkqTKnq2ZhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB0WVjKQ; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB0WVjKQ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa65080so79956166b.3
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2026 04:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789731389; cv=none;
        d=google.com; s=arc-20260327;
        b=k/Oz8a0Ff3RU2WzSkP2DBHLodNQIdwNar6AkohQSNLcWpMkLT3VoxbmBy+lmrcYA1q
         3VwF9QHFiIFzvtfLBALIP+Sv8exHWUTux6C2zUBRLndysjMLw1VMXLPMamET2INuaTqW
         BECvozRBz8uTmzTJdbl5MrgkkYv6Sx7oioyCmgbdT1+inVjNSe76owIiVLVR79L9MCkQ
         4wX0jJL7KZ589Hc+9TOMJdhVFhWUZAgOaMDqBk1kwdScIA07Lfe91tuW1GW/YINA7bLG
         yK0vDOn3sl7QwZVJthjv/BHL6J4UYqvNMyTi9l2FbK99pvEviuw5CbEKbXUsUPk5PndX
         J/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        fh=ajnhX4A6YLHUncWxgUaOPs0bXtlFIAX5ZghRUs4wzjA=;
        b=izNE3N5dETYOlBsoUGR/mcD/a6lNuwLczGf1T7xdDDpgkwm6r4Hv1r31/Tjh6ySSif
         7G+V/WbK3EOhTVBHDPKqYMGOf/yOd/jVLOMVKDLOGYSOaJkE5bx3qVYcOgB1zVFvJS4V
         7/ePfHk4AoHU1sZTpuNFiVhy9wC8hVKLGwOTvi13YMw1dx0jyMDJVHu1RXG0/cuaFB45
         aPfTGg6uSHkzviFOfAxcy2m2d4UXpGLEJ/hGsLKL8x4B0yMr6HJ9l+UIK08lhX39faJH
         XVPr4D/vII8/o2k5R0aMSYcH+ss6UFb8p675OkF+g3SmVzF7tlHM5H4TP9KPKOLtZ7Ym
         HWaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731389; x=1790336189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=bB0WVjKQFWGFLevQSZ6+wAuVr10y9ueGPJi48P/WjBtC8HiA56X/7cJR6K9vGM0O1b
         LOn9zSnVnB030apqwbpqkCcB8mZ9LvTeNyV8wzjrAVeJPSwPqR0YbfMFFX7oInCp+PO6
         AUrKAP72yTipK6iFJN6rwwDKibX21Hd5VtDQi6St4RCUM1ANGs5FdA15ckkqr0pWqS1M
         dmYrup7gqfRT9F5Zzs0SSzWEO/OrwvnvxLERcm1vKAiyBn3OnaeDPBAat3WD9kx440C8
         44rBdCLqBzQhueA3Sxz9dP/Ix0BSHZ78Qw6u1mlZL+iOzeg6cyHhJb2ZDhy8cpR45RAX
         2B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731389; x=1790336189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=VPCQjfpkOw+EAUGEPNH8fRD7RIrIE9urem+R/5KCNWFlR2JS3O/CSK9KuoxQNyUcSn
         0qPApfeM/TU2SnpXhsA+xctPu9xxVSEmNN1siqOj5AOI8IpWsmO759+SmRScly3EdA/0
         1CyqT3mMcQWfn/SaoFewiRKSjAnjqTM+sckuQJlyUFEgDOdLgLNrPZjysR1vLSOrmRFh
         Y8Xx3PVCborl9IAfKeLChKvsNhY8jYMVbTinbtHpxTUkzBt9z2p1Tz1twofaaNFN1GfR
         /AjmU38BGZhuT6tQ+rsoVuvCjI30o8lTf6l97KnwpSuD+4W5wmrSaMdf420VHHA4LPPS
         qeig==
X-Forwarded-Encrypted: i=1; AKwUvBxB8rpta1oOBNGFYl53w7cBmsYuGmWoDQifUFrRxN8MXQ3qGNbPonStNF83MHmsygl46c599yxZfQdVk9I=@vger.kernel.org
X-Gm-Message-State: AFuF++mYUhZXof51DN//SBHCRNfdH8u9Jy2/ssrVv6YMvI3ZsIX3K3La
	K1CnvPbN7VLXCPFVeegoCTW+35jN8IDYZejL28TvbQpcRBxMgpk9k8JUB6nzIFxFJAF/AKt1QgZ
	4r5DRynJ0H9N03foPcs1Yys+d/EPssqI=
X-Gm-Gg: AYBFou0VX3O/Mt6uajmwtLm2OHKqv+N8anTJY0YPnQowLkwbhDysfVJ1f578YMYxqjk
	jBiWJlp6zt/YqoFdROMmbtDUH/9HG6WNpSqlZtQh0nfIIco00oC8KrStalIEgsWUZBjjmwU52/b
	5m32iPMmZGm4dc8Wu3nrGl4H7PuXqf+MIqeZ+/FZbE+xMHHhNMNeHjyzQxAQz0tZTzymOOxMYlx
	tnQf5lQVKTYIqWlEvgDxgei/SBrMUZf07JRbxvpFOy1W0gpzUIazC/DT7v9N5Hw889eU4w+iqfk
	TLkEZkSKBUZBrWJRllflYkMONTmHBo17lwigQu7SyrrjMpqjYkWz17gJrMAv4HvK4T/uoN2OliW
	Wz/qo9V/wkmAJjCVa4UD7Dc4zaFO8ObiN8kavXRL8bA==
X-Received: by 2002:a17:907:948f:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c2a1582698fmr217595066b.43.1789731389390; Fri, 18 Sep 2026
 04:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 13:36:17 +0200
X-Gm-Features: AcwNN1W0uIsrBudlRZeSpl5_CSJhjtWRK4S-OK-90sOk1QFHdqx3jezfZnvgjR0
Message-ID: <CA+=Fv5To=fUfD+9OtAcNJcaquBy+xv6oNUFES6sVwpOKzH8qgw@mail.gmail.com>
Subject: Re: [PATCH v7 11/13] alpha: Define entry point for
 set_mempolicy_home_node syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:47=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall i=
n
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the syscall
> tables and create a common table to rule them all.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 52e3538cc7df..8fc4701a6328 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -489,7 +489,7 @@
>  # 557 reserved for memfd_secret
>  558    common  process_mrelease                sys_process_mrelease
>  559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_ni_syscall
> +560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
>  561    common  cachestat                       sys_cachestat
>  562    common  fchmodat2                       sys_fchmodat2
>  563    common  map_shadow_stack                sys_map_shadow_stack
>
> --
> 2.55.0
>
>

Looks good to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
