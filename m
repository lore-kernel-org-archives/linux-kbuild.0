Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36910 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751899AbeB0Uwq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Feb 2018 15:52:46 -0500
Received: by mail-wr0-f194.google.com with SMTP id z12so181540wrg.4
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Feb 2018 12:52:45 -0800 (PST)
Date: Tue, 27 Feb 2018 21:52:31 +0100
From: Robin Jarry <robin.jarry@6wind.com>
Subject: Re: [PATCH v2 0/3] kbuild: fix host progs build with libs in non
 standard locations
Message-ID: <20180227205231.t2wmh4e2ky2ganyo@6wind.com>
References: <cover.1519393674.git.robin.jarry@6wind.com>
 <cover.1519668832.git.robin.jarry@6wind.com>
 <20180227174518.qzw6eqmuyggcvjl6@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180227174518.qzw6eqmuyggcvjl6@treble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

2018-02-27, Josh Poimboeuf:
> In Documentation/kbuild/kbuild.txt, we have the following environment
> variables:
> 
>   KCFLAGS
>   --------------------------------------------------
>   Additional options to the C compiler (for built-in and modules).
>   
>   CFLAGS_KERNEL
>   --------------------------------------------------
>   Additional options for $(CC) when used to compile
>   code that is compiled as built-in.
>   
>   CFLAGS_MODULE
>   --------------------------------------------------
>   Additional module specific options to use for $(CC).
>   
>   LDFLAGS_MODULE
>   --------------------------------------------------
>   Additional options used for $(LD) when linking modules.
>   
>   LDFLAGS_vmlinux
>   --------------------------------------------------
>   Additional options passed to final link of vmlinux.
> 
> So instead of
> 
>   HOST_CFLAGS
>   HOST_LDFLAGS
> 
> maybe it would be more consistent to call them
> 
>   CFLAGS_HOST
>   LDFLAGS_HOST
> 
> ?

I had missed this file. Indeed {C,LD}FLAGS_HOST are much less confusing!

> Also, the new environment variables should be documented in the above
> file.

Sure, I'll do that. However, I feel like I should also leave the
paragraph in Documentation/admin-guide/README.txt.

What do you think?

-- 
Robin
