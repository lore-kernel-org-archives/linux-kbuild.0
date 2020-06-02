Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:58939 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgFBOnV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Jun 2020 10:43:21 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 052Eh31q014219
        for <linux-kbuild@vger.kernel.org>; Tue, 2 Jun 2020 23:43:04 +0900
Received: by mail-ua1-f50.google.com with SMTP id a10so1324818uan.8
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2020 07:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
 <1591083917-63371-1-git-send-email-ashimida@linux.alibaba.com>
In-Reply-To: <1591083917-63371-1-git-send-email-ashimida@linux.alibaba.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 2 Jun 2020 23:42:26 +0900
Message-ID: <CAK7LNASLZ4t1=5pDBMvTNryQf_1=-1GASA=unk8asumUDEzsoQ@mail.gmail.com>
Subject: Re: [PATCH v2] mksysmap: Fix the mismatch of '.L' symbols in System.map
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ashimida <ashimida@linux.alibaba.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Jun 2, 2020 at 4:45 PM ashimida <ashimida@linux.alibaba.com> wrote:
>
> When System.map was generated, the kernel used mksysmap to
> filter the kernel symbols, but all the symbols with the
> second letter 'L' in the kernel were filtered out, not just
> the symbols starting with 'dot + L'.
>
> For example:
> ashimida@ubuntu:~/linux$ cat System.map |grep ' .L'
> ashimida@ubuntu:~/linux$ nm -n vmlinux |grep ' .L'
> ffff0000088028e0 t bLength_show
> ......
> ffff0000092e0408 b PLLP_OUTC_lock
> ffff0000092e0410 b PLLP_OUTA_lock
>
> In the original patch[1], the original intent should
> be to filter out all local symbols starting with '.L',
> so the dot should be escaped.
>
> [1]. mksysmap: Add h8300 local symbol pattern
>
> Signed-off-by: ashimida <ashimida@linux.alibaba.com>
> ---

Applied to linux-kbuild. Thanks.






-- 
Best Regards
Masahiro Yamada
