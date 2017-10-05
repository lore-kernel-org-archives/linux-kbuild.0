Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:48745 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbdJEUX6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 16:23:58 -0400
MIME-Version: 1.0
In-Reply-To: <1506058274-30516-2-git-send-email-yamada.masahiro@socionext.com>
References: <1506058274-30516-1-git-send-email-yamada.masahiro@socionext.com> <1506058274-30516-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 6 Oct 2017 05:23:07 +0900
Message-ID: <CAK7LNATPeyQTw3NJQWFnhN1u-rC2PD+EEj8DgNe03Jp8CPHKGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: mkcompile_h: do not create .version
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-09-22 14:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This script need not to create .version; it will be created by
> scripts/link-vmlinux.sh later.  Clean-up the code slightly.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to linux-kbuild/kbuild.



-- 
Best Regards
Masahiro Yamada
