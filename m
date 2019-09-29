Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39037 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728696AbfI2C5C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Sep 2019 22:57:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id y3so6030329ljj.6
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Sep 2019 19:57:00 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id d3sm1770250ljc.66.2019.09.28.19.56.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2019 19:56:59 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id r22so4582223lfm.1
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Sep 2019 19:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAT-D68xMFrE-D_F-2y+iZt45+8iLF9dmTyO8YwUX-bTqA@mail.gmail.com>
In-Reply-To: <CAK7LNAT-D68xMFrE-D_F-2y+iZt45+8iLF9dmTyO8YwUX-bTqA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Sep 2019 19:56:42 -0700
Message-ID: <CAHk-=wjdc7Ovi-iVGBGzuP6prTXVRT8rgbnabBd0AiHRqECMCg@mail.gmail.com>
Subject: Re: [GIT PULL] More Kbuild updates for v5.4-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

On Sat, Sep 28, 2019 at 11:41 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Please pull some more updates for v5.4-rc1

I pulled this, but I'm not sure if I'm going to keep it.

There's thousands of lines of changes because of the header-test-y
thing, and I'm honestly considering just getting rid of that thing
entirely.

It has no actual upside that I can tell, and it's extremely annoying.
It pollutes the tree with hundreds of *.h.s files, which messes up
filename completion, and just generally is ugly and annoying.

So I've unpulled for now, and I'm not sure I want to pull more noise
for this mis-feature.

                Linus
