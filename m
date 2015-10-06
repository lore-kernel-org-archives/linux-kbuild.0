Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud2.xs4all.net ([194.109.24.21]:47055 "EHLO
	lb1-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750812AbbJFIdE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 Oct 2015 04:33:04 -0400
Message-ID: <1444120375.2417.10.camel@tiscali.nl>
Subject: Re: [PATCH v3] kbuild: document recursive dependency limitation /
 resolution
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 06 Oct 2015 10:32:55 +0200
In-Reply-To: <20151006081912.GA2681@nebuchadnezzar.informatik.uni-erlangen.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
	 <1443026498-15081-1-git-send-email-mcgrof@do-not-panic.com>
	 <20151004134247.GA7528@nebuchadnezzar>
	 <20151005230317.GQ14464@wotan.suse.de>
	 <20151006081912.GA2681@nebuchadnezzar.informatik.uni-erlangen.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valentin Rothberg <valentinrothberg@gmail.com>, "Luis R. Rodriguez" <mcgrof@suse.com>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, mmarek@suse.com, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, herbert@gondor.apana.org.au, tiwai@suse.de, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc, soos.mate@gmail.com, skl@det.ua.pt, iouliia@det.ua.pt, Armin Biere <biere@jku.at>, Julia Lawall <julia.lawall@lip6.fr>, ziegler@cs.fau.de

Hi Valentin,

On di, 2015-10-06 at 10:19 +0200, Valentin Rothberg wrote:
> I think that a general remark that using selects should be discouraged
> as, besides causing the recursive issue, selects can also break
> dependencies.

How do selects break dependencies?


Paul Bolle
