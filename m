Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e9.ny.us.ibm.com ([32.97.182.139]:41744 "EHLO e9.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751168AbZIHWJk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Sep 2009 18:09:40 -0400
Date: Tue, 8 Sep 2009 15:09:43 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Odd Kconfig output..
Message-ID: <20090908220943.GJ6753@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <12284.1252155974@turing-police.cc.vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12284.1252155974@turing-police.cc.vt.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valdis.Kletnieks@vt.edu
Cc: Roman Zippel <zippel@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Sat, Sep 05, 2009 at 09:06:14AM -0400, Valdis.Kletnieks@vt.edu wrote:
> Saw this while doing  a 'make oldconfig' moving from -mmotm0827 to -mmotm0903:
> 
> RCU Implementation
> > 1. Tree-based hierarchical RCU (TREE_RCU)
>   2. Preemptable tree-based hierarchical RCU (TREE_PREEMPT_RCU) (NEW)
> choice[1-2]: ?
> 
> There is no help available for this kernel option.
> Prompt: RCU Implementation
>   Defined at init/Kconfig:329
>   Location:
>     -> General setup
>       -> RCU Subsystem
>   Selected by: m [=m]
> 
> Where did that 'Selected by:' come from? Or is that just an artifact of
> the way Kconfig implements 'choice'?

Many of the architectures use a "select" clause for RCU, usually
selecting CLASSIC_RCU.  Could that be the issue?

							Thanx, Paul
