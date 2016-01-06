Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53668 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751777AbcAFOsJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jan 2016 09:48:09 -0500
Subject: Re: kbuild: global makefile and spaces in path
References: <87lh8nfrx8.fsf@belgarion.home>
From: Michal Marek <mmarek@suse.com>
Message-ID: <568D2927.2010106@suse.com>
Date: Wed, 6 Jan 2016 15:48:07 +0100
MIME-Version: 1.0
In-Reply-To: <87lh8nfrx8.fsf@belgarion.home>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On 2015-12-21 21:49, Robert Jarzmik wrote:
> Hi Michal,
> 
> I compiled my kernel in a directory /home/robert jarzmik/kernel, and that's the
> first time I encountered a space in the path containing my kernel in years.
> 
> I was wondering if there is a known constraint that the linux kernel source
> should be contained within a path without any space ?

Whitespace and colons are problematic.


> If no such constraint is known, maybe you could consider the patch in [1].

I expect it is going to break in lot more places, especially if you do
an O= build. I think it's better to just check for this and error out early.

Michal
