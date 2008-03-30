Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:45269 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751554AbYC3SBb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 30 Mar 2008 14:01:31 -0400
Date: Sun, 30 Mar 2008 21:01:19 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: wish: build time warning for missing MODULE_LICENSE
Message-ID: <20080330180119.GC1575@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rusty@rustcorp.com.au, sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

I just fixed a bug where I had accidentally removed a MODULE_LICENSE() 
from a file.

The problem is that such bugs are currently not discovered until someone 
actually runs a kernel with this module loaded.

Could we get a build time warning/error for a missing MODULE_LICENSE?

TIA
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

