Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE591C63798
	for <linux-kbuild@archiver.kernel.org>; Mon, 23 Nov 2020 05:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47E88207FF
	for <linux-kbuild@archiver.kernel.org>; Mon, 23 Nov 2020 05:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="OEBEdpZl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgKWFUK (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 23 Nov 2020 00:20:10 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:26341 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWFUK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 00:20:10 -0500
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0AN5JqHx032226
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 14:19:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0AN5JqHx032226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606108793;
        bh=Y7eS3LrjJHCmAosRJeow41kNwu+r2gw0PUm4JOuP3hg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OEBEdpZlnBbQMYp7YyrhH4+vRXjw3sVUjOxL5lx/wK0GF2dkbEWQY7T5bO/Gx31Xu
         Sg0fBzroENTJIWRJTxRjJR/lXLcUVNIgqdrMVXMY+rWYYhSg+ir3ttan5+DfyCXZXl
         Hk4cXzkA5jhu6sQmFWHLTVmA7XGagvvsRQSgzz/yDQnVEqr8F9AMeHiun8xY0EsYRR
         UtZ1SL17+WpsCQXinG6pfftyuc8xaDShYU3ivgpNcJozDk3Gw2kneUhx6Re+4ZjIUu
         g4rtEJHrLBoSR2GcVHyk5ch7yNDzzNWjcmqgH1nulrI0viP+/9JexfF+tJ5crIARcz
         XtoOc+Q+/9hhw==
X-Nifty-SrcIP: [209.85.215.178]
Received: by mail-pg1-f178.google.com with SMTP id f17so4629661pge.6
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Nov 2020 21:19:53 -0800 (PST)
X-Gm-Message-State: AOAM531JqF0MBHMblAYEi2WS+HPv6JZJ5K9dhFET8gUMzK2hUE66l6Af
        HKV8q1g9H3tykPfjONYtxiBfpeo4JkKtbAkSR8A=
X-Google-Smtp-Source: ABdhPJwS5rNztXrqsYOnH7Z4PEpvfv609d20Hu8Jbaiv50SwKoqb3PCfVEjI+XYZfWdYHgmD6jv3xGqjIzSKvkY8rkg=
X-Received: by 2002:a17:90a:5304:: with SMTP id x4mr23068823pjh.153.1606108792267;
 Sun, 22 Nov 2020 21:19:52 -0800 (PST)
MIME-Version: 1.0
References: <20201029155152.2467-1-boris@codesynthesis.com>
 <20201029155152.2467-3-boris@codesynthesis.com> <CAK7LNARRfK7LFrmJdMj4n77rb6pBYY=gXNLkfoSjk=pBJkg79w@mail.gmail.com>
 <boris.20201102162336@codesynthesis.com>
In-Reply-To: <boris.20201102162336@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Nov 2020 14:19:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR4jxyOpGYspNUK==-pcdpMLkwv7_ejOO500RwfqAqL=w@mail.gmail.com>
Message-ID: <CAK7LNAR4jxyOpGYspNUK==-pcdpMLkwv7_ejOO500RwfqAqL=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: clean up header inclusion
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 2, 2020 at 11:32 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > On Fri, Oct 30, 2020 at 12:52 AM Boris Kolpackov
> > <boris@codesynthesis.com> wrote:
> > >
> > > - Add missing includes.
> > > - Remove no longer necessary includes.
> > > - Separate non-portable header includes for easier porting.
> >
> > I think the definition of "non-portable"
> > depends on how far we expand the supported system.
> >
> > I guess you want to segregate <unistd.h> and <sys/mmap.h>
> > because you do not have them on Windows, correct?
>
> Correct. I have a set of patches that make kconfig portable to
> Windows. I assume there is no interest in these patches here so
> I will be maintaining them out of tree (but let me know if my
> assumption is wrong and I will happily submit them). Splitting
> the header inclusions into two blocks make these patches a bit
> cleaner and more resilient to changes.
>
> Let me know if you would like me to change the patch to (1)
> clarify the non-portable part or (2) get rid of the split.



If you send v2 with the first two items:

- Add missing includes.
- Remove no longer necessary includes.

I will accept it.


I am not interested in the last one because
running kconfig on Windows
is not officially supported.


-- 
Best Regards
Masahiro Yamada
