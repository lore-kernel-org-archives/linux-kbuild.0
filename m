Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www262.sakura.ne.jp ([202.181.97.72]:56868 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbgCZXli (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 19:41:38 -0400
Subject: Re: [PATCH AUTOSEL 5.5 23/28] kconfig: Add yes2modconfig and
 mod2yesconfig targets.
References: <20200326232357.7516-1-sashal@kernel.org>
 <20200326232357.7516-23-sashal@kernel.org>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <d4546302-2dd8-0930-f478-654bfbddb642@i-love.sakura.ne.jp>
Date: Fri, 27 Mar 2020 08:41:28 +0900
MIME-Version: 1.0
In-Reply-To: <20200326232357.7516-23-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org

Hello.

I'm fine with backporting this patch. But if you want to backport this patch, please also
backport 089b7d890f972f6b ("kconfig: Invalidate all symbols after changing to y or m.")
which actually makes this patch functional.

On 2020/03/27 8:23, Sasha Levin wrote:
> From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> 
> [ Upstream commit 89b9060987d988333de59dd218c9666bd7ee95a5 ]
> 
> Since kernel configs provided by syzbot are close to "make allyesconfig",
> it takes long time to rebuild. This is especially waste of time when we
> need to rebuild for many times (e.g. doing manual printk() inspection,
> bisect operations).
> 
> We can save time if we can exclude modules which are irrelevant to each
> problem. But "make localmodconfig" cannot exclude modules which are built
> into vmlinux because /sbin/lsmod output is used as the source of modules.
> 
> Therefore, this patch adds "make yes2modconfig" which converts from =y
> to =m if possible. After confirming that the interested problem is still
> reproducible, we can try "make localmodconfig" (and/or manually tune
> based on "Modules linked in:" line) in order to exclude modules which are
> irrelevant to the interested problem. While we are at it, this patch also
> adds "make mod2yesconfig" which converts from =m to =y in case someone
> wants to convert from =m to =y after "make localmodconfig".
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
