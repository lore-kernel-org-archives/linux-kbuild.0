Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40435 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfEPTYs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 15:24:48 -0400
Received: by mail-lf1-f67.google.com with SMTP id h13so3519864lfc.7
        for <linux-kbuild@vger.kernel.org>; Thu, 16 May 2019 12:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
In-Reply-To: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 May 2019 21:24:35 +0200
Message-ID: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

Hi Ivan,

On Wed, May 15, 2019 at 8:55 PM Ivan Babrou <ivan@cloudflare.com> wrote:
>
> Hey,
>
> It looks like it's not possible to build Linux 4.19.43 (latest LTS as
> of today) with GCC 9.1 (latest stable GCC). From what I see, some
> support for GCC 9 was added by Miguel (cc'd) in 4.20, but it was never
> backported into 4.19.

I just compiled 4.19.43 allmodconfig with GCC 9.1.1 and it succeeded
(even if it gives a lot of warnings from objtool and
-Wmissing-attributes).

Which errors are you seeing? On which config?

Cheers,
Miguel
