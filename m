Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:35005 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751463AbdDNQvI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Apr 2017 12:51:08 -0400
Received: by mail-pf0-f180.google.com with SMTP id i5so42659700pfc.2
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Apr 2017 09:51:07 -0700 (PDT)
Date: Fri, 14 Apr 2017 09:51:05 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 1/2] kbuild: consolidate redundant sed script ASM offset
 generation
Message-ID: <20170414165105.GJ28657@google.com>
References: <1492149003-19136-1-git-send-email-yamada.masahiro@socionext.com>
 <1492149003-19136-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1492149003-19136-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Jan Beulich <JBeulich@novell.com>, Alexander van Heukelum <heukelum@fastmail.fm>, linux-kernel@vger.kernel.org

El Fri, Apr 14, 2017 at 02:50:02PM +0900 Masahiro Yamada ha dit:

> This part ended up in redundant code after touched by multiple
> people.
> 
> [1] Commit 3234282f33b2 ("x86, asm: Fix CFI macro invocations to
> deal with shortcomings in gas") added parentheses for defined
> expressions to support old gas for x86.
> 
> [2] Commit a22dcdb0032c ("x86, asm: Fix ancient-GAS workaround")
> split the pattern into two to avoid parentheses for non-numeric
> expressions.
> 
> [3] Commit 95a2f6f72d37 ("Partially revert patch that encloses
> asm-offset.h numbers in brackets") removed parentheses from numeric
> expressions as well because parentheses in MN10300 assembly have a
> special meaning (pointer access).
> 
> Apparently, there is a conflict between [1] and [3].  After all,
> [3] took precedence, and a long time has passed since then.
> 
> Now, merge the two patterns again because the first one is covered
> by the other.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Thanks

Matthias
