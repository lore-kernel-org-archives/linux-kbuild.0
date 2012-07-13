Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47754 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933135Ab2GMMhb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jul 2012 08:37:31 -0400
Date: Fri, 13 Jul 2012 14:37:30 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] xconfig: use pkgconfig to find moc
Message-ID: <20120713123730.GA18564@sepie.suse.cz>
References: <20120704163351.GB12094@sepie.suse.cz>
 <1341433409-5764-1-git-send-email-yselkowitz@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1341433409-5764-1-git-send-email-yselkowitz@users.sourceforge.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org

On Wed, Jul 04, 2012 at 03:23:29PM -0500, Yaakov (Cygwin/X) wrote:
> From: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>
> 
> Various schemes exist to allow parallel installations of multiple major
> versions of Qt (4.x with the previous 3.x and/or the upcoming 5.x).
> QtCore.pc includes a moc_location variable which should be a more reliable
> way to find moc.
> 
> Signed-off-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Thanks, applied to kbuild.git#kconfig.

Michal
