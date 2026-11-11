Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382999;
	b=JEUysz/I0BvQhdDL4XUSabQXUyA7sWyPrKHRRcZZCemh7sB6a1mrQWOa6elKO1YkVije
	 /h6ZHBnNqKCkFLBMb8QTDB/lRnMwspXtr4Ille+mLwfDa9vE5R7RiXGkA96LA8pbLqZHa
	 RSYaJKe624/39y8asH2IaDIvllBTGOt+XpHYyqG6m3mS3LOR8zDvwb/BOQqCTW9UG70Ic
	 bllrwPyYw7Vt5NAsWB/7T0YQPTaqTVyGrMxfXNePaZD/lJsGxgLWStm9wchaO3Opj+aPV
	 XNq8sMZSiDlmHpzHfpRfsgHxSTkPa+xfl2+He2W5xhC5+P8aLecLUmIvVLezhStIkug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
	b=l+iRiUx1uwsnN3748Bfe1XxcLj59H5nRk/zGo0ffPjG3wt3mxNIwq9HJKXZ3Aec9OKoy
	 t0Y40mKzx9l1JZ9+SqfuGQ+6CV0BfMQjJH96aVqQ9CQXhPzDOvVvgdezK6tKjtH9EtPl/
	 DrSjZ3/KHdEJiROnu0+845e4dGKnEIL2EsAlZ6mUhCSJXZ2SwwOpY/6h+/LTY2LjOLWg1
	 HLdh7DdG31L/YlfY7ydkbxaqtSHqbPfQeujUJbgPavkY07VoHkId2S+7ZRQix6RHNgfyu
	 BpvPIORcLYTpzPJvFyVNvzykr5YA//jFj0yWh0Y5nje5+/PQemO0rb+DKJDjrAddqJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5NQKG5D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3E606A33E
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 07:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC3E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5NQKG5D
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1726598a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 23:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382997; cv=none;
        d=google.com; s=arc-20260327;
        b=cfL44jLn/TBrUODrIef2qFfAE3EFlprtzkYK3N4hQaVElPHs5JaGcLOl2nvHvyVZr9
         TUtNMH5bIl9Y4IhZo9rVssSCz27P2SJg46YwRYdZkyrPzI2nTFHclvx9iP5EBRgfu5ui
         ZjuVv7HCeEwfVxXr1sJ2VNW9eIk9XC3+rc/rjFPgsxH1+1AR/3Bnx8MwHPfj7L74FIHT
         EHyVIHb9A2m4kbY9KvYTUQNV1wu1m5JjF3i8Pr/7yCdBw7Eww3nm9KG942EimVDLJoRO
         hFHvstMeCAvwF3oQBKboHpOxOIwZ7JeX9m0YMHZ9M7HkkrN/Y27hm60HIZnuyvtvBKt6
         Ajhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        fh=+xt887CoQ218E5F9+GzbIEIfQAFUDi8hPkC4/oCGISY=;
        b=aKxNPTZpurVbiXDJg6DhbUfQJ6TNXWi7CrfV1AQJqmYNZRdnpLQ6da4Hx2sFNRAMT7
         /VsprRxnXs3FBtWjpYwsbXIZ7SLWffwrL/g+PMJRlWzl3lYzPeNkmTJaGcWLZ6elHYR5
         8eXtEHePCQH0/J9+Ja1cJLsEs1Yc4qP+XnOtIPgSdWGITwlwPSNHVG1ixilEN9mig4sm
         xFOh/rTIXUWTp0XFv7ubOL4V12PMVX1kUmg/i8rNi/eDFPdUgQ72ZwVPCloP28pJ1c/6
         N/WVG5jspTRKnZdu+3W9G+FCVeumotzF+dKwkHeWtiiytrrHt4+qcweeJbRzNOXAPt29
         Tb1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382997; x=1794987797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=h5NQKG5DsH5k0QdRiJVJ86KtbHIpBxOZtiNveHnZG/t4JAkAZl11gGqvbZh2gbx+CZ
         U7R2l09uEN9Mz6txyG/VHZJvSvlNiFdQj+V+bgbOtkQgjiNZU0CA5FMY6smQ/+4XBAH3
         TyiknHwqbS9a1ikRyqP2U11AjltnFdJ0aJiSYxxvbDIdddHQa9rv+KTy80xEhAMzl3C+
         bIpY5WP4LhG5OSEIpLn1ynS3EgjFFWznVldcdS2uIAoKSyrP0PX27WalhA9H67xC1xsv
         oVv9D9PpI4KM5wKfG/3AUYQbehBCy8YKKKaBfMQR6O76UfhYBDJ2qQ9F1ZaCwVdZpUw3
         DTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382997; x=1794987797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=K5SUQT6uyXiS/skdDtqgVhSX5u66AYcRFQmk1Pk4vFlkUY0bvym2/+ktEQnWTJQGUi
         zI9wqw6DEhijodsbAmtsL7gNmYViw5pV+lInewkOlbUlRx2qFsz9BLOnv+71py1D2TJv
         5fCA4CXOtok7U5Uz2yYXXUF2dmPSh3UIzGOjpmcAI74etpBwmCnz1xsq3rE28vkadxvp
         lpGPLbkn7E6B3573/Tk0BTWoCRdJ7psm3AF/H+3K8UN98vjj7/wTUkNdcbN8c1/cyzzz
         +PyuBnBy6TXEHgSRSz5WYYwQU3+8FdYQ9/o/r+Oa094SfBJVmuTorQapeeRZN7tOL1YZ
         +6gg==
