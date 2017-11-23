Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:51278 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752991AbdKWOVH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Nov 2017 09:21:07 -0500
MIME-Version: 1.0
In-Reply-To: <1510737560-12643-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510737560-12643-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Nov 2017 23:20:02 +0900
Message-ID: <CAK7LNATygeZJBSYCsYA+T-q+DpsHTomehmWT9L9gfgGORhoOVg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm: prompt to use "rpm-pkg" if "rpm" target is used
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-15 18:19 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The "rpm" has been kept for backward compatibility since pre-git era.
> I am planning to remove it after the Linux 4.18 release.  Annouce the
> end of the support, prompting to use "rpm-pkg" instead.
>
> If you use "rpm", it will work like "rpm-pkg", but warning messages
> will be displayed as follows:
>
>   WARNING: "rpm" target will be removed after Linux 4.18
>            Please use "rpm-pkg" instead.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild.



-- 
Best Regards
Masahiro Yamada
