Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:65499 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751010AbdECEtk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 May 2017 00:49:40 -0400
MIME-Version: 1.0
In-Reply-To: <20170430161600.15845-1-rabin@rab.in>
References: <20170430161600.15845-1-rabin@rab.in>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 3 May 2017 13:49:29 +0900
Message-ID: <CAK7LNAQ8SeXevJqwp+qXpTPdSEDV-p=aFjDP2GP_vfgr3wCHiQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: evaluate LDFLAGS_BUILD_ID only once
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rabin Vincent <rabin@rab.in>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-05-01 1:16 GMT+09:00 Rabin Vincent <rabin@rab.in>:
> Evaluate LDFLAGS_BUILD_ID (which involves invoking the compiler) only
> once instead of over and over.
>
> This provides a ~20% reduction in null build time with x86 allnoconfig:
>
> $ make allnoconfig && make -j8
> $ perf stat -r5 -e sched:sched_process_exec make -j8
> -       2 119      sched:sched_process_exec
> +       1 878      sched:sched_process_exec
>
> -       1,238817018 seconds time elapsed
> +       0,971020553 seconds time elapsed
>
> Signed-off-by: Rabin Vincent <rabin@rab.in>


Applied to linux-kbuild/kbuild.  Thanks!


-- 
Best Regards
Masahiro Yamada
