Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51698 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfJWFd6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 01:33:58 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x9N5XsRc011253
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2019 14:33:54 +0900
Received: by mail-ua1-f52.google.com with SMTP id m21so5636293ual.13
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2019 22:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191003031312.157994411@gmail.com> <20191003031312.313485229@gmail.com>
In-Reply-To: <20191003031312.313485229@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 23 Oct 2019 14:33:17 +0900
Message-ID: <CAK7LNAToNaODf_9J5mxz3NnLDGYbDJDP_2Jc3p_mC6bVMaeLMg@mail.gmail.com>
Subject: Re: [PATCH 2/4] scripts: namespace.pl: add some x86 object files to nmexception
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rd.dunlab@gmail.com
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

On Thu, Oct 3, 2019 at 12:18 PM <rd.dunlab@gmail.com> wrote:


You can grow %nmexception until
you no longer see "No nm data for ..." messages,
but is this maintainable?

I think it is more realistic to
delete the printf "No nm data for $fullname\n" line.



-- 
Best Regards
Masahiro Yamada
