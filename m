Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.it.da.ut.ee ([193.40.5.66]:46287 "EHLO smtp1.it.da.ut.ee"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751222Ab0BWLdu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Feb 2010 06:33:50 -0500
Date: Tue, 23 Feb 2010 13:33:48 +0200 (EET)
From: Meelis Roos <mroos@linux.ee>
Subject: Re: CROSS_COMPILE not taken into account on parisc64?
In-Reply-To: <4B83B9C2.8040500@suse.cz>
Message-ID: <alpine.SOC.1.00.1002231333290.23172@math.ut.ee>
References: <alpine.SOC.1.00.1002231008460.18041@math.ut.ee> <4B83B9C2.8040500@suse.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-parisc@vger.lernel.org, linux-kbuild@vger.kernel.org

> I guess this objcopy command is run outside of the kernel build system
> (a packaging script storing debug info in /usr/lib/debug), nothing the
> kernel makefiles can do about.

Thanks - my bad that I didn't notice this.

-- 
Meelis Roos (mroos@linux.ee)
