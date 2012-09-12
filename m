Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:52091 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759646Ab2ILDQx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 11 Sep 2012 23:16:53 -0400
Date: Wed, 12 Sep 2012 05:16:46 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: make tar*-pkg considered dangerous
Message-ID: <20120912031646.GV16230@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org


Hi,

We've had some incidents with people destroying Fedore 17 installs
(to the point of reinstall) by installing a kernel tarball generated with 
make tar*-pkg

The problem is that the tarball includes /lib/{modules,firmware},
but on FC17 /lib is a symlink. tar when it unpacks the tarball
replaces the symlink with the directory. So they end up
with a /lib which only contains the new kernel files, but nothing else,

And then the system doesn't boot anymore.

I'm not sure there is a good fix for this. I don't know of a way to
convince tar to not do that. And putting everything into /usr 
would be very incompatible.

Disable these make targets or add warnings?  If disabling people should
use rpms or dpkgs instead?

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
