Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:50929 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750964AbYA3QYc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Jan 2008 11:24:32 -0500
Date: Wed, 30 Jan 2008 17:24:33 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH][scripts/{genksyms/parse.c,kconfig/zconf.tab)_shipped] duplicate YYSTYPE_IS_TRIVIAL =>1st *_DECLARED
Message-ID: <20080130162433.GA24138@uranus.ravnborg.org>
References: <47A093D6.3000105@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47A093D6.3000105@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roel Kluin <12o3l@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Wed, Jan 30, 2008 at 04:12:22PM +0100, Roel Kluin wrote:
> Untested patch, please confirm it's the right fix.

First off - I do not see what problem you are trying to fix.
Second - this is generated files that we never manually edit.
If the generated files are wrong the tools to generate the files
should be fixed.

	Sam
