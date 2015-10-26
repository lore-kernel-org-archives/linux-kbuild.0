Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45232 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752101AbbJZVDM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Oct 2015 17:03:12 -0400
Subject: Re: [PATCH] kbuild: Add support for SOURCE_DATE_EPOCH environment
 variable
References: <1443741332.2730.75.camel@decadent.org.uk>
From: Michal Marek <mmarek@suse.com>
Message-ID: <562E950D.2030609@suse.com>
Date: Mon, 26 Oct 2015 22:03:09 +0100
MIME-Version: 1.0
In-Reply-To: <1443741332.2730.75.camel@decadent.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, reproducible-builds@lists.alioth.debian.org

Dne 2.10.2015 v 01:15 Ben Hutchings napsal(a):
> As part of the reproducible builds project, the SOURCE_DATE_EPOCH
> environment variable has been specified as a project- and
> distribution-independent means to specify a timestamp at build
> time: https://reproducible-builds.org/specs/source-date-epoch/
> 
> Add support for this by converting it to KBUILD_BUILD_TIMESTAMP
> if they aren't both set.

At which projects besides the kernel is this aimed? If there are
multiple projects willing to support this, I'll happily apply it. But if
it's just a synonym for KBUILD_BUILD_TIMESTAMP that nobody else is going
to support, then it looks a bit redundant.

Michal
