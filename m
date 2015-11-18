Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:41622 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753108AbbKRRxb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Nov 2015 12:53:31 -0500
Date: Wed, 18 Nov 2015 09:53:30 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: drop kbuild workaround dummy module from top dir
Message-ID: <20151118175330.GA5988@kroah.com>
References: <1447721929-45813-1-git-send-email-paul.gortmaker@windriver.com>
 <564CB927.5020105@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <564CB927.5020105@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, Nov 18, 2015 at 06:45:11PM +0100, Michal Marek wrote:
> Dne 17.11.2015 v 01:58 Paul Gortmaker napsal(a):
> > This is essentially a revert of 86f69fe9c069dd8608d238581eea259caa1dfc99
> > ("Staging: workaround build system bug"), but to call it a revert would
> > imply it was wrong -- rather it seems more like it is just no longer
> > required anymore.
> 
> Acked-by: Michal Marek <mmarek@suse.com>
> 
> In fact, I can't even reproduce the original bug with 2.6.27 + the
> initial staging series. I also do not remember any fix for such bug in
> the recent years. 4b024242e8a4 ("kbuild: Fix linking error built-in.o no
> such file or directory") is related, but fixing a different problem.

I can't remember the issue at the moment either, but it was a problem
with some sort of config, I'll queue this up and see if anything breaks
:)

thanks,

greg k-h
