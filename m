Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39366 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965216AbbBDMXs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Feb 2015 07:23:48 -0500
Message-ID: <54D20F50.7020207@suse.cz>
Date: Wed, 04 Feb 2015 13:23:44 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kasan: fix build warnings
References: <20150204185328.1ee3ce3c@canb.auug.org.au> <1423050231-1701-1-git-send-email-a.ryabinin@samsung.com> <54D20B08.7010508@samsung.com>
In-Reply-To: <54D20B08.7010508@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On 2015-02-04 13:05, Andrey Ryabinin wrote:
> Or maybe it would be be better always use -Werror in cc-option?

Please don't do it. A couple of Makefiles call cc-option after we have
added the user-supplied KCFLAGS to KBUILD_CFLAGS.

Michal
