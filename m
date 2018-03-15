Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:44436 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752684AbeCOSuE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 14:50:04 -0400
Received: by mail-qk0-f195.google.com with SMTP id h14so2958641qkj.11
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Mar 2018 11:50:04 -0700 (PDT)
Date: Thu, 15 Mar 2018 14:50:02 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 7/7] kbuild: link vmlinux just once for
 CONFIG_TRIM_UNUSED_KSYMS
In-Reply-To: <CAK7LNATANL6Lfa6=05g9fCfj0ZLNHu_XnPEfurrOBQ8YXqUc4w@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1803151434270.28583@knanqh.ubzr>
References: <1521045861-22418-1-git-send-email-yamada.masahiro@socionext.com> <1521045861-22418-8-git-send-email-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1803141448330.28583@knanqh.ubzr>
 <CAK7LNATANL6Lfa6=05g9fCfj0ZLNHu_XnPEfurrOBQ8YXqUc4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jarod Wilson <jarod@redhat.com>, Prarit Bhargava <prarit@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 15 Mar 2018, Masahiro Yamada wrote:

> I am not familiar with Make internal, but
> I can test it with simple code.
> 
> 
> [Test Makefile]
> A: B
>         cp B A
>         echo $?
> 
> B: C
>         cp C B
>         touch A
> 
> [Result]
> $ rm -rf A B C
> $ touch C
> $ make
> cp C B
> touch A
> cp B A
> echo B
> B
> 
> 
> In the recipe of 'B', 'A' is touched,
> so the dependency 'A: B' has already been met
> before the recipe of 'A' is executed,
> but Make does not notice that fact,
> then tries to update 'A'.
> 
> 
> The situation is the same.
> vmlinux has been updated in the recursed sub-make,
> but it is not noticed.

OK, I agree.


Nicolas
