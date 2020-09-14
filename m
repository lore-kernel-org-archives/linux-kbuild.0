Return-Path: <SRS0=rOOZ=CX=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6780C433E2
	for <linux-kbuild@archiver.kernel.org>; Mon, 14 Sep 2020 14:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99299207EA
	for <linux-kbuild@archiver.kernel.org>; Mon, 14 Sep 2020 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600093911;
	bh=dij7IZwAFsKVZTXZIHkaeD9gfCe4U6UCR/1ISNPdxhs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=NMX3M9pQ08fAi7L+BP/Tb+hD5CQ6Asb1LWzeCjLfYdkvyU87WSO7SYsQ+lh40VA8O
	 rSe322MHClDtqf2clskcoeTO1B5V2LzmWFC8pW0Nv/Uc06YoCOEIvrJYpjtYWsv6Qg
	 BwXQ9WfXPY6YfpLqOv9y/DElpYMRxbydOiLeFZK0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgINObl (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 14 Sep 2020 10:31:41 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17443 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgINOav (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 10:30:51 -0400
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 08EEUArI003959;
        Mon, 14 Sep 2020 23:30:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 08EEUArI003959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600093810;
        bh=UaE0Zy68kPNweus87sVFzfnVevHrKCIDC5eT9Rp0vmc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nR1kdS/c/XWFDV04iV0J5iNaTyzmspagmzGfhWZniLm708cIVFF3JgM98uhJlactE
         pJjbDdUDtvZnphtMRmdvfRnHKCi/Q+wUhfHNRNtHBVUfR1+xaA1mFhcrzoPuTrW1Sf
         kK39BVda6bcM/6Xzl/gTk5Ky7oBcltK/66KCZuu26+bYddSvrD3+go9km/6XfXNpsI
         JAy9c1cTExb88UuyQXqB7Oxfmyql864Os1jw9pjQmEV5VEJzseKmP5I7JghRedf9dQ
         OK7SOvnSec7G+WOmx3QGKgQGoE8rt0eXVuC0MKwPxpOYznoXYhHNAHjMcy28ZzKJyQ
         rTYFf4sVWaeMw==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id z19so12777515pfn.8;
        Mon, 14 Sep 2020 07:30:10 -0700 (PDT)
X-Gm-Message-State: AOAM533yqr7dIN3yhBLvzUI2nNm2nZXRzuexOEARs0YRngc0nKzcP4NZ
        Cw6LcVXZckSmMesv+BP8oFa5Purby9qm7R+bUq4=
X-Google-Smtp-Source: ABdhPJyQXe2Mipf+fHBb44hIw0BNL+a1xlhuXiTpfn4rOcTnA3hzYUkK4BHA467v6gIx62gaYCq18XrKTbQIhz4saTw=
X-Received: by 2002:aa7:93a8:0:b029:13c:1611:6534 with SMTP id
 x8-20020aa793a80000b029013c16116534mr13503727pff.6.1600093809514; Mon, 14 Sep
 2020 07:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200914133559.GA126210@localhost.localdomain>
In-Reply-To: <20200914133559.GA126210@localhost.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 14 Sep 2020 23:29:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASDLZ_=b5vM48mBT1SsLY-m5bXWBVBf7FbqJMGtc5XaMw@mail.gmail.com>
Message-ID: <CAK7LNASDLZ_=b5vM48mBT1SsLY-m5bXWBVBf7FbqJMGtc5XaMw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Run syncconfig with -s
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 14, 2020 at 10:36 PM Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> > BTW., there's another, rather spurious bug I recently triggered in kbuild.
> >
> > Occasionally when I Ctrl-C a kernel build on a system with a lot of CPUs,
> > the .o.cmd file gets corrupted:
>
> Those are temporary files, truncated at page boundary.
>
>         $ stat -c %s XXX.pata_sil680.mod.o.cmd
>         12288
>
> I tried to fix this by inserting shell 'trap' directive but it failed
> somewhere else.
>
>         cmd_and_fixdep =                                                     \
>         $(cmd);                                                              \
>         scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
>         rm -f $(depfile)



No. It is *OK* to have broken .o.cmd files
as long as .o files are deleted on error or interruption
(and this should be automatically handled by GNU Make).


.o.cmd is included only when the corresponding .o exists.


This is explained in the case [2] of commit
392885ee82d35d515ba2af7b72c5e357c3002113



-- 
Best Regards
Masahiro Yamada
