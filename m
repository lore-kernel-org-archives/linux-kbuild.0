Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:40134 "EHLO
        one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752905AbeFHWSf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 18:18:35 -0400
Date: Fri, 8 Jun 2018 15:08:00 -0700
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] trace: fix SKIP_STACK_VALIDATION=1 build
Message-ID: <20180608220759.irqviu5g4a3w7nms@two.firstfloor.org>
References: <20180608214746.136554-1-gthelen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180608214746.136554-1-gthelen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Thelen <gthelen@google.com>
Cc: Andi Kleen <andi@firstfloor.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

On Fri, Jun 08, 2018 at 02:47:46PM -0700, Greg Thelen wrote:
> Non gcc-5 builds with CONFIG_STACK_VALIDATION=y and
> SKIP_STACK_VALIDATION=1 fail.
> Example output:
>   /bin/sh: init/.tmp_main.o: Permission denied
> 
> commit 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace"),
> added a mismatched endif.  This causes cmd_objtool to get mistakenly
> set.
> 
> Relocate endif to balance the newly added -record-mcount check.
> 
> Fixes: 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace")
> Signed-off-by: Greg Thelen <gthelen@google.com>

Looks good thanks.

Acked-by: Andi Kleen <ak@linux.intel.com>

-Andi
