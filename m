Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:59401 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754056AbYDYS7F (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Apr 2008 14:59:05 -0400
Date: Fri, 25 Apr 2008 20:59:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] kbuild doc: move smart-config.txt to Doc/kbuild/
Message-ID: <20080425185908.GC10902@uranus.ravnborg.org>
References: <20080303150105.d8f68bc1.randy.dunlap@oracle.com> <20080303153203.22c52d98.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080303153203.22c52d98.randy.dunlap@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Mar 03, 2008 at 03:32:03PM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> I'm trying to clean up some of the Documentation diretory.
> What do you think about this one?
> 
> Move smart-config.txt to Documentation/kbuild/ since it is
> build/config-related.

I think we should delete it - everything is outdated by now.
Will you do this as part of your regular Documentation
patches?

	Sam
