Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:42734 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752378AbeCOSaq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 14:30:46 -0400
Received: by mail-qk0-f169.google.com with SMTP id b198so8365659qkg.9
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Mar 2018 11:30:45 -0700 (PDT)
Date: Thu, 15 Mar 2018 14:30:43 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 5/7] kbuild: hide CONFIG_TRIM_UNUSED_KSYMS code from
 external module building
In-Reply-To: <CAK7LNATTFjexL0gmtyL0QNpRQUeTPYsjoOxb3+9F20vFaE3Xdg@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1803151428480.28583@knanqh.ubzr>
References: <1521045861-22418-1-git-send-email-yamada.masahiro@socionext.com> <1521045861-22418-6-git-send-email-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1803141419550.28583@knanqh.ubzr>
 <CAK7LNATTFjexL0gmtyL0QNpRQUeTPYsjoOxb3+9F20vFaE3Xdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jarod Wilson <jarod@redhat.com>, Prarit Bhargava <prarit@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 15 Mar 2018, Masahiro Yamada wrote:

> 2018-03-15 3:32 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
> > On Thu, 15 Mar 2018, Masahiro Yamada wrote:
> >
> >> If CONFIG_TRIM_UNUSED_KYMS is enabled, KBUILD_MODULES is set.
> >
> > Not when you do "make vmlinux" though.
> 
> I could not understand this.
> 
> Unless I am missing something,
> I think this code is always parsed.

Sorry, you're right. I had misread your sentence when I replied.


Nicolas
