Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:43482 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727355AbeICOSx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Sep 2018 10:18:53 -0400
Date: Mon, 3 Sep 2018 12:00:21 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v4 07/11] kbuild: use 'include' directive to load
 auto.conf from top Makefile
Message-ID: <20180903100021.GD10249@zn.tnic>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
 <1532072796-7947-8-git-send-email-yamada.masahiro@socionext.com>
 <20180903093945.GA1195@zn.tnic>
 <CAK7LNAQOd-QA6E7189q4K-p_9ReRtE88UbhtuXS9600nOQTgaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQOd-QA6E7189q4K-p_9ReRtE88UbhtuXS9600nOQTgaA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Sep 03, 2018 at 06:54:12PM +0900, Masahiro Yamada wrote:
> You are right - I missed this usecase,
> but I still want to excuse "it is rare enough".

Isn't there a Makefile way to check file existence before including it?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
