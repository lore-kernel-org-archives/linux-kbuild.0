Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:30564 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752839AbdHTMu6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Aug 2017 08:50:58 -0400
MIME-Version: 1.0
In-Reply-To: <20170818215441.2828-1-shuahkh@osg.samsung.com>
References: <20170818215441.2828-1-shuahkh@osg.samsung.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 20 Aug 2017 21:50:05 +0900
Message-ID: <CAK7LNASORROK60AQz9D+-KUBbPYKxAwm0KFwXCt0TReFL3FgkQ@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: add kselftest-clean to PHONY target list
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-08-19 6:54 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
> kselftest-clean isn't in the PHONY target list. Add it.
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---

Applied to linux-kbuild/fixes.  Thanks!




-- 
Best Regards
Masahiro Yamada
