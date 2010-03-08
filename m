Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from queueout03-winn.ispmail.ntl.com ([81.103.221.33]:18014 "EHLO
	queueout03-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753530Ab0CHJj3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Mar 2010 04:39:29 -0500
From: Ian Campbell <ijc@hellion.org.uk>
In-Reply-To: <20100307213023.GB3794@viiv.ffwll.ch>
References: <1267784461.11737.37000.camel@zakaz.uk.xensource.com>
	 <4B9416A7.203@suse.cz>  <20100307213023.GB3794@viiv.ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Mar 2010 09:34:09 +0000
Message-ID: <1268040849.11737.53867.camel@zakaz.uk.xensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: Patch eb8f844c "kbuild: specify absolute paths for cscope"
 breaks cscope use on NFS mounted source tree
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Michal Marek <mmarek@suse.cz>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org

On Sun, 2010-03-07 at 22:30 +0100, Daniel Vetter wrote:
> On Sun, Mar 07, 2010 at 10:12:07PM +0100, Michal Marek wrote:
> > Daniel, how do we proceed here? Would
> > $ make O=. cscope
> > plus maybe a comment suggesting this, be an acceptable workaround for
> > your use case (which was running vim from within a subdirectory, IIRC).
> 
> If this hack bites other people, just revert it and declare vim broken.
> $ make O=. cscope
> works as a workaround.
> 
> Pardon for the fuss, Daniel

Thanks Daniel, much appreciated.

Ian.

-- 
Ian Campbell

Alea iacta est.
	[The die is cast]
		-- Gaius Julius Caesar

