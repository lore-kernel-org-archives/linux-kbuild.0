Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:37950 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751034Ab0LON2g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 08:28:36 -0500
Date: Wed, 15 Dec 2010 14:28:35 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kconfig: nuke second argument of conf_write_symbol()
Message-ID: <20101215132835.GA18269@pobox.suse.cz>
References: <1291530796-16379-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291530796-16379-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Sun, Dec 05, 2010 at 01:33:16AM -0500, Arnaud Lacombe wrote:
> Replacing S_TRISTATE by S_BOOLEAN is a no-op for conf_write_symbol().

Nice cleanup, applied to kbuild-2.6.git#kconfig, thanks.

Michal
