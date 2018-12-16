Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:25318 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730382AbeLPPlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Dec 2018 10:41:15 -0500
MIME-Version: 1.0
References: <1544529716-4917-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544529716-4917-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 17 Dec 2018 00:40:18 +0900
Message-ID: <CAK7LNAQ3o5+6-SgZqrUCKPVxWwtJ9t-vB+C1RzjY9AuX8p7uTg@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: remove redundant quiet_modtag for $(obj-m)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Dec 11, 2018 at 9:02 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> All objects in $(obj-m) are included in $(real-obj-m) as well.
>
> It is true composite objects are only contained in $(obj-m),
> but [M] is hard-coded in quiet_cmd_link_multi-m.
>
> This line is redundant.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
