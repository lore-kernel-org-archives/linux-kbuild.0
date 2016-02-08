Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:50834 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754611AbcBHCkZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Feb 2016 21:40:25 -0500
Date: Sun, 7 Feb 2016 18:40:24 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: drop kbuild workaround dummy module from top dir
Message-ID: <20160208024024.GA14842@kroah.com>
References: <1447721929-45813-1-git-send-email-paul.gortmaker@windriver.com>
 <564CB927.5020105@suse.com>
 <20151118175330.GA5988@kroah.com>
 <20151209210609.GR22885@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151209210609.GR22885@windriver.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, Dec 09, 2015 at 04:06:10PM -0500, Paul Gortmaker wrote:
> [Re: [PATCH] staging: drop kbuild workaround dummy module from top dir] On 18/11/2015 (Wed 09:53) Greg Kroah-Hartman wrote:
> 
> > On Wed, Nov 18, 2015 at 06:45:11PM +0100, Michal Marek wrote:
> > > Dne 17.11.2015 v 01:58 Paul Gortmaker napsal(a):
> > > > This is essentially a revert of 86f69fe9c069dd8608d238581eea259caa1dfc99
> > > > ("Staging: workaround build system bug"), but to call it a revert would
> > > > imply it was wrong -- rather it seems more like it is just no longer
> > > > required anymore.
> > > 
> > > Acked-by: Michal Marek <mmarek@suse.com>
> > > 
> > > In fact, I can't even reproduce the original bug with 2.6.27 + the
> > > initial staging series. I also do not remember any fix for such bug in
> > > the recent years. 4b024242e8a4 ("kbuild: Fix linking error built-in.o no
> > > such file or directory") is related, but fixing a different problem.
> > 
> > I can't remember the issue at the moment either, but it was a problem
> > with some sort of config, I'll queue this up and see if anything breaks
> > :)
> 
> Did you detect any fallout?  Just wondering since I didn't see it loop
> around in linux-next via staging #staging-next yet...

Sorry, it now just got applied, got way behind on patches :(
