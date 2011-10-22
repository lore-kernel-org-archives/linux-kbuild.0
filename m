Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vms173019pub.verizon.net ([206.46.173.19]:58345 "EHLO
	vms173019pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752449Ab1JVTmr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 22 Oct 2011 15:42:47 -0400
Date: Sat, 22 Oct 2011 15:38:39 -0400 (EDT)
From: Peter Foley <pefoley2@verizon.net>
Subject: Re: [PATCH] kbuild: silence moc when V=0
In-reply-to: <CACqU3MUmg6KN7MQe7T3j+D06m1R=4R+q6C5z-SCOnxCj=zZ5OA@mail.gmail.com>
Message-id: <alpine.LNX.2.00.1110221537520.59156@linux>
References: <alpine.LNX.2.00.1110221307010.59156@linux>
 <CACqU3MUmg6KN7MQe7T3j+D06m1R=4R+q6C5z-SCOnxCj=zZ5OA@mail.gmail.com>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Peter Foley <pefoley2@verizon.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>, mmarek@suse.cz

On Sat, 22 Oct 2011, Arnaud Lacombe wrote:

> Hi,
> 
> On Sat, Oct 22, 2011 at 1:10 PM, Peter Foley <pefoley2@verizon.net> wrote:
> > Use quiet_cmd to silence moc when V=0
> >
> > Signed-off-by: Peter Foley <pefoley2@verizon.net>
> >
> This was included in my branch reworking the checking logic in the
> Makefile, I still need to find some time to finish to polish it.
> 
>  - Arnaud

Ok, feel free to drop this patch then.

Peter
