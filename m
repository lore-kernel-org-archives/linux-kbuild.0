Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:52953 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933037AbeB1P15 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Feb 2018 10:27:57 -0500
MIME-Version: 1.0
In-Reply-To: <1519776926-30459-1-git-send-email-yamada.masahiro@socionext.com>
References: <1519776926-30459-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 1 Mar 2018 00:27:01 +0900
Message-ID: <CAK7LNAS-gLVSY9UU79Fee7MRJgh0LkvixsWehkjDiT4zu47now@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] kconfig: some clean-ups and rename silentoldconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Marc Herbert <marc.herbert@intel.com>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2018-02-28 9:15 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Masahiro Yamada (6):
>   kconfig: do not call check_conf() for olddefconfig
>   kconfig: remove unneeded input_mode test in conf()
>   kconfig: remove redundant input_mode test for check_conf() loop
>   kconfig: hide irrelevant sub-menus for oldconfig
>   kconfig: invoke oldconfig instead of silentoldconfig from local*config
>   kconfig: rename silentoldconfig to syncconfig
>
>  Documentation/kbuild/kconfig.txt |  2 +-
>  Makefile                         |  2 +-
>  scripts/kconfig/Makefile         |  8 ++++----
>  scripts/kconfig/conf.c           | 41 ++++++++++++++++++++--------------------
>  4 files changed, 27 insertions(+), 26 deletions(-)
>
> --


1-4 applied to linux-kbuild/kconfig
because they are re-post.

I will re-spin 5 and 6 as commented.


-- 
Best Regards
Masahiro Yamada
