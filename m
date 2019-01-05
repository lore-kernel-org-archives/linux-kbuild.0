Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44583 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfAEUod (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Jan 2019 15:44:33 -0500
Received: by mail-lf1-f65.google.com with SMTP id z13so27616731lfe.11
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Jan 2019 12:44:32 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id x29-v6sm12986727ljb.97.2019.01.05.12.44.30
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jan 2019 12:44:30 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id p6so27698163lfc.1
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Jan 2019 12:44:30 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAQzEHv7Y69xFTPDEhyMP6JX4ghb96UMqMdxYyVyah6-VA@mail.gmail.com>
 <CAHk-=whg49nn5q_2QVMGN0u4rQFBmRKywtqJUSk+5=rBzTk1kg@mail.gmail.com> <20190105203906.GA22423@ravnborg.org>
In-Reply-To: <20190105203906.GA22423@ravnborg.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Jan 2019 12:44:14 -0800
Message-ID: <CAHk-=wh0rrLKYOxW6hAVaQ8rFGno7Q=XKrd13mfLXyd__WnTPw@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] Kbuild updates for v4.21
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

On Sat, Jan 5, 2019 at 12:39 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Not exactly what you ask for - but we have make V=2

Yeah, that's certainly more convenient than "make --debug".

That said, I was more thinking of not any particular "oh, it's
recompiling everything" situation (by then it's too late, obviously),
but if somebody has been looking at tools for finding and maybe
breaking some of our deeper include chains.

I know it has come up before (the x86 people did the
<linux/schedule.h> split some years ago) and then it was all manual.
But I was kind of hoping that maybe some of the kbuild people had
looked at this?

             Linus
