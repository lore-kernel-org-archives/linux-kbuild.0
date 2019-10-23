Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:17695 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfJWFfn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 01:35:43 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x9N5ZSuU017272
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2019 14:35:29 +0900
Received: by mail-vs1-f47.google.com with SMTP id j85so3893932vsd.11
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2019 22:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191003031312.157994411@gmail.com> <20191003031312.374601455@gmail.com>
In-Reply-To: <20191003031312.374601455@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 23 Oct 2019 14:34:52 +0900
Message-ID: <CAK7LNAR_qK72-j=heEtvUp_DXt-uMGSJguMMzApFFKFyuj3dzg@mail.gmail.com>
Subject: Re: [PATCH 3/4] scripts: namespace.pl: add .o to nmexception file
 names and fix "acpica"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rd.dunlab@gmail.com
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

On Thu, Oct 3, 2019 at 12:18 PM <rd.dunlab@gmail.com> wrote:


The same comment as 2/4.
I doubt if %nmexception is maintainable.


For example, you are fixing fs/ext3/bitmap to fs/ext3/bitmap.o
but I do not see the directory fs/ext3/.

How many entries in the %nmexception are still valid?





--
Best Regards
Masahiro Yamada
