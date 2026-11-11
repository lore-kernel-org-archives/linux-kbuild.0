Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794383492;
	b=ZLtDkI5Es/Pz0oeQaSI5Jk4cNBbgW3UNkXNb0ThTX+dyYwH6/25exIhqhzhB8Lohu6wO
	 ocOUstaZlFxp+KSUvQ5DpYcb/LsWMZkFZufsQBVQRxYRd+6FNza0MWS47YGg+Il/nCd/1
	 2Ph0m0TB1goUWSM7Ns0nmDAqalxS33sf5uW4x48SZWtXje76OurQjzOYmhir9B8+FGeF4
	 QtvbW8q8a6hhb3bLAERttySE8H4rDbubsrkaa49auKu2Xh08bdaR5u2SFIaB8xHQ8J2lK
	 qUCk6u8IYdp7oNeP9aq6cel8w6kkWtGle1FmRlm0JJN+NP4c747EAZYW2BQhiQuZmsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
	b=ZY+H/M6+2rPmJlpoeOjYjk9TUvH7E3S5U6V+2SJfgH2Kee2QSmQchzLOVJ1uVWsLs172
	 y81eFuVybHdpqk3mmXzKACbkO87/8uBovPWgx4yLS98TrOOYfu0JuJVfLbQmwr1cDEllE
	 CFp0iXVa+Wfqv11ZixBqGlUaxgNUZUjHlW/26LSduKVODg+ZQe+voGW15ZaPEE8YB67Tz
	 CoU4FTcZrFrPDHYF3909+Qhie3hQemwlCMiQFkMdBpABPh/3jxsYT1DeAiGnWCswJbPAh
	 JYSbrQmtymUeQOW+4k+I5P7wu16FbLsh0HCcLC405AEPDQSF1oW2tHcmBs3RmAvmxmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=md4l3zAY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39606606A324
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 07:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39606606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=md4l3zAY
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d21051042so449899466b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 23:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794383490; cv=none;
        d=google.com; s=arc-20260327;
        b=moiBowhDNbMhTkqHlSxgG0zJquLc5ld9XFODnWABh6YfBHoo/rnn4FD63SqJTwYt2d
         PGSQPgVchMGiGrlB0K9qSLnX70LkxlkpO68o4XbiOImBKd3HzjOKCJfU/wielPdh4Zmi
         vjyVGDC/7m2haVO1gEgIA5Fmcf9QF8a0adfwrA3HXEDc1beICgqLdxkk+ZKSKghkE+7Y
         Sj0qlY0c3T5egf4ThjgJsvb117K6W2o8XdJFx0q/U4YFzmn3FG5XCBHxJuewCJ2R04PE
         abw9PGUcATnm9OlWBM3W0ro+icAL7L7YmHW0fGK9Aexk/YO/y0Wu1UmLbfAkx7dgLFyA
         rGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        fh=2Ln8kKC9ElGrSSU92/imcUm5pL5gJNlHBAtIK/j0Yek=;
        b=POgzkvwlb/oMGBuCCE97C8uqm9qE54VAqg2WVzxPTLg8Vf7BIFf1SPVoX1pctnXqy/
         9ZfyqIM8L0/I9/0BFwNei7aWlewqs3D5ZEZo65sOe8hS2DVFMhJvzxFXkjPHb5h4dmMQ
         PsWVLRizhz5on8CqYJCTq3oibXqjwqaqdEyC70x33fjQgQIz+czfNnlGDUZ/ZM/o4TNr
         Eg47yv7ZHFWKo7OrSG9LNuuk6HiPGupeUkpKCUJ+Dgbsg6FwmcDOtyEsGcludgjH211a
         QJV0H5nOOXRvxxg5mG7gZJfSaWEkrr66st2bzzH9wRXJ+p6cTmbztE19eqDplRBUXH4p
         P++Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794383490; x=1794988290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        b=md4l3zAYv1zu9HhijK+oX3dpDB6YUSeOKHdEMKTuN7pX+J0HNpZQaAtuo3AKBkgH7s
         Xol8EfdG076x931RcDKNcJMSnMJqRR9zy2fns0x48pWylIn+nzYcFB3mqKrdNbi2xkgq
         W9FOovP9uE8OulDKq2Mr+k7s0oo6YxvtxoWjuUd8CwzVieGl9R+IqZ8ZhCK4zSe9dF7B
         vQpHxeF2Vo9uDifi6j0iiemE6/GzaxofZXrrz2bF5g9h7P/Bww+w1X27r7PK9XQa35eh
         70AF3W71JWv7eNXpZwiksuer5G6PZ1mIkog11t93J4zqczq1jX+HjywgfOx+nUnWwkf8
         bVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383490; x=1794988290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        b=i3q7tASHdY13QdkzW6cFvyPnnh3lNZfIJfhyE+GPhEQB1O7VJy12Xn9VhsV2o32N+h
         aKl64dg5EtHwnP5S/SBswGJCxThkM3/5n6lHYAR6qbIh99Y6MbM608WYNRpQUB9JtF5G
         zdI1KIO7dQU1lmsLU60xYXEKAZ3ETYTq7p2R+NFEmwxSOcQyC0EkLG7wccgUC3P7Xm0v
         EF2ugIBKrn48gjjVmCbZV8/A+kQj3ptgvAK0KkcNY/39STHkYoC9/XNXHGdUg8W6sKJi
         heE7x7rQE5SSM+gjGFFKg6iWiO23L99gcToYqT+Rw7OhSbOjtx1j3+m9Af+N5n/AFJhe
         npTA==
