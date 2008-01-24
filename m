Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns2.suse.de ([195.135.220.15]:40919 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751936AbYAXWxL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:53:11 -0500
Date: Thu, 24 Jan 2008 14:46:07 -0800
From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
Message-ID: <20080124224607.GA29340@suse.de>
References: <20080124215813.GA4204@uranus.ravnborg.org> <1201212238-4369-12-git-send-email-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1201212238-4369-12-git-send-email-sam@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Tejun Heo <htejun@gmail.com>, Bill Nottingham <notting@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>, Kay Sievers <kay.sievers@vrfy.org>

On Thu, Jan 24, 2008 at 11:02:53PM +0100, Sam Ravnborg wrote:
> From: Tejun Heo <htejun@gmail.com>
> 
> When multiple built-in modules (especially drivers) provide the same
> capability, they're prioritized by link order specified by the order
> listed in Makefile.  This implicit ordering is lost for loadable
> modules.
> 
> When driver modules are loaded by udev, what comes first in
> modules.alias file is selected.  However, the order in this file is
> indeterministic (depends on filesystem listing order of installed
> modules).  This causes confusion.
> 
> The solution is two-parted.  This patch updates kbuild such that it
> generates and installs modules.order which contains the name of
> modules ordered according to Makefile.  The second part is update to
> depmod such that it generates output files according to this file.
> 
> Note that both obj-y and obj-m subdirs can contain modules and
> ordering information between those two are lost from beginning.
> Currently obj-y subdirs are put before obj-m subdirs.
> 
> Sam Ravnborg cleaned up Makefile modifications and suggested using awk
> to remove duplicate lines from modules.order instead of using separate
> C program.
> 
> Signed-off-by: Tejun Heo <htejun@gmail.com>
> Cc: Bill Nottingham <notting@redhat.com>
> Cc: Rusty Russell <rusty@rustcorp.com.au>
> Cc: Greg Kroah-Hartman <gregkh@suse.de>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>

thanks,

greg k-h
