Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:8873 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750771AbZISBxi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Sep 2009 21:53:38 -0400
Message-ID: <4AB439A3.2050809@linux.intel.com>
Date: Sat, 19 Sep 2009 03:53:39 +0200
From: Andi Kleen <ak@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [patch 15/18] kbuild: check if linker supports the -X option
References: <200909181949.n8IJnZ7g019298@imap1.linux-foundation.org>
In-Reply-To: <200909181949.n8IJnZ7g019298@imap1.linux-foundation.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, andi@firstfloor.org

akpm@linux-foundation.org wrote:
> From: Andi Kleen <andi@firstfloor.org>
> 
> The new alternative `gold' linker in recent binutils doesn't support the
> -X option.  This breaks allyesconfig builds that have
> CONFIG_STRIP_ASM_SYMS enabled.  Check if the linker really supports the
> option using ld-option.

I sent Sam an updated version of that patch and the "Fix ld-option to really work"
patch.

-Andi
