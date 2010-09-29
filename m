Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta15.emeryville.ca.mail.comcast.net ([76.96.27.228]:51301
	"EHLO qmta15.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752368Ab0I2XQx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Sep 2010 19:16:53 -0400
Date: Wed, 29 Sep 2010 16:15:21 -0700
From: matt mooney <mfm@muteddisk.com>
Subject: Re: [PATCH 08/20] m68knommu: change to new flag variables
Message-ID: <20100929231521.GA21930@haskell.muteddisk.com>
References: <1285224645-29728-1-git-send-email-mfm@muteddisk.com>
 <4CA18E00.7090207@snapgear.com>
 <20100928071606.GA13303@haskell.muteddisk.com>
 <4CA34F0B.6010605@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4CA34F0B.6010605@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Greg Ungerer <gerg@snapgear.com>, Greg Ungerer <gerg@uclinux.org>, Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>, Tim Abbott <tabbott@ksplice.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kbuild@vger.kernel.org

On 16:36 Wed 29 Sep     , Michal Marek wrote:
> On 28.9.2010 09:16, matt mooney wrote:
> > My original intent was through the maintainer trees; however, I am starting to
> > realize that it probably would have been best to all go into the kbuild tree as
> > one patch series. That being said, some people have picked them up and others
> > have just acked, so really whatever is easiest for you. All unapplied will
> > eventually go through the kbuild tree.
> 
> Please try push as much through maintainer trees as possible, to avoid
> unnecessary merge conflicts. Of course, if you end up with some patches
> that nobody is picking up, I'll apply them to the kbuild tree.

Okay, if anybody else asks, I will definitely ask them kindly to pick them
up. There are, however, some patches that will need to go through the kbuild
tree because some maintainers have already acked the patches and not picked them
up. I will wait a couple more weeks, and then I will resend to you and the
kbuild list with all acks added.

-mfm
