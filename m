Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:42444 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755769AbaG3TBD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Jul 2014 15:01:03 -0400
Date: Wed, 30 Jul 2014 21:00:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] Kbuild: Add a option to enable dwarf4 v2
Message-ID: <20140730190059.GB11217@ravnborg.org>
References: <1406746219-15427-1-git-send-email-andi@firstfloor.org>
 <1406746219-15427-2-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1406746219-15427-2-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

On Wed, Jul 30, 2014 at 08:50:19PM +0200, Andi Kleen wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> I found that a lot of unresolvable variables when using gdb on the kernel
> become resolvable when dwarf4 is enabled. So add a Kconfig flag to enable it.
> 
> It definitely increases the debug information size, but on the other
> hand this isn't so bad when debug fusion is used.
> 
> v2: Use cc-option
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
