Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f173.google.com ([209.85.128.173]:46903 "EHLO
        mail-wr0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752679AbeB1RYg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Feb 2018 12:24:36 -0500
Received: by mail-wr0-f173.google.com with SMTP id m12so3240144wrm.13
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Feb 2018 09:24:35 -0800 (PST)
Date: Wed, 28 Feb 2018 18:24:20 +0100
From: Robin Jarry <robin.jarry@6wind.com>
Subject: Re: [PATCH v2 0/3] kbuild: fix host progs build with libs in non
 standard locations
Message-ID: <20180228172420.usinpmathg4gvvav@6wind.com>
References: <cover.1519393674.git.robin.jarry@6wind.com>
 <cover.1519668832.git.robin.jarry@6wind.com>
 <20180227174518.qzw6eqmuyggcvjl6@treble>
 <CAK7LNAQLDRefb34KzF=3UUBdRLsDXtaZhRVQjRE2ZMaqNEb4LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQLDRefb34KzF=3UUBdRLsDXtaZhRVQjRE2ZMaqNEb4LA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-28, Masahiro Yamada:
[snip]
> So, my idea is to rename existing
> 
>  HOSTCFLAGS     ->  KBUILD_HOSTCFLAGS
>  HOSTCXXFLAGS   ->  KBUILD_HOSTCXXFLAGS
>  HOSTLDFLAGS    ->  KBUILD_HOSTLDFLAGS
>  HOST_LOADLIBES ->  KBUILD_HOSTLDLIBS
> 
> 
> ("LOADLIBES" is too long, so rename it to "LDLIBS")
> 
> 
> Then, re-add no-prefix ones as user interface.

Hi Masahiro,

Ok, I'll add the rename patch in a v3 of my series.

-- 
Robin
