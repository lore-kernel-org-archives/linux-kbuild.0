Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pqueueb.post.tele.dk ([193.162.153.10]:36883 "EHLO
	pqueueb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753411Ab0DVRPr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Apr 2010 13:15:47 -0400
Received: from pfepb.post.tele.dk (pfepb.post.tele.dk [195.41.46.236])
	by pqueueb.post.tele.dk (Postfix) with ESMTP id C1FBE83F9
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Apr 2010 18:46:02 +0200 (CEST)
Date: Thu, 22 Apr 2010 18:45:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Set INSTALL_HDR_PATH on command line
Message-ID: <20100422164541.GB22382@merkur.ravnborg.org>
References: <1271921008.5866.16.camel@needafix>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1271921008.5866.16.camel@needafix>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonas Bonn <jonas@southpole.se>
Cc: linux-kbuild@vger.kernel.org

On Thu, Apr 22, 2010 at 09:23:28AM +0200, Jonas Bonn wrote:
> In the toplevel Linux Makefile, INSTALL_HDR_PATH is hardcoded as
> follows:
> 
> # Kernel headers
> 
> #Default location for installed headers
> export INSTALL_HDR_PATH = $(objtree)/usr
> 
> Should this not be done with ?= so that the install path can be
> overridden on the command line?
> 
> export INSTALL_HDR_PATH ?= $(objtree)/usr

What you can do today is:

    make INSTALL_HDR_PATH=/my/dir


Difference between "=" and "?=" is that the latter
only assign a new value if the variables was not defined.

	Sam
