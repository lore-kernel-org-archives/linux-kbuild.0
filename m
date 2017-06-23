Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20651 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753925AbdFWDYG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 23:24:06 -0400
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com [209.85.161.176]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id v5N3NmSJ018227
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2017 12:23:49 +0900
Received: by mail-yw0-f176.google.com with SMTP id v7so12815105ywc.2
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2017 20:23:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170622123929.15054-1-npiggin@gmail.com>
References: <20170622123929.15054-1-npiggin@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 23 Jun 2017 12:23:48 +0900
Message-ID: <CAK7LNAT9T9CvoDOhare5UN-bZPcemV+Ecmt6EK2ONVZhKc77jQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fix ia64, tile, sh for thin archives
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-06-22 21:39 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> This is a re-work of the vdso symbol linking patches to avoid the
> problem,
>
>   ld: warning: .note.gnu.build-id  section discarded, --build-id ignored.
>
> I was able to reproduce the problem, and I have compiled
> defconfig for 3 architectures here with this new approach
> and I saw no problems.
>
> Please replace the existing patches in kbuild/thin-ac with these
> 3 if you agree with them.

I did so.  Thanks!



-- 
Best Regards
Masahiro Yamada
