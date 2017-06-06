Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47915 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751192AbdFFAOG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jun 2017 20:14:06 -0400
MIME-Version: 1.0
In-Reply-To: <1495194150-14016-1-git-send-email-yamada.masahiro@socionext.com>
References: <1495194150-14016-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Jun 2017 09:13:59 +0900
Message-ID: <CAK7LNASfCzac4Lz1ufEK+cUxeWKEcSBn7iJ_+S2ecL0GBvK3KA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: simplify silent build (-s) detection
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wang Nan <wangnan0@huawei.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Jiri Olsa <jolsa@redhat.com>

2017-05-19 20:42 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This allows to detect -s (--silent) option without checking GNU Make
> version.
>
> As commit e36aaea28972 ("kbuild: Fix silent builds with make-4")
> pointed out, GNU Make 4.x changed the way/order it presents the
> command line options into MAKEFLAGS.
>
> In Make 3.8x, 's' is always be the first in a group of short options.
> The group may be prefixed with '-' in some cases.
>
> In Make 4.x, 's' is always the last in a group of short options.
>
> As commit e6ac89fabd03 ("kbuild: Correctly deal with make options
> which contain an 's'") addressed, we also need to deal with long
> options that contain 's', like --warn-undefined-variables.
>
> Test cases:
>
> [1] command line input:    make --silent
>      -> MAKEFLAGS for Make 3.8x:    s
>      -> MAKEFLAGS for Make 4.x :    s
>
> [2] command line input:    make -srR
>      -> MAKEFLAGS for Make 3.8x:    sRr
>      -> MAKEFLAGS for Make 4.x :    rRs
>
> [3] command line input:    make -s -rR --warn-undefined-variables
>      -> MAKEFLAGS for Make 3.8x:    --warn-undefined-variables -sRr
>      -> MAKEFLAGS for Make 4.x :    rRs --warn-undefined-variables
>
> The idea to cater to all the cases more easily is to filter out long
> options (--%), then search 's' with $(findstring ...).  This way will
> be more future-proof even if Make 5.x decides to put 's' in the middle
> of the group.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to linux-kbuild/kbuild.


-- 
Best Regards
Masahiro Yamada
