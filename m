Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:57262 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752781AbbEHNr5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 May 2015 09:47:57 -0400
Date: Fri, 8 May 2015 15:47:51 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] builddeb: fix stripped module signatures if
 CONFIG_DEBUG_INFO and CONFIG_MODULE_SIG_ALL are set
Message-ID: <20150508134751.GA19652@gluino>
References: <1426494054-32138-1-git-send-email-andrej.skvortzov@gmail.com>
 <55365798.4090302@suse.cz>
 <20150422155700.GD32026@gluino>
 <20150504153724.GA26392@nest>
 <554A1774.6080801@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <554A1774.6080801@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Andrey Skvortsov <Andrej.Skvortzov@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Michal,

On Wed, May 06, 2015 at 03:30:28PM +0200, Michal Marek wrote:
> 
> I applied the patch to kbuild.git#misc now, after fixing the whitespace.
> Andrey, please use tabs for indentation, especially when the surrounding
> code is already using this style.

please apply this arm thingy too:

- [PATCHv4 1/1] deb-pkg: Add device tree blobs to the package
  reviewed by ben and acked by me.
  20150203121648.046396044@rtp-net.org

 
thanks,

-- 
maks
