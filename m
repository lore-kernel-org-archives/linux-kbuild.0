Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382814;
	b=o+6Zofs4E1jMTpJ3ydL921E3SGEhmgqKtNyN7uEHYwqrnd+D93XENLR2IO4ob+HBBqLj
	 lyo+7qa6y9/uFOu9fChuuvfWYws28QqHD8bwdYxTyfHBQywMs7mQXYhRQ/6C9oh9c9qL1
	 iKPc/TsU3N8pEy63/FeAz/z61mMU9WNi81sZzy/BgiMEDfjP9uBdx2HM6Toges10ygwf3
	 yO6ZuRiHKIcQkELPqYDqBw9KF5XXxTC9TrPXWcH7uBi41qTQIDtpeb07Z5vOLoHXfTXE4
	 mtPKQF+t7CE6KcvfHlG/6z+YAz6OfCWaLFUJY0X71/zk+KmifmxUxbgyEnBvU2Ij/ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
	b=wKhp+Sw06jqsz7zYn9zf6PgJTSaRNm3F+pnGxo4gZ2c3eo/q3EODpIUqJV6tV+J5SSdG
	 0uAXJ65pLfGig2YiUGDeYNfaWfQDwQRE3JVts8dKGzUQh3c1AHYnwNmyt48z5OHeRcx3g
	 4a77i40hp4jcLY6Z8g6lBrMoN7mwHiexhDhwEe+myewW+YiRKHHsAqvaVCrUBLv8nK17j
	 QgawaEqGFUmd+v1EUxxpyLi8RxKWpfVQiTyRatUg7Uxfl7HB8ap95qvAgfDVDI3AFyFCH
	 Irv+pKfI+YY5wd6zNeq6lJWUWCK8fjpm9eJkm5RUFQYLoDnSUq8MRSs4CnXuRD6IyvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCD6QF64;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB1C606A32D
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 07:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB1C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCD6QF64
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1830772a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 23:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382812; cv=none;
        d=google.com; s=arc-20260327;
        b=lTta7Co7h+wRGab4euPZWmaVmDgYyUGGvINUpVVXhVSZHUV9YG83QTnYNKtTYlikz3
         QVMM8q5nZN63+CJVpZteTJZDjCtZJ3rOyaOqVkeRALjPHtuFiOCgQuBioiE6wIyXe1E4
         0UzytPU2pJxUjqmcZb4V3iDHJqZbaBQE6PeXHNxPY6fCOgzwJaWYDy+/Tw+A3bZTZ7DT
         eXkWGxyoKhjGDdAwRByWk9ehJOCqMXN0ES1CsZwige6y5i1hJdAbxfOWDc09UNJW5fuH
         9k2R0ZnQgFLOo/N0OVqYnsOg25s98Dv/kp7/mGLreCOo06NI+dvjW2H/5bTe4Uzi91Pg
         cc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        fh=GThxozOZ3jvc3+hZkYvkZpvwNCTIH41Axe2QGQGZJJQ=;
        b=EIDfUJjguUGbeuOeg/an/rbY2/eBuIAmkSxt1VuQyOs+OOhYMh/90FRp4m+OwscBf0
         2XBugx+dsIZ+dVKdKa22j2I2n0tvWYRQc3siM9BL3PJ4f2WECmnLAQ8cXYuljT9S1rzv
         ilUykrPXb7tCW4reAUbwlHeRLX9TIGUan5FkLtkxDgTFfwFheOqqI9AuxkymR3Ifhef3
         pv4YgSiOfe5Xahq0OJqM+NQ+7O5Odz7ilJ8XngqZYa4IVOYYuv5vLz5S1YJw3tpr2pzb
         H9LP0EfPtrgf14f8wowBDDiDxrYI8vF9U6WngL+O7BHoW3/NwvAtl3mGRSbxW9T53j8D
         XhKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382812; x=1794987612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=VCD6QF64cq+6EajKVeH2KGvi/U5cBgOq2QaZUPujN9TUpScC8tW0bSWQt0oDUSy4JW
         S6Z8D6nWlIJvYo0C12W4DfrOkGdol86fJwYUUTyy4O1KRs5ZZZUMVLH5TcN2PkElzTMC
         CDPcO/9EjC2evHTSCepGDSbwuoSelf7KCGcOupsWhHmqIXstiHNkS+oNFTvRiDsE9USX
         LiWsrb9RYjjdGp3t/FMvX1MXOCXDbkNCM98PDcj50ceTD5evbGSrKBzvVmJsknTflsiz
         goYBb6lxDQzfivXfrbKsifTYJfLVgLYCutTWcyI9Jo7kHyPrf094IrOod562TSGGHij3
         JFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382812; x=1794987612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=L8tFDqbSegyilwwDFVJHr0oYxctUKPE7bpg+x7ogQZ7Uh3SdIIsF8b4NtpLZRmoV8Q
         ybG6soqrbYQR6fwjskNFSub7MdVV3WmGG90+A0ItkKBFng7cl3Bg2U3yqr+aPdcHuAJX
         0feJtMcjKdpMsbSGop+bIbsV7X8JpN6hZrJJb8zE1SO4sW7HRwhoR4GHGyTgUWHEyBb8
         cnFMGyGoYkQxUrSkSNO5rw+PrZ9jLNZpuxTAH4C2fjfN2Pm/paDlHynI5GCAmI5JzK0r
         0JVhP9U91Ep/N6py0X3gxkxC61WDdtVGHv4X+SQhBzY8T2zRfUb/RE9wy8ts570/jvnQ
         e1vw==
