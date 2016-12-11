Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40681 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752089AbcLKLcZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Dec 2016 06:32:25 -0500
Date: Sun, 11 Dec 2016 12:32:22 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] kconfig/nconf: Fix hang when editing symbol with a long
 prompt
Message-ID: <20161211113222.GE30135@sepie.suse.cz>
References: <1480025423.1860.87.camel@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480025423.1860.87.camel@codethink.co.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org

On Thu, Nov 24, 2016 at 10:10:23PM +0000, Ben Hutchings wrote:
> Currently it is impossible to edit the value of a config symbol with a
> prompt longer than (terminal width - 2) characters.  dialog_inputbox()
> calculates a negative x-offset for the input window and newwin() fails
> as this is invalid.  It also doesn't check for this failure, so it
> busy-loops calling wgetch(NULL) which immediately returns -1.
> 
> The additions in the offset calculations also don't match the intended
> size of the window.
> 
> Limit the window size and calculate the offset similarly to
> show_scroll_win().
> 
> Cc: stable <stable@vger.kernel.org>
> Fixes: 692d97c380c6 ("kconfig: new configuration interface (nconfig)")
> Signed-off-by: Ben Hutchings <ben.hutchings@codethink.co.uk>

Applied to kbuild.git#kconfig, thanks.

Michal
