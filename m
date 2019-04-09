Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:62053 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfDINrH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Apr 2019 09:47:07 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x39DkpPb017438
        for <linux-kbuild@vger.kernel.org>; Tue, 9 Apr 2019 22:46:52 +0900
Received: by mail-ua1-f54.google.com with SMTP id b8so5500851uaq.7
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2019 06:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190407230909.20668-1-pvorel@suse.cz>
In-Reply-To: <20190407230909.20668-1-pvorel@suse.cz>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Apr 2019 22:46:15 +0900
Message-ID: <CAK7LNARZEDRbs=fQXdRbgSiJtzKXRCLTE7jw7X69o-iVrWfcSw@mail.gmail.com>
Subject: Re: [PATCH 1/1] kconfig: Make nconf-cfg.sh executable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Mon, Apr 8, 2019 at 8:09 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Although it's not required for the build *conf-cfg.sh scripts to be
> executable (they're run by CONFIG_SHELL), let's be consistent with other
> scripts.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Applied to linux-kbuild/kconfig.
Thanks.


> ---
>  scripts/kconfig/nconf-cfg.sh | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 scripts/kconfig/nconf-cfg.sh
>
> diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
> old mode 100644
> new mode 100755
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
