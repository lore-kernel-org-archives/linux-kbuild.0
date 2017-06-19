Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:35838 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750761AbdFSNuk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jun 2017 09:50:40 -0400
MIME-Version: 1.0
In-Reply-To: <20170612082317.20407-1-net147@gmail.com>
References: <20170612082317.20407-1-net147@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Jun 2017 22:50:21 +0900
Message-ID: <CAK7LNAQtrUx_S8=fB_810HC0b0NOuwaAN773M3LwmtE0S=RTBQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/mkcompile_h: Remove trailing spaces from compiler version
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Liu <net147@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-06-12 17:23 GMT+09:00 Jonathan Liu <net147@gmail.com>:
> Improves the output of "cat /proc/version" by getting rid of the
> trailing space at the end of the compiler version when the kernel
> is compiled using GCC.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---

Applied to linux-kbuild/misc.  Thanks!

-- 
Best Regards
Masahiro Yamada
