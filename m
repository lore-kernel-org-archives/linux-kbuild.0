Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:64850 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750936AbdIBE4X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Sep 2017 00:56:23 -0400
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com [209.85.161.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id v824tvVn016130
        for <linux-kbuild@vger.kernel.org>; Sat, 2 Sep 2017 13:55:58 +0900
Received: by mail-yw0-f169.google.com with SMTP id t188so8731097ywb.1
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Sep 2017 21:55:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170818222052.22375-1-nicolasporcel06@gmail.com>
References: <20170818222052.22375-1-nicolasporcel06@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 2 Sep 2017 13:55:16 +0900
Message-ID: <CAK7LNATkVJXFGYLxEjHo3o43BFULJ7ZvMFCvMcCKT+Z=js17Bg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve KCONFIG_CONFIG use in kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Porcel <nicolasporcel06@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-08-19 7:20 GMT+09:00 Nicolas Porcel <nicolasporcel06@gmail.com>:
> This patch series will improve the use of KCONFIG_CONFIG in order to perform
> out of tree kernel configuration. This is useful when the kernel source is not
> on a writable directory.
>
> Nicolas Porcel (2):
>   kconfig: Use KCONFIG_CONFIG in buildtar
>   kconfig: support out of tree KCONFIG_CONFIG
>

I do not get it.

We are supposed to use O=path/to/build/dir
(or KBUILD_OUTPUT).

Even if you patch the location of .config,
you can not put object files to the read-only kernel source.


-- 
Best Regards
Masahiro Yamada
