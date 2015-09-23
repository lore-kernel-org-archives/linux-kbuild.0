Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36377 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755360AbbIWPxP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2015 11:53:15 -0400
Date: Wed, 23 Sep 2015 17:53:13 +0200
From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: [PATCH] kbuild: document recursive dependency limitation /
 resolution
Message-ID: <20150923155313.GE18173@wotan.suse.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <1438775840.30717.46.camel@tiscali.nl>
 <20150810185705.GX30479@wotan.suse.de>
 <1441281409.2439.96.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441281409.2439.96.camel@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, mmarek@suse.com, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, herbert@gondor.apana.org.au, tiwai@suse.de, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc

On Thu, Sep 03, 2015 at 01:56:49PM +0200, Paul Bolle wrote:
> Hi Luis,
> 
> (This landed in my Inbox when I was away from keyboard for a few weeks.
> And then I dragged my feet a bit in answering this. Sorry about that.)

No worries I will note that I try to be as thorough so sadly this can go on
forever... I've taken your feedback and placed it first to explain *why* this
happens, then I added another subsection explaining one practical ramification
of such issue. Lastly I've exanded the patch with some homework for folks to
consider.

  Luis
