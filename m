Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35676 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752037AbdJEUUi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 16:20:38 -0400
MIME-Version: 1.0
In-Reply-To: <1506058274-30516-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506058274-30516-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 6 Oct 2017 05:19:30 +0900
Message-ID: <CAK7LNARmvPj--u9nTj6W7sFRHVKDgVNTtLc4f_vqJd07etJwhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: link-vmlinux.sh: simplify .version increment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-09-22 14:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Since commit 1f2bfbd00e46 ("kbuild: link of vmlinux moved to a
> script"), it is easy to increment .version without using a temporary
> file .old_version.
>
> I do not see anybody who creates .tmp_version any more.  Probably
> it is a left-over of commit 4e25d8bb9550fb ("[PATCH] kbuild: adjust
> .version updating").  Just remove it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>


Applied to linux-kbuild/kbuild.



-- 
Best Regards
Masahiro Yamada
