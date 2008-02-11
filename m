Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:42900 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752888AbYBKONG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 09:13:06 -0500
Date: Mon, 11 Feb 2008 15:13:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Help Require for makeing 2.6 kernel makefile
Message-ID: <20080211141311.GE20959@uranus.ravnborg.org>
References: <20080208192620.GA31391@uranus.ravnborg.org> <432435.26752.qm@web95105.mail.in2.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <432435.26752.qm@web95105.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: murtuja bharmal <murtuja_bharmal@yahoo.com>
Cc: linux-kbuild@vger.kernel.org

>   Actually problem is I have 2000 source file for
> single kernel module with 2.4 kbuild architecture.
> All this source file are in different directory
> sturcture.

A big module I must say...
Take a look at fs/xfs/
they have source scattered over a few directories.
But you will require a single kbuild file listing all the .o
file that is generated.
But with the dense syntax used by kbuild that should
not be a problem.

If you continue to struggle upload the code somwhere and let
us take a look.

	Sam
