Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:41494 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752000AbdGRSjC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Jul 2017 14:39:02 -0400
MIME-Version: 1.0
In-Reply-To: <20170630225822.25349-1-sboyd@codeaurora.org>
References: <20170630225822.25349-1-sboyd@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Jul 2017 03:38:57 +0900
Message-ID: <CAK7LNAQgv5s8-2fo+qV9a29Fyj0m1nKA1WZzoJpYzhP6NAZ8wg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: modpost: Warn about references from rodata to
 __init text
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>

2017-07-01 7:58 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> If we have a structure that's marked const it will be placed
> into the .rodata section but it could reference an init section
> function. Include the read only data section in the check we have
> for read/write data sections referencing init sections so we can
> find this class of problems. This exposes quite a few places
> where const marked structures are referencing __init functions and
> __init data that we were previously ignoring.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>
> Making this change leads to quite a few other errors even on the
> multi_v7_defconfig for ARM[1]. I still need to do a build of the
> allmodconfig to see how many other errors there, but it seems to
> be quite a few. I suppose those will need to be fixed before we can
> merge this?
>
> [1] https://www.irccloud.com/pastebin/zzqfWGQY/

Applied to linux-kbuild/misc.  Thanks!

Now people will notice the warnings in linux-next,
and will start fixing drivers.
We still have plenty of time until the next merge windows.  :-)

-- 
Best Regards
Masahiro Yamada
