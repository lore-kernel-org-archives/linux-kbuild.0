Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews03.kpnxchange.com ([213.75.39.6]:49603 "EHLO
	cpsmtpb-ews03.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751558AbbAVKrg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Jan 2015 05:47:36 -0500
Message-ID: <1421923654.13638.56.camel@x220>
Subject: Re: [PATCH] [RFC] kconfig: menuconfig make "Selected by:" readable
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 22 Jan 2015 11:47:34 +0100
In-Reply-To: <54C0D1F3.6000001@suse.cz>
References: <1421881250.13638.10.camel@x220>
		 <54C05F33.6070703@infradead.org> <1421915745.13638.27.camel@x220>
	 <54C0D1F3.6000001@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org

On Thu, 2015-01-22 at 11:33 +0100, Michal Marek wrote:
> On 2015-01-22 09:35, Paul Bolle wrote:
> > In this case 64BIT is set to 'y' (otherwise LBDAF would have been 'y').
> > This isn't a bug issue, of course, but I still can see how this can be
> > confusing. Perhaps the last line should read:
> >       Unmet dependency on: BLOCK [=y] && !64BIT [=y]
> > 
> > Would that help? Or would 
> >       Depends on: BLOCK [=y] && !64BIT [=n]
> > 
> > (ie, print the value if "!64BIT") be clearer?
> 
> How about
> 
>   Depends on: (BLOCK [=y] && !64BIT [=y]) [=n]
> 
> ?

Or
   Depends on: BLOCK [=y] && !64BIT [=y] => [=n]

Whatever, we'll figure out something.

This is a curses UI, isn't it? Could we use color to distinguish the
symbols or sub-expressions that are set correctly, for that particular
dependency, from those that are not? 


Paul Bolle

