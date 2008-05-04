Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:52934 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757671AbYEDTI1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 May 2008 15:08:27 -0400
Date: Sun, 4 May 2008 21:08:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [2.6 patch] kconfig-language.txt: remove bogus hint
Message-ID: <20080504190835.GB23619@uranus.ravnborg.org>
References: <20080503231535.GY5838@cs181133002.pp.htv.fi> <20080504061741.GA14784@uranus.ravnborg.org> <20080504080137.GF5838@cs181133002.pp.htv.fi> <20080504112741.GA18379@uranus.ravnborg.org> <20080504121014.GJ5838@cs181133002.pp.htv.fi> <20080504122640.GA19513@uranus.ravnborg.org> <481DF1A5.1030103@oracle.com> <20080504175121.GN5838@cs181133002.pp.htv.fi> <481DF887.5030101@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <481DF887.5030101@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org

On Sun, May 04, 2008 at 10:55:19AM -0700, Randy Dunlap wrote:
> >
> >The idiom has use cases, but you need the following prerequisites:
> >- A and B are tristates
> >- B does not depend on A
> >- C is a bool with the semantics "enable feature C in B"
> >
> >And I doubt you can put that into a useful hint.
> 
> OK, sounds like the patch is good then.

Thanks for the explanations.

Patch applied.

	Sam
