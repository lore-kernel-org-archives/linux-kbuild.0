Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:41301 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750721AbZFFGEn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 6 Jun 2009 02:04:43 -0400
Date: Sat, 6 Jun 2009 08:06:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Building a 32 bit on a 64 bit machine.
Message-ID: <20090606060659.GB22347@uranus.ravnborg.org>
References: <55c333c0906050631y6ca1b676q94dd8ec324c9ba7@mail.gmail.com> <20090606051823.GA16127@synapse.neuralscape.com> <55c333c0906052240p71168d37q7c1a0b71fbe1f59f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55c333c0906052240p71168d37q7c1a0b71fbe1f59f@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kevin Wilson <wkevils@gmail.com>
Cc: Karen Shaeffer <shaeffer@neuralscape.com>, linux-kbuild@vger.kernel.org

On Sat, Jun 06, 2009 at 08:40:39AM +0300, Kevin Wilson wrote:
> Hello,
>    I know that using cross compiler is needed when you want to compile
> for different platforms (for example, to build a module for ARM or PPC on intel
> machine).
> I did not mention it, but the machine I am building on is an Intel
> x86_64 machine, and I want to build on it a 32 bit module - also for
> Intel machine.
> So I believe there should be a way to do it with some gcc flag.
> 
> Any ideas ?

Your gcc only support 64-bit.
So you need a cross compiler to build 32 bit x86.

	Sam
