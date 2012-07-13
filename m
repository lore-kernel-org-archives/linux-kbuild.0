Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47861 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932653Ab2GMMmP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jul 2012 08:42:15 -0400
Date: Fri, 13 Jul 2012 14:42:14 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] xconfig: add quiet rule for moc
Message-ID: <20120713124214.GB18564@sepie.suse.cz>
References: <1341444671-7528-1-git-send-email-yselkowitz@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1341444671-7528-1-git-send-email-yselkowitz@users.sourceforge.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org

On Wed, Jul 04, 2012 at 06:31:11PM -0500, Yaakov (Cygwin/X) wrote:
> From: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>
> 
> Also add a dependency on .tmp_qtcheck for KC_QT_MOC.
> 
> Signed-off-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Applied to kbuild.git#kconfig, thanks.


> Also applies to 3.x stable branches

But is it necessary to have the patch in stable? It only fixes the
progress message.

Michal
