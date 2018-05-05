Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:26204 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750971AbeEEKck (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 May 2018 06:32:40 -0400
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com [209.85.217.174]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w45AWM1v000529
        for <linux-kbuild@vger.kernel.org>; Sat, 5 May 2018 19:32:23 +0900
Received: by mail-ua0-f174.google.com with SMTP id h15so15593834uan.11
        for <linux-kbuild@vger.kernel.org>; Sat, 05 May 2018 03:32:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1804161456540.28462@knanqh.ubzr>
References: <nycvar.YSQ.7.76.1804161456540.28462@knanqh.ubzr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 5 May 2018 19:31:41 +0900
Message-ID: <CAK7LNATk2KcnJDaO7V8XEkdeqRi-V6Aoo1gGj-1fQxpcFcJXAw@mail.gmail.com>
Subject: Re: [PATCH] fixdep: suppress consecutive / from file paths in
 dependency list files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-04-17 4:07 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
> Underscores in symbol names are translated into slashes for path names.
> Filesystems treat consecutive slashes as if there was only one, so
> let's do the same in the dependency list for easier grepping, etc.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>


Applied to linux-kbuild. Thanks!






-- 
Best Regards
Masahiro Yamada
