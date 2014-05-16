Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:44694 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1757072AbaEPKcE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 May 2014 06:32:04 -0400
Date: 16 May 2014 06:32:02 -0400
Message-ID: <20140516103202.11272.qmail@ns.horizon.com>
From: "George Spelvin" <linux@horizon.com>
Subject: Re: [PATCH] Documentation/kbuild/makefiles.txt: Improve description of lib-* targets
In-Reply-To: <20140516101433.GB10187@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rdunlap@infradead.org, sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, linux@horizon.com, mmarek@suse.cz, yann.morin.1998@free.fr

>> On 05/10/2014 10:02 PM, George Spelvin wrote:
>>> -	For consistency, objects listed in lib-m will be included in lib.a.
>>> +
>>> +	For consistency, objects listed in lib-m will be included
>>> +	in lib.a, but this will probably not do what you want.

Sam Ravneborg wrote:
> So maybe we should catch this and error out?

Given my current poor state of knowledge, that does indeed seem
like a better solution; I can't imagine a situation where the current
behavior is useful.

But can we not stall a straightforward and harmless documentation
upgrade waiting for a more ambitious solution?  A significant
change to kbuild like that is going to trigger a (beneficial, but
slow) wave of bug reports and Kconfig/Makefile fixes.

