Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41012 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751108AbbJZTqh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Oct 2015 15:46:37 -0400
Subject: Re: file names embedded in kernel image
References: <87wpwhhxpi.fsf@rasmusvillemoes.dk>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <562E831C.9030204@suse.cz>
Date: Mon, 26 Oct 2015 20:46:36 +0100
MIME-Version: 1.0
In-Reply-To: <87wpwhhxpi.fsf@rasmusvillemoes.dk>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kbuild@vger.kernel.org

Dne 27.8.2015 v 11:44 Rasmus Villemoes napsal(a):
> Hi
> 
> I just noticed that when one build the kernel outside the source tree,
> all __FILE__ occurences get replaced with the absolute path (since
> that's what is given to gcc, and most -I paths are also absolute). This
> ends up wasting quite a lot of space in .rodata, and I suppose most
> distro supplied kernels have this issue. For example, my ubuntu kernel
> is full of strings like
> 
> /build/linux-hFNI9K/linux-3.13.0/arch/x86/platform/sfi/sfi.c
> /build/linux-hFNI9K/linux-3.13.0/kernel/fork.c

If you build in a subdirectory of the source tree, the filenames will
look like

../arch/x86/platform/sfi/sfi.c
../kernel/fork.c

Michal
