Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60382 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754377AbdJIQbr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 12:31:47 -0400
Date: Mon, 9 Oct 2017 11:31:42 -0500
From: Richard Kuo <rkuo@codeaurora.org>
Subject: Re: [PATCH] hexagon: get rid of #include <generated/compile.h>
Message-ID: <20171009163142.GA19621@codeaurora.org>
References: <1505920670-8290-1-git-send-email-yamada.masahiro@socionext.com>
 <20170927232415.GB5939@codeaurora.org>
 <CAK7LNAQaGd5h5OHe5ArXV=wms07Zpd4OBPLrPYwZ68KpbjeGcQ@mail.gmail.com>
 <CAK7LNARd6ovx=qmny1micPx7BUXf9uL9soES_OcotF-bYCCQWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARd6ovx=qmny1micPx7BUXf9uL9soES_OcotF-bYCCQWw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-hexagon@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Oct 09, 2017 at 11:25:28PM +0900, Masahiro Yamada wrote:
> >>
> >
> > How should this patch be handled?
> >
> 
> I checked
> git://git.kernel.org/pub/scm/linux/kernel/git/rkuo/linux-hexagon-kernel.git
> 
> I could not see any patch applied to the tree since last year.
> 
> Assuming the tree is unmaintained, I am picking this patch to Kbuild tree.
> 
> 
> 
> Applied to linux-kbuild/kbuild with Rechard's Acked.
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada


Sorry about that.  For the record I'm fine with these patches going up
some of the other trees, like trivial or kbuild.  Might go faster that way.


Thanks,
Richard Kuo




-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, 
a Linux Foundation Collaborative Project
