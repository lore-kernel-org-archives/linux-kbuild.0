Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33412 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752365AbdI0XYT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Sep 2017 19:24:19 -0400
Date: Wed, 27 Sep 2017 18:24:15 -0500
From: Richard Kuo <rkuo@codeaurora.org>
Subject: Re: [PATCH] hexagon: get rid of #include <generated/compile.h>
Message-ID: <20170927232415.GB5939@codeaurora.org>
References: <1505920670-8290-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505920670-8290-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-hexagon@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org

On Thu, Sep 21, 2017 at 12:17:50AM +0900, Masahiro Yamada wrote:
> <generated/compile.h> is created (or updated) when Kbuild descends
> into the init/ directory.  In parallel building from a pristine
> source tree, there is no guarantee <generated/compile.h> exists when
> arch/hexagon/kernel/ptrace.c is compiled.
> 
> For hexagon architecture, we know UTS_MACHINE is a fixed string
> "hexagon", so let's hard-code it, like many architectures do.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/hexagon/kernel/ptrace.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Richard Kuo <rkuo@codeaurora.org>


-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, 
a Linux Foundation Collaborative Project
