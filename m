Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:36497 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751419AbdHaXxn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Aug 2017 19:53:43 -0400
MIME-Version: 1.0
In-Reply-To: <20170830140413.9333-1-jthumshirn@suse.de>
References: <20170830140413.9333-1-jthumshirn@suse.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Sep 2017 08:52:55 +0900
Message-ID: <CAK7LNARcvmKN9bQit6ufkTJdgcpFW3Ahti4Jh-ZsrN+g9vtUsg@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: enable -Wunused-macros warning for "make W=2"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Michal Marek <mmarek@suse.com>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-08-30 23:04 GMT+09:00 Johannes Thumshirn <jthumshirn@suse.de>:
> We have lots of dead defines and macros in drivers, lets offer users a way
> to detect and eventually remove them.
>
> Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
> ---
>
> Notes:
>     Changes to v1:
>     * Change from W=1 to W=2
>

Applied to linux-kbuild.  Thanks.

-- 
Best Regards
Masahiro Yamada
