Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:48464 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754976AbbDVQGa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2015 12:06:30 -0400
Date: Wed, 22 Apr 2015 17:57:00 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] builddeb: fix stripped module signatures if
 CONFIG_DEBUG_INFO and CONFIG_MODULE_SIG_ALL are set
Message-ID: <20150422155700.GD32026@gluino>
References: <1426494054-32138-1-git-send-email-andrej.skvortzov@gmail.com>
 <55365798.4090302@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55365798.4090302@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 21, 2015 at 03:58:48PM +0200, Michal Marek wrote:
> (added Max to Cc)
> 
> On 2015-03-16 09:20, Andrey Skvortsov wrote:
> > If CONFIG_MODULE_SIG_ALL is set, then user expects that all modules are
> > automatically signed in the result package, as it's for rpm-pkg, binrpm-pkg,
> > tar, tar-*. For deb-pkg this is correct only if CONFIG_DEBUG_INFO
> > is NOT set. In that case deb-package contains signed modules.
> > 
> > But if CONFIG_DEBUG_INFO is set, builddeb creates separate package with
> > debug information. To do that, debug information from all modules
> > is copied into separate files by objcopy. And loadable kernel modules are
> > stripped afterwards. Stripping removes previously (during modules_install)
> > added signatures from loadable kernel modules. Therefore final deb-package
> > contains unsigned modules despite of set option CONFIG_MODULE_SIG_ALL.
> > 
> > This patch resigns all stripped modules if CONFIG_MODULE_SIG_ALL is set
> > to solve this problem.
> > 
> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> 
> Max, Ben, are you fine with this patch? It looks OK to me, the
> modules_sign target has been added for this very purpose.
> 

Ben seems busy with the release, so jumping in. The patch looks
perfect to me.

Acked-by: maximilian attems <max@stro.at>

