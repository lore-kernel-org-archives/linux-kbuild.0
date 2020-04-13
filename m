Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388123AbgDMTsK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 15:48:10 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746E9C0A3BE2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 12:48:10 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t40so4238125pjb.3
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 12:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200413115815.141587-1-vitor@massaru.org>
In-Reply-To: <20200413115815.141587-1-vitor@massaru.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 13 Apr 2020 12:47:58 -0700
Message-ID: <CAFd5g45yG1sSyuft4e_hrFxTNeES5fQVVyjmN8qOFyEmoUU4fg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: arch/$(SUBARCH)/include/generated/ aren't cleaned
 by mrproper
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>

On Mon, Apr 13, 2020 at 4:58 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> This bug was introduced in this commit a788b2ed81abe
>
> Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

Please elaborate on what this change does and why it is necessary.
Shuah and I are not the only ones who will want to understand what is
going on here.

Otherwise, the change itself looks good to me.

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
