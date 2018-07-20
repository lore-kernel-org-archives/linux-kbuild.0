Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:50131 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731314AbeGTQ1M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 12:27:12 -0400
Date: Fri, 20 Jul 2018 10:21:50 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] checkpatch: kbuild: if_changed: check for multiple calls in targets
Message-ID: <20180720152150.GB16221@gate.crashing.org>
References: <ghy3eafbrf.fsf@lena.gouders.net> <20180720074804.4160-1-dirk@gouders.net> <01cfa83d2e29667d311d679c904b1648cd35c614.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01cfa83d2e29667d311d679c904b1648cd35c614.camel@perches.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Dirk Gouders <dirk@gouders.net>, Andy Whitcroft <apw@canonical.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 20, 2018 at 03:06:37AM -0700, Joe Perches wrote:
> On Fri, 2018-07-20 at 09:48 +0200, Dirk Gouders wrote:
> > +		# Check for multiple calls of if_changed within a target in Makefiles
> > +		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
> 
> The uses of .* here are superfluous.

And it looks like you wanted to match this only at the beginning of the
string, which would be /^Makefile/ etc.


Segher
