Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:63937 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388689AbgDBQ4S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 12:56:18 -0400
MIME-Version: 1.0
References: <cover.1585819250.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1585819250.git.mchehab+huawei@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 3 Apr 2020 01:55:15 +0900
Message-ID: <CAK7LNAQ49zWcZzGdnpkUBczR88DPHNRu2CFMOjvVVs5MB9MvVQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Fix several issues at qconf.cc
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Apr 2, 2020 at 6:28 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Since its conversion to support Qt5, back on Kernel 3.14, the qconf.cc tool
> has been having some issues.  With Kernel 5.6 (and Qt 5.13) it doesn't
> work at all, on any of its modes.
>
> This patch series restore its functionality to what it had before Kernel 3.14.
>
> Now, all three modes should work as expected, and the layout will be shown
> with a vertical split, with the help messages at the botton, for both Single and
> Full modes.
>
> The Split mode should also work properly, with its horizontal split showing
> the main config items at the left and a per-items view at the right.
>
> Mauro Carvalho Chehab (6):
>   kconfig: qconf: clean deprecated warnings
>   kconfig: qconf: Change title for the item window
>   kconfig: qconf: fix the content of the main widget
>   kconfig: qconf: fix support for the split view mode
>   kconfig: qconf: remove some old bogus TODOs
>   kconfig: qconf: Fix a few alignment issues


Thank you for fixing several issues!

I will pick this series for v5.7-rc1 soon.



>
>  scripts/kconfig/qconf.cc | 90 ++++++++++++++++++++++++++++------------
>  scripts/kconfig/qconf.h  |  2 +
>  2 files changed, 66 insertions(+), 26 deletions(-)
>
> --
> 2.25.1
>
>


-- 
Best Regards
Masahiro Yamada
