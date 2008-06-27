Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:47805 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755345AbYF0NEt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Jun 2008 09:04:49 -0400
Date: Fri, 27 Jun 2008 16:02:36 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: a.out.h userspace headers not present with O=
Message-ID: <20080627130236.GD18644@cs181140183.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Commit e53d6a152793a38aa334d6f7a4850642ae45cedc
(Export <linux/a.out.h> to userspace again.)
does not work properly when using O= :

<--  snip  -->

linux-2.6.26-rc8$ make O=../out headers_install
...
linux-2.6.26-rc8$ find usr -name a.out.h
linux-2.6.26-rc8$ 

<--  snip  -->

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

