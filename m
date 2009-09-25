Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:49719 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202AbZIYEjC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Sep 2009 00:39:02 -0400
Date: Fri, 25 Sep 2009 06:39:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch] powerpc: build modules outside the kernel tree fails,
	if it was built using O=
Message-ID: <20090925043902.GA2484@merkur.ravnborg.org>
References: <4ABB57CB.3000409@ru.mvista.com> <1253841141.7103.489.camel@pasglop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1253841141.7103.489.camel@pasglop>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Yuri Frolov <yfrolov@ru.mvista.com>, linuxppc-dev@lists.ozlabs.org, rep.dot.nop@gmail.com, linux-kbuild@vger.kernel.org

On Fri, Sep 25, 2009 at 11:12:21AM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2009-09-24 at 15:28 +0400, Yuri Frolov wrote:
> > Hello,
> > 
> > here is a corresponding bug: http://bugzilla.kernel.org/show_bug.cgi?id=11143
> > This patch should correctly export crtsavres.o in order to make O= option working.
> > Please, consider to apply.
> > 
> > 
> > Fix linking modules against crtsavres.o
> 
> Hi !
> 
> This is the same patch you already posted as "
> 
> 
> [PATCH] Fix linking modules against
> crtsavres.o
> "
> 
> Or it's an update ?
> 
> I've asked Sam to review it already since it affects the main kernel
> makefiles, waiting for his answer.
Saw the duplicates. Will get back to it tonight (morning here now).

	Sam
