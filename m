Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:58239 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1765875AbYDPTXT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Apr 2008 15:23:19 -0400
Date: Wed, 16 Apr 2008 22:23:12 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: RFC: run all userspace header through unifdef
Message-ID: <20080416192312.GQ1677@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

Facts:
- installing userspace headers is nothing normal users need
- unifdef is relatively fast
- we have sometimes patches moving headers from header-y to
  unifdef-y or the other way round

Any objections against dropping unifdef-y and simply running all headers 
through unifdef?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

