Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:59595 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbYLQH04 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Dec 2008 02:26:56 -0500
Date: Wed, 17 Dec 2008 08:28:23 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: next-20081216 - powerpc link error 'dynreloc miscount'
Message-ID: <20081217072823.GB3551@uranus.ravnborg.org>
References: <20081216223754.0c8e21d4.sfr@canb.auug.org.au> <20081217070858.GA7424@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081217070858.GA7424@linux.vnet.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org, mel@csn.ul.ie, linux-kbuild@vger.kernel.org

On Wed, Dec 17, 2008 at 12:38:58PM +0530, Kamalesh Babulal wrote:
> Hi,
> 	next-20081216 build breaks on powerpc
> 
> ld: dynreloc miscount for kernel/built-in.o, section .opd
> ld: can not edit opd Bad value
> make: *** [vmlinux.o] Error 1

Could it be this:

     http://sourceware.org/ml/binutils/2005-10/msg00334.html

	Sam
