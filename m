Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34930 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbfGMBqr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 21:46:47 -0400
Received: by mail-lj1-f195.google.com with SMTP id x25so11049776ljh.2
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jul 2019 18:46:45 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id n124sm1311875lfd.46.2019.07.12.18.46.43
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 18:46:43 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 16so10999529ljv.10
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jul 2019 18:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190712010556.248319-1-briannorris@chromium.org>
 <CAK7LNARGNVfxexE616cQDs1fK7SzToKwHxO_T69+RShL6QVTCQ@mail.gmail.com>
 <CA+ASDXNGqYkBjMsjcRKAit+0cd0n7dwxKhezyYCXSh_HjucvQw@mail.gmail.com> <CAK7LNARJ=aAf-iG7RVDp=bs7DTScJ1GBpEpkqtKDFDJYHEekUA@mail.gmail.com>
In-Reply-To: <CAK7LNARJ=aAf-iG7RVDp=bs7DTScJ1GBpEpkqtKDFDJYHEekUA@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 12 Jul 2019 18:46:31 -0700
Message-ID: <CA+ASDXOOyd4-thctnHG06GXnouf6EuJ4QV5QM+3iNBYQF499uA@mail.gmail.com>
Subject: Re: [RFC PATCH] bug: always show source-tree-relative paths in WARN()/BUG()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jason Baron <jbaron@akamai.com>, Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@suse.de>, Michal Marek <michal.lkml@markovi.net>

On Thu, Jul 11, 2019 at 6:50 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> GCC 8 added this flag.
> So, it will be eventually all solved in the GCC world.

Ack.

> Clang has not supported it yet...

That's what it appeared like. I've bugged our Clang-loving toolchain
folks to see if we can get parity.

> Trimming absolute path at run-time
> is no help for reducing the kernel image.

Sure, but that's not my stated goal. It would indeed be nicer though.
I guess if no one else speaks up with a favorable word toward my RFC,
I'll just see what I can do on the toolchain side.

Thanks for the help,
Brian
