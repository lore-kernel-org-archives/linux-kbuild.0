Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36414 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFBBvg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 21:51:36 -0400
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0521pDHp029563
        for <linux-kbuild@vger.kernel.org>; Tue, 2 Jun 2020 10:51:14 +0900
Received: by mail-vk1-f172.google.com with SMTP id f126so499794vkb.13
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2020 18:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
In-Reply-To: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 2 Jun 2020 10:50:36 +0900
Message-ID: <CAK7LNATDKUbtJPNuFtbBTd2sg3=Fn_E_fq_9VP0oK1BT7mo0KA@mail.gmail.com>
Subject: Re: [PATCH] mksysmap: Fix the mismatch of '.L' symbols in System.map
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: AliOS system security <alios_sys_security@linux.alibaba.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, May 31, 2020 at 7:28 PM AliOS system security
<alios_sys_security@linux.alibaba.com> wrote:
>
> When System.map was generated, the kernel used mksysmap to filter the
> kernel symbols, but all the symbols with the second letter 'L' in the
> kernel were filtered out, not just the symbols starting with 'dot + L'.
>
> For example:
> ashimida@ubuntu:~/linux$ cat System.map |grep ' .L'
> ashimida@ubuntu:~/linux$ nm -n vmlinux |grep ' .L'
> ffff0000088028e0 t bLength_show
> ......
> ffff0000092e0408 b PLLP_OUTC_lock
> ffff0000092e0410 b PLLP_OUTA_lock
>
> I see that in the original patch[1], the original intent should be to
> filter all local symbols starting with '.L', so I wonder if the code
> here may add a '\' before '.L'?
>
> [1]. mksysmap: Add h8300 local symbol pattern
>
> Signed-off-by: AliOS system security <alios_sys_security@linux.alibaba.com>


I think you should submit this patch
with your real name instead of
the team name.




-- 
Best Regards
Masahiro Yamada
