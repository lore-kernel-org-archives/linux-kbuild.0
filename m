Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xsmtp1.ethz.ch ([82.130.70.13]:25844 "EHLO xsmtp1.ethz.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756465AbYCTPiV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Mar 2008 11:38:21 -0400
Message-ID: <47E2811B.9000100@debian.org>
Date: Thu, 20 Mar 2008 16:22:03 +0100
From: "Giacomo A. Catenazzi" <cate@debian.org>
MIME-Version: 1.0
Subject: Re: The evolution of the Linux kernel build system
References: <9048849A-9578-40E7-BD0E-FF2CD34F9372@ugent.be>
In-Reply-To: <9048849A-9578-40E7-BD0E-FF2CD34F9372@ugent.be>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bram Adams <Bram.Adams@ugent.be>
Cc: linux-kbuild@vger.kernel.org

Bram Adams wrote:
> We would like to thank Sam Ravnborg and Kai Germaschewski for their 
> constructive comments on an earlier version of the report. Any feedback 
> on the published report or suggestions for further analysis are gladly 
> appreciated.

Now I've done only a quick look.

I think you missed a point about dependencies.
Also in the old method, the .h dependencies were calculated
on build time (with the gcc -MM option IIRC).
But big problem is the dependencies of configuration.
Instead of having the dependency of config.h,
the kbuild checks about changes on every single
configuration item.

So "make dep" read the sources looking for CONFIG_ options.

IIRC it was a separate step, not to check file
for CONFIG_ string at every modification.
"make dep" was not so mandatory after every patch,
and anyway before big releases a "make mrproper"
was still recommended.

There was a lot of active development on this program,
to increment speed, and AFAIK no other project split
header dependencies in a more precise way.


This weekend I'll read carefully the paper and I'll give
you more comments.


ciao
	cate


