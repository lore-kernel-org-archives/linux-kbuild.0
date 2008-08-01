Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:44856 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751388AbYHATXX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Aug 2008 15:23:23 -0400
Date: Fri, 1 Aug 2008 22:22:20 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: annoying "trying to assign nonexistent symbol" warnings
Message-ID: <20080801192220.GB19682@cs181140183.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zippel@linux-m68k.org, sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

Now that defconfig became less chatty the "trying to assign nonexistent symbol"
warnings become annoying: They are in practice not avoidable and give a 
false impression that something would have gone wrong.

If anyone already knows where to touch the code for disabling these 
warnings for defconfigs that would be appreciated, otherwise I'll cook
up a patch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