X-Forwarded-Encrypted: i=1; AL+hErFeaZTJxXtvPBET1xGWOcujM1tm1PKTxzzEEz203cInLPFWF4GP2bnoeSyuY8222cSmvJLpWMP1TRqXtU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gRgny7pkrOLswXRY6mdA8ZZwmhb90GehXoxD24YoUa+we9BHN
	H8xgbeuwbx0BSuzfPDf4vtpG/p5N5Z/CtLWCho2YiloIcXfLjPQlTM9Pw2oTvjNwS4xJu99Ocs3
	5cGK4adTO6gKZ3Nebs08Gbbt4YG2w+Pk=
X-Gm-Gg: AYBFou2HpylNm9RyUIOcuGnoq6aNiFIRN2ORHhJ4B5kH7t4HkzAFiPv5+Jtx2u1Xwy8
	J5fM/lhsoFJFB2EdirTPNhaJU9uxddWdftrHEr3f6JniCrWT6N6C218koy/4/e814nazx4PUIWb
	zbcRpKOum+4Osq9C/8cBEPMiybR0LNgwX7blVZd00O13lqC16Hx+VOra8+HdL/7BYoy1YFsmLtZ
	jCp1LnMqaoTM1WOCvrYWhQbptauKfYplk5dQqMfmNHZbEXipUBpsfVSgKp2F9IrWO7mo1Eg+UMz
	dPFF1jpYGMQcHPqs4j4eFnswosyOksmupJpgF8VZ07IpmHhe75xH9H/BSg4u1fAiGAiD6pnLb82
	NikBXzTef1/7GWlVPyGlram0+fFT83vzMmP/Y6SUivjESOJm4wv4yWbZGQYI+ckp4NXnguQ==
X-Received: by 2002:a05:6402:a614:b0:6b4:2aa6:2bf7 with SMTP id
 4fb4d7f45d1cf-6b7773fba00mr814626a12.17.1794382812113; Tue, 10 Nov 2026
 23:40:12 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:40:00 +0100
X-Gm-Features: AclHuK-efo-IN8C0PeBM3H51GRM-qrC5WxHB8slQK0l-tYnt6GeST1OC-lb_0Yw
Message-ID: <CA+=Fv5RNznnVyh4AM_ZTdwyK4iv-8TEO5Ejx0_81sf5CTeoGgw@mail.gmail.com>
Subject: Re: [PATCH v9 10/15] alpha: Define entry point for
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

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
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
> Acked-by: Magnus Lindholm <linmag7@gmail.com>
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
> 2.56.0
>

My Acked-by already in this patch still stands.

I tested the series against my Alpha for-next, with the integration
adjustments described in my replies to patches 11 and 12. Full GENERIC
SMP and DP264 UP builds passed.

The generated dispatch table changes syscall 560 to
sys_set_mempolicy_home_node as intended. Alpha has no NUMA support,
so this still resolves to the sys_ni_syscall fallback.

Thanks,
Magnus
