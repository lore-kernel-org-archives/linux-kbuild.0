Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:46344 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751900AbdJLJl4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Oct 2017 05:41:56 -0400
MIME-Version: 1.0
In-Reply-To: <1507800569-30134-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507800569-30134-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Oct 2017 18:41:05 +0900
Message-ID: <CAK7LNAQBpTK2m0Gwo+hhqULrfs0qLJwGZpe7GxwiHZBv--39Vw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: shrink Makefile cache when it exceeds 1000 lines
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

2017-10-12 18:29 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:

>
> +nr_cache := $(words $(filter __cached_%, $(.VARIABLES)))
> +
> +# Strip the last digit.  Covert as follows:

I meant "Convert".


> +#    0   ->
> +#    123 -> 12




-- 
Best Regards
Masahiro Yamada
