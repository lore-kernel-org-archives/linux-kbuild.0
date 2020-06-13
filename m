Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgFMUnl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jun 2020 16:43:41 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4943CC03E96F
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2020 13:43:40 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so14871214ljn.4
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2020 13:43:40 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id c22sm3303115lfm.25.2020.06.13.13.43.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 13:43:36 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id q19so14866651lji.2
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2020 13:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATsQRp=kkB+THaO23XiHZsU1xJ-B42p8sMieBgJ4uftMg@mail.gmail.com>
In-Reply-To: <CAK7LNATsQRp=kkB+THaO23XiHZsU1xJ-B42p8sMieBgJ4uftMg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 13 Jun 2020 13:43:20 -0700
Message-ID: <CAHk-=wh7vRkvFTFFQ_TQioLmoK-HWoHMAZ65J3N9jhTHVk5ATA@mail.gmail.com>
Subject: Re: [GIT PULL] more Kbuild updates for v5.8-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Jun 13, 2020 at 10:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - fix build rules in binderfs sample

.. oh, and now that this builds, it also made it obvious that the
.gitignore file was missing.

          Linus
