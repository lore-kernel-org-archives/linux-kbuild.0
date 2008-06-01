Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mta23.gyao.ne.jp ([125.63.38.249]:45350 "EHLO mx.gate01.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751265AbYFAFcl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 1 Jun 2008 01:32:41 -0400
Date: Sun, 1 Jun 2008 14:30:47 +0900
From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: sh64 build error - sh, kbuild or binutils problem?
Message-ID: <20080601053047.GA25429@linux-sh.org>
References: <20080531202239.GB7347@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080531202239.GB7347@cs181133002.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: sam@ravnborg.org, hjl.tools@gmail.com, linux-kbuild@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, May 31, 2008 at 11:22:39PM +0300, Adrian Bunk wrote:
> Minimal example demonstrating the problem:
> 
> $ sh64-linux-ar rcs tmp.o
> $ sh64-linux-ld -EL -r -o tmp2.o tmp.o
> $ sh64-linux-ld -EL -r -o out.o tmp2.o 
> sh64-linux-ld: sh3 architecture of input file `tmp2.o' is incompatible with sh5 output
> $ 
> 
Yes, it's a binutils bug. I've hit this on SH-2A zImage builds too, and
hacked together a patch for it. I'll see about fixing it up fo sh64 too
and then posting it to the list.
