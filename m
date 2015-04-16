Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:54522 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752161AbbDPDEx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Apr 2015 23:04:53 -0400
Date: Wed, 15 Apr 2015 22:04:24 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] Support gcc 6 for building
Message-ID: <20150416030424.GA10141@gate.crashing.org>
References: <1429127143-31745-1-git-send-email-andi@firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1429127143-31745-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: akpm@linux-foundation.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

On Wed, Apr 15, 2015 at 12:45:43PM -0700, Andi Kleen wrote:
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
> 
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>

Tested-by: Segher Boessenkool <segher@kernel.crashing.org>

This works fine, thanks,


Segher
