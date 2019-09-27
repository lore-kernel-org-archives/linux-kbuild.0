Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:50376 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfI0PyN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 11:54:13 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x8RFrxZa011551
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Sep 2019 00:54:00 +0900
Received: by mail-vs1-f46.google.com with SMTP id d3so2214968vsr.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 08:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAKYFi-4i-rspPYsYPznjcU+_v02sKEewxFLQuHyx6i11v85UWQ@mail.gmail.com>
In-Reply-To: <CAKYFi-4i-rspPYsYPznjcU+_v02sKEewxFLQuHyx6i11v85UWQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 28 Sep 2019 00:53:22 +0900
Message-ID: <CAK7LNAQ8xu=6PD_Pz8wPrshsTtHprwjQEj7qFoFsq80rc5bDZg@mail.gmail.com>
Subject: Re: scripts/kconfig/nconf.c stuck in infinite loop in search
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: constant override <constantoverride@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Sep 27, 2019 at 2:41 AM constant override
<constantoverride@gmail.com> wrote:
>
> please have a look at the path/solution here:
> https://bugzilla.kernel.org/show_bug.cgi?id=203437#c0
>
> thanks!

Could you send it in a patch form to this ML?


Please add the subject in the form:

kconfig: <one-line description in imperative mood>


Also, one important thing is
to add your Signed-off-by:

For the patch submission rule, you can refer to:

https://github.com/torvalds/linux/blob/master/Documentation/process/submitting-patches.rst



-- 
Best Regards
Masahiro Yamada
