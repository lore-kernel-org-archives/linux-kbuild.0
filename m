Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52539 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752255AbbDPUNq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 16:13:46 -0400
Message-ID: <553017F6.7080205@suse.cz>
Date: Thu, 16 Apr 2015 22:13:42 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Support gcc 6 for building
References: <1429127143-31745-1-git-send-email-andi@firstfloor.org> <552F6B7C.7020406@suse.cz> <20150416155626.GT2366@two.firstfloor.org>
In-Reply-To: <20150416155626.GT2366@two.firstfloor.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>

Dne 16.4.2015 v 17:56 Andi Kleen napsal(a):
> On Thu, Apr 16, 2015 at 09:57:48AM +0200, Michal Marek wrote:
>> Good idea. With the new scheme, we could also merge back compiler-gcc5.h
>> and compiler-gcc4.h. The only difference is the KASAN_ABI_VERSION define.
> 
> Would be fine too. Are you doing that, or should I send a patch?

I suggest to merge your patch now, so that the kernel can be built with
gcc 6 snapshots. I can send a follow-up patch.

Michal
