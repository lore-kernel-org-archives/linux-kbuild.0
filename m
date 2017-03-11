Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63756 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdCKFrG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Mar 2017 00:47:06 -0500
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com [209.85.161.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id v2B5kgBq000451
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Mar 2017 14:46:42 +0900
Received: by mail-yw0-f169.google.com with SMTP id p77so35570554ywg.1
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Mar 2017 21:46:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3bzdV3zyU+UJD-WDe=7P-htxQ10fsYM3HKUqzCqXKL-A@mail.gmail.com>
References: <20170307234823.17093.94956.stgit@bwallan-cwp1.jf.intel.com> <CAK8P3a3bzdV3zyU+UJD-WDe=7P-htxQ10fsYM3HKUqzCqXKL-A@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 11 Mar 2017 14:46:41 +0900
Message-ID: <CAK7LNATkmGQap4jma51yerOnOoqMV1j+ryGyeBJiNOP11jc+xA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: external module build warnings when KBUILD_OUTPUT
 set and W=1
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bruce Allan <bruce.w.allan@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

2017-03-08 15:59 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Wed, Mar 8, 2017 at 12:48 AM, Bruce Allan <bruce.w.allan@intel.com> wrote:
>> Commit db547ef19064 ("Kbuild: don't add obj tree in additional includes")
>> causes warnings (-Wmissing-include-dirs) when compiling external modules
>> with KBUILD_OUTPUT set and W=1.  This is because $src can be an absolute
>> path to the external module source which when prefixed with -I$(srctree)/
>> generates an incorrect directory path.
>>
>> Signed-off-by: Bruce Allan <bruce.w.allan@intel.com>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>
> Looks good to me, sorry for the regression
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>


Applied to linux-kbuild/fixes

Thanks!


-- 
Best Regards
Masahiro Yamada
