Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:54261 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752658Ab0DOH1g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Apr 2010 03:27:36 -0400
Message-ID: <4BC6C043.5070504@cn.fujitsu.com>
Date: Thu, 15 Apr 2010 15:29:07 +0800
From: Li Zefan <lizf@cn.fujitsu.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] kconfig: add support to show hidden options which
 have prompts
References: <4BC539DD.5040003@cn.fujitsu.com> <20100414160043.7ffb1109.randy.dunlap@oracle.com>
In-Reply-To: <20100414160043.7ffb1109.randy.dunlap@oracle.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>

>> Exmaple:
>>
>>       --- Tracers
>>       -*-   Kernel Function Tracer
>>       - -     Kernel Function Graph Tracer
>>       [*]   Interrupts-off Latency Tracer
>>       - -   Preemption-off Latency Tracer
>>       [*]   Sysprof Tracer
>>
>> Here you can see 2 tracers are not selectable, and then can find
>> out how to make them selectable.
>>
>> I also add this support for gconfig, but haven't done for xconfig.
>>
>> btw: are there many users using gconfig/xconfig today ?
> 
> I use xconfig quite a bit, but only use gconfig for making sure that
> it still works or displays a menu tree correctly.
> 

Ok, I wanted to make sure it worth effort to working on gconf/xconf.
(I always use menuconfig.)
