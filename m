Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from synapse.neuralscape.com ([198.144.200.82]:39272 "EHLO
	neuralscape.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbZFFGGt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 6 Jun 2009 02:06:49 -0400
Date: Fri, 5 Jun 2009 22:18:23 -0700
From: Karen Shaeffer <shaeffer@neuralscape.com>
Subject: Re: Building a 32 bit on a 64 bit machine.
Message-ID: <20090606051823.GA16127@synapse.neuralscape.com>
References: <55c333c0906050631y6ca1b676q94dd8ec324c9ba7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55c333c0906050631y6ca1b676q94dd8ec324c9ba7@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kevin Wilson <wkevils@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Fri, Jun 05, 2009 at 04:31:50PM +0300, Kevin Wilson wrote:
> Hello,
> I want to build a module I developed for 32 bit on a 64 bit machine.
> It is on a machine running Fedora.
> 
> Rgs,
> Kevin

Hi Kevin,
You need a cross compile tool chain. You can learn about that
here:
http://cross-lfs.org/view/1.1.0/x86_64/introduction/chapter.html

You'll also need to port your module to 64 bits.

Good luck with it,
Karen
-- 
 Karen Shaeffer
 Neuralscape, Palo Alto, Ca. 94306
 shaeffer@neuralscape.com  http://www.neuralscape.com
