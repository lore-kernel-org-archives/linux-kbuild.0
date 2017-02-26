Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-06.nifty.com ([202.248.20.71]:22049 "EHLO
        condef-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752145AbdBZGYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Feb 2017 01:24:40 -0500
MIME-Version: 1.0
In-Reply-To: <20170216211820.4337-1-stephen.boyd@linaro.org>
References: <20170216211820.4337-1-stephen.boyd@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 26 Feb 2017 15:12:03 +0900
Message-ID: <CAK7LNASCEdHdBxXgEqioTpR3+=oF_xUE_fu1uVYXMfXX4KYHHQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: objdiff: Ignore debug info when comparing
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <stephen.boyd@linaro.org>, Michal Marek <mmarek@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>

Hi.

2017-02-17 6:18 GMT+09:00 Stephen Boyd <stephen.boyd@linaro.org>:
> If the kernel is configured to be built with debug symbols, or
> has bug tables, comparing files may not work if line numbers
> change. This makes comparing object files with these options
> harder to do. Let's strip out the debug info and drop the
> __bug_table here so that we don't see false positives. There may
> be other things to drop later, and it may be architecture
> specific, but this works for me with my ARM64 build.
>
> Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>


Great!

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


BTW, I left Panasonic two years ago,
so the old address yamada.m@jp.panasonic.com
is not working any more.

Please drop the "Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>"
when this patch is applied.


Thanks!



-- 
Best Regards
Masahiro Yamada
