Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43498 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756336AbdDRJ54 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Apr 2017 05:57:56 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1492149003-19136-2-git-send-email-yamada.masahiro@socionext.com>
References: <1492149003-19136-2-git-send-email-yamada.masahiro@socionext.com> <1492149003-19136-1-git-send-email-yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/2] kbuild: consolidate redundant sed script ASM offset generation
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28459.1492509473.1@warthog.procyon.org.uk>
Date: Tue, 18 Apr 2017 10:57:53 +0100
Message-ID: <28460.1492509473@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: dhowells@redhat.com, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Jan Beulich <JBeulich@novell.com>, Alexander van Heukelum <heukelum@fastmail.fm>, linux-kernel@vger.kernel.org

Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

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

There's a conflict between [1] and various assembly code formats.  Some
formats define, say,

	mov	4,r1

to move the number 4 into register r1, and:

	mov	(4),r1

to move the contents of the memory at address 4 into r1.  Therefore, you
cannot simply wrap numeric operands in brackets.  What might work is adding a
'+' on the front, e.g.:

	mov	+(4),r1

David
