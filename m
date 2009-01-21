Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.172]:50000 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752273AbZAUBoi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Jan 2009 20:44:38 -0500
Subject: Re: [git pull] m68k and m68knommu merge of includes
From: Harvey Harrison <harvey.harrison@gmail.com>
In-Reply-To: <200901210058.n0L0wjdf005545@localhost.localdomain>
References: <200901210058.n0L0wjdf005545@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 20 Jan 2009 17:44:35 -0800
Message-Id: <1232502275.5653.2.camel@brick>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: torvalds@linux-foundation.org, arnd@arndb.de, gerg@uclinux.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, sam@ravnborg.org, uclinux-dev@uclinux.org, zippel@linux-m68k.org

On Wed, 2009-01-21 at 10:58 +1000, Greg Ungerer wrote:
> Hi Linus,
> 
> Please consider pulling this merge of the m68k and m68knommu include files.
> It comepletely moves include/asm-m68k to arch/m68k/include as part of the
> process, and ultimately results in both m68k and m68knommu arch code using
> the same set of includes. More cleanup can follow, but this is the
> necessary first step.
> 
> Thanks
> Greg

I think you need to check your arch/m68k/include/asm/swab.h as I get an
empty file when I pull this.  It looks like it needs a conditional 
include of swab_mm/swab_no similar to the other files.

Also, because of the byteorder changes, it looks like you don't need
a separate byteorder_mm/no as they both just include the generic
include/linux/byteorder/big_endian.h

Cheers,

Harvey

