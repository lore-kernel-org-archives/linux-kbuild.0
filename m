Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60062 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751430Ab1AFJ2v (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Jan 2011 04:28:51 -0500
Date: Thu, 6 Jan 2011 10:28:49 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: kbuild system regression (final '/' in directory names)
Message-ID: <20110106092849.GA1841@sepie.suse.cz>
References: <Pine.LNX.4.44L0.1101051146560.2094-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1101051146560.2094-100000@iolanthe.rowland.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kbuild@vger.kernel.org

On Wed, Jan 05, 2011 at 11:53:33AM -0500, Alan Stern wrote:
> Up until the last kernel version or so, I could do something like:
> 
> 	make M=drivers/usb/misc/
> 
> and the kbuild system would automatically do the right thing by
> removing the final '/'.  Now it does not do so, and instead it ends up
> unnecessarily compiling bogus files like
> 
>   CC [M]  drivers/usb/misc//usbtest.o

It behaves the same on 2.6.36 and 2.6.35, BUT this is not what the M
variable is meant for. It should be used to build external modules, if
you want to build only a part of the kernel tree, use

  make drivers/usb/misc

Michal
