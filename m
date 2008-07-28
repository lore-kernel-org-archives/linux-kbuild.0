Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mta23.gyao.ne.jp ([125.63.38.249]:42094 "EHLO mx.gate01.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751561AbYG1XUB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Jul 2008 19:20:01 -0400
Date: Tue, 29 Jul 2008 08:19:22 +0900
From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: kill include symlinks for sh?
Message-ID: <20080728231922.GB28055@linux-sh.org>
References: <20080728115735.GA32089@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080728115735.GA32089@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Sam,

On Mon, Jul 28, 2008 at 01:57:35PM +0200, Sam Ravnborg wrote:
> Now that kbuild has proper support for
> include/$ARCH/* maybe this is a good time
> to kill the use of symlinks for sh?
> 
Good idea, I just saw the sparc change go by earlier today and remembered
we had talked about this before.

> I do not have sh toolchina on this box so I have
> not tried to do a full patch myself. And the mach stuff
> obviously worries me with the link to the parent directory.
> 
This didn't end up being _too_ painful, though it did take a bit of time
to hunt down all of the guilty parties. I've pushed out what I have now,
which you can see at:

http://git.kernel.org/?p=linux/kernel/git/lethal/sh-2.6.git;a=commitdiff;h=f15cbe6f1a4b4d9df59142fc8e4abb973302cf44

It's been holding up to all of the random builds I've thrown at it so
far, so there shouldn't be any really nasty surprises left over.

I'm glad git supports renames.. :-)
