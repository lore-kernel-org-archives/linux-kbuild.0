Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:44327 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731646AbgGAPUn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:20:43 -0400
MIME-Version: 1.0
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1593498345.git.mchehab+huawei@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 2 Jul 2020 00:19:41 +0900
Message-ID: <CAK7LNAQ607UrHZ9Pa3QjdkWGhid95idCsMFq+GcZc8S-jHw1Tg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Fix split view search and debug info navigation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Jun 30, 2020 at 3:26 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> This series fixes some issues with search while on split view and fix the
> broken hyperlink navigation.
>
> The first patches restore the pre-Qt5 conversion behavior. The last
> one implements navigation on a different way. I opted to keep this one
> in separate, as this one is a new feature.
>
> -


Series, I applied to linux-kbuild/fixes.
(I used v3.1 for 7/7)


If Maxim gives Tested-by or something,
I will append it.





> v3:
>
> - dropped a patch that it is not needed anymore;
> - hyperlinks should now work for non-visible items;
> - fixed a description at patch 3.
>
> Mauro Carvalho Chehab (7):
>   kconfig: qconf: cleanup includes
>   kconfig: qconf: make search fully work again on split mode
>   kconfig: qconf: make debug links work again
>   kconfig: qconf: re-implement setSelected()
>   kconfig: qconf: simplify the goBack() logic
>   kconfig: qconf: don't show goback button on splitMode
>   kconfig: qconf: navigate menus on hyperlinks
>
>  scripts/kconfig/qconf.cc | 169 +++++++++++++++++++++++----------------
>  scripts/kconfig/qconf.h  |  29 ++++---
>  2 files changed, 119 insertions(+), 79 deletions(-)
>
> --
> 2.26.2
>
>


-- 
Best Regards
Masahiro Yamada
