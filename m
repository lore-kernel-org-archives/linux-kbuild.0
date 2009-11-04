Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:41748 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361AbZKDR2Q (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 12:28:16 -0500
Date: Wed, 4 Nov 2009 18:28:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 2/4] kbuild: generate modules.builtin
Message-ID: <20091104172820.GA6404@merkur.ravnborg.org>
References: <200911041519.nA4FJaBF030330@imap1.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200911041519.nA4FJaBF030330@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, JBeulich@novell.com

On Wed, Nov 04, 2009 at 07:19:36AM -0800, akpm@linux-foundation.org wrote:
> From: Michal Marek <mmarek@suse.cz>
> 
> To make it easier for tools like mkinitrd to detect whether a needed
> module is missing or whether it is compiled into the kernel, install a
> modules.builtin file listing all modules built into the kernel.  This is
> done by generating an alternate config file with all tristate =y options
> set to =Y and reading the makefiles with this config included.  The built
> in modules then appear in obj-Y.

I have an updated version queued. Will dig it out.

	Sam
