Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:33439 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753996AbdFNBPg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 21:15:36 -0400
MIME-Version: 1.0
In-Reply-To: <593FB5F2.4040206@cn.fujitsu.com>
References: <1496740073-3320-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNATSyqcf7X6Cn2GjObBdcW-qBxnS50BhgYAz5wcSKmCEjw@mail.gmail.com> <593FB5F2.4040206@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Jun 2017 10:15:14 +0900
Message-ID: <CAK7LNATJP5Ua3bWsxKQFUJ=m7TmOzz168_ZrZ4O4tnvd6mrgjA@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: tiny correction on `make help`
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

2017-06-13 18:52 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> Yamada-san,
>
>   I have a question on the current top level Makefile. There are
> following lines, I have trouble to understand "firstword x$(MAKEFLAGS)"
> in 2nd line, why there is a 'x' there?
>
>
>   ifneq ($(filter 4.%,$(MAKE_VERSION)),)  # make-4
>   ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)


I do not understand the 'x' either.

Michal suggested the code according to the following:
https://patchwork.kernel.org/patch/3291301/
(I hope Michal can help you.)


My first guess was, it was added just in case $(MAKEFLAGS) is empty.
Actually $(firstword ) seems to work with empty argument, though.



-- 
Best Regards
Masahiro Yamada
