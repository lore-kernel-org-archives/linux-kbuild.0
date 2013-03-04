Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from two.firstfloor.org ([193.170.194.197]:37521 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758558Ab3CDSKB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Mar 2013 13:10:01 -0500
Date: Mon, 4 Mar 2013 19:02:16 +0100
From: Andi Kleen <andi@firstfloor.org>
Subject: make ctags with separate build dirs
Message-ID: <20130304180216.GI3401@two.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


I usually use separate build dirs. For make ctags in the main source
directory the dependecies always want to create all kinds of
infrastructure and set up up the config, polluting the source dir.
For make cscope it doesn't do that.

Could make ctags be fixed to not do that?

Thanks,

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
