Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55975 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753695Ab1DEQZU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 12:25:20 -0400
Date: Tue, 5 Apr 2011 17:25:12 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 33/34] usb/lh7a40x_udc: Drop __DATE__ usage
Message-ID: <20110405162512.GB11737@n2100.arm.linux.org.uk>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz> <1302015561-21047-34-git-send-email-mmarek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1302015561-21047-34-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marc Singer <elf@buici.com>

On Tue, Apr 05, 2011 at 04:59:20PM +0200, Michal Marek wrote:
> The kernel already prints its build timestamp during boot, no need to
> repeat it in random drivers and produce different object files each
> time.

This file no longer exists.
