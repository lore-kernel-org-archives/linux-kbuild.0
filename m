Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:60177 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752013Ab0CWLjD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Mar 2010 07:39:03 -0400
Message-ID: <4BA8A855.8040600@suse.cz>
Date: Tue, 23 Mar 2010 12:39:01 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: recalc symbol value before showing search results
References: <4BA3206B.9020405@cn.fujitsu.com>
In-Reply-To: <4BA3206B.9020405@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Li Zefan <lizf@cn.fujitsu.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 19.3.2010 07:57, Li Zefan wrote:
> A symbol's value won't be recalc-ed until we save config file or
> enter the menu where the symbol sits.
> 
> So If I enable OPTIMIZE_FOR_SIZE, and search FUNCTION_GRAPH_TRACER:
> 
>   Symbol: FUNCTION_GRAPH_TRACER [=y]
>   Prompt: Kernel Function Graph Tracer
>     Defined at kernel/trace/Kconfig:140
>     Depends on: ... [=y] && (!X86_32 [=y] || !CC_OPTIMIZE_FOR_SIZE [=y])
>     ...
> 
> From the dependency it should result in FUNCTION_GRAPH_TRACER=n,
> but it still shows FUNCTION_GRAPH_TRACER=y.
> 
> Signed-off-by: Li Zefan <lizf@cn.fujitsu.com>

Nice, applied.

Michal
