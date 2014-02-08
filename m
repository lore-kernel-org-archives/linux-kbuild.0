Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ud10.udmedia.de ([194.117.254.50]:57649 "EHLO
	mail.ud10.udmedia.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751488AbaBHSBJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Feb 2014 13:01:09 -0500
Date: Sat, 8 Feb 2014 19:01:07 +0100
From: Markus Trippelsdorf <markus@trippelsdorf.de>
Subject: Re: [PATCH 4/6] kbuild: Support padding in kallsyms tables
Message-ID: <20140208180107.GC401@x4>
References: <1391845840-28514-1-git-send-email-ak@linux.intel.com>
 <1391845840-28514-4-git-send-email-ak@linux.intel.com>
 <20140208121241.GA401@x4>
 <20140208174645.GH12219@tassilo.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140208174645.GH12219@tassilo.jf.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: mmarek@suse.cz, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 2014.02.08 at 09:46 -0800, Andi Kleen wrote:
> > With attached config I get:
> > 
> >   KSYM    .tmp_kallsyms2.o
> > kallsyms: address pointers padding too short: 24495 missing
> >   OBJCOPY .tmp_kallsyms2.bin
> >   PATCHFILE vmlinux
> > Not enough padding in vmlinux for new kallsyms, missing 192120
> > Makefile:840: recipe for target 'vmlinux' failed
> 
> Nice test case thanks.  This should fix it.

Yes. The build completes successfully now.
Thanks.

-- 
Markus
