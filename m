Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45396 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754856Ab2JKUod (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Oct 2012 16:44:33 -0400
Date: Thu, 11 Oct 2012 22:44:32 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] modpost: Permit .GCC.command.line sections
Message-ID: <20121011204432.GE16465@sepie.suse.cz>
References: <1349382739-24838-1-git-send-email-kliegs@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349382739-24838-1-git-send-email-kliegs@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Kliegman <kliegs@chromium.org>
Cc: linux-kbuild@vger.kernel.org

On Thu, Oct 04, 2012 at 04:32:19PM -0400, Jonathan Kliegman wrote:
> Allow .GCC.command.line sections in modules to prevent modpost warnings:
> WARNING: sound/usb/snd-usbmidi-lib.o (.GCC.command.line): unexpected non-allocatable section.
> Did you forget to use "ax"/"aw" in a .S file?
> Note that for example <linux/init.h> contains
> section definitions for use in .S files.
> 
> Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>

Applied to kbuild.git#kbuild, thanks.

Michal
