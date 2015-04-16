Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:60580 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753527AbbDPQ3k (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 12:29:40 -0400
Date: Thu, 16 Apr 2015 18:29:38 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] Support gcc 6 for building
Message-ID: <20150416162938.GU2366@two.firstfloor.org>
References: <1429127143-31745-1-git-send-email-andi@firstfloor.org>
 <552F6B7C.7020406@suse.cz>
 <20150416155626.GT2366@two.firstfloor.org>
 <1429201390.2850.54.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1429201390.2850.54.camel@perches.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>, Sasha Levin <levinsasha928@gmail.com>

> As compiler-gcc3.h is trivial, what about integrating
> the whole thing into a single file and get rid of the
> compiler-gcc<version>.h files?

I think that's the right thing to do yes.

-Andi
