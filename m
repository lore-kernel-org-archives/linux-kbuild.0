Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:45982 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754067AbZAGUZd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Jan 2009 15:25:33 -0500
Date: Wed, 7 Jan 2009 21:27:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] [3/3] KBUILD: Add a "bin" symlink for the scripts directory too
Message-ID: <20090107202712.GI4647@uranus.ravnborg.org>
References: <20090103321.351399938@firstfloor.org> <20090103022143.6D0803E6650@basil.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090103022143.6D0803E6650@basil.firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jan 03, 2009 at 03:21:43AM +0100, Andi Kleen wrote:
> 
> Several of the scripts in "scripts" are useful to operate on
> files in a separate objdir. Instead of always manually typing
> the path to the source dir create a convenient symlink to
> the source dir's script directory in the objdir too.
> 
> I named it bin because scripts was already used for the object
> files of scripts.

So you suggest we in the O=... case should have
a bin symlink to save you typing "source/sc<tab>

That does not justify another symlink in the output
directory.

	Sam
