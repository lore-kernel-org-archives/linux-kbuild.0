Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.168]:36305 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753214AbYDZORP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Apr 2008 10:17:15 -0400
Received: by wf-out-1314.google.com with SMTP id 28so3289962wff.4
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Apr 2008 07:17:15 -0700 (PDT)
Message-ID: <19f34abd0804260717le1773aapec49cdb6f68e296f@mail.gmail.com>
Date: Sat, 26 Apr 2008 16:17:15 +0200
From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in header file
In-Reply-To: <48133537.7040800@cs.helsinki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080426134554.GA20727@damson.getinternet.no>
	 <48133537.7040800@cs.helsinki.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Sam Ravnborg <sam@ravnborg.org>, Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/26/08, Pekka Enberg <penberg@cs.helsinki.fi> wrote:
> > +# Output dependency graph in GraphViz language.
> > +sub graph {
> >
>
>  Shouldn't there be a command line option for printing out the GraphViz
> files?

Hm. For now, it's a hidden feature that requires editing the script :-)

I didn't want to get into the lands of parsing options since we would
need to handle gcc options and skip arguments to those, etc.

Maybe it's better just to chuck the whole GraphViz thing. It's not
really that useful anyway.

Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
