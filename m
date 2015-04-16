Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41111 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752251AbbDPH5v (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 03:57:51 -0400
Message-ID: <552F6B7C.7020406@suse.cz>
Date: Thu, 16 Apr 2015 09:57:48 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Support gcc 6 for building
References: <1429127143-31745-1-git-send-email-andi@firstfloor.org>
In-Reply-To: <1429127143-31745-1-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>

On 2015-04-15 21:45, Andi Kleen wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> gcc recently switched to a new version number scheme, where every version
> gets a new major version number. The current version is 5.x, the next 6.x, etc.
> 
> The gcc git repository trunk branch just switched to report 6.x for the next
> major release.
> 
> This breaks the way Linux selects compiler-gccX.h based on the major
> version. Every new version would require adding a new compiler-gccX.h file,
> which wouldn't really scale.
> 
> Let's assume that future gccs are fairly compatible (they are unlikely
> to break anything Linux is relying on). So we can just keep using
> compiler-gcc5.h, and select any specific differences with #if.

Good idea. With the new scheme, we could also merge back compiler-gcc5.h
and compiler-gcc4.h. The only difference is the KASAN_ABI_VERSION define.

Michal
