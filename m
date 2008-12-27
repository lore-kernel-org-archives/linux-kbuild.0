Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:55293 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754347AbYL0Vy0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Dec 2008 16:54:26 -0500
Date: Sat, 27 Dec 2008 22:55:58 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] kbuild: make *config usage docs
Message-ID: <20081227215558.GA19136@uranus.ravnborg.org>
References: <20080212155228.0c913874.rdunlap@xenotime.net> <20080215132223.GE1178@uranus.ravnborg.org> <20080229142153.9c6a656e.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080229142153.9c6a656e.rdunlap@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Create a kconfig user assistance guide, with a few tips and hints
> about using menuconfig, xconfig, and gconfig.
> 
> Mostly contains user interface, environment variables, and search topics,
> along with mini.config/custom.config usage.
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

A bit late - but applied now. Thanks Randy!

I renamed make-configs.txt to kconfig.txt.

So now we just need a kbuild.txt...

	Sam
