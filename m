Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:35727 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757044Ab2DLBpG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Apr 2012 21:45:06 -0400
Date: Wed, 11 Apr 2012 18:45:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/5] RFC: strip 15,000 lines from a typical autoconf.h
Message-Id: <20120411184538.ec21844a.akpm@linux-foundation.org>
In-Reply-To: <CA+55aFx6V_TpbghsG7xqoBree8ALAKWMA+qLeGg-8DNAno+peg@mail.gmail.com>
References: <1334188257-3449-1-git-send-email-paul.gortmaker@windriver.com>
	<CA+55aFy-CeLXstbceP7+co3AXrEWtifKF+8NWzhC7B-A8xBd-w@mail.gmail.com>
	<CA+55aFx6V_TpbghsG7xqoBree8ALAKWMA+qLeGg-8DNAno+peg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, tony@bakeyournoodle.com, mmarek@suse.cz, lacombar@gmail.com

On Wed, 11 Apr 2012 18:19:58 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:

>    #define IS_DEFINED(x) (__stringify(CONFIG_##x)[0]=='1')
> 
> That really is a piece of art. I'm expecting that the Guggenheim will
> contact me any moment now about it.

Several weeks ago I asked the assemblage if anyone could think of a way
of doing this.  It seems that I failed to Cc sufficiently perverted
parties.

> Of course, the above does *not* work for a pre-processor, but hey, you
> can't have everything.  It literally is *only* valid in C code. You
> can't have everything. 

So we shouldn't call it IS_DEFINED() - that would cause confusion with
the old version.
