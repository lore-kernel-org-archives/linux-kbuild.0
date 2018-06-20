Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:41096 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933422AbeFTVf7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jun 2018 17:35:59 -0400
Received: by mail-pl0-f68.google.com with SMTP id w8-v6so461587ply.8
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jun 2018 14:35:59 -0700 (PDT)
Date: Wed, 20 Jun 2018 14:35:57 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] trace: fix SKIP_STACK_VALIDATION=1 build
In-Reply-To: <20180608214746.136554-1-gthelen@google.com>
Message-ID: <alpine.DEB.2.21.1806201435430.255247@chino.kir.corp.google.com>
References: <20180608214746.136554-1-gthelen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Thelen <gthelen@google.com>
Cc: Andi Kleen <andi@firstfloor.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

On Fri, 8 Jun 2018, Greg Thelen wrote:

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

Tested-by: David Rientjes <rientjes@google.com>
