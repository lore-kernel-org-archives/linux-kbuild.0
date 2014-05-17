Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:45053 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756087AbaEQIcD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 17 May 2014 04:32:03 -0400
Date: Sat, 17 May 2014 10:31:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 8/8] Kbuild: add inline-account tool to find inline bloat
Message-ID: <20140517083144.GA16691@ravnborg.org>
References: <1400276595-6965-1-git-send-email-andi@firstfloor.org>
 <1400276595-6965-9-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400276595-6965-9-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, linux-kbuild@vger.kernel.org, mmarek@suse.cz

Hi Andi.

On Fri, May 16, 2014 at 02:43:15PM -0700, Andi Kleen wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> Add a tool to hunt for inline bloat. It uses objdump -S to account
> inlines.
I tried this on my sparc32 build - but it failed with:
objdump: can't disassemble for architecture UNKNOWN!

It looks simple to add CROSS_COMPILE support but I did not do so.
My python skills are non-existing.

	Sam
