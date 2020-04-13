Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727802AbgDMUKA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 16:10:00 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD71BC0A3BDC
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 13:09:59 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id x2so8271108qtr.0
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 13:09:59 -0700 (PDT)
Message-ID: <14517051a7046f105570a90d61e3a02d4c8a51eb.camel@massaru.org>
Subject: Re: [PATCH] kbuild: arch/$(SUBARCH)/include/generated/ aren't
 cleaned by mrproper
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Mon, 13 Apr 2020 17:09:54 -0300
In-Reply-To: <CAFd5g45yG1sSyuft4e_hrFxTNeES5fQVVyjmN8qOFyEmoUU4fg@mail.gmail.com>
References: <20200413115815.141587-1-vitor@massaru.org>
         <CAFd5g45yG1sSyuft4e_hrFxTNeES5fQVVyjmN8qOFyEmoUU4fg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>

On Mon, 2020-04-13 at 12:47 -0700, Brendan Higgins wrote:
> On Mon, Apr 13, 2020 at 4:58 AM Vitor Massaru Iha <vitor@massaru.org>
> wrote:
> > This bug was introduced in this commit a788b2ed81abe
> > 
> > Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> 
> Please elaborate on what this change does and why it is necessary.
> Shuah and I are not the only ones who will want to understand what is
> going on here.

Sure, I'll do that.

Thanks for the review.

> 
> Otherwise, the change itself looks good to me.
> 
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Tested-by: Brendan Higgins <brendanhiggins@google.com>
