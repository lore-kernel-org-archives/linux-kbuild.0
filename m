Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872C0C433EF
	for <linux-kbuild@archiver.kernel.org>; Thu,  7 Apr 2022 23:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiDGX76 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 7 Apr 2022 19:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbiDGX75 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Apr 2022 19:59:57 -0400
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C389FF2;
        Thu,  7 Apr 2022 16:57:55 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 237NvVAu018069;
        Fri, 8 Apr 2022 08:57:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 237NvVAu018069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1649375853;
        bh=2xt6T2poF3Jb2rXQqjGy0tw2bFfsjebPGhPiXY6x8nE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UboELrmsxNtueHP8l9jwLEViCMAzg6Vu8OcdetvULTADwduoRUsU99oGjR8z6aXzr
         Lu7bRdm80qjBtOxULJmgpbpj2GGCXREw1Weet4CiiDAjA3CBdlhBM+CHgkXUxAwaxL
         AFywXuSZnKrE8VrUfE+M0dlhFIadNT2PhRUmePckm/WZj9cunkx5rsFI5kZpSaIdSn
         FargPXkmzARPR1TaZ2rsE2SbJCbVz28LMx2rDAX3X0jHp80Lm+NkWej95YRb7sA6sW
         7veSKbNIxt9eh9sSytqLRFIPoGS83SbwJYGXx/DfIkwfrUUXgWafKLbfpvCEPNZ8H3
         d+VksF3eEgy5w==
X-Nifty-SrcIP: [209.85.208.169]
Received: by mail-lj1-f169.google.com with SMTP id bn33so9455020ljb.6;
        Thu, 07 Apr 2022 16:57:32 -0700 (PDT)
X-Gm-Message-State: AOAM532beJT4hhSQNyGQjk/gl6GTbAQPLchU6fG92VRh0IvaOaeohDxA
        YZQoUfDpHcWiZYGbQFl3N2u6bnkz2xfhKCwwnbM=
X-Google-Smtp-Source: ABdhPJwMIyCuy+7fO1cOpOcUkEJiYA0J7US+42V8NnfrzrSAT424OdA+4z/VVcuyjerRs/kH0pR0n7cp5qEzzTnammU=
X-Received: by 2002:a2e:bf27:0:b0:246:7ed6:33b0 with SMTP id
 c39-20020a2ebf27000000b002467ed633b0mr10441919ljr.167.1649375850933; Thu, 07
 Apr 2022 16:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220406153023.500847-1-masahiroy@kernel.org> <20220406153023.500847-5-masahiroy@kernel.org>
 <CAKwvOdmT0G5b2nz-HBCXOVKaC2h5XNsoNbsAVHTo=86b5pdBDw@mail.gmail.com>
In-Reply-To: <CAKwvOdmT0G5b2nz-HBCXOVKaC2h5XNsoNbsAVHTo=86b5pdBDw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 8 Apr 2022 08:56:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNASh58DFSUCe4cJRFkLBK3NE6tT346JT=3yZFkUzFUtLhA@mail.gmail.com>
Message-ID: <CAK7LNASh58DFSUCe4cJRFkLBK3NE6tT346JT=3yZFkUzFUtLhA@mail.gmail.com>
Subject: Re: [PATCH 4/7] kbuild: split the second line of *.mod into *.usyms
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Alexander Lobakin <alobakin@pm.me>,
        Michal Marek <michal.lkml@markovi.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 8, 2022 at 2:47 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Wed, Apr 6, 2022 at 8:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > The *.mod files have two lines; the first line lists the member objects
> > of the module, and the second line, if CONFIG_TRIM_UNUSED_KSYMS=y, lists
> > the undefined symbols.
>
> Enabling EXPERT and TRIM_UNUSED_KSYMS, I didn't find any .mod files
> containing a second line that wasn't empty. Is there an example that
> has such symbol list that I can use to verify?


Modules are usually symbol consumers in order to be useful.
(and some of them are symbol providers as well).

So, it is rare to see an empty unresolved symbol list.

But, it is theoretically possible to create such a module.


This is sample code.


obj-m += foo.o

----------------(foo.c begin)----------------
#include <linux/module.h>

MODULE_LICENSE("GPL");
----------------(foo.c end)----------------






> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