X-Forwarded-Encrypted: i=1; AL+hErG9ioHXvCFVycBWtAwFWIB1tfwK4pbgcArCKB9IKFEZQJYBpNefxV4qpleaI66+LyhU0lMYNI8VZGY7kKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YdIWu5gKnq8YLPE5md5xUMWrgQWK3TNmoODvmqt06XTND/2xL
	Qm0croAKA56t+o6BScKxCW/31hAcHuAdRdhYwOtPfqWR/qXrl5aWLzz2phbAtwSo3aKpzhQABuT
	bOuH2Xrtr90EUUJqblSeHs2CcAd5wFhw=
X-Gm-Gg: AYBFou0kDWxoYEtHpsc+kdcK6fCn3aWTt4+myVX+rN9LRnkBlAhZon4bkpgCvWn9L7E
	LjfmHK0Tckwizni/mSxOBiMJVM0Irzv5mageLch0aRjQE1644VWLYvVqjj9R5PZfidhpgQD5e2F
	Yv0qLq1My6qRVrMqpsXJw6ZBUcs2VfhDh641zEPsYB7tLO0mztyhQSF/Fn+cVC18krOhnXAdxO6
	kUra5qfcg7JbL4+WtbxjhlbXTfIzCBNlNwviI+lUYvV4V1Jw66MO3JCHDfzy7L7xCRi+E6X8gcd
	oUERwofSbMB3LIvsd4PlGUV858k1/U6anSnPIntrW67a1v+aUfb7R21X31ToVGp8fj/Lj1fJJ8d
	IdTLhDG1FHdsRlcP8YBrI6qG3JZnrwEjXjN/Dzrt6dAYyGh5a1OLj+SysaceFLfkq71C8iw==
X-Received: by 2002:a17:906:f596:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c5066d0bb14mr114825966b.43.1794383490428; Tue, 10 Nov 2026
 23:51:30 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-12-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-12-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:51:18 +0100
