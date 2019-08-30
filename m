Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41677 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfH3MMg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Aug 2019 08:12:36 -0400
MIME-Version: 1.0
References: <20190829120215.1977-1-msuchanek@suse.de> <ccc65bd29747f8ad4d0ba1b3eda6c9d230f03c70.camel@perches.com>
In-Reply-To: <ccc65bd29747f8ad4d0ba1b3eda6c9d230f03c70.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Aug 2019 14:12:23 +0200
Message-ID: <CANiq72=ND-czaeKS9qUpEfrFj_SrUWBrmGQHVKCvV=dG8S=-XA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Convert -Wimplicit-fallthrough to -Wimplicit-fallthrough=2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Michal Suchanek <msuchanek@suse.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Aug 30, 2019 at 1:09 PM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2019-08-29 at 14:02 +0200, Michal Suchanek wrote:
> > In particular the default value of 3 does not match the comments like
> > /* falls through to do foobar */
>
> How many comments are there like this in the kernel?

+1 Given we are trying to move to attr-only and therefore
-Wimplicit-fallthrough=5, going back a level needs to be backed by a
good argument. It would be way better to fix those comments instead.

Cheers,
Miguel
