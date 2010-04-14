Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40658 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754380Ab0DNN5j (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Apr 2010 09:57:39 -0400
Message-ID: <4BC5C9D0.20707@suse.cz>
Date: Wed, 14 Apr 2010 15:57:36 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] kconfig: add support to show hidden options which
 have prompts
References: <4BC539DD.5040003@cn.fujitsu.com>
In-Reply-To: <4BC539DD.5040003@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Li Zefan <lizf@cn.fujitsu.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kbuild@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>

On 14.4.2010 05:43, Li Zefan wrote:
> Usage:
>   (in menuconfig)
>   Press <Z> to show all config symbols which have prompts.
...
> Exmaple:
> 
>       --- Tracers
>       -*-   Kernel Function Tracer
>       - -     Kernel Function Graph Tracer
>       [*]   Interrupts-off Latency Tracer
>       - -   Preemption-off Latency Tracer
>       [*]   Sysprof Tracer
> 
> Here you can see 2 tracers are not selectable, and then can find
> out how to make them selectable.

This is really nice! Applied.

Michal

