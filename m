Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:37832 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1759779Ab1D2QN5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 12:13:57 -0400
Received: from static-50-53-38-135.bvtn.or.frontiernet.net ([50.53.38.135] helo=chimera.site)
	by box742.bluehost.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69)
	(envelope-from <rdunlap@xenotime.net>)
	id 1QFqKK-0007nR-GV
	for linux-kbuild@vger.kernel.org; Fri, 29 Apr 2011 10:13:56 -0600
Date: Fri, 29 Apr 2011 09:10:58 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Message-Id: <20110429091058.d5d9fd54.rdunlap@xenotime.net>
In-Reply-To: <20110429131940.4f4c938f.sfr@canb.auug.org.au>
References: <20110429131940.4f4c938f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: linux-next: Tree for April 29 (uml build issue)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuiild@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 29 Apr 2011 13:19:40 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110428:


My uml builds fail with:

  GEN     linux-next-20110429/UM64/Makefile
scripts/kconfig/conf --silentoldconfig arch/um/Kconfig.x86
  CC      arch/um/sys-x86_64/user-offsets.s
  GEN     linux-next-20110429/UM64/Makefile
linux-next-20110429/scripts/Makefile.asm-generic:9: linux-next-20110429/arch/um/include/asm/Kbuild: No such file or directory
make[2]: *** No rule to make target `linux-next-20110429/arch/um/include/asm/Kbuild'.  Stop.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
