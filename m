Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:34492 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750746AbeEJGJs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 02:09:48 -0400
Received: by mail-pl0-f67.google.com with SMTP id ay10-v6so682120plb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 09 May 2018 23:09:48 -0700 (PDT)
Date: Thu, 10 May 2018 16:09:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/5] kbuild: call cc-option with the current set of
 KBUILD_CFLAGS
Message-ID: <20180510160937.27997d66@roar.ozlabs.ibm.com>
In-Reply-To: <CAK7LNATnJ_xi7nFLA5-MeP=86bK19Z9-L=muCW8LKoDYBpDHGA@mail.gmail.com>
References: <20180510051659.15356-1-npiggin@gmail.com>
        <20180510051659.15356-4-npiggin@gmail.com>
        <CAK7LNATnJ_xi7nFLA5-MeP=86bK19Z9-L=muCW8LKoDYBpDHGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Thu, 10 May 2018 14:29:49 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2018-05-10 14:16 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> > In some cases, the options that gcc will accept depend on options it
> > has already been given. For example -m32 / -m64 and -mbig-endian /
> > -mlittle-endian can have this affect.  
> 
> Is cc-option not working for you?

I thought it wasn't, but now I try again and it does work, sorry for
the noise. The bug must have been something in my previous series.
This series seems to work just as well after I remove this patch.

Thanks,
Nick
