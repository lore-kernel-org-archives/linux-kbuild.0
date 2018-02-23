Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f181.google.com ([209.85.128.181]:37865 "EHLO
        mail-wr0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751413AbeBWQXK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 11:23:10 -0500
Received: by mail-wr0-f181.google.com with SMTP id z12so14684276wrg.4
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Feb 2018 08:23:09 -0800 (PST)
Date: Fri, 23 Feb 2018 17:22:55 +0100
From: Robin Jarry <robin.jarry@6wind.com>
Subject: Re: [PATCH 2/2] objtool: use host flags to detect if libelf is
 missing
Message-ID: <20180223162255.cakkzdi3jpkh4vmi@6wind.com>
References: <cover.1519393674.git.robin.jarry@6wind.com>
 <2afbfc7911a0eb0642c33e8c2582f137a4fda2f3.1519393674.git.robin.jarry@6wind.com>
 <20180223153720.glun6fa2a3jde7mi@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180223153720.glun6fa2a3jde7mi@treble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

2018-02-23, Josh Poimboeuf:
> Hi Robin,
> 
> Did you test this?  I see some issues:
> 
> a) I don't see where the host_cflags variable comes from (and btw, it's
>    misspelled...)

Hi Josh,

Shame on me... Last minute fix. I had tested this first by forcing
HOSTCC="gcc <CFLAGS> <LDFLAGS>" but I found it rather dirty. As it turns
out, my patch is not better.

> b) I don't see where objtool uses HOSTLDFLAGS.

Indeed, I also missed this (see above).

It looks like objtool does not use HOSTCFLAGS nor HOSTLDFLAGS (defined
in top Makefile). Do you see a reason why? Maybe it would be a good idea
to share these flags (adding some specific ones for objtool, if needed).

What do you think?

-- 
Robin
