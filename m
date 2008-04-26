Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.171]:17521 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752167AbYDZRz3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Apr 2008 13:55:29 -0400
Received: by wf-out-1314.google.com with SMTP id 28so3337216wff.4
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Apr 2008 10:55:28 -0700 (PDT)
Message-ID: <19f34abd0804261055u49d3951fn7e6d0a87e65254c2@mail.gmail.com>
Date: Sat, 26 Apr 2008 19:55:28 +0200
From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in header file
In-Reply-To: <20080426172329.GO2252@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080426134554.GA20727@damson.getinternet.no>
	 <20080426164450.GK2252@cs181133002.pp.htv.fi>
	 <19f34abd0804260957i62db6929s2a4227a517f3c9a1@mail.gmail.com>
	 <20080426172329.GO2252@cs181133002.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/26/08, Adrian Bunk <bunk@kernel.org> wrote:
> On Sat, Apr 26, 2008 at 06:57:09PM +0200, Vegard Nossum wrote:
>  > On 4/26/08, Adrian Bunk <bunk@kernel.org> wrote:
>  > >  And you need cross compilers for all architectures since fiddling with
>  > >  #include's under include/ breaks code left and right that only compiled
>  > >  due to some implicit #include (and if it still works due to another
>  > >  implicit #include on x86 the latter might not be present on all
>  > >  architectures).
>  >
>  > Yep. I have been compiling cross-compilers myself. As a btw, I had
>  > already started some project to distribute binary cross-compilers
>  > http://folk.uio.no/vegardno/crosstool/ for the purpose of making
>  > cross-compiling easier to get started with. (It would be cool to have
>  > a complete suite of working cross-compilers in a single download.)
>
>
> "The source code for the binary files below can be downloaded from the
>   aforementioned project websites."
>
>  -> GPL violation

Thanks, corrected.

Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
