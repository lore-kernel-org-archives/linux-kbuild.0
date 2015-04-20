Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:43470 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754652AbbDTVRP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Apr 2015 17:17:15 -0400
Date: Mon, 20 Apr 2015 14:17:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/2] Integrate compiler-gcc[345].h files into
 compiler-gcc.h
Message-Id: <20150420141713.e8611fcb6336ece7b4e84967@linux-foundation.org>
In-Reply-To: <cover.1429212277.git.joe@perches.com>
References: <20150416162938.GU2366@two.firstfloor.org>
	<cover.1429212277.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>, Sasha Levin <levinsasha928@gmail.com>, Anton Blanchard <anton@samba.org>, Alan Modra <amodra@gmail.com>

On Thu, 16 Apr 2015 13:31:01 -0700 Joe Perches <joe@perches.com> wrote:

> Joe Perches (2):
>   compiler-gcc.h: Neatening
>   compiler-gcc: Integrate the various compiler-gcc[345].h files
> 

We have at least three support-three-gcc-6 patchsets floating about. 
Are we all happy with Joe's patchset?


I expect Andi's
http://ozlabs.org/~akpm/mmots/broken-out/lto-add-__noreorder-and-mark-initcalls-__noreorder.patch
will need to be updated in response, which is why I didn't merge it.
