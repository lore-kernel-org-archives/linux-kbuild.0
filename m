Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:48353 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750852AbdCNQ3E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Mar 2017 12:29:04 -0400
MIME-Version: 1.0
In-Reply-To: <1485093752-16470-1-git-send-email-yamada.masahiro@socionext.com>
References: <1485093752-16470-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 15 Mar 2017 01:28:55 +0900
Message-ID: <CAK7LNAT3XH7TyfKfG9hQ1tq0=1gVmpYQpJNLDCQtibr52d1_Bw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop unneeded patterns '.*.orig' and '.*.rej'
 from distclean
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-01-22 23:02 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The patterns '.*.orig' and '.*.rej' are cleaned away by '*.orig' and
> '*.rej' seen two lines above.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to linux-kbuild/kbuild.




-- 
Best Regards
Masahiro Yamada
