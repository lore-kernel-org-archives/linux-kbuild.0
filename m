Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud2.xs4all.net ([194.109.24.29]:46466 "EHLO
	lb3-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751432AbbJFJRD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 Oct 2015 05:17:03 -0400
Message-ID: <1444123019.2417.39.camel@tiscali.nl>
Subject: Re: [PATCH v3] kbuild: document recursive dependency limitation /
 resolution
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 06 Oct 2015 11:16:59 +0200
In-Reply-To: <20151005230317.GQ14464@wotan.suse.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
	 <1443026498-15081-1-git-send-email-mcgrof@do-not-panic.com>
	 <20151004134247.GA7528@nebuchadnezzar>
	 <20151005230317.GQ14464@wotan.suse.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@suse.com>, Valentin Rothberg <valentinrothberg@gmail.com>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, mmarek@suse.com, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, herbert@gondor.apana.org.au, tiwai@suse.de, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc, soos.mate@gmail.com, skl@det.ua.pt, iouliia@det.ua.pt, Armin Biere <biere@jku.at>, Julia Lawall <julia.lawall@lip6.fr>

On di, 2015-10-06 at 01:03 +0200, Luis R. Rodriguez wrote:
> On Sun, Oct 04, 2015 at 03:42:47PM +0200, Valentin Rothberg wrote:

> > In contrast to a select, a symbol using a dependency is only
> > visible to the user when its dependency are satisfied.  I see it as a
> > decision between being semantically correct (depends) and being easy to
> > configure/user friendly (select).
> 
> Good point, something easy to configure should however still likely only
> be visible to the user if and only if it would not break existing user
> config. If we are not ensuring that now its perhaps good to annotate that
> as a desirable future feature.

(This might be going off on a tangent a bit.)

Perhaps the issue that people run into, and that Luis is trying to
solve, here and in other threads, is that these two approaches currently
are used at the same level. In other words, maybe the configuration
requirements should only be described using dependency relations while a
(new) tool should provide what now is provided, sort of, by selects.

Isn't that how package managers work? The packages themselves state
things like: "I need Foo", "I conflict with Bar". Package managers use
that information to handle what people actually care about, like "Please
install Baz", without requiring those people to do the busy work of
figuring out the dependencies of all packages.

So, would a future SAT solver for Kconfig use a two level approach too:
given the set of dependencies of the various features (first level) try
to figure out if and how the features a user picks can actually be
enabled (second level)?

Thanks,


Paul Bolle
