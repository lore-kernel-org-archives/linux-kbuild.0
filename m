Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54453 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752099AbaGKMVq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jul 2014 08:21:46 -0400
Message-ID: <53BFD6A8.5080803@suse.cz>
Date: Fri, 11 Jul 2014 14:20:56 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: include guard weirdness
References: <87a98gnmeg.fsf@rasmusvillemoes.dk>
In-Reply-To: <87a98gnmeg.fsf@rasmusvillemoes.dk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kbuild@vger.kernel.org

On 2014-07-11 13:51, Rasmus Villemoes wrote:
> Hi,
> 
> gcc/cpp claims to be smart enough to recognize the include guard idiom,
> and most of the time this works very well: the second and subsequent
> #includes do not even cause the file to be opened (thus saving at least
> open+fstat+read+close). Except in a few cases, which are so common that
> it might be worth investigating.
> 
> For example, linux/mm.h often shows up exactly twice in strace output;
> another very common header such as linux/types.h always occurs only
> once.

My guess is that <linux/mm.h> includes a header which at some point
includes <linux/mm.h> again.

Michal

