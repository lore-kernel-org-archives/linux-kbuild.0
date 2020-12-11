Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0D5C433FE
	for <linux-kbuild@archiver.kernel.org>; Fri, 11 Dec 2020 21:42:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6441923372
	for <linux-kbuild@archiver.kernel.org>; Fri, 11 Dec 2020 21:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394281AbgLKUuY (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 11 Dec 2020 15:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393915AbgLKUuV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Dec 2020 15:50:21 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AABC0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2020 12:49:41 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 33CB72CA;
        Fri, 11 Dec 2020 20:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 33CB72CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607719740; bh=TUKuBk1yLTj6iJl57tiIUylufG0Uuv+IzcChQMN3mgU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DLCsy9KhstfgEKIf/LylZp0NnHpDxD0qTRlJfmrEtCNvDVipTAWkeyamFBiJnbuC3
         hs5QykQKEQoNcPQimiy8rJnRNWdoNg3FbhBdm3Zz5ERZkQjiCWYMnEIbEgg5i21at3
         O2PQYM+beUlJTHubQGYz1wnJST0bHe5n6jMiiSriscmA77ZpU1jRgndDqc8KUD9oGq
         bU66sZie6MIzPd+JDCAIo6hCwqekZai5F6K7F4trRa0C7xkojt0FtBsFDal633DWsy
         PIdV2iO811offKh65uSecAz+77Xjhr/Xhc4yS/gFf/Q9hSJ8HrvaGmBD3ArnlJMlJC
         S+aV9TeyzdVOg==
Date:   Fri, 11 Dec 2020 13:48:59 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH RFC v2] docs: experimental: build PDF with rst2pdf
Message-ID: <20201211134859.5ab8e0c2@lwn.net>
In-Reply-To: <b73c93c6946ab324443608fac62333b7e327a7e4.1607675494.git.mchehab+huawei@kernel.org>
References: <20201210172938.3b3086b6@coco.lan>
        <b73c93c6946ab324443608fac62333b7e327a7e4.1607675494.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 11 Dec 2020 09:33:32 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Add an experimental PDF builder using rst2pdf
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> Please notice that 18 documents (of a total of 71) won't build with 
> rst2pdf. There's an opened issue about that at:
> 
>     https://github.com/rst2pdf/rst2pdf/issues/958
> 
> v2: usage of SPHINXDIRS was fixed.
> 
> 
>  Documentation/Makefile                     |  5 +++++
>  Documentation/conf.py                      | 21 +++++++++++++++------
>  Documentation/sphinx/load_config.py        | 12 ++++++++++++
>  Documentation/userspace-api/media/Makefile |  1 +
>  Makefile                                   |  4 ++--
>  5 files changed, 35 insertions(+), 8 deletions(-)

So I would dearly love to have rst2pdf working.

I applied this, then tried to see what would happen if I ran a build
without having rst2pdf installed:

> 1108 meer kernel: make htmldocs
>   SPHINX  htmldocs --> file:///stuff/k/git/kernel/Documentation/output
> make[2]: Nothing to be done for 'html'.
> WARNING: The kernel documentation build process
>         support for Sphinx v3.0 and above is brand new. Be prepared for
>         possible issues in the generated output.
>         enabling CJK for LaTeX builder
> 
> Extension error:
> Could not import extension rst2pdf.pdfbuilder (exception: No module named 'rst2pdf')
> make[1]: *** [Documentation/Makefile:91: htmldocs] Error 2
> make: *** [Makefile:1663: htmldocs] Error 2

Methinks it's perhaps not quite ready for linux-next yet :)

With rst2pdf installed I get a bunch of zero-length files, as promised.
Pretty much none of the larger "books" make it through.  It's a start,
though.  I'll happily apply this as a step forward once it doesn't break
the docs build if rst2pdf is missing.

Thanks,

jon
