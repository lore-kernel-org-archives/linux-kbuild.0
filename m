Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56665 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755302Ab1I3IdY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Sep 2011 04:33:24 -0400
Message-ID: <4E857ED3.9010803@suse.cz>
Date: Fri, 30 Sep 2011 10:33:23 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: kBuild-0.1.9998
References: <1317323802.13830.12.camel@segulix>
In-Reply-To: <1317323802.13830.12.camel@segulix>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?U8OpcmdpbyBCYXN0bw==?= <sergio@serjux.com>
Cc: linux-kbuild@vger.kernel.org

On 29.9.2011 21:16, Sérgio Basto wrote:
> I need update kBuild for compile VirtualBox 4.1.2
> 
> I do this:
> svn co http://svn.netlabs.org/repos/kbuild/trunk/
> mv trunk kBuild-0.1.9998
> tar cvzf kBuild-0.1.9998.tar.gz kBuild-0.1.9998/ --exclude=.svn
> 
> this is the right way ? 

That's a different project that the linux kernel build system.


> Any way http://kbuild.sourceforge.net/ is completely out-of-date 
> The link of "The CML2 Resources Page" http://tuxedo.org/~esr/cml2/ is broken 
> I found a note on  http://sourceforge.net/projects/kbuild/

This is the former home of the linux kernel build system, and it is
indeed out of date now. But you are looking for the Virtualbox kbuild.

Michal
