Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33182 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754035AbdFWDmz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 23:42:55 -0400
Received: by mail-pf0-f195.google.com with SMTP id w12so5691951pfk.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2017 20:42:54 -0700 (PDT)
Date: Fri, 23 Jun 2017 13:42:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/3] fix ia64, tile, sh for thin archives
Message-ID: <20170623134244.43b48470@roar.ozlabs.ibm.com>
In-Reply-To: <CAK7LNAT9T9CvoDOhare5UN-bZPcemV+Ecmt6EK2ONVZhKc77jQ@mail.gmail.com>
References: <20170622123929.15054-1-npiggin@gmail.com>
        <CAK7LNAT9T9CvoDOhare5UN-bZPcemV+Ecmt6EK2ONVZhKc77jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, 23 Jun 2017 12:23:48 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2017-06-22 21:39 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> > This is a re-work of the vdso symbol linking patches to avoid the
> > problem,
> >
> >   ld: warning: .note.gnu.build-id  section discarded, --build-id ignored.
> >
> > I was able to reproduce the problem, and I have compiled
> > defconfig for 3 architectures here with this new approach
> > and I saw no problems.
> >
> > Please replace the existing patches in kbuild/thin-ac with these
> > 3 if you agree with them.  
> 
> I did so.  Thanks!
> 
> 
> 

Thank you Yamada san, will you merge David's patch for sparc64 as well?

Thanks,
Nick
