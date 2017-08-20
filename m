Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20093 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752843AbdHTMzz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Aug 2017 08:55:55 -0400
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com [209.85.161.173]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id v7KCtgPA027603
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Aug 2017 21:55:42 +0900
Received: by mail-yw0-f173.google.com with SMTP id s143so79435835ywg.1
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Aug 2017 05:55:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170819213002.GI18698@decadent.org.uk>
References: <20170819213002.GI18698@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 20 Aug 2017 21:55:01 +0900
Message-ID: <CAK7LNARU=mLDYD+kU7K_+cKLOmN4zpb1ybM650igAJ=JDqPz4Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Do not use hyphen in exported variable name
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

2017-08-20 6:30 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> This definition in Makefile.dtbinst:
>
>     export dtbinst-root ?= $(obj)
>
> should define and export dtbinst-root when handling the root dts
> directory, and do nothing in the subdirectories.  However some shells,
> including dash, will not pass through environment variables whose name
> includes a hyphen.  Usually GNU make does not use a shell to recurse,
> but if e.g. $(srctree) contains '~' it will use a shell here.
>
> Rename the variable to dtbinst_root.
>
> References: https://bugs.debian.org/833561
> Fixes: 323a028d39cdi ("dts, kbuild: Implement support for dtb vendor subdirs")
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
> v2: Revised the commit message to explain exactly how the hyphenated
> variable can be lost.
>

Thanks for figuring out the root cause!

Applied to linux-kbuild/fixes.

-- 
Best Regards
Masahiro Yamada
