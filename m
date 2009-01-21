Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.225]:40514 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757056AbZAUDtR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Jan 2009 22:49:17 -0500
Subject: Re: [git pull] m68k and m68knommu merge of includes
From: Harvey Harrison <harvey.harrison@gmail.com>
In-Reply-To: <497698D2.1050804@snapgear.com>
References: <200901210058.n0L0wjdf005545@localhost.localdomain>
	 <1232502275.5653.2.camel@brick>  <497698D2.1050804@snapgear.com>
Content-Type: text/plain
Date: Tue, 20 Jan 2009 19:49:14 -0800
Message-Id: <1232509755.9701.2.camel@brick>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: torvalds@linux-foundation.org, arnd@arndb.de, gerg@uclinux.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, sam@ravnborg.org, uclinux-dev@uclinux.org, zippel@linux-m68k.org

On Wed, 2009-01-21 at 13:38 +1000, Greg Ungerer wrote:
> > 
> > I think you need to check your arch/m68k/include/asm/swab.h as I get an
> > empty file when I pull this.  It looks like it needs a conditional 
> > include of swab_mm/swab_no similar to the other files.
> 
> Yes, something went wrong there...
> 
> 
> > Also, because of the byteorder changes, it looks like you don't need
> > a separate byteorder_mm/no as they both just include the generic
> > include/linux/byteorder/big_endian.h
> 
> Are you happy to just apply your follow up patch to fix these issues,
> after this has been pulled?

Sounds fine to me, hopefully Linus will just apply it right after he
pulls.

Harvey