X-Gm-Features: AclHuK9CC8htHdABEClpUnIw4kUNRCRbcWaYA_peZjxEX-MI6234hqDvVucRruU
Message-ID: <CA+=Fv5QBnNipJH5SKKV0iiPc1CQz+6f8dGzsRoKt1riMNxxOOg@mail.gmail.com>
Subject: Re: [PATCH v9 12/15] alpha: Use the common syscall table
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

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Remove some of the duplicated code by using the common syscall number
> table.
>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/Makefile    | 14 +++++++---
>  arch/alpha/kernel/syscalls/syscall.tbl | 49 ----------------------------=
------
>  arch/alpha/kernel/systbls.S            |  1 +
>  3 files changed, 11 insertions(+), 53 deletions(-)
>
> diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/sysc=
alls/Makefile
> index b265e4bc16c2..03099daff6b9 100644
> --- a/arch/alpha/kernel/syscalls/Makefile
> +++ b/arch/alpha/kernel/syscalls/Makefile
> @@ -7,17 +7,23 @@ $(shell mkdir -p $(uapi) $(kapi))
>  syscall :=3D $(src)/syscall.tbl
>  syshdr :=3D $(srctree)/scripts/syscallhdr.sh
>  systbl :=3D $(srctree)/scripts/syscalltbl.sh
> +systbl_common :=3D $(srctree)/scripts/syscall_common.tbl
> +abis :=3D common,__clone3
>
>  quiet_cmd_syshdr =3D SYSHDR  $@
> -      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
> +      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
>  quiet_cmd_systbl =3D SYSTBL  $@
> -      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) $< $@
> +      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
> -$(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
> +$(uapi)/unistd_32.h: $(syscall) $(systbl_common) $(syshdr) FORCE
>         $(call if_changed,syshdr)
>
> -$(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
> +$(kapi)/syscall_table.h: $(syscall) $(systbl_common) $(systbl) FORCE
>         $(call if_changed,systbl)
>
>  uapisyshdr-y           +=3D unistd_32.h
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 59eb066a40bf..7066a3920899 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -463,52 +463,3 @@
>  532    common  getppid                         sys_getppid
>  # all other architectures have common numbers for new syscall, alpha
>  # is the exception.
> -534    common  pidfd_send_signal               sys_pidfd_send_signal
> -535    common  io_uring_setup                  sys_io_uring_setup
> -536    common  io_uring_enter                  sys_io_uring_enter
> -537    common  io_uring_register               sys_io_uring_register
> -538    common  open_tree                       sys_open_tree
> -539    common  move_mount                      sys_move_mount
> -540    common  fsopen                          sys_fsopen
> -541    common  fsconfig                        sys_fsconfig
> -542    common  fsmount                         sys_fsmount
> -543    common  fspick                          sys_fspick
> -544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          __sys__clone3
> -546    common  close_range                     sys_close_range
> -547    common  openat2                         sys_openat2
> -548    common  pidfd_getfd                     sys_pidfd_getfd
> -549    common  faccessat2                      sys_faccessat2
> -550    common  process_madvise                 sys_process_madvise
> -551    common  epoll_pwait2                    sys_epoll_pwait2
> -552    common  mount_setattr                   sys_mount_setattr
> -553    common  quotactl_fd                     sys_quotactl_fd
> -554    common  landlock_create_ruleset         sys_landlock_create_rules=
et
> -555    common  landlock_add_rule               sys_landlock_add_rule
> -556    common  landlock_restrict_self          sys_landlock_restrict_sel=
f
> -# 557 reserved for memfd_secret
> -558    common  process_mrelease                sys_process_mrelease
> -559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
> -561    common  cachestat                       sys_cachestat
> -562    common  fchmodat2                       sys_fchmodat2
> -563    common  map_shadow_stack                sys_map_shadow_stack
> -564    common  futex_wake                      sys_futex_wake
> -565    common  futex_wait                      sys_futex_wait
> -566    common  futex_requeue                   sys_futex_requeue
> -567    common  statmount                       sys_statmount
> -568    common  listmount                       sys_listmount
> -569    common  lsm_get_self_attr               sys_lsm_get_self_attr
> -570    common  lsm_set_self_attr               sys_lsm_set_self_attr
> -571    common  lsm_list_modules                sys_lsm_list_modules
> -572    common  mseal                           sys_mseal
> -573    common  setxattrat                      sys_setxattrat
> -574    common  getxattrat                      sys_getxattrat
> -575    common  listxattrat                     sys_listxattrat
> -576    common  removexattrat                   sys_removexattrat
> -577    common  open_tree_attr                  sys_open_tree_attr
> -578    common  file_getattr                    sys_file_getattr
> -579    common  file_setattr                    sys_file_setattr
> -580    common  listns                          sys_listns
> -581    common  rseq_slice_yield                sys_rseq_slice_yield
> -582    common  fchroot                         sys_fchroot
> diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
> index 68f3e4f329eb..9a67d29f7818 100644
> --- a/arch/alpha/kernel/systbls.S
> +++ b/arch/alpha/kernel/systbls.S
> @@ -7,6 +7,7 @@
>
>  #include <asm/unistd.h>
>
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, n=
ative)
>  #define __SYSCALL(nr, entry) .quad entry
>         .data
>         .align 3
>
> --
> 2.56.0
>

This also needs an adjustment when combined with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Following d38895ba9330 ("alpha: dispatch system calls from C"), Alpha
uses sys_clone3 directly. The ABI selection should therefore be:

  abis :=3D common,clone3

rather than common,__clone3. The removal of the old table entries
also conflicts because the clone3 entry has changed.

For testing, I skipped patch 11, removed the entries from 534 onward
as intended here, and selected common,clone3.

With those adjustments, full GENERIC SMP and DP264 UP builds passed
using GCC 14.2.1. The generated syscall numbers are unchanged.
Comparing the native dispatch entries shows only patch 10's intended
change at syscall 560; clone3 remains sys_clone3.

The only build warning was the previously observed saved_config
COMMON-symbol warning. I have not runtime-tested this combination.

Thanks,
Magnus
