Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from yoi5.greathalifaxhome.com ([66.180.172.116]:48343 "HELO
	vps1.tull.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with SMTP
	id S1753580AbYDIW7V (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Apr 2008 18:59:21 -0400
Date: Thu, 10 Apr 2008 08:52:30 +1000
From: Nick Andrew <nick@nick-andrew.net>
Subject: Re: [PATCH v2] documentation: build source files in Documentation	sub-dir
Message-ID: <20080409225229.GC18242@tull.net>
References: <20080403124529.3f2efb79.randy.dunlap@oracle.com> <20080408134613.a047a7b6.akpm@linux-foundation.org> <20080409123551.42c5da0d.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080409123551.42c5da0d.randy.dunlap@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, samr <sam@ravnborg.org>

On Wed, Apr 09, 2008 at 12:35:51PM -0700, Randy Dunlap wrote:
> +##oops, this is a kernel module::hostprogs-y := procfs_example

Is this intentional? It looks like you commented-out a mistake.

Nick.
