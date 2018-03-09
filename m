Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:3650 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750909AbeCIHeA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Mar 2018 02:34:00 -0500
Subject: Re: [PATCH 0/5] kbuild: always define KBUILD_MODNAME, and
 clean-up/fix modname
References: <1520471103-10089-1-git-send-email-yamada.masahiro@socionext.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <a5668320-a781-a22c-3206-fbd7fb1b30df@cn.fujitsu.com>
Date: Fri, 9 Mar 2018 15:33:10 +0800
MIME-Version: 1.0
In-Reply-To: <1520471103-10089-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Govind Singh <govinds@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, linux-kernel@vger.kernel.org

The series build successfully on upstream in my: make allyesconfig and
allmodconfig, so,

Tested-by: Cao jin <caoj.fnst@cn.fujitsu.com>

-- 
Sincerely,
Cao jin

On 03/08/2018 09:04 AM, Masahiro Yamada wrote:
> 
> 3/5 takes into account '-m' case for multi-used-m.
> 
> 2/5 is necessary beforehand because 3/5 would cause a build error for
> drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
> 
> 1, 4, 5 are just clean-ups.
> 
> 
> 
> Cao jin (1):
>   kbuild: fix modname for composite modules
> 
> Masahiro Yamada (4):
>   kbuild: remove unnecessary $(subst $(obj)/,,...) in modname-multi
>   kbuild: define KBUILD_MODNAME even if multiple modules share objects
>   kbuild: simplify modname calculation
>   kbuild: move modname and modname-multi close to modname_flags
> 
>  scripts/Makefile.build | 12 ------------
>  scripts/Makefile.lib   | 22 +++++++++-------------
>  2 files changed, 9 insertions(+), 25 deletions(-)
> 