X-Forwarded-Encrypted: i=1; AL+hErFj1/M+LjSEz3rDIuCaINApxpXADb9DCNWEkpz4k0BEdjdSDbh4d7IKcYL2+n+ie5wOl0+qo//vU8KxH1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f80SEG5CaH9XQNjC0Un19frvjrnzmpw7Y1GxoLdV2bK4gX40u
	TKlcvxhyYAuTB7OpnKEvW6gE+blgAYi7iRBgEfz81sf3Kep6WYl8k4mH/4VEJHZrS5M63Tkrk11
	9pTW0CQI3/6K78s+DZUC/jctUJxlP7UM=
X-Gm-Gg: AYBFou0iqvEVBC+yO5AxgbYs4ECVEluyPJsHk6RuPmo5R91p0SqeUUaCP7C7PqsUoWr
	/oQUZZFoZZ9mpZ7pSb9Vm6JWr/39uEH9aaXZIl6GroSDRvspVXSGPA984jSxcdtCJvz6HluDJ05
	q0gA1duQSguN3el6WZkBV9mhc1sdBtbpgXpPP13fkPtnR4p6/cPQhSnLtrw41zUnJU4eemBCHMX
	DRBEBQARVods/9OzbSRlKRINanBgGAdu7yI1VcpLPVr75q0L9y4F/B1vHXrvn94tKbJJKh4eTEi
	K74qMVRBn17apJCFqC0diA8dM+YGslyT4iruxcHIwg1CN/o7Q7vwmXRlkHip8G0xt0ParILJCNV
	DW4FdaGTW3dpFnvWGuoHOlXcGW8BwU7ruNbdMRBqLyhfn8cRCQWEsDtc3IglzqSbPvyOC+A==
X-Received: by 2002:aa7:c1c4:0:b0:6b5:90b9:e1f4 with SMTP id
 4fb4d7f45d1cf-6b7773edf4bmr819135a12.15.1794382997169; Tue, 10 Nov 2026
 23:43:17 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:43:04 +0100
X-Gm-Features: AclHuK-WWcZzAuRTugYoSHBXz8aDMS8vLzO87BtuVYEGxCZ10b0uUmgcqCUEPe8
Message-ID: <CA+=Fv5Tm4-DV9KEKxO11ta84EvqigB-KDemhOML1hx9zoxx0cA@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] alpha: Remove alpha_ prefix from custom syscall entries
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

On Thu, Nov 5, 2026 at 9:26=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Some architectures need special entry points for some syscalls (like
> clone3). The current approach is, instead of having a special name like
> arch_syscall, to name if as __syscall. This is enough to different the
> common entry point to the architecture specific entry point.
>
> Change alpha special syscall entries to do the same. This makes easier to
> join the syscall tables. Leave alpha_syscall_zero because this syscall on=
ly
> exists in alpha anyway.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> Changes from v7:
> - Fix __clone3 entry
> ---
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 790389a15c3c..25d05f45512d 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -729,9 +729,9 @@ ret_from_kernel_thread:
>
>  .macro fork_like name
>         .align  4
> -       .globl  alpha_\name
> -       .ent    alpha_\name
> -alpha_\name:
> +       .globl  __sys_\name
> +       .ent    __sys_\name
> +__sys_\name:
>         .prologue 0
>         bsr     $1, do_switch_stack
>         // NB: if anyone adds preemption, this block will need to be prot=
ected
> @@ -746,7 +746,7 @@ alpha_\name:
>         ldq     $26, 56($sp)
>         lda     $sp, SWITCH_STACK_SIZE($sp)
>         ret
> -.end   alpha_\name
> +.end   __sys_\name
>  .endm
>
>  fork_like fork
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 8fc4701a6328..59eb066a40bf 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -9,7 +9,7 @@
>  #
>  0      common  osf_syscall                     alpha_syscall_zero
>  1      common  exit                            sys_exit
> -2      common  fork                            alpha_fork
> +2      common  fork                            __sys_fork
>  3      common  read                            sys_read
>  4      common  write                           sys_write
>  5      common  osf_old_open                    sys_ni_syscall
> @@ -72,7 +72,7 @@
>  63     common  getpgrp                         sys_getpgrp
>  64     common  getpagesize                     sys_getpagesize
>  65     common  osf_mremap                      sys_ni_syscall
> -66     common  vfork                           alpha_vfork
> +66     common  vfork                           __sys_vfork
>  67     common  stat                            sys_newstat
>  68     common  lstat                           sys_newlstat
>  69     common  osf_sbrk                        sys_ni_syscall
> @@ -242,7 +242,7 @@
>  309    common  get_kernel_syms                 sys_ni_syscall
>  310    common  syslog                          sys_syslog
>  311    common  reboot                          sys_reboot
> -312    common  clone                           alpha_clone
> +312    common  clone                           __sys_clone
>  313    common  uselib                          sys_uselib
>  314    common  mlock                           sys_mlock
>  315    common  munlock                         sys_munlock
> @@ -474,7 +474,7 @@
>  542    common  fsmount                         sys_fsmount
>  543    common  fspick                          sys_fspick
>  544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          alpha_clone3
> +545    common  clone3                          __sys__clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.56.0
>
>

This conflicts with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Commit d38895ba9330 ("alpha: dispatch system calls from C") removes
the fork_like assembly wrappers and changes the table entries to
sys_fork, sys_vfork, sys_clone and sys_clone3.

Consequently, this rename is no longer needed when integrating your
series on top of that branch. I skipped this patch for my integration
test and retained those existing entries.

My for-next is registered with linux-next, so this is an interaction
we should account for when the trees are combined.

Thanks,
Magnus
