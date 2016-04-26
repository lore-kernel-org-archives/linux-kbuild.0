Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0173.hostedemail.com ([216.40.44.173]:38219 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751974AbcDZODf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 10:03:35 -0400
Date: Tue, 26 Apr 2016 10:03:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/2] localmodconfig: Fix parsing of Kconfig "source"
 statements
Message-ID: <20160426100329.7cb17a10@gandalf.local.home>
In-Reply-To: <20160408145902.GH29941@linux-rxt1.site>
References: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
	<20160408145902.GH29941@linux-rxt1.site>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: Benjamin Poirier <bpoirier@suse.com>, Michal Marek <mmarek@suse.cz>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 8 Apr 2016 22:59:02 +0800
joeyli <jlee@suse.com> wrote:

> On Sat, Apr 02, 2016 at 10:55:21AM -0700, Benjamin Poirier wrote:
> > The parameter of Kconfig "source" statements does not need to be quoted.
> > The current regex causes many kconfig files to be skipped and hence,
> > dependencies to be missed.
> > 
> > Also fix the whitespace repeat count.
> > 
> > Signed-off-by: Benjamin Poirier <bpoirier@suse.com>  
> 
> Tested-by: Lee, Chun-Yi <jlee@suse.com>
> 

Applied.

Thanks!

-- Steve
