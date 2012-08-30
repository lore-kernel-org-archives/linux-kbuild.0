Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39179 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752260Ab2H3O15 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Aug 2012 10:27:57 -0400
Date: Thu, 30 Aug 2012 16:27:54 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] firmware: fix directory creation rule matching with make
 3.82
Message-ID: <20120830142754.GB14031@sepie.suse.cz>
References: <1344446076-9135-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344446076-9135-1-git-send-email-mark.asselstine@windriver.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, Aug 08, 2012 at 01:14:36PM -0400, Mark Asselstine wrote:
> Attempting to run 'firmware_install' with CONFIG_USB_SERIAL_TI=y when
> using make 3.82 results in an error
> 
> make[2]: *** No rule to make target `/lib/firmware/./', needed by
> `/lib/firmware/ti_3410.fw'.  Stop.
> 
> It turns out make 3.82 is picky when matching directory names with
> trailing slashes as a result, where make 3.81 would handle this
> correctly make 3.82 does not find the rule needed to create the
> directory.
> 
> The './' seen in the error is added by $(dir) for firmware which
> resides in the base firmware src directory, such as
> ti_3410.fw.ihex. By performing $(dir) after we prepend the
> $(INSTALL_FW_PATH) we can ensure we don't end up with a './' in the
> middle of the path and the directory will be properly created.
> 
> This change works with make 3.81 and should work with previous
> versions as well.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>

Thanks a lot and sorry for the delay. I applied the patch to
kbuild.git#rc-fixes.

Michal
