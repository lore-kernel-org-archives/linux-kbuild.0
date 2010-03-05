Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mtaout03-winn.ispmail.ntl.com ([81.103.221.49]:45018 "EHLO
	mtaout03-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754820Ab0CEKVR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Mar 2010 05:21:17 -0500
From: Ian Campbell <ijc@hellion.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 05 Mar 2010 10:21:01 +0000
Message-ID: <1267784461.11737.37000.camel@zakaz.uk.xensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Patch eb8f844c "kbuild: specify absolute paths for cscope" breaks
 cscope use on NFS mounted source tree
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, mmarek@suse.cz

I keep my kernel source tree on a more powerful build box where I run my
builds etc (including "make cscope") but run my editor from my
workstation with an NFS mount to the source. This worked fine for me
using relative paths for cscope. Using absolute paths in cscope breaks
this previously working setup because the root path is not the same on
both systems. I guess this is similar to moving the source tree around.

Without wanting to start a flamewar it really sounds to me like we are
working around a vim (or cscope) bug here, emacs with cscope bindings
works fine in this configuration.

Could we at least have an option to allow both variants to work? Would
setting "make O=$(pwd) cscope" (where pwd is the source tree) not have
provided a workaround for people who needed absolute paths for whatever
reason?

Ian.
-- 
Ian Campbell
Current Noise: Testament - D.N.R. (Do Not Resuscitate)

What do you give a man who has everything?  Penicillin.
		-- Jerry Lester

