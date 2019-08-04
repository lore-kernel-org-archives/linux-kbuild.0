Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:22281 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfHDDu7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Aug 2019 23:50:59 -0400
MIME-Version: 1.0
References: <CAK7LNASPib2GUgjUEwmNYcO9_NgvjyjKSpqwJVZSNhFOJ7Lkfw@mail.gmail.com>
 <20190803100212.8227-1-m.v.b@runbox.com>
In-Reply-To: <20190803100212.8227-1-m.v.b@runbox.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 4 Aug 2019 12:50:10 +0900
Message-ID: <CAK7LNAS3heQA-0FzANyqXGSOR+kZ6zLgoSWYEW_ngrEdH46QsQ@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: Clear "written" flag to avoid data loss
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc: =?UTF-8?B?Sm9vbmFzIEt5bG3DpGzDpA==?= <joonas.kylmala@iki.fi>, Ulf Magnusson <ulfalizer@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-stable <stable@vger.kernel.org>

On Sat, Aug 3, 2019 at 7:02 PM M. Vefa Bicakci <m.v.b@runbox.com> wrote:
>
> Prior to this commit, starting nconfig, xconfig or gconfig, and saving
> the .config file more than once caused data loss, where a .config file
> that contained only comments would be written to disk starting from the
> second save operation.
>
> This bug manifests itself because the SYMBOL_WRITTEN flag is never
> cleared after the first call to conf_write, and subsequent calls to
> conf_write then skip all of the configuration symbols due to the
> SYMBOL_WRITTEN flag being set.
>
> This commit resolves this issue by clearing the SYMBOL_WRITTEN flag
> from all symbols before conf_write returns.
>
> Fixes: 8e2442a5f86e ("kconfig: fix missing choice values in auto.conf")
> Cc: linux-stable <stable@vger.kernel.org> # 4.19+
> Signed-off-by: M. Vefa Bicakci <m.v.b@runbox.com>


Applied to linux-kbuild/fixes.
Thanks.



-- 
Best Regards
Masahiro Yamada
