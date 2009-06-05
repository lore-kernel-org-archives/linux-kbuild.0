Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:60854 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755280AbZFEVjI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 17:39:08 -0400
Date: Fri, 5 Jun 2009 23:41:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [Patch] kbuild: clean up scripts/headers.sh
Message-ID: <20090605214125.GB29008@uranus.ravnborg.org>
References: <20090605021419.7905.89870.sendpatchset@localhost.localdomain> <20090605021427.7905.16640.sendpatchset@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090605021427.7905.16640.sendpatchset@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Amerigo Wang <amwang@redhat.com>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

On Thu, Jun 04, 2009 at 10:12:09PM -0400, Amerigo Wang wrote:
> 
> 'drop' variable is unused.
> 
> 'ppc' and 'sparc64' directories don't exist in arch/,
> and I think their headers can be well exported now, so
> just remove them.

Applied,
	Sam
