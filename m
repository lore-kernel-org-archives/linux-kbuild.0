Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:32768 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932135AbcBHWZC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 17:25:02 -0500
Date: Mon, 8 Feb 2016 23:24:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 5/6] create/adjust generated/expsyms.h
Message-ID: <20160208222448.GC13832@ravnborg.org>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
 <1454963315-20468-6-git-send-email-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454963315-20468-6-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

On Mon, Feb 08, 2016 at 03:28:34PM -0500, Nicolas Pitre wrote:
> Given the list of exported symbols needed by all modules, we can create
> a header file containing preprocessor defines for each of those symbols.
> Also, when some symbols are added and/or removed from the list, we can
> update the time on the corresponding files used as build dependencies for
> those symbols. And finally, if any symbol did change state, the
> corresponding source files must be rebuilt.
> 
> The insertion or removal of an EXPORT_SYMBOL() entry within a module may
> create or remove the need for another exported symbol.  This is why this
> operation has to be repeated until the list of needed exported symbols
> becomes stable. Only then the final kernel and modules link take place.

Could this magic with vmlinux_recursive have been implemented in a more
obvious way in link-vmlinux.sh?
One of the purposes with link-vmlinux.sh was to make the final link
stage more readable and this patch goes in the other direction.

	Sam
