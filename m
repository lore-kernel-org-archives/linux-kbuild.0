Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f191.google.com ([209.85.210.191]:34996 "EHLO
	mail-yx0-f191.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753849AbZINDmK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Sep 2009 23:42:10 -0400
MIME-Version: 1.0
In-Reply-To: <1243381049-10359-1-git-send-email-vapier@gentoo.org>
References: <1243381049-10359-1-git-send-email-vapier@gentoo.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 13 Sep 2009 23:41:52 -0400
Message-ID: <8bd0f97a0909132041y3705ff59ja51c7065503ba519@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: add some common Blackfin checks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>, Andy Whitcroft <apw@shadowen.org>

On Tue, May 26, 2009 at 19:37, Mike Frysinger wrote:
> Add checks for Blackfin-specific issues that seem to crop up from time to
> time.  In particular, we have helper macros to break a 32bit address into
> the hi/lo parts, and we want to make sure people use the csync/ssync
> variant that includes fun anomaly workarounds.

Andrew: could you pick this up ?
-mike
