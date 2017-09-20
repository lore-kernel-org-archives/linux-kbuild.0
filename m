Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33022 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751499AbdITPya (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 11:54:30 -0400
MIME-Version: 1.0
In-Reply-To: <1505725956-11012-1-git-send-email-yamada.masahiro@socionext.com>
References: <1505725956-11012-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 21 Sep 2017 00:53:27 +0900
Message-ID: <CAK7LNARcdC5E1jciNjgyDYCwoz5eUBv+Karh6ivkh=yH6KrQKA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: delete firmware_install to fix build error
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Markus Trippelsdorf <markus@trippelsdorf.de>, Greg K-H <gregkh@linuxfoundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-09-18 18:12 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Commit 5620a0d1aacd ("firmware: delete in-kernel firmware") deleted
> in-kernel firmware support, including "make firmware_install".
>
> Since then, "make rpm-pkg" / "make binrpm-pkg" fails to build with
> the error:
>
>   make[2]: *** No rule to make target `firmware_install'.  Stop.
>
> Commit df85b2d767aa ("firmware: Restore support for built-in firmware")
> restored the build infrastructure for CONFIG_EXTRA_FIRMWARE, but this
> is out of the scope of "make firmware_install".  So, the right thing to
> do is to kill the use of "make firmware_install".
>
> Fixes: 5620a0d1aacd ("firmware: delete in-kernel firmware")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/fixes.


-- 
Best Regards
Masahiro Yamada
