Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42651 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753881AbcDVQw0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Apr 2016 12:52:26 -0400
Subject: Re: linux-next: Tree for Apr 22 (adjust_autoksyms.sh)
References: <20160422153503.24aa389e@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <571A56C4.7030907@infradead.org>
Date: Fri, 22 Apr 2016 09:52:20 -0700
MIME-Version: 1.0
In-Reply-To: <20160422153503.24aa389e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, nicolas.pitre@linaro.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On 04/21/16 22:35, Stephen Rothwell wrote:
> Hi all,
> 
> There will be no linux-next release on Monday (ANZAC Day).
> 
> Changes since 20160421:
> 

on x86_64:

I'm seeing:

/bin/sh: scripts/adjust_autoksyms.sh: No such file or directory
/local/lnx/next/linux-next-20160422/Makefile:937: recipe for target 'vmlinux' failed

when using O=subdir for the build output directory.


Is there a missing $(objtree) somewhere?

thanks,

-- 
~Randy
