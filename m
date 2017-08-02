Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25436 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbdHBAcH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 20:32:07 -0400
MIME-Version: 1.0
In-Reply-To: <1501587394-32226-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1501587394-32226-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 2 Aug 2017 09:31:49 +0900
Message-ID: <CAK7LNASx15Lw_fXhRwCDKjPo15_aD3du7EYhVXRAn4VcEcDd2A@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: trivial cleanups on the comments
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Randy Dunlap <rdunlap@infradead.org>

Hi.

2017-08-01 20:36 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
> Since this one has not been merged yet and I find more cleanups,
> so I have v4 out.
>
> v3 addressed comments from Masahiro-san and Randy Dunlap.
> v4 find several more cleanups in Makefile.build worth to be
>    included into this trivial patch.


OK, this is a collection of trivial fixes.


While you are here, could you fix the following as well?


[1]
Makefile line 445:
# Basic helpers built in scripts/

    scripts/   ->   scripts/basic/


[2]
Makefile line 508:
# install and module_install need also be processed one by one


   module_install  ->  modules_install




-- 
Best Regards
Masahiro Yamada
