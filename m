Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0025.hostedemail.com ([216.40.44.25]:41011 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728362AbeGTQWu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 12:22:50 -0400
Message-ID: <4977e9adba5e826d5e7e9f503e3ce8fbaa872af5.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: kbuild: if_changed: check for multiple
 calls in targets
From: Joe Perches <joe@perches.com>
Date: Fri, 20 Jul 2018 08:33:56 -0700
In-Reply-To: <20180720152150.GB16221@gate.crashing.org>
References: <ghy3eafbrf.fsf@lena.gouders.net>
         <20180720074804.4160-1-dirk@gouders.net>
         <01cfa83d2e29667d311d679c904b1648cd35c614.camel@perches.com>
         <20180720152150.GB16221@gate.crashing.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Dirk Gouders <dirk@gouders.net>, Andy Whitcroft <apw@canonical.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2018-07-20 at 10:21 -0500, Segher Boessenkool wrote:
> On Fri, Jul 20, 2018 at 03:06:37AM -0700, Joe Perches wrote:
> > On Fri, 2018-07-20 at 09:48 +0200, Dirk Gouders wrote:
> > > +		# Check for multiple calls of if_changed within a target in Makefiles
> > > +		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
> > 
> > The uses of .* here are superfluous.
> 
> And it looks like you wanted to match this only at the beginning of the
> string, which would be /^Makefile/ etc.

Nope.

$realfile includes path and /^Makefile/ matches only the
top level Makefile and none of the ones in subdirectories.


