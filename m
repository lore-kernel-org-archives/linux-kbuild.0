Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-da0-f45.google.com ([209.85.210.45]:57605 "EHLO
	mail-da0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758126Ab3BSDhO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2013 22:37:14 -0500
Received: by mail-da0-f45.google.com with SMTP id w4so2775371dam.32
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Feb 2013 19:37:14 -0800 (PST)
Date: Mon, 18 Feb 2013 19:37:05 -0800
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH] kbuild: Fix missing '\n' for NEW symbols in yes "" |
 make oldconfig >conf.new
Message-ID: <20130219033636.GA19757@elie.Belkin>
References: <20130219002426.GA19381@nt1.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130219002426.GA19381@nt1.in>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Regid Ichira <regid23@nt1.in>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, 636029@bugs.debian.org

Regid Ichira wrote:

> Applied and tested to 3.8.0-rc4, on top of commit
> 5da1f88 - Linus Torvalds, 2013-01-18 : Merge tag 'usb-3.8-rc4' of git:/

Thanks, Regid.  This looks like a good change, correctly implemented, so
Reviewed-by: Jonathan Nieder <jrnieder@gmail.com>
