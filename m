Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57037 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751551AbdESKx2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 May 2017 06:53:28 -0400
Subject: Re: [PATCH] kbuild: simplify silent build (-s) detection
References: <1495168096-22440-1-git-send-email-yamada.masahiro@socionext.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <9f1d9a57-5447-c23a-156a-02e7cab2d29a@suse.com>
Date: Fri, 19 May 2017 12:53:25 +0200
MIME-Version: 1.0
In-Reply-To: <1495168096-22440-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2017-05-19 06:28, Masahiro Yamada wrote:
> This allows to detect -s option without checking GNU Make version.
> 
> As commit e36aaea28972 ("kbuild: Fix silent builds with make-4")
> pointed out, GNU Make 4.x changed the way/order it presents the
> command line options into MAKEFLAGS.
> 
> In Make 3.8x, 's' is always be the first in a group of short options.
> The group could be prefixed with '-'.
> 
> In Make 4.x, 's' is always the last in a group of short options.
> 
> As commit e6ac89fabd03 ("kbuild: Correctly deal with make options
> which contain an 's'") addressed, we also need to deal with long
> options that end with 's', like --warn-undefined-variables.
> 
> Test cases:
> 
> [1] command line input:    make --silent
>      -> MAKEFLAGS for Make 3.8x:    s
>      -> MAKEFLAGS for Make 4.x :    s
> 
> [2] command line input:    make -srR
>      -> MAKEFLAGS for Make 3.8x:    sRr
>      -> MAKEFLAGS for Make 4.x :    rRs
> 
> [3] command line input:    make -s -rR --warn-undefined-variables
>      -> MAKEFLAGS for Make 3.8x:    --warn-undefined-variables -sRr
>      -> MAKEFLAGS for Make 4.x :    rRs --warn-undefined-variables
> 
> We can take care of them, by filtering out long options (--%),
> then matching -s% s% %s patterns.

Good idea, that's a much cleaner way.

Michal
